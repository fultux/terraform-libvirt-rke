
module "network" { 
	source 	=  "./modules/network"
	subnet = var.subnet
	subnet_mask = var.subnet_mask
	lb_name = var.lb_name
	lb_ip = var.lb_ip
}
module "kvm" {
	source	 = "./modules/kvm"
	main_count	= var.main_count
	main_node_memory = var.main_node_memory
	main_node_vcpu	= var.main_node_vcpu
	node_count	= var.node_count
	worker_node_memory	=	var.worker_node_memory
	worker_node_vcpu	=	var.worker_node_vcpu
	node_ssh_key	=	var.ssh_key
	node_ssh_user	=	var.ssh_user
	depends_on = [module.network]
}
	

module "nginx" {
	source = "./modules/nginx"
	lb_memory = var.lb_memory
	lb_vcpu = var.lb_vcpu
	lb_ssh_key = var.ssh_key
	lb_ssh_user = var.ssh_user
	worker_ip = module.kvm.nodes_ips
	lb_name = var.lb_name
	lb_ip = var.lb_ip
	depends_on = [module.kvm]
	}




 module "rke" {
	source = "./modules/rke"
	main_ip = module.kvm.main_ips
	worker_ip = module.kvm.nodes_ips
	ssh_key_file = var.ssh_key_file
	depends_on = [module.kvm]
}



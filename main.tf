
module "network" { 
	source 	=  "./modules/network"
	subnet = var.subnet
	subnet_mask = var.subnet_mask
	lb_name = var.lb_name
	lb_ip = var.lb_ip
}
module "kvm" {
	source	 = "./modules/kvm"
	node_count	= var.node_count
	node_memory	=	var.node_memory
	node_vcpu	=	var.node_vcpu
	node_ssh_key	=	var.ssh_key
	node_ssh_user	=	var.ssh_user
	ssh_key_file = var.ssh_key_file
	depends_on = [module.network]
	node_disk_size	= var.node_disk_size
	storage_pool = var.storage_pool
}
	

module "nginx" {
	source = "./modules/nginx"
	lb_memory = var.lb_memory
	lb_vcpu = var.lb_vcpu
	lb_ssh_key = var.ssh_key
	lb_ssh_user = var.ssh_user
	nodes_ip = module.kvm.nodes_ips
	lb_name = var.lb_name
	lb_ip = var.lb_ip
	storage_pool = var.storage_pool
	depends_on = [module.kvm]
	}




 module "rke" {
	source = "./modules/rke"
	nodes_ip = module.kvm.nodes_ips
	ssh_key_file = var.ssh_key_file
	depends_on = [module.kvm,module.nginx]
}


module "rancher" {
	source = "./modules/rancher"
	url = var.url
	depends_on = [module.rke]
}


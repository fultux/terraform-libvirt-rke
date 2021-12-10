module "kvm" {
	source	 =	"./modules/kvm"
	main_count	= var.main_count
	main_node_memory = var.main_node_memory
	main_node_vcpu	= var.main_node_vcpu
	node_count	= var.node_count
	worker_node_memory	=	var.worker_node_memory
	worker_node_vcpu	=	var.worker_node_vcpu
	node_ssh_key	=	var.node_ssh_key
	node_ssh_user	=	var.node_ssh_user
}



module "rke" {
	source = "./modules/rke"
	main_ip = module.kvm.main_ips
	worker_ip = module.kvm.nodes_ips
	ssh_key_file = var.ssh_key_file
	depends_on = [module.kvm]
}
module "kvm-nodes" {
	source	 =	"./modules/kvm-nodes"
	main_count	= var.main_count
	main_node_memory = var.main_node_memory
	main_node_vcpu	= var.main_node_vcpu
	node_count	= var.node_count
	worker_node_memory	=	var.worker_node_memory
	worker_node_vcpu	=	var.worker_node_vcpu
	node_ssh_key	=	var.node_ssh_key
	node_ssh_user	=	var.node_ssh_user
}


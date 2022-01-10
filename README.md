# terraform-libvirt-rke
Terraform module to create a rke cluster on top of kvm

## Prerequisites 
- Terraform version >= 13
- libvirtd installed and running
- kubectl



## How to 

Fetch the repository: 
```
git clone https://github.com/fultux/terraform-libvirt-rke.git
```

Create a value file like the following exemple with values set to your needs: 

```
node_count = #Number of nodes in the cluster
node_memory = "" #Amount of memory for each nodes 
node_vcpu = #Number of vcpu for each nodes 
ssh_user = "" #Username for the ssh user
ssh_key = "" #Your ssh public key to be added in the allowed hosts on each vm
lb_memory = "" #Amount of ram used for the loadbalancer
lb_vcpu = #Number of vcpu for the loadbalancer
lb_name = "lb"
lb_ip = "" #Ip of the loadbalancer
subnet = ""
subnet_mask = "24"
url = "" #DNS name for the loadbalancer that was set up on your systenm
```

Init 

```
terraform init
```


plan then apply : 

```
terraform plan --var-file=<name-of-value-file>
terraform apply --var-file=<name-of-value-file>
```

Removal 
```
terraform destroy --var-file=values.tfvars
```










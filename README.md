# terraform-libvirt-rke
Terraform module to create a rke cluster on top of kvm


**Doesn't work!**
Problem with the template format to provide a list to populate the cloud-init file for the loadbalancer module.

## Prerequisites 
- Terraform version >= 13
- libvirtd installed and running



## How to 

Fetch the repository: 
```
git clone https://github.com/fultux/terraform-libvirt-rke.git
```

Create a value file like the following exemple with values set to your needs: 

```
main_node_memory = "4096"
main_node_vcpu = 1
node_count = 2 
worker_node_memory = "8192"
worker_node_vcpu = 2
ssh_user = "rancher"
ssh_key = "<value of your public key here>"
lb_memory = "1024"
lb_vcpu = 1
lb_name = "lb"
lb_ip = "10.24.10.253"
subnet = "10.24.10.0"
subnet_mask = "24"
url = "rancher.test.local"
```

Init 

```
terraform init
```


plan then apply : 

```
terraform plan --var-file=values.tfvars
terraform apply --var-file=values.tfvars
```

Removal 
```
terraform destroy --var-file=values.tfvars
```










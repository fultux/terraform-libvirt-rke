terraform {
  required_providers {
    libvirt = {
      source = "dmacvicar/libvirt"
      version = "0.6.11"
    }
  }
}

# instance the provider
provider "libvirt" {
  uri = "qemu:///system"
}

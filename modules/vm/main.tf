terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

resource "proxmox_vm_qemu" "this" {
  name        = var.vm_name
  target_node = var.target_node
  clone       = var.clone

  cores     = var.cores
  sockets   = var.sockets
  memory    = var.memory
  scsihw    = "virtio-scsi-single"
  onboot    = true

  disk {
    type     = "scsi"
    size     = var.disk_size
    storage  = var.storage
    slot     = var.slot
  }

  network {
    model  = "virtio"
    bridge = var.bridge
  }

  os_type     = "cloud-init"
  ciuser      = var.ciuser
  cipassword  = var.cipassword
  ipconfig0   = "ip=${var.ip_address}/24,gw=${var.gateway}"

  agent       = 1
  tags        = "kubernetes"
}

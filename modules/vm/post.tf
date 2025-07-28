resource "null_resource" "remote_command" {
    depends_on = [ proxmox_vm_qemu.this ]
    provisioner "remote-exec" {
        inline = [
            "sudo sed -i 's/^#\\?PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config.d/60-cloudimg-settings.conf",
            "sudo systemctl restart sshd"
        ]
        connection {
            type        = "ssh"
            host        = proxmox_vm_qemu.var.ip_address
            user        = var.ciuser
            password    = var.cipassword
            timeout     = "5m"
            agent       = false
        }
    }
}

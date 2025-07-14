variable "vm_name"     { type = string }
variable "target_node" { type = string }
variable "clone"       { type = string }

variable "cores"   { type = number }
variable "sockets" { type = number }
variable "memory"  { type = number }

variable "disk_size" { type = string }
variable "storage"   { type = string }
variable "slot"   { type = string }

variable "bridge"     { type = string }
variable "ciuser"     { type = string }
variable "cipassword" { type = string }
variable "ip_address" { type = string }
variable "gateway"    { type = string }

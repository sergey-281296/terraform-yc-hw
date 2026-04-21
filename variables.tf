variable "cloud_id" {
  type        = string
  description = "Yandex Cloud ID"
}

variable "folder_id" {
  type        = string
  description = "Yandex Cloud Folder ID"
}

variable "token" {
  type        = string
  description = "OAuth token"
  sensitive   = true
}

variable "vms_ssh_root_key" {
  type        = string
  description = "ssh public key"
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKwm9GPCGkCQU0fqGu0OIT3FeUGtWQ4ro5lBFCa1q6ub sergey-281296@mail.ru"
}

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    hdd_size      = number
    hdd_type      = string
  }))
  description = "Ресурсы для ВМ"
  default = {
    web = {
      cores         = 2
      memory        = 2
      core_fraction = 5
      hdd_size      = 10
      hdd_type      = "network-hdd"
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
      hdd_size      = 10
      hdd_type      = "network-hdd"
    }
  }
}

variable "metadata" {
  type = map(string)
  description = "Метаданные для ВМ"
  default = {
    serial-port-enable = "1"
    ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKwm9GPCGkCQU0fqGu0OIT3FeUGtWQ4ro5lBFCa1q6ub sergey-281296@mail.ru"
  }
}

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_instance" "platform" {
  name        = "netology-develop-platform-web-${local.web_name}"
  platform_id = "standard-v2"
  zone        = "ru-central1-a"

  resources {
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      type     = var.vms_resources["web"].hdd_type
      size     = var.vms_resources["web"].hdd_size
    }
  }

  network_interface {
    subnet_id = "e9be0ae07guviitl84ts"
    nat       = true
  }

  metadata = var.metadata

  scheduling_policy {
    preemptible = true
  }
}

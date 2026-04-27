resource "yandex_compute_instance" "db" {
  name        = "netology-develop-platform-db-${local.db_name}"
  platform_id = "standard-v2"
  zone        = "ru-central1-a"

  resources {
    cores         = var.vms_resources["db"].cores
    memory        = var.vms_resources["db"].memory
    core_fraction = var.vms_resources["db"].core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.id
      type     = var.vms_resources["db"].hdd_type
      size     = var.vms_resources["db"].hdd_size
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

data "yandex_vpc_network" "default" {
  name = "default-network"
}

data "yandex_vpc_subnet" "default" {
  name = "default-subnet"
}

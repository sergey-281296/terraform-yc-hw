locals {
  web_name = "${var.vms_resources["web"].cores}core-${var.vms_resources["web"].memory}gb"
  db_name  = "${var.vms_resources["db"].cores}core-${var.vms_resources["db"].memory}gb"
}

variable "compartment_ocid" {
  default = "ocid1.compartment.oc1..aaaaaaaa2ph2o3lwq5lq6qdsxdub4jqum25fj6h3uv3v5vxipjcdxkh2xhcq"
}

variable "region" {
  default = "eu-marseille-1"
}

variable "availability_domain" {
  default = "ocid1.availabilitydomain.oc1..aaaaaaaamrcnaivxhl3lf2fw242qqgbqeo5ralo3el5dwxshtimpxifme4jq"
}

variable "PATH_TO_PUBLIC_KEY" {
  type        = string
  default     = "../../ssh/oci-id_key.pem"
  description = "OCI public key"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "is_private" {
  type    = bool
  default = false
}

variable "public_subnet_id" {
  type = string
  default = "ocid1.subnet.oc1.eu-marseille-1.aaaaaaaaf5behhm3aen37ysp6ty4mia52bxdekp4cy6ru7f2zyd6ygnonzfq"
}

variable "private_subnet_id" {
  type = string
}

variable "default_fault_domain" {
  default = "FAULT-DOMAIN-1"
}

variable "os_image_id" {
  //default = "ocid1.image.oc1.eu-zurich-1.aaaaaaaag2uyozo7266bmg26j5ixvi42jhaujso2pddpsigtib6vfnqy5f6q" # Canonical-Ubuntu-20.04-aarch64-2022.01.18-0
  default = "ocid1.image.oc1..aaaaaaaaoca4olqpze2ykvpnptzk2hkge6hcgdj5lqsbvm3ohri3pl7zvtma" # Lamp on Ubuntu
}
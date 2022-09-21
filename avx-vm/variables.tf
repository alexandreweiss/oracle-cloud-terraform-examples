variable "compartment_ocid" {
  default = "ocid1.compartment.oc1..aaaaaaaa2ph2o3lwq5lq6qdsxdub4jqum25fj6h3uv3v5vxipjcdxkh2xhcq"
}

variable "region" {
}

variable "fault_domains" {
  type    = list(any)
  default = ["FAULT-DOMAIN-1", "FAULT-DOMAIN-2", "FAULT-DOMAIN-3"]
}

variable "oci_core_vcn_cidr" {
  default = "10.0.0.0/24"
}

variable "oci_core_subnet_cidr" {
  default = "10.0.0.0/28"
}

variable "oci_core_vcn_dns_label" {
  default = "defaultvcn"
}

variable "oci_core_subnet_dns_label" {
  default = "publicsubnet10"
}

variable "my_public_ip_cidr" {
  type        = string
  description = "My public ip CIDR"
  default = "0.0.0.0/0"
}

variable "availability_domain" {
}

variable "PATH_TO_PUBLIC_KEY" {
  type        = string
  default     = "../../ssh/oci-id_key.pem"
  description = "OCI public key"
}

variable "is_private" {
  type    = bool
  default = false
}

variable "default_fault_domain" {
  default = "FAULT-DOMAIN-1"
}

variable "os_image_id" {
  default = "ocid1.image.oc1.eu-marseille-1.aaaaaaaalgmsx4yvo3ras7bksgcupn3nkh54cxp4z36tho4uomi5jcovi2yq" # Canonical-Ubuntu-20.04-aarch64-2022.01.18-0
}
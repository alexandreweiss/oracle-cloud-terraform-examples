output "instance_ip" {
  value = var.is_private == true ? oci_core_instance.ubuntu_oci_instance.private_ip : oci_core_instance.ubuntu_oci_instance.public_ip
}

output "vcn_id" {
  value = oci_core_vcn.default_oci_core_vcn.id
}

output "public_subnet_id" {
  value = oci_core_subnet.default_oci_core_subnet10.id
}

output "security_list_id" {
  value = oci_core_default_security_list.default_security_list.id
}

output "public_subnet_cidr" {
  value = oci_core_subnet.default_oci_core_subnet10.cidr_block
}
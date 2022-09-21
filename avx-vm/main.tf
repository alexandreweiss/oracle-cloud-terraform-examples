resource "oci_core_vcn" "default_oci_core_vcn" {
  cidr_block     = var.oci_core_vcn_cidr
  compartment_id = var.compartment_ocid
  display_name   = "vm-vcn"
  dns_label      = var.oci_core_vcn_dns_label
}

resource "oci_core_subnet" "default_oci_core_subnet" {
  cidr_block        = var.oci_core_subnet_cidr
  compartment_id    = var.compartment_ocid
  display_name      = "${var.oci_core_subnet_cidr} vm-vcn-subnet"
  dns_label         = var.oci_core_subnet_dns_label
  route_table_id    = oci_core_vcn.default_oci_core_vcn.default_route_table_id
  vcn_id            = oci_core_vcn.default_oci_core_vcn.id
  security_list_ids = [oci_core_default_security_list.default_security_list.id]
}

resource "oci_core_instance" "ubuntu_oci_instance" {
  agent_config {
    is_management_disabled = "false"
    is_monitoring_disabled = "false"

    plugins_config {
      desired_state = "DISABLED"
      name          = "Vulnerability Scanning"
    }

    plugins_config {
      desired_state = "DISABLED"
      name          = "Bastion"
    }
  }

  availability_config {
    recovery_action = "RESTORE_INSTANCE"
  }

  availability_domain = var.availability_domain
  compartment_id      = var.compartment_ocid
  fault_domain        = var.default_fault_domain

  create_vnic_details {
    assign_private_dns_record = true
    assign_public_ip          = var.is_private == true ? false : true
    subnet_id                 = oci_core_subnet.default_oci_core_subnet.id
  }

  display_name = "nginx-vm"

  instance_options {
    are_legacy_imds_endpoints_disabled = false
  }

  is_pv_encryption_in_transit_enabled = true

  metadata = {
    "ssh_authorized_keys" = file(var.PATH_TO_PUBLIC_KEY)
    "user_data"           = data.template_cloudinit_config.ubuntu_init.rendered
  }

  shape = "VM.Standard.E3.Flex"
  shape_config {
    memory_in_gbs = "2"
    ocpus         = "1"
  }

  source_details {
    source_id   = var.os_image_id
    source_type = "image"
  }
}
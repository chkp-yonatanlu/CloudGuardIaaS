provider "google" {
  credentials = file(var.service_account_path)
  project = var.project
  zone = var.zone
}

resource "random_string" "random_string" {
  length = 5
  special = false
  upper = false
  keepers = {}
}
data "google_compute_network" "external_network" {
  name = var.network_name[0]
}
resource "random_string" "random_sic_key" {
  length = 12
  special = false
}
module "network_and_subnet" {
  source = "../common/network-and-subnet"

  prefix = "${var.prefix}-${random_string.random_string.result}"
  type = "single"
  network_cidr = var.network_cidr
  private_ip_google_access = true
  region =  join("-", concat(split("-", var.zone)[0],split("-", var.zone)[0]))
  network_name = var.network_name
}
resource "google_compute_firewall" "ICMP_firewall_rules" {
  count = local.ICMP_traffic_condition
  name = "${var.prefix}-icmp-${random_string.random_string.result}"
  network = data.google_compute_network.external_network.self_link
  allow {
    protocol = "icmp"
  }
  source_ranges = var.network_icmpSourceRanges
  target_tags = [
    "checkpoint-${replace(replace(lower(var.installationType)," ","-"),"(standalone)","standalone")}"]
}
resource "google_compute_firewall" "TCP_firewall_rules" {
  count = local.TCP_traffic_condition
  name = "${var.prefix}-tcp-${random_string.random_string.result}"
  network = data.google_compute_network.external_network.self_link
  allow {
    protocol = "tcp"
  }
  source_ranges = var.network_tcpSourceRanges
  target_tags = [
    "checkpoint-${replace(replace(lower(var.installationType)," ","-"),"(standalone)","standalone")}"]
}
resource "google_compute_firewall" "UDP_firewall_rules" {
  count = local.UDP_traffic_condition
  name = "${var.prefix}-udp-${random_string.random_string.result}"
  network = data.google_compute_network.external_network.self_link
  allow {
    protocol = "udp"
  }
  source_ranges = var.network_udpSourceRanges
  target_tags = [
    "checkpoint-${replace(replace(lower(var.installationType)," ","-"),"(standalone)","standalone")}"]
}
resource "random_string" "generated_password" {
  length = 12
  special = false
}
resource "google_compute_firewall" "SCTP_firewall_rules" {
  count = local.SCTP_traffic_condition
  name = "${var.prefix}-sctp-${random_string.random_string.result}"
  network = data.google_compute_network.external_network.self_link
  allow {
    protocol = "sctp"
  }
  source_ranges = var.network_sctpSourceRanges
  target_tags = [
    "checkpoint-${replace(replace(lower(var.installationType)," ","-"),"(standalone)","standalone")}"]
}
resource "google_compute_firewall" "ESP_firewall_rules" {
  count = local.ESP_traffic_condition
  name = "${var.prefix}-esp-${random_string.random_string.result}"
  network = data.google_compute_network.external_network.self_link
  allow {
    protocol = "esp"
  }
  source_ranges = var.network_espSourceRanges
  target_tags = [
    "checkpoint-${replace(replace(lower(var.installationType)," ","-"),"(standalone)","standalone")}"]
}
module "internal_network1_and_subnet" {
  source = "../common/network-and-subnet"

  prefix = "${var.prefix}-${random_string.random_string.result}"
  type = "internal-network1"
  network_cidr = var.internal_network1_cidr
  private_ip_google_access = false
  region =  join("-", concat(split("-", var.zone)[0],split("-", var.zone)[0]))
  network_name = var.internal_network1_name
}

module "internal_network2_and_subnet" {
  count = var.numAdditionalNICs < 2 ? 0 : 1
  source = "../common/network-and-subnet"

  prefix = "${var.prefix}-${random_string.random_string.result}"
  type = "internal-network2"
  network_cidr = var.internal_network2_cidr
  private_ip_google_access = false
  region =  join("-", concat(split("-", var.zone)[0],split("-", var.zone)[0]))
  network_name = var.internal_network2_name
}

module "internal_network3_and_subnet" {
  count = var.numAdditionalNICs < 3 ? 0 : 1
  source = "../common/network-and-subnet"

  prefix = "${var.prefix}-${random_string.random_string.result}"
  type = "internal-network3"
  network_cidr = var.internal_network3_cidr
  private_ip_google_access = false
  region =  join("-", concat(split("-", var.zone)[0],split("-", var.zone)[0]))
  network_name = var.internal_network3_name
}

module "internal_network4_and_subnet" {
  count = var.numAdditionalNICs < 4 ? 0 : 1
  source = "../common/network-and-subnet"

  prefix = "${var.prefix}-${random_string.random_string.result}"
  type = "internal-network4"
  network_cidr = var.internal_network4_cidr
  private_ip_google_access = false
  region =  join("-", concat(split("-", var.zone)[0],split("-", var.zone)[0]))
  network_name = var.internal_network4_name
}

module "internal_network5_and_subnet" {
  count = var.numAdditionalNICs < 5 ? 0 : 1
  source = "../common/network-and-subnet"
  prefix = "${var.prefix}-${random_string.random_string.result}"
  type = "internal-network5"
  network_cidr = var.internal_network5_cidr
  private_ip_google_access = false
  region =  join("-", concat(split("-", var.zone)[0],split("-", var.zone)[0]))
  network_name = var.internal_network5_name
}
module "internal_network6_and_subnet" {
  count = var.numAdditionalNICs < 6 ? 0 : 1
  source = "../common/network-and-subnet"
  prefix = "${var.prefix}-${random_string.random_string.result}"
  type = "internal-network6"
  network_cidr = var.internal_network6_cidr
  private_ip_google_access = false
  region =  join("-", concat(split("-", var.zone)[0],split("-", var.zone)[0]))
  network_name = var.internal_network6_name
}
module "internal_network7_and_subnet" {
  count = var.numAdditionalNICs < 7 ? 0 : 1
  source = "../common/network-and-subnet"
  prefix = "${var.prefix}-${random_string.random_string.result}"
  type = "internal-network7"
  network_cidr = var.internal_network7_cidr
  private_ip_google_access = false
  region =  join("-", concat(split("-", var.zone)[0],split("-", var.zone)[0]))
  network_name = var.internal_network7_name
}
module "internal_network8_and_subnet" {
  count = var.numAdditionalNICs < 8 ? 0 : 1
  source = "../common/network-and-subnet"
  prefix = "${var.prefix}-${random_string.random_string.result}"
  type = "internal-network8"
  network_cidr = var.internal_network8_cidr
  private_ip_google_access = false
  region =  join("-", concat(split("-", var.zone)[0],split("-", var.zone)[0]))
  network_name = var.internal_network7_name
}
resource "google_compute_instance" "gateway" {
  name = "${var.prefix}-${random_string.random_string.result}"
  description = "Check Point Security ${replace(var.installationType,"(Standalone)","--")==var.installationType?split(" ",var.installationType)[0]:" Gateway and Management"}"
  zone = var.zone
  labels = {goog-dm = "${var.prefix}-${random_string.random_string.result}"}
  tags =replace(var.installationType,"(Standalone)","--")==var.installationType?[
    "checkpoint-${split(" ",lower(var.installationType))[0]}","${var.prefix}${random_string.random_string.result}"
  ]:["checkpoint-gateway","checkpoint-management","${var.prefix}${random_string.random_string.result}"]
  machine_type = var.machine_type
  can_ip_forward = var.installationType == "Management only"? false:true
  boot_disk {
    auto_delete = true
    device_name = "chkp-single-boot-${random_string.random_string.result}"
    initialize_params {
      size = var.bootDiskSizeGb
      type = local.disk_type_condition
      image = var.image_name
    }
  }
  network_interface {
    network = var.network_name[0]
    subnetwork = var.subnetwork_name[0]
    dynamic "access_config" {
      for_each = var.externalIP == "None"? []:[1]
      content {
        nat_ip = var.externalIP=="static" ? google_compute_address.static.address : null
      }
    }
  }
  dynamic "network_interface" {
    for_each = var.numAdditionalNICs >= 1 ? [
      1] : []
    content {
      network = local.create_internal_network1_condition? module.internal_network1_and_subnet.new_created_network_link : [var.internal_network1_name]
      subnetwork =local.create_internal_network1_condition? module.internal_network1_and_subnet.new_created_subnet_link : [var.internal_network1_subnetwork_name]
    }
  }
  dynamic "network_interface" {
    for_each = var.numAdditionalNICs >= 2 ? [
      1] : []
    content {
      network = local.create_internal_network2_condition? module.internal_network2_and_subnet.new_created_network_link : [var.internal_network2_name]
      subnetwork =local.create_internal_network2_condition? module.internal_network2_and_subnet.new_created_subnet_link : [var.internal_network2_subnetwork_name]
    }
  }
  dynamic "network_interface" {
    for_each = var.numAdditionalNICs >= 3 ? [
      3] : []
    content {
      network = local.create_internal_network3_condition? module.internal_network3_and_subnet.new_created_network_link : [var.internal_network3_name]
      subnetwork =local.create_internal_network3_condition? module.internal_network3_and_subnet.new_created_subnet_link : [var.internal_network3_subnetwork_name]
    }
  }
  dynamic "network_interface" {
    for_each = var.numAdditionalNICs >= 4 ? [
      4] : []
    content {
      network = local.create_internal_network4_condition? module.internal_network4_and_subnet.new_created_network_link : [var.internal_network4_name]
      subnetwork =local.create_internal_network4_condition? module.internal_network4_and_subnet.new_created_subnet_link : [var.internal_network4_subnetwork_name]
    }
  }
  dynamic "network_interface" {
    for_each = var.numAdditionalNICs >= 5 ? [
      5] : []
    content {
      network = local.create_internal_network5_condition? module.internal_network5_and_subnet.new_created_network_link : [var.internal_network5_name]
      subnetwork =local.create_internal_network5_condition? module.internal_network5_and_subnet.new_created_subnet_link : [var.internal_network5_subnetwork_name]
    }
  }
  dynamic "network_interface" {
    for_each = var.numAdditionalNICs == 6 ? [
      6] : []
    content {
      network = local.create_internal_network6_condition? module.internal_network6_and_subnet.new_created_network_link : [var.internal_network6_name]
      subnetwork =local.create_internal_network6_condition? module.internal_network6_and_subnet.new_created_subnet_link : [var.internal_network6_subnetwork_name]
    }
  }
  dynamic "network_interface" {
    for_each = var.numAdditionalNICs == 7 ? [
      7] : []
    content {
      network = local.create_internal_network7_condition? module.internal_network7_and_subnet.new_created_network_link : [var.internal_network7_name]
      subnetwork =local.create_internal_network7_condition? module.internal_network7_and_subnet.new_created_subnet_link : [var.internal_network7_subnetwork_name]
    }
  }
  dynamic "network_interface" {
    for_each = var.numAdditionalNICs == 8 ? [
      8] : []
    content {
      network = local.create_internal_network8_condition? module.internal_network8_and_subnet.new_created_network_link : [var.internal_network8_name]
      subnetwork =local.create_internal_network8_condition? module.internal_network8_and_subnet.new_created_subnet_link : [var.internal_network8_subnetwork_name]
    }
  }

  service_account {
    scopes = [
      "https://www.googleapis.com/auth/cloudruntimeconfig",
      "https://www.googleapis.com/auth/monitoring.write"]
  }

  metadata = local.admin_SSH_key_condition ? {
    instanceSSHKey = var.admin_SSH_key
    adminPasswordSourceMetadata = var.generatePassword ?random_string.generated_password.result : ""
  } : {adminPasswordSourceMetadata = var.generatePassword?random_string.generated_password.result : ""}

  metadata_startup_script = templatefile("${path.module}/../common/startup-script.sh", {
    // script's arguments
    generatePassword = var.generatePassword
    config_url = "https://runtimeconfig.googleapis.com/v1beta1/projects/${var.project}/configs/-config"
    config_path = "projects/${var.project}/configs/-config"
    sicKey = ""
    allowUploadDownload = var.allowUploadDownload
    templateName = "single_tf"
    templateVersion = "20211128"
    templateType = "terraform"
    hasInternet = "true"
    enableMonitoring = var.enableMonitoring
    shell = var.admin_shell
    installationType = var.installationType
    computed_sic_key = var.sicKey
    managementGUIClientNetwork = var.managementGUIClientNetwork
    installSecurityManagement = true
    primary_cluster_address_name = ""
    secondary_cluster_address_name = ""
    subnet_router_meta_path = ""
    mgmtNIC = var.management_nic
    managementNetwork = ""
  })
}
resource "google_compute_address" "static" {
  name = "ipv4-address"
}
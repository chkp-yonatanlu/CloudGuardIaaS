variable "service_account_path" {
  type = string
  description = "User service account path in JSON format - From the service account key page in the Cloud Console choose an existing account or create a new one. Next, download the JSON key file. Name it something you can remember, store it somewhere secure on your machine, and supply the path to the location is stored."
  default = ""
}
variable "project" {
  type = string
  description = "Personal project id. The project indicates the default GCP project all of your resources will be created in."
  default = ""
}
variable "zone" {
  type = string
  description = "The zone determines what computing resources are available and where your data is stored and used"
  default = "us-central1-a"
}
variable "image_name" {
  type = string
  description = "The single gateway and management image name"
}
variable "installationType" {
  type = string
  description = "Installation type and version"
  default = "Gateway only"
}
variable "license" {
  type = string
  description = "Checkpoint license (BYOL or PAYG)."
  default = "BYOL"
}
variable "prefix" {
  type = string
  description = "(Optional) Resources name prefix"
  default = "chkp-single-tf-"
}
variable "machine_type" {
  type = string
  default = "n1-standard-4"
}
variable "network_name" {
  type = list(string)
  description = "The network determines what network traffic the instance can access"
  default = ["default"]
}
variable "subnetwork_name" {
  type = list(string)
  description = "Assigns the instance an IPv4 address from the subnetwork’s range. Instances in different subnetworks can communicate with each other using their internal IPs as long as they belong to the same network."
  default = ["default"]
}
variable "network_cidr" {
  type = string
  description = "Cluster external subnet CIDR. If the variable's value is not empty double quotes, a new network will be created. The Cluster public IP will be translated to a private address assigned to the active member in this external network."
  default = "10.0.0.0/24"
}
variable "network_enableTcp" {
  type = bool
  description = "Allow TCP traffic from the Internet"
  default = false
}
variable "network_tcpSourceRanges" {
  type = list(string)
  description = "Allow TCP traffic from the Internet"
  default = []
}
variable "network_enableGwNetwork" {
  type = bool
  description = "This is relevant for Management only. The network in which managed gateways reside"
  default = false
}
variable network_gwNetworkSourceRanges{
  type = list(string)
  description = "Allow TCP traffic from the Internet"
  default = []
}
variable "network_enableIcmp" {
  type = bool
  description ="Allow ICMP traffic from the Internet"
  default = false
}
variable "network_icmpSourceRanges" {
  type = list(string)
  description = "(Optional) Source IP ranges for ICMP traffic - Traffic is only allowed from sources within these IP address ranges. Use CIDR notation when entering ranges. Please leave empty list to unable ICMP traffic."
  default = []
}
variable network_enableUdp{
  type = bool
  description ="Allow UDP traffic from the Internet"
  default = false
}
variable "network_udpSourceRanges" {
  type = list(string)
  description = "(Optional) Source IP ranges for UDP traffic - Traffic is only allowed from sources within these IP address ranges. Use CIDR notation when entering ranges. Please leave empty list to unable UDP traffic."
  default = []
}
variable "network_enableSctp" {
  type = bool
  description ="Allow SCTP traffic from the Internet"
  default = false
}
variable "network_sctpSourceRanges" {
  type = list(string)
  description = "(Optional) Source IP ranges for SCTP traffic - Traffic is only allowed from sources within these IP address ranges. Use CIDR notation when entering ranges. Please leave empty list to unable SCTP traffic."
  default = []
}
variable "network_enableEsp" {
  type = bool
  description ="Allow ESP traffic from the Internet	"
  default = false
}
variable "network_espSourceRanges" {
  type = list(string)
  description = "(Optional) Source IP ranges for ESP traffic - Traffic is only allowed from sources within these IP address ranges. Use CIDR notation when entering ranges. Please leave empty list to unable ESP traffic."
  default = []
}
variable "diskType" {
  type = string
  description ="Disk type"
  default = "pd-ssd"
}
variable "bootDiskSizeGb" {
  type = number
  description ="Disk size in GB"
  default = 100
}
variable "generatePassword" {
  type = bool
  description ="Automatically generate an administrator password	"
  default = false
}
variable "management_nic" {
  type = string
  description = "Management Interface - Gateways in GCP can be managed by an ephemeral public IP or using the private IP of the internal interface (eth1)."
  default = "Ephemeral Public IP (eth0)"
}
variable "allowUploadDownload" {
  type = string
  description ="Allow download from/upload to Check Point"
  default = true
}
variable "enableMonitoring" {
  type = bool
  description ="Enable Stackdriver monitoring"
  default = false
}
variable "admin_shell" {
  type = string
  description = "Change the admin shell to enable advanced command line configuration."
  default = "/etc/cli.sh"
}
variable "admin_SSH_key" {
  type = string
  description = "(Optional) The SSH public key for SSH authentication to the template instances. Leave this field blank to use all project-wide pre-configured SSH keys."
  default = ""
}
variable "sicKey" {
  type = string
  description ="The Secure Internal Communication one time secret used to set up trust between the single gateway object and the management server"
  default = ""
}
variable "managementGUIClientNetwork" {
  type = string
  description ="Allowed GUI clients	"
  default = "0.0.0.0/0"
}
variable "numAdditionalNICs" {
  type = number
  description ="Number of additional network interfaces"
  default = 0
}
variable "externalIP" {
  type = string
  description = "External IP address type"
  default = "static"
}
#variable "internal_network1_network" {
#  type = list(string)
#  description = "1st internal network ID in the chosen zone."
#  default = []
#}
#variable "internal_network1_subnetwork" {
#  type = list(string)
#  description = "1st internal subnet ID in the chosen network."
#  default = []
#}
variable "internal_network1_cidr" {
  type = string
  description = "1st internal subnet CIDR. If the variable's value is not empty double quotes, a new subnet will be created. Assigns the cluster members an IPv4 address in this internal network."
  default = "10.0.2.0/24"
}
variable "internal_network1_name" {
  type = list(string)
  description = "1st internal network ID in the chosen zone. The network determines what network traffic the instance can access. If you have specified a CIDR block at var.internal_network1_cidr, this network name will not be used. "
  default = [""]
}
variable "internal_network1_subnetwork_name" {
  type = list(string)
  description = "1st internal subnet ID in the chosen network. Assigns the instance an IPv4 address from the subnetwork’s range. If you have specified a CIDR block at var.internal_network1_cidr, this subnetwork will not be used. Instances in different subnetworks can communicate with each other using their internal IPs as long as they belong to the same network."
  default = [""]
}
variable "internal_network2_cidr" {
  type = list(string)
  description = "Used only if var.num_internal_networks is 2 or and above - 2nd internal subnet CIDR. If the variable's value is not empty double quotes, a new subnet will be created. Assigns the cluster members an IPv4 address in this internal network."
  default = [""]
}
variable "internal_network2_name" {
  type = list(string)
  description = "Used only if var.num_internal_networks is 2 or and above - 2nd internal network ID in the chosen zone. The network determines what network traffic the instance can access. If you have specified a CIDR block at var.internal_network2_cidr, this network name will not be used. "
  default = [""]
}
variable "internal_network2_subnetwork_name" {
  type = list(string)
  description = "Used only if var.num_internal_networks is 2 or and above - 2nd internal subnet ID in the chosen network. Assigns the instance an IPv4 address from the subnetwork’s range. If you have specified a CIDR block at var.internal_network2_cidr, this subnetwork will not be used. Instances in different subnetworks can communicate with each other using their internal IPs as long as they belong to the same network."
  default = [""]
}
variable "internal_network3_cidr" {
  type = list(string)
  description = "Used only if var.num_internal_networks is 3 or and above - 3rd internal subnet CIDR. If the variable's value is not empty double quotes, a new subnet will be created. Assigns the cluster members an IPv4 address in this internal network."
  default = [""]
}
variable "internal_network3_name" {
  type = list(string)
  description = "Used only if var.num_internal_networks is 3 or and above - 3rd internal network ID in the chosen zone. The network determines what network traffic the instance can access. If you have specified a CIDR block at var.internal_network3_cidr, this network name will not be used. "
  default = [""]
}
variable "internal_network3_subnetwork_name" {
  type = list(string)
  description = "Used only if var.num_internal_networks is 3 or and above - 3rd internal subnet ID in the chosen network. Assigns the instance an IPv4 address from the subnetwork’s range. If you have specified a CIDR block at var.internal_network3_cidr, this subnetwork will not be used. Instances in different subnetworks can communicate with each other using their internal IPs as long as they belong to the same network."
  default = [""]
}
variable "internal_network4_cidr" {
  type = list(string)
  description = "Used only if var.num_internal_networks is 4 or and above - 4th internal subnet CIDR. If the variable's value is not empty double quotes, a new subnet will be created. Assigns the cluster members an IPv4 address in this internal network."
  default = [""]
}
variable "internal_network4_name" {
  type = list(string)
  description = "Used only if var.num_internal_networks is 4 or and above - 4th internal network ID in the chosen zone. The network determines what network traffic the instance can access. If you have specified a CIDR block at var.internal_network4_cidr, this network name will not be used. "
  default = [""]
}
variable "internal_network4_subnetwork_name" {
  type = list(string)
  description = "Used only if var.num_internal_networks is 4 or and above - 4th internal subnet ID in the chosen network. Assigns the instance an IPv4 address from the subnetwork’s range. If you have specified a CIDR block at var.internal_network4_cidr, this subnetwork will not be used. Instances in different subnetworks can communicate with each other using their internal IPs as long as they belong to the same network."
  default = [""]
}
variable "internal_network5_cidr" {
  type = list(string)
  description = "Used only if var.num_internal_networks is 5 or and above - 5th internal subnet CIDR. If the variable's value is not empty double quotes, a new subnet will be created. Assigns the cluster members an IPv4 address in this internal network."
  default = [""]
}
variable "internal_network5_name" {
  type = list(string)
  description = "Used only if var.num_internal_networks is 5 or and above - 5th internal network ID in the chosen zone. The network determines what network traffic the instance can access. If you have specified a CIDR block at var.internal_network5_cidr, this network name will not be used. "
  default = [""]
}
variable "internal_network5_subnetwork_name" {
  type = list(string)
  description = "Used only if var.num_internal_networks is 5 or and above - 5th internal subnet ID in the chosen network. Assigns the instance an IPv4 address from the subnetwork’s range. If you have specified a CIDR block at var.internal_network5_cidr, this subnetwork will not be used. Instances in different subnetworks can communicate with each other using their internal IPs as long as they belong to the same network."
  default = [""]
}
variable "internal_network6_cidr" {
  type = list(string)
  description = "Used only if var.num_internal_networks equals 6 - 6th internal subnet CIDR. If the variable's value is not empty double quotes, a new subnet will be created. Assigns the cluster members an IPv4 address in this internal network."
  default = [""]
}
variable "internal_network6_name" {
  type = list(string)
  description = "Used only if var.num_internal_networks equals 6 - 6th internal network ID in the chosen zone. The network determines what network traffic the instance can access. If you have specified a CIDR block at var.internal_network6_cidr, this network name will not be used. "
  default = [""]
}
variable "internal_network6_subnetwork_name" {
  type = list(string)
  description = "Used only if var.num_internal_networks equals 6 - 6th internal subnet ID in the chosen network. Assigns the instance an IPv4 address from the subnetwork’s range. If you have specified a CIDR block at var.internal_network6_cidr, this subnetwork will not be used. Instances in different subnetworks can communicate with each other using their internal IPs as long as they belong to the same network."
  default = [""]
}
variable "internal_network7_cidr" {
  type = list(string)
  description = "Used only if var.num_internal_networks equals 7 - 7th internal subnet CIDR. If the variable's value is not empty double quotes, a new subnet will be created. Assigns the cluster members an IPv4 address in this internal network."
  default = [""]
}
variable "internal_network7_name" {
  type = list(string)
  description = "Used only if var.num_internal_networks equals 7 - 7th internal network ID in the chosen zone. The network determines what network traffic the instance can access. If you have specified a CIDR block at var.internal_network7_cidr, this network name will not be used. "
  default = [""]
}
variable "internal_network7_subnetwork_name" {
  type = list(string)
  description = "Used only if var.num_internal_networks equals 7 - 7th internal subnet ID in the chosen network. Assigns the instance an IPv4 address from the subnetwork’s range. If you have specified a CIDR block at var.internal_network7_cidr, this subnetwork will not be used. Instances in different subnetworks can communicate with each other using their internal IPs as long as they belong to the same network."
  default = [""]
}
variable "internal_network8_cidr" {
  type = list(string)
  description = "Used only if var.num_internal_networks equals 8 - 8th internal subnet CIDR. If the variable's value is not empty double quotes, a new subnet will be created. Assigns the cluster members an IPv4 address in this internal network."
  default = [""]
}
variable "internal_network8_name" {
  type = list(string)
  description = "Used only if var.num_internal_networks equals 8 - 8th internal network ID in the chosen zone. The network determines what network traffic the instance can access. If you have specified a CIDR block at var.internal_network8_cidr, this network name will not be used. "
  default = [""]
}
variable "internal_network8_subnetwork_name" {
  type = list(string)
  description = "Used only if var.num_internal_networks equals 8 - 8th internal subnet ID in the chosen network. Assigns the instance an IPv4 address from the subnetwork’s range. If you have specified a CIDR block at var.internal_network8_cidr, this subnetwork will not be used. Instances in different subnetworks can communicate with each other using their internal IPs as long as they belong to the same network."
  default = [""]
}
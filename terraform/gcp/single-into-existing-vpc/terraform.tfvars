# --- Google Provider ---
service_account_path                       = "service-accounts/service-account-file-name.json"
project                                    = "project-name"

# --- Check Point Deployment---
image_name                                 ="check-point-r8040-gw-byol-123-456-v12345678"
installationType                           ="Gateway only"
license                                    ="BYOL"
prefix                                     ="chkp-single-tf-"
management_nic                             ="Ephemeral Public IP (eth0)"
admin_shell                                ="/etc/cli.sh"
admin_SSH_key                              ="ssh-rsa xxxxxxxxxxxxxxxxxxxxxxxx imported-openssh-key"
generatePassword                           =false
allowUploadDownload                        =false
sicKey                                     =""
managementGUIClientNetwork                 ="0.0.0.0/0"

# --- Networking---
zone                                       ="us-central1-a"
network_name                               =   ["default"]
subnetwork_name                            =        ["default"]
network_cidr                               = "10.0.0.0/24"
network_enableTcp                          =false
network_tcpSourceRanges                    =[""]
network_enableGwNetwork                    =false
network_gwNetworkSourceRanges              =[""]
network_enableIcmp                         =false
network_icmpSourceRanges                   =[""]
network_enableUdp                          = false
network_udpSourceRanges                    =[""]
network_enableSctp                         =false
network_sctpSourceRanges                   =[""]
network_enableEsp                          =false
network_espSourceRanges                    =[""]
numAdditionalNICs                          =1
externalIP                                 ="static"
internal_network1_cidr=                    "11.0.0.0/9"
internal_network1_name=                    ["yonatanlu-NIC1"]
internal_network1_subnetwork_name=         ["yonatanlu-NIC1-subnetwork"]
# --- Instances configuration---
machine_type                               ="n1-standard-4"
diskType                                   ="SSD Persistent Disk"
bootDiskSizeGb                             =100
enableMonitoring                           =false

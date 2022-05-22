# run <az account list-locations --output table> to list all location
variable "resource_group_location" {
  description = "Region in which Azure Resources to be created"
  type        = string
  default     = "eastus"
}

/**************************** VNET VAR ****************************/
variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
  default     = "vnet"
}
variable "vnet_address_space" {
  description = "Virtual Network address_space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
/*********************** END OF VNET VAR ************************/


/************************ UI SUBNET VAR *************************/
variable "uisubnet_name" {
  description = "User Interface Subnet Name"
  type        = string
  default     = "uisubnet"
}

variable "uisubnet_address" {
  description = "User Interface Subnet Address Spaces"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}
/********************* END OF UI SUBNET VAR **********************/

/************************ API SUBNET VAR *************************/
variable "apisubnet_name" {
  description = "User Interface Subnet Name"
  type        = string
  default     = "apisubnet"
}

variable "apisubnet_address" {
  description = "API Subnet Address Spaces"
  type        = list(string)
  default     = ["10.0.11.0/24"]
}
/********************* END OF UI SUBNET VAR **********************/

/************************ DB SUBNET VAR *************************/
variable "db_subnet_name" {
  description = "DB Subnet Name"
  type        = string
  default     = "dbsubnet"
}

variable "db_subnet_address" {
  description = "DB Subnet Address Spaces"
  type        = list(string)
  default     = ["10.0.21.0/24"]
}
/********************* END OF DB SUBNET VAR **********************/

/************************ AG SUBNET VAR *************************/
variable "ag_subnet_name" {
  description = "Application Gateway Subnet Name"
  type        = string
  default     = "agsubnet"
}

variable "ag_subnet_address" {
  description = "Application Gateway Subnet Address Spaces"
  type        = list(string)
  default     = ["10.0.31.0/24"]
}
/********************* END OF DB SUBNET VAR **********************/


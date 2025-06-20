variable "vpc_cidr_block" {
    description = "CIDR block for the VPC"
    type        = string
    default = ""
}
variable "tags" {
    description = "Tags to apply to the VPC"
    type        = map(string)
    default     = {}
}
variable "vpc_name" {
    description = "Name of the VPC"
    type        = string
    default     = "default-vpc"
  
}

variable "public_subnet_cidr_block" {
    description = "CIDR block for the public subnet"
    type        = string
    default     = ""    
  
}
variable "public_availability_zone" {
    description = "Availability zone for the public subnet"
    type        = string
    default     = ""
  
}
variable "private_subnet_cidr_block" {
    description = "CIDR block for the private subnet"
    type        = string
    default     = ""
  
}

variable "private_availability_zone" {
    description = "Availability zone for the private subnet"
    type        = string
    default     = ""    
  
}
vpc_cidr_block = "10.3.0.0/16"
tags = {
  Environment = "dev"
  Project     = "example-project"
}
vpc_name = "example-vpc"
private_availability_zone = "us-east-1b"  # Example availability zone, adjust as needed
public_subnet_cidr_block = "10.3.0.1/24"
public_availability_zone = "us-east-1a"  # Example availability zone, adjust as needed
private_subnet_cidr_block = "10.3.0.2/24"

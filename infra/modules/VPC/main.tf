resource aws_vpc "vpc" {
  cidr_block = var.vpc_cidr_block

  tags = merge(
    {
      Name = var.vpc_name
    },
    var.tags
  )
}

resource "aws_subnet" "public-subnet" {
   
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.public_subnet_cidr_block
    availability_zone = var.public_availability_zone
    map_public_ip_on_launch = true
    tags = merge(
        {
            Name = "${var.vpc_name}-public-subnet"
        },
        var.tags
    )
}

resource "aws_subnet" "private-subnet" {
   
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.private_subnet_cidr_block
    availability_zone = var.private_availability_zone
    tags = merge(
        {
            Name = "${var.vpc_name}-private-subnet"
        },
        var.tags
    )
  
}

resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.vpc.id
    tags = merge(
        {
            Name = "${var.vpc_name}-public-route-table"
        },
        var.tags
    )


}

resource "aws_route_table_association" "public_subnet_association" {
    subnet_id = aws_subnet.public-subnet.id
    route_table_id = aws_route_table.public_route_table.id
    gateway_id = aws_internet_gateway.internet_gateway.id
}

resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = aws_vpc.vpc.id
    tags = merge(
        {
            Name = "${var.vpc_name}-internet-gateway"
        },
        var.tags
    )
}

resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.vpc.id
    tags = merge(
        {
            Name = "${var.vpc_name}-private-route-table"
        },
        var.tags
    )
}

resource "aws_route_table_association" "private_subnet_association" {
    subnet_id = aws_subnet.private-subnet.id
    route_table_id = aws_route_table.private_route_table.id
}

# resource "aws_nat_gateway" "nat_gateway" {
#     subnet_id = aws_subnet.public-subnet.id
#     tags = merge(
#         {
#             Name = "${var.vpc_name}-nat-gateway"
#         },
#         var.tags
#     )
#     public_ip = aws_eip.eip.id
# }

# resource "aws_eip" "eip" {
#     domain = "vpc"


#     tags = merge(
#         {
#         Name = "${var.vpc_name}-eip"
#         },)
# }

# resource "aws_eip_association" "to_nat" {
#     allocation_id = aws_eip.eip.id
#     instance_id = aws_nat_gateway.nat_gateway.id



# }
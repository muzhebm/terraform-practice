resource "aws_vpc" "vpcs2" {
    cidr_block = var.network.vpccidr
    tags = {
      Name=var.network.vpcname
    }
}
resource "aws_subnet" "subnets" {
    count = length(var.network.subnets[0].subnetscidr)
    vpc_id = aws_vpc.vpcs2.id
    cidr_block = var.network.subnets[0].subnetscidr[count.index]
    availability_zone = var.network.subnets[0].subnetsaz[count.index]
    tags = {
      Name=var.network.subnets[0].subnetsname[count.index]

    }
    depends_on = [ aws_vpc.vpcs2 ]

}
resource "aws_route_table" "newroute" {
    vpc_id = aws_vpc.vpcs2.id
    route {
        cidr_block="0.0.0.0/0"
        gateway_id=aws_internet_gateway.mynewgw.id
    }
    tags = {
      Name="myroute"
    }
    depends_on = [ aws_vpc.vpcs2 ]
  
}
resource "aws_internet_gateway" "mynewgw" {
    vpc_id = aws_vpc.vpcs2.id
    tags = {
      Name="myigw"
    }
    
  
}
resource "aws_route_table_association" "mypublicroute" {
    route_table_id=aws_route_table.newroute.id
    subnet_id = aws_subnet.subnets[0].id


depends_on=[aws_subnet.subnets,aws_route_table.newroute]
}
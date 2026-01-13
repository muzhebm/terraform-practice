data "aws_vpc" "myalreadyvpc1" {
    id = "vpc-05d159e2e653bee1f"
  
}
data "aws_subnet" "myalreadysub"{
    vpc_id = data.aws_vpc.myalreadyvpc1.id
}
resource "aws_nat_gateway" "mynat" {
    count = 0
    connectivity_type = "private"
    subnet_id = data.aws_subnet.subnets.id
    
  
}
resource "aws_route_table_association" "myprsub" {
    count = 0
    route_table_id = data.aws_route_table.newroute.id
    subnet_id = data.aws_subnet.subnets[0].id

  
}
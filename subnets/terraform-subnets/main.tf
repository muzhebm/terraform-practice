resource "aws_vpc" "myvpc" {
    cidr_block = "192.168.0.0/16"
    tags = {
      Name="vpcs1"
    }
  
}
resource "aws_subnet" "sub1" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "192.168.0.0/24"
    availability_zone = "ap-south-1a"
    tags = {
      Name = "mysub1"
    }
  
}
resource "aws_subnet" "sub2" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "192.168.1.0/24"
    availability_zone = "ap-south-1b"
    tags = {
      Names = "mysub2"
    }
  
}
resource "aws_subnet" "sub3" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "192.168.2.0/24"
    availability_zone = "ap-south-1c"
    tags = {
      Name = "mysub3"
    }
}
    
  

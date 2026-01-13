data "aws_vpc" "myalreadyvpc" {
    default = true

  
}
resource "aws_security_group" "myownsg" {
    name = "openallsg-terraform"
    description = "all network sg"
    vpc_id = data.aws_vpc.myalreadyvpc.id  
}
resource "aws_vpc_security_group_ingress_rule" "myingressrule" {
    security_group_id = aws_security_group.myownsg.id
    from_port=22
    to_port=22
    ip_protocol="tcp"
    cidr_ipv4="0.0.0.0/0"
  
}
resource "aws_key_pair" "myounkey" {
    public_key = file("id_ed25519.pub")
    key_name = "myshownkey"

  
}
resource "aws_instance" "myec2" {
    ami = "ami-02b8269d5e85954ef"
    instance_type = "t3.micro"
    key_name = aws_key_pair.myounkey.key_name
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.myownsg.id]
    tags = {
      name = "myterraformec2"
    }
  
}
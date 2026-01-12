variable "network" {
    description = "mynetwork"
    type = object({
      vpcname = string
      vpccidr=string
      subnets=list(object({
        subnetscidr=list(string)
        subnetsname=list(string)
        subnetsaz=list(string)
      }))
    })
default = {
  vpcname="vpcone"
  vpccidr="192.168.0.0/16"
  subnets=[{
    subnetscidr=["192.168.0.0/24","192.168.1.0/24","192.168.2.0/24"]
    subnetsaz=["ap-south-1a","ap-south-1b","ap-south-1c"]
    subnetsname=["sub12","sub13","sub14"]

  }]}
}

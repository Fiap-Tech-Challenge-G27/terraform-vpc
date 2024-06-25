resource "aws_vpc_endpoint" "ec2" {
  vpc_id            = aws_default_vpc.vpcTechChallenge.id
  service_name      = "com.amazonaws.us-east-1.secretsmanager"
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    "sg-057fe6da91359a364",
  ]

  subnet_ids = [
    aws_default_subnet.subnetTechChallenge.id, aws_default_subnet.subnetTechChallenge2.id
  ]

  private_dns_enabled = true
}
module "vote_service_sg" {
  source = "./terraform-aws-security-group"

  name        = "user-service"
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = "vpc-c0e189ba"

  ingress_cidr_blocks = ["10.10.0.0/16", "10.30.0.0/16"]
  ingress_rules       = ["https-443-tcp"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "10.10.0.0/16"
    },
    {
      from_port   = 8000
      to_port     = 8000
      protocol    = "tcp"
      description = "User-service ports for tomcat"
      cidr_blocks = "10.20.0.0/16"
    },
  ]
}

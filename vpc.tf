module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${local.name}-vpc"
  cidr = local.vpc-cidr

  azs             = local.azs
  private_subnets = local.private-subnet-cidrs
  public_subnets  = local.public-subnet-cidrs
  intra_subnets  = local.intra-subnet-cidr

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = local.env
  }
}
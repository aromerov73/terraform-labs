module "network" {
  source      = "./network"
  vpc_cidr    = lookup(var.vpc_cidr, terraform.workspace)
  subnet_cidr = lookup(var.subnet_cidr, terraform.workspace)
  tags        = var.tags
}

module "infra" {
  depends_on = [module.network]
  source     = "./infra"
  ami        = lookup(var.ami, terraform.workspace)
  instancia  = lookup(var.instance, terraform.workspace)
  tags       = var.tags
  security_group_id = module.security.security_group_id

  subnet_id = module.network.subnet_id
}

module "security" {

  source = "./security"
  vpc_id = module.network.vpc_id
  tags   = var.tags
}
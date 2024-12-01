module "ssh_key" {
  source       = "git::https://gitlab.com/acit_4640_library/tf_modules/aws_ssh_key_pair.git"
  ssh_key_name = "acit_4640_lab_13"
  output_dir   = "${path.root}/../app_configuration"
}

module "vpc" {
  source            = "./modules/terraform_vpc"
  project_name      = var.project_name
  region            = "us-west-2"
  vpc_cidr          = "10.0.0.0/16"
  subnets = [
    {
      cidr_block = "10.0.1.0/24"
      availability_zone = "us-west-2a"
      subnet_name = var.public_sn_name
    },
    {
      cidr_block = "10.0.2.0/24"
      availability_zone = "us-west-2b"
      subnet_name = var.private_sn_name
    }
  ]
  availability_zone = "us-west-2a"
  allowed_ip        = "0.0.0.0/0"
}

module "dns" {
  source = "./modules/terraform_dns"
  vpc_id = module.vpc.vpc_id
  domain_name = "${var.project_name}.internal"
}

module "ec2_instances" {
  source = "./modules/terraform_ec2"
  project_name      = var.project_name
  ami               = "ami-04dd23e62ed049936"
  key_name          = module.ssh_key.ssh_key_name
  zone_id      = module.dns.zone_id

  instances = {
    (var.public_i_name) = {
      name       = var.public_i_name
      subnet_id  = module.vpc.subnet_ids[var.public_sn_name]
      security_group_ids = [module.vpc.public_sg_id]
      role       = "web"

    }
    (var.private_i_name) = {
      name       = var.private_i_name
      subnet_id  = module.vpc.subnet_ids[var.private_sn_name]
      security_group_ids = [module.vpc.private_sg_id]
      role       = "backend"
    }
  }
}

module "connect_script" {
  source           = "git::https://gitlab.com/acit_4640_library/tf_modules/aws_ec2_connection_script.git"
  ec2_instances = {
    (var.public_i_name)  = module.ec2_instances.instances[var.public_i_name]
    (var.private_i_name) = module.ec2_instances.instances[var.private_i_name]
  }
  output_file_path = "${path.root}/../app_configuration/connect_vars.sh"
  ssh_key_file     = module.ssh_key.priv_key_file
  ssh_user_name    = "ubuntu"
}

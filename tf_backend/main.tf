module "backend" {
  source = "./modules/tfstate_backend"

  bucket_name   = var.bucket_name
  dynamodb_name = var.dynamodb_name
  region        = "us-west-2"
  backend_config_path = "../infrastructure/backend_config.tf"
}
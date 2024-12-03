variable "bucket_name" {
  type        = string
}

variable "dynamodb_name" {
  type        = string
}

variable "region" {
  type        = string
}

variable "backend_config_path" {
  type        = string
  default     = "."
}
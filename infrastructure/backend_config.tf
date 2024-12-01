terraform {
    backend "s3" {
        bucket         = "acit4640-wk13-1525-s3"
        key            = "terraform.tfstate"
        dynamodb_table = "acit4640-wk13-1525-lock"
        region         =  "us-west-2"
        encrypt        = true
    }
}

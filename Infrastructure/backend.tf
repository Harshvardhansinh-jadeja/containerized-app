# Intialized Backend here.
terraform {
  backend "s3" {
    # for personal
    # bucket = "harshvardhan-tfstate"
    bucket = "harshvardhan-tfstates"
    key    = "TH_Harshvardhan/terraform.tfstate"
    region = "us-west-2"
    profile = "sandbox"
    # profile = "harshvardhan"
  }
}

terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = ">= 0.70.0"
    }
  }

  # Uncomment and configure if using remote state in S3
  # backend "s3" {
  #   bucket         = "<your-bucket-name>"
  #   key            = "terraform-prod.tfstate"
  #   region         = "<bucket-region>"
  #   # Optional DynamoDB for state locking
  #   # dynamodb_table = "terraform-state-lock-table"
  #   encrypt        = true
  #   role_arn       = "arn:aws:iam::<your-aws-account-no>:role/<terraform-s3-backend-access-role>"
  # }
}

provider "snowflake" {
  username    = "kumar"
  account     = "OCMRUDE-LM45005"
  role        = "ACCOUNTADMIN"
  private_key = var.snowflake_private_key
}

module "snowflake_resources" {
  source              = "../modules/snowflake_resources"
  time_travel_in_days = 30
  database            = var.database
  env_name            = var.env_name
}

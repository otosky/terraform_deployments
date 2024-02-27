terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.86.0"
    }
  }
  backend "s3" {
    bucket                      = "tfstate-snowflake"
    key                         = "terraform.tfstate"
    skip_requesting_account_id  = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_s3_checksum            = true
  }
}

provider "snowflake" {
  account       = var.snowflake_account
  user          = var.snowflake_username
  authenticator = "JWT"
  private_key   = file(var.snowflake_private_key_path)
  params        = { query_tag = local.snowflake_session_query_tag }
  role          = "terraform"
}



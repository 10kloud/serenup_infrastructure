resource "aws_cognito_user_pool" "users_authentication" {
  name = var.identity_pool_name
  alias_attributes = [
    "phone_number",
    "email"
  ]
}

resource "aws_cognito_user_group" "users" {
  name         = "user"
  user_pool_id = aws_cognito_user_pool.users_authentication.id
  description  = "Normal users group"
}

resource "aws_cognito_user_group" "admins" {
  name         = "admin"
  user_pool_id = aws_cognito_user_pool.users_authentication.id
  description  = "Administrator users group"
}

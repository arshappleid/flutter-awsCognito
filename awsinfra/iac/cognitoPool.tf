resource "aws_cognito_user_pool" "pool1" {
  name = "Test-App-Pool"

  auto_verified_attributes = ["email"]
}

resource "aws_cognito_user_pool_client" "flutter_client" {
  name         = "flutter_web_client"
  user_pool_id = aws_cognito_user_pool.pool1.id

  generate_secret = false  # disables client secret
  

  allowed_oauth_flows             = ["code"]
  allowed_oauth_scopes            = ["email", "openid"]
  allowed_oauth_flows_user_pool_client = true

  callback_urls = ["http://localhost:8080/"]
  logout_urls   = ["http://localhost:8080/"]
}

output "user_pool_id" {
  value = aws_cognito_user_pool.pool1.id
}

output "app_client_id" {
  value = aws_cognito_user_pool_client.flutter_client.id
}
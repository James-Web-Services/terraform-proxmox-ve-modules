output "user_passwords" {
  description = "User passwords."
  sensitive   = true

  value = {
    for user in var.users : user.username => user.password == null ? random_password.user[user.username].result : user.password
  }
}

output "user_tokens" {
  description = "User tokens."
  sensitive   = true
  value       = { for k, v in proxmox_user_token.this : k => v.value }
}

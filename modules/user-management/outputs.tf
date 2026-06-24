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
  value       = try(proxmox_user_token.this[*].value, null)
}

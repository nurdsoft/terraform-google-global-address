output "address_name" {
  description = "The name of the reserved global address resource."
  value       = google_compute_global_address.this.name
}

output "ip_address" {
  description = "The reserved external IP address."
  value       = google_compute_global_address.this.address
}

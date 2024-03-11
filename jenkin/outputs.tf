output "jenkinMaster" {
  description = "Server Details"
  value = aws_instance.jenkinMaster.public_ip
}

output "jenkinNode" {
  description = "Server Details"
  value = aws_instance.jenkinNode.public_ip
}
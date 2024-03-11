output "Servers" {
    description = "ServerNames"
    value = [for instance in aws_instance.DayOne : instance.public_ip]
}
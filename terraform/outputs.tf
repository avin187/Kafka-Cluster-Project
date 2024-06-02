output "instance_ips" {
  description = "The public IPs of the Kafka nodes"
  value       = aws_instance.kafka_broker.*.public_ip
}

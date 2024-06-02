variable "region" {
  description = "AWS region where resources will be provisioned"
  default     = "us-east-1"  # Update with your preferred region
}

variable "instance_type" {
  description = "EC2 instance type for Kafka brokers"
  default     = "t2.small"  # Update with your preferred instance type
}

variable "ami" {
  description = "Ubuntu Server 24.04 LTS"
  default     = "ami-04b70fa74e45c3917"
}

variable "keyname" {
  description = "Key Pair for .pem Key-Authentication"
  default     = "Kafka_Key"
}

variable "subnet_id" {
  description = "Public Subnet ID"
  default     = "subnet-041ccb74f1c8cb5a8"
}

variable "instances" {
  description = "Number of Instances to be created"
  default     = "3"
}

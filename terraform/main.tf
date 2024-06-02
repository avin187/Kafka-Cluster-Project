# Declare AWS provider
provider "aws" {
  region = var.region
}

# Define EC2 Instance
resource "aws_instance" "kafka_broker" {
  count             = var.instances
  ami               = var.ami
  instance_type     = var.instance_type
  subnet_id         = var.subnet_id
  security_groups   = [aws_security_group.kafka_sg.id]
  key_name          = var.keyname
  
  tags = {
    Name        = "Kafka_Broker_${count.index + 1}"
    Environment = "Project"
    Owner       = "Avin"
  }
}

# Define Security Group
resource "aws_security_group" "kafka_sg" {
  ingress {
    from_port   = 9092
    to_port     = 9092
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 9093
    to_port     = 9093
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 2181
    to_port     = 2181
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

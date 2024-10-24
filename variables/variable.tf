variable "country" {
  description = "To define default region"
  type        = string
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "To define ami id"
  type        = string
  default     = "ami-0dee22c13ea7a9a67"
}

variable "instanceType" {
  description = "To define instance_type"
  type        = string
  default     = "t2.micro"
}

variable "availabilityZone" {
  description = "To define availability_zone"
  type        = string
  default     = "ap-south-1a"
}

variable "keyName" {
  description = "To define key Name"
  type        = string
  default     = "linuxkey"
}

variable "val" {
  description = "To launch number of instances"
  type        = number
  default     = 1
}

variable "server_name" {
    description = "To add Name tag"
    type = string
    default = "terra_server"
}


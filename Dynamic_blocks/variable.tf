variable "country" {
  description = "To define region"
  type        = string
  default     = "ap-south-1"
}

variable "allow_ports" {
  description = "allowed ports"
  type        = list(any)
  default     = [22, 80, 443, 9000, 8080, 8081, 3306]
}
variable "tags" {
  type = map(string)
    default = {
project = "modules-project"
    os = "ubuntu"
    country = "india"
    module = "module-1"
    webfiles = "interior"
}
}

variable "region" {
  default = "ap-south-1"
}
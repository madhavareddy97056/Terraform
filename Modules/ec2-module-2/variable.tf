variable "region" {
  default = "ap-south-1"
}

variable "tags" {
    type = map(string)
  default = {
    OS = "amazon-linux"
    webfiles = "moon-login"
    country = "india"
    owner = "reddy"
    project = "swiggy"
    module = "module-2"
  }
}
resource "aws_iam_user" "list_demo" {
  count = length(var.users)
  name  = var.users[count.index]
}

variable "users" {
  description = "List variable"
  type        = list(string)
  default     = ["bonam", "madhava", "Reddy", "Mounika"]
}
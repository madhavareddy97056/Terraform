variable "users" {
  description = "creating multiple  users"
  type        = set(string)
  default     = ["madhava", "reddy", "bonam"]
}

# For_each will accept List, Map, Set datatypes only.
resource "aws_iam_user" "demo_for_each" {
  for_each = var.users
  name     = each.value
}

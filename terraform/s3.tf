resource "aws_s3_bucket" "assignment_bucket" {
  bucket = "assignment-screenshot-bucket"
  acl    = "private"
  policy = file("policy.json")
}

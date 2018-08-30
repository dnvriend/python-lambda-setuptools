
provider "aws" {
  region = "eu-west-1"
}

resource "aws_lambda_function" "test_lambda" {
  function_name    = "helloworld"
  filename         = "dist/helloworld-0.1.zip"
  role             = "${aws_iam_role.role_for_lambda.arn}"
  handler          = "helloworld_function.handler"
  source_code_hash = "${base64sha256(file("dist/helloworld-0.1.zip"))}"
  runtime          = "python3.6"
}


resource "aws_iam_role" "role_for_lambda" {
  name = "iam_for_lambda"
  assume_role_policy = "${file("assume-role-policy.json")}"
}

resource "aws_iam_role_policy_attachment" "test-attach" {
    role       = "${aws_iam_role.role_for_lambda.name}"
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

output "arn" {
  value = "${aws_lambda_function.test_lambda.arn}"
}
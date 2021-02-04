resource "aws_vpc" "webapp_ecs_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "webapp_ecs_sub_a" {
  vpc_id = aws_vpc.webapp_ecs_vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "webapp_ecs_sub_b" {
  vpc_id = aws_vpc.webapp_ecs_vpc.id
  cidr_block = "10.0.2.0/24"
}

resource "aws_subnet" "webapp_ecs_sub_c" {
  vpc_id = aws_vpc.webapp_ecs_vpc.id
  cidr_block = "10.0.3.0/24"
}

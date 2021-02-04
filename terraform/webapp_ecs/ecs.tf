resource "aws_ecs_cluster" "webapp_ecs_cluster" {
  name = "webapp_ecs_cluster"
  capacity_providers = ["FARGATE"]
}

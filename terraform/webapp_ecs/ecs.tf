module "ecs-container-definition" {
  source  = "cloudposse/ecs-container-definition/aws"
  version = "0.49.2"

  container_image = "arn:aws:ecr:${var.region}:${var.user_id}:repository/${var.ecr_registry_name}"
  container_name = "backend"
}

resource "aws_ecs_cluster" "webapp_ecs_cluster" {
  name = "webapp_ecs_cluster"
  capacity_providers = ["FARGATE"]
}

resource "aws_ecs_task_definition" "webapp_ecs_backend" {
  family = "webapp_ecs_backend"
  container_definitions = module.ecs-container-definition.json_map_encoded_list
  requires_compatibilities = ["FARGATE"]
  network_mode = "awsvpc"
  cpu = "512"
  memory = "1024"
}

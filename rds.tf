resource "aws_db_instance" "default" {
  engine                 = "postgres"
  instance_class         = "db.t2.micro"
  name                   = var.RDS_DB_NAME
  engine_version         = "12.5"
  allocated_storage      = 20
  username               = var.RDS_USERNAME
  password               = var.RDS_PASSWORD
  vpc_security_group_ids = [
              aws_security_group.my_sg.id
            ]
}

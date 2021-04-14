// Secure the PgSQL RDS cluster using a dedicated SG
resource "aws_security_group" "pgsql" {
  name        = "PgSQL Security Group"
  description = "PgSQL Security Group"

  tags = {
    Name = "PgSQL Security Group"
  }
}

// PgSQL can only be accessed from the WWW network (10.0.0.0/8)
resource "aws_security_group_rule" "pgsql" {
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.0/8"]
  security_group_id = aws_security_group.pgsql.id
}


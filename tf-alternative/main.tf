// Secure the PgSQL RDS cluster using a dedicated SG
resource "aws_security_group" "pgsql" {
  name        = "PgSQL Security Group"
  description = "PgSQL Security Group"

  ingress {
    description = "Allow PgSQL from WWW"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  tags = {
    Name = "PgSQL Security Group"
  }
}

/*
  Database Servers
*/
resource "aws_security_group" "trusted_zone" {
    name = "vpc_trusted_zone"
    description = "Allow incoming database connections."

    ingress { # redis
        from_port = 6379
        to_port = 6379
        protocol = "tcp"
        security_groups = ["${aws_security_group.web.id}"]
    }
    ingress { # postres
        from_port = 51270
        to_port = 51270
        protocol = "tcp"
        security_groups = ["${aws_security_group.web.id}"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["${var.vpc_cidr}"]
    }

    egress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    vpc_id = "${aws_vpc.default.id}"

    tags {
        Name = "TrustedZoneSG"
    }
}

resource "aws_db_instance" "auth_db_1" {
  depends_on             = ["aws_security_group.trusted_zone"]
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "9.3.3"
  instance_class         = "db.t2.micro"
  name                   = "databasename"
  username               = "ddd"
  password               = "daviddaviddavid"
  vpc_security_group_ids = ["${aws_security_group.trusted_zone.id}"]
  db_subnet_group_name   = "${aws_db_subnet_group.default.id}"
  tags {
    Name = "DB Server 1"
  }
}

resource "aws_db_subnet_group" "default" {
  name        = "main_subnet_group"
  description = "Our main group of subnets"
  subnet_ids  = ["${aws_subnet.eu-west-1a-private.id}", "${aws_subnet.eu-west-1a-public.id}"]
}


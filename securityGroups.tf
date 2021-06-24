resource "aws_security_group" "my_sg" {
  vpc_id = aws_vpc.my_vpc.id
  description = "sg-for-lambdas"
  egress = [
    {
      cidr_blocks = [
        "0.0.0.0/0"
      ]
      description = ""
      from_port = 0
      ipv6_cidr_blocks = [
         "::/0"
      ]
      prefix_list_ids = []
      protocol = "-1"
      security_groups = []
      self = false
      to_port = 0
    }
  ]
  ingress = [
    {
      cidr_blocks = [
        "0.0.0.0/0"
      ]
      description = ""
      from_port = 0
      ipv6_cidr_blocks = [
        "::/0"
      ]
      prefix_list_ids = []
      protocol = "-1"
      security_groups = []
      self = false
      to_port = 0
    }
  ]

  revoke_rules_on_delete = null
}

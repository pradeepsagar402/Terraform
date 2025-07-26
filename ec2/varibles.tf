variable "ami" {
    type = string
}
variable "instancetype" {
    type = string
}
variable "tags" {
  type = map(string)  
}
variable "secuirity_group_rules" {
  type = map(object({
    from_port   = string
    to_port     = string
    protocol    = string
    cidr_blocks = list(string)
  }))
}

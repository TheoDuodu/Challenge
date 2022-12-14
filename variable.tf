#creating variables

variable "az" {
  type        = string
  description = "name of availabilty zone"
  default     = "eu-west-2a"
}

variable "region" {
  type        = string
  description = "name of region"
  default     = "eu-west-2"
}

variable "vpc-cidr" {
  type        = string
  description = "name of vpc cidr"
  default     = "10.0.0.0/16"
}

variable "ami" {
  type        = string
  description = "name of ami"
  default     = "ami-0758d98b134137d18"
}

variable "instance_type" {
  type        = string
  description = "name of instance type"
  default     = "t2.micro"
}

variable "protocol" {
  description = "name of protocol"
  type = string
  default = "tcp"
}



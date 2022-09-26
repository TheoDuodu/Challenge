#creating a server for eu-west-2 region in the public subnet
resource "aws_instance" "Test-server1" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "Theo"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.Test-sec-group.id]
  subnet_id                   = aws_subnet.Test-public-sub1.id
  availability_zone           = var.az


  connection {
      type     = "ssh"
      user     = "ubuntu"
      private_key = file("Theo.pem")
      #host = aws_instance.web.public_ip
      host = self.public_ip
  }

  
  
  provisioner "remote-exec" {
    inline = [
	   "sudo apt-get update",
    "sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -",
     /* "sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) test'", */
     "sudo add-apt-repository 'deb [arch=amd64] https://download.docker.com/linux/ubuntu artful stable'",
   "sudo apt-get update",
    "sudo apt-get install -y docker-ce",
       "sudo docker pull theoduodu/fastapi-challenge:v1",
      "sudo docker run -d -p 8000:8000 theoduodu/fastapi-challenge:v1",
	  "echo 'Hello world'",
    ]
  }

  tags = {
    Name = "Test-server1"
  }
}


#creating a server for eu-west-2 region in the private subnet

resource "aws_instance" "Test-server2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "Theo"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.Test-sec-group.id]
  subnet_id                   = aws_subnet.Test-priv-sub1.id
  availability_zone           = var.az

  tags = {
    Name = "Test-server2"
  }
}


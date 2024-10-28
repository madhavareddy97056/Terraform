provider "aws" {
  region = "ap-south-1"
}

#using public key
resource "aws_key_pair" "test_key" {
  key_name   = "terra-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQClWSyu55T8Y88MndPjykmw8/IfqydN3+RmL0MjgAzWUOfywmW7dYk3/Haa5cAC3a7M/QNWhRrxsNneHenNNyDpOZ7UhYK1u4Gt9ofEyiqARtNnmsCEPtPEhX1MPO2/KQtzrI7g1gSk0ZZF6cSwVNlfoyXjlPMA8U4SN3lmw4eVG6QZsqBTJ8k6TspzN0sI9AhbIVlLNSB/GhSQ4Ua+d8RT+2XNQvidPRss3yIE81HYq7gU+72hJ9rsxpdO5p9DzIHTdMtAKB6ObCPDMoPKzLTa42Ukc/l0VVRb14gzcNl9+OuX3ZyIQ2uhu8pcbxZthGq+MwbJctvjZdQ103oJaXJ+f9GFKWl5dmjIF1OS+rjLQUe9+w/pPQ86Gnnie2KKswQyO2la2ykEuj5vpBAzUAUWnshaW6lBPCuH7br7Q3Cfr0sbY8pbLbqWJW6v8RylieEi3Yr42Tz0QJC0odujhWeUBQsrdmPjYbMPqhdEe5Epyz2PXwwQ09cKF8oQQsGm8oE= root@ip-172-31-14-234"

  tags = {
    Name = "terrfaorm-tag-key"
  }
}

# using file
provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "test_key" {
  key_name   = "terra-key"
  public_key = file("/root/.ssh/id_rsa.pub")
  tags = {
    Name = "terrfaorm-tag-key"
  }
}

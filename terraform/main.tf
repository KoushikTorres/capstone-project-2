module "vpc" {
  source = "./vpc"
  vpc_id = module.vpc.vpc_id
}

module "security_group" {
  source = "./securitygroup"
  vpc_id = module.vpc.vpc_id
}

module "ansible" {
  source = "./ec2"

  instance_name = "ansible"
  key_name = "web-apps"
  vpc_id = module.vpc.vpc_id
  security_group_id = module.security_group.security_group_id
  public_subnet_id = module.vpc.public_subnet_id
  user_data = <<-EOF
  #!/bin/bash
  apt update -y
  apt install software-properties-common
  add-apt-repository --yes --update ppa:ansible/ansible
  apt install ansible -y
  EOF
}

module "jenkins-master" {
  source = "./ec2"

  instance_name = "jenkins-master"
  key_name = "web-apps"
  instance_type = "t2.medium"
  vpc_id = module.vpc.vpc_id
  security_group_id = module.security_group.security_group_id
  public_subnet_id = module.vpc.public_subnet_id

}

module "kubernetes-master" {
  source = "./ec2"

  instance_name = "kubernetes-master"
  key_name = "web-apps"
  instance_type = "t2.medium"
  vpc_id = module.vpc.vpc_id
  security_group_id = module.security_group.security_group_id
  public_subnet_id = module.vpc.public_subnet_id

}

module "worker-1" {
  source = "./ec2"

  instance_name = "worker-1"
  key_name = "web-apps"
  instance_type = "t2.medium"
  vpc_id = module.vpc.vpc_id
  security_group_id = module.security_group.security_group_id
  public_subnet_id = module.vpc.public_subnet_id

}

module "worker-2" {
  source = "./ec2"

  instance_name = "worker-2"
  key_name = "web-apps"
  instance_type = "t2.medium"
  vpc_id = module.vpc.vpc_id
  security_group_id = module.security_group.security_group_id
  public_subnet_id = module.vpc.public_subnet_id

}
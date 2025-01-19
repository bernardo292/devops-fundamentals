


output "publicip" {
value = module.ec2_module.ip  
}

output "instanceid" {
value = module.ec2_module.id  
}

output "vpc_id" {
  value = module.vpc_module.vpcid
}

output "public_subnet_1_id" {
  value = module.vpc_module.public_subnet_1.id
}

output "public_subnet_2_id" {
  value = module.vpc_module.public_subnet_2.id
}

output "private_subnet_1_id" {
  value   = module.vpc_module.private_subnet_1.id
}

output "private_subnet_2_id" {
  value   = module.vpc_module.private_subnet_2.id
}
region = "us-east-1"

project_name = "ecs-cluster"

##### SSM VPC Parameters ##### 

ssm_vpc_id = "/containers-vpc/vpc/vpc_id"

ssm_public_subnet_1 = "/containers-vpc/vpc/subnet_private_1a"

ssm_public_subnet_2 = "/containers-vpc/vpc/subnet_private_1b"

ssm_public_subnet_3 = "/containers-vpc/vpc/subnet_private_1c"

ssm_private_subnet_1 = "/containers-vpc/vpc/subnet_public_1a"

ssm_private_subnet_2 = "/containers-vpc/vpc/subnet_public_1b"

ssm_private_subnet_3 = "/containers-vpc/vpc/subnet_public_1c"

### Balancer ####

load_balancer_internal = false

load_balancer_type = "application"

######## ecs general ########

node_ami = "ami-0dc67873410203528"

node_instace_type = "t3a.large"

node_volume_size = "50"

node_volume_type = "gp3"

cluster_on_demand_min_size = 2

cluster_on_demand_max_size = 4

cluster_on_demand_desired_size = 3

cluster_spot_min_size = 2

cluster_spot_max_size = 4

cluster_spot_desired_size = 3
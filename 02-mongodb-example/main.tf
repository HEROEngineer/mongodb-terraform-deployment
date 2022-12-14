#
# Configure the MongoDB Atlas Provider
#
provider "mongodbatlas" {}

#
# Create a Project
#
resource "mongodbatlas_project" "my_project" {
  name   = var.mongodb_atlas_project_name
  org_id = var.mongodb_atlas_org_id
}

#
# Create a Shared Tier Cluster
#
resource "mongodbatlas_cluster" "my_cluster" {
  project_id = mongodbatlas_project.my_project.id
  name       = var.mongodb_atlas_cluster_name

  # Provider Settings "block"
  provider_name = "TENANT"

  # options: AWS, AZURE, GCP
  backing_provider_name = var.mongodb_atlas_backing_provider_name

  # GCP - CENTRAL_US SOUTH_AMERICA_EAST_1 WESTERN_EUROPE EASTERN_ASIA_PACIFIC NORTHEASTERN_ASIA_PACIFIC ASIA_SOUTH_1
  # AZURE - US_EAST_2 US_WEST CANADA_CENTRAL EUROPE_NORTH
  # AWS - US_EAST_1 US_WEST_2 EU_WEST_1 EU_CENTRAL_1 AP_SOUTH_1 AP_SOUTHEAST_1 AP_SOUTHEAST_2
  provider_region_name = var.mongodb_atlas_provider_region_name

  # options: M2 M5
  provider_instance_size_name = var.mongodb_atlas_provider_instance_size_name

  # Will not change till new version of MongoDB but must be included
  mongo_db_major_version = var.mongodb_atlas_mongo_db_major_version
}

#
# Create an Atlas Admin Database User
#
resource "mongodbatlas_database_user" "my_user" {
  username           = var.mongodb_atlas_database_username
  password           = var.mongodb_atlas_database_user_password
  project_id         = mongodbatlas_project.my_project.id
  auth_database_name = var.mongodb_atlas_auth_database_name

  roles {
    role_name     = var.mongodb_atlas_auth_database_roles_0_role_name
    database_name = var.mongodb_atlas_auth_database_roles_0_database_name
  }
}

#
# Create an IP Accesslist
#
# can also take a CIDR block or AWS Security Group -
# replace ip_address with either cidr_block = "CIDR_NOTATION"
# or aws_security_group = "SECURITY_GROUP_ID"
#
resource "mongodbatlas_project_ip_access_list" "my_ipaddress" {
  project_id = mongodbatlas_project.my_project.id
  cidr_block = "0.0.0.0/0"
  comment    = "Open to any IP address to access the database - DO NOT use in production"
}

# Use terraform output to display connection strings.
output "connection_string" {
  value = mongodbatlas_cluster.my_cluster.connection_strings.0.standard_srv
}
output "database_user_for_connection" {
  value = mongodbatlas_database_user.my_user.username
}

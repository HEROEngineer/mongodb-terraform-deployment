variable "mongodb_atlas_org_id" {
  type        = string
  description = "MongoDB Organization ID"
}
variable "mongodb_atlas_project_name" {
  type        = string
  description = "The MongoDB Atlas Project Name"
}
variable "mongodb_atlas_cluster_name" {
  type        = string
  description = "The MongoDB Atlas Cluster Name"
}
variable "mongodb_atlas_backing_provider_name" {
  type        = string
  description = "The cloud provider to use, must be: AWS, GCP or AZURE"
}
variable "mongodb_atlas_provider_region_name" {
  type        = string
  description = "MongoDB Atlas Cluster Region, must be a region for the provider given."
}
variable "mongodb_atlas_provider_instance_size_name" {
  type        = string
  description = "The cloud provider instance to use"
}
variable "mongodb_atlas_mongo_db_major_version" {
  type        = string
  description = "The Major MongoDB Version"
}
variable "mongodb_atlas_database_username" {
  type        = string
  description = "MongoDB Atlas Database User Name"
}
variable "mongodb_atlas_database_user_password" {
  type        = string
  description = "MongoDB Atlas Database User Password"
}
variable "mongodb_atlas_auth_database_name" {
  type        = string
  description = "MongoDB Atlas Auth DB name"
}
variable "mongodb_atlas_auth_database_roles_0_role_name" {
  type        = string
  description = "MongoDB Atlas User Role"
}
variable "mongodb_atlas_auth_database_roles_0_database_name" {
  type        = string
  description = "MongoDB Atlas User Database name"
}




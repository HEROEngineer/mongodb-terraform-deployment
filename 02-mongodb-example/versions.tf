terraform {
  required_providers {
    mongodbatlas = {
      version = "1.6.1"
      source = "mongodb/mongodbatlas"
    }
  }
  required_version = ">= 0.13"
}

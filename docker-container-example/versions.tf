terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.23.1"
    }
  }
  required_version = ">= 0.13"
}

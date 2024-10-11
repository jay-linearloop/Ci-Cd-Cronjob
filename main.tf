terraform {
  backend "remote" {
    organization = "jackkkk"

    workspaces {
      name = "Jackk-1"
    }
  }

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.TF_VAR_digitalocean_token
}

resource "digitalocean_droplet" "example" {
  image  = "ubuntu-20-04-x64"
  name   = "ci-cd-droplet"
  region = "blr1"
  size   = "s-1vcpu-1gb"
}

output "droplet_ip" {
  value = digitalocean_droplet.example.ipv4_address
}


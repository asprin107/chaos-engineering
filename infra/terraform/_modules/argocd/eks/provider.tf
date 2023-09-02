terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.20.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2"
    }
    argocd = {
      source  = "oboukili/argocd"
      version = "5.3.0"
    }
  }
}

provider "argocd" {
  server_addr = data.kubernetes_service.svc-argocd-server.status[0].load_balancer[0].ingress[0].hostname
  username    = "admin"
  password    = data.kubernetes_secret.argocd-initial-pwd.data.password
  insecure    = true
}
resource "kubernetes_ingress_v1" "hello_world" {
  metadata {
    name      = "hello-world-ingress"
    namespace = var.namespace

    labels = merge(var.tags, {
      ManagedBy = "terraform"
    })
  }

  spec {
    ingress_class_name = "ingress-nginx"

    rule {
      host = var.ingress_host

      http {
        path {
          path      = "/${var.environment}/"
          path_type = "Prefix"

          backend {
            service {
              name = "hello-world"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }

  depends_on = [module.eks]
}

output "kube_config_raw" {
  value = azurerm_kubernetes_cluster.this.kube_config_raw

  sensitive = true
}

output "kubelet_identity" {
  value       = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
  description = "Kubelet Identity needed to give the AcrPull role"
}
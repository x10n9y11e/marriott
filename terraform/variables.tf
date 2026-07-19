variable "environment" {
  description = "Environment name for deploy"
  type        = string
  validation {
    condition     = contains(["dev", "test", "perf", "staging", "prod"], var.environment)
    error_message = "Environment must be one of: dev, test, perf, staging, prod"
  }
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "marriott"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "cluster_version" {
  description = "EKS cluster version"
  type        = string
  default     = "1.31"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "node_instance_types" {
  description = "EC2 instance types for EKS nodes"
  type        = list(string)
  default     = ["t3.small"]
}

variable "node_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "node_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 5
}

variable "ingress_host" {
  description = "Ingress host"
  type        = string
  default     = "trial.marriott.local"
}

variable "namespace" {
  description = "Kubernetes namespace for deployment"
  type        = string
  default     = "app"
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
  default     = {}
}

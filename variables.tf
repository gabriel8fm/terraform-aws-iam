variable "assume_role_policy" {
  description = "The assume role policy for the IAM role"
  type        = string
}

variable "group_name" {
  description = "The name of the IAM user group to create"
  type        = string
}

variable "name" {
  description = "Name prefix for all resources"
  type = string
}

variable "policy_arns" {
  description = "List of IAM policy ARNs to attach to the role"
  type        = list(string)
}

variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "role_name" {
  description = "The name of the IAM role to create"
  type        = string
}

variable "user_name" {
  description = "The name of the IAM user to create"
  type        = string
}
variable "name" {
  type    = string
  default = ""
  validation {
    condition = length(var.name) > 0
    error_message = "Error : the variable 'name' must be non-empty."
  }
}
variable "route53_resolver_rule_arn" {
  type    = string
  default = ""
  validation {
    condition = length(var.route53_resolver_rule_arn) > 0
    error_message = "Error : the variable 'route53_resolver_rule_arn' must be non-empty."
  }
}
variable "share_with_account_ids" {
  type    = list(string)
  default = []
}
variable "default_tags" {
  description = "Default tags"
  default     = {}
  type        = map(string)
}
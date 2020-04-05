variable "base_path" {
  description = "The namespace path this one is nested in if any"
  type        = string
  default     = ""
}

variable "group_names" {
  description = "A list of groups to create in the namespace"
  type        = list(string)
  default     = ["admin", "dev"]
}

variable "root_groups" {
  description = " A list of group_ids to link into the namespace groups"
  type        = list(string)
  default     = []
}

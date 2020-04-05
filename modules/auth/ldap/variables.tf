variable "path" {
  default = "ldap"
}

variable "ldap_url" {
  default = "localhost"
}

variable "userdn" {
  default = ""
}

variable "userattr" {
  default = "cn"
}

variable "discoverdn" {
  default = false
}

variable "groupdn" {
  default = ""
}

variable "group_filter" {
  default = "(objectclass=*)"
}

variable "group_name" {
  default = "dev"
}

variable "base_path" {
  default = ""
}

variable "binddn" {
  default = ""
}

variable "bindpass" {
  default = ""
}

variable "insecure_tls" {
  default = true
}

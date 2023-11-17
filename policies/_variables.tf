variable "tenant" {
  type = string
}

variable "enabled" {
  type    = string
  default = "enabled"
}

variable "off" {
  type    = string
  default = "disabled"
}

variable "report_only" {
  type    = string
  default = "enabledForReportingButNotEnforced"
}

variable "pol_block_legacy_auth" {
  type = string
}

variable "pol_apply_user_allow_byod_access" {
  type = string
}

variable "pol_apply_user_byod_ca_exclusion" {
  type = string
}

variable "pol_apply_user_ext_byod_ca_exclusion" {
  type = string
}

variable "intune_users" {
  type = string
}

variable "rpa_user_bots" {
  type = string
}

variable "ca002_test_ring" {
  type = string
}

variable "ca004_test_ring" {
  type = string
}

variable "ca007_test_ring" {
  type = string
}

variable "blocked_locations" {
  type = string

}

variable "test_mam" {
  type = string
}

variable "break_glass" {
  type = string
}

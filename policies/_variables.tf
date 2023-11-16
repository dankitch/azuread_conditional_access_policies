variable "tenant" {
  type = string
}

variable "Enabled" {
  type    = string
  default = "enabled"
}

variable "Off" {
  type    = string
  default = "disabled"
}

variable "Report-only" {
  type    = string
  default = "enabledForReportingButNotEnforced"
}

variable "pol-blockLegacyAuth" {
  type = string
}

variable "pol-apply-user-AllowBYoDAccess" {
  type = string
}

variable "pol-apply-user-BYoDCAExclusion" {
  type = string
}

variable "pol-apply-user-ExtBYoDCAExclusion" {
  type = string
}

variable "Intune-Users" {
  type = string
}

variable "RPA-User-Bots" {
  type = string
}

variable "CA002-Test-RING" {
  type = string
}

variable "CA004-Test-RING" {
  type = string
}

variable "CA007-Test-RING" {
  type = string
}

variable "blockedLocations" {
  type = string

}

variable "Test-MAM" {
  type = string
}

variable "break-glass" {
  type = string
}

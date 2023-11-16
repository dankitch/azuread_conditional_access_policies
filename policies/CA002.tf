resource "azuread_conditional_access_policy" "CA002" {
  display_name = "${var.tenant} - ${local.policy2.sequence_number} - ${local.policy2.personas_groups} - ${local.policy2.cloud_app_target} : ${local.policy2.response}"
  state        = var.Report-only // Report-only

  conditions {
    client_app_types = ["all"]
    // service_principal_risk_levels = []
    sign_in_risk_levels = ["high"]
    // user_risk_levels              = []
    applications {
      // excluded_applications = []
      included_applications = ["All"]
      // included_user_actions = []
    }
    users {
      // excluded_groups = []
      // excluded_roles  = []
      excluded_users  = [var.break-glass]
      included_groups = [var.CA002-Test-RING]
      // included_roles  = []
      // included_users  = []
    }
  }
  grant_controls {
    built_in_controls = ["block"]
    // custom_authentication_factors = []
    operator = "OR"
    // terms_of_use                  = []
  }
}

resource "azuread_conditional_access_policy" "CA007" {
  display_name = "${var.tenant} - ${local.policy7.sequence_number} - ${local.policy7.personas_groups} - ${local.policy7.cloud_app_target} : ${local.policy7.response}"
  state        = var.Enabled
  conditions {
    client_app_types = ["browser", "mobileAppsAndDesktopClients"]
    // service_principal_risk_levels = []
    // sign_in_risk_levels           = []
    // user_risk_levels              = []
    applications {
      // excluded_applications = []
      included_applications = ["All"]
      // included_user_actions = []
    }
    devices {
      filter {
        mode = "include"
        rule = "device.deviceOwnership -eq \"Company\""
      }
    }
    platforms {
      // excluded_platforms = []
      included_platforms = ["android", "iOS"]
    }
    users {
      // excluded_groups = []
      // excluded_roles  = []
      // excluded_users  = []
      included_groups = [var.Intune-Users]
      // included_roles  = []
      // included_users  = []
    }
  }
  grant_controls {
    built_in_controls = ["compliantDevice"]
    // custom_authentication_factors = []
    operator = "OR"
    // terms_of_use                  = []
  }
}

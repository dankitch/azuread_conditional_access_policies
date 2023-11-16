resource "azuread_conditional_access_policy" "CA010" {
  display_name = "${var.tenant} - ${local.policy10.sequence_number} - ${local.policy10.personas_groups} - ${local.policy10.cloud_app_target} : ${local.policy10.response}"
  state        = var.Enabled
  conditions {
    client_app_types = ["browser"]
    // service_principal_risk_levels = []
    // sign_in_risk_levels           = []
    // user_risk_levels              = []
    applications {
      // excluded_applications = []
      included_applications = ["Office365"]
      // included_user_actions = []
    }
    devices {
      filter {
        mode = "include"
        rule = "device.trustType -ne \"ServerAD\""
      }
    }
    platforms {
      // excluded_platforms = []
      included_platforms = ["windows"]
    }
    users {
      // excluded_groups = []
      // excluded_roles  = []
      // excluded_users  = []
      included_groups = [var.Test-MAM]
      // included_roles  = []
      // included_users  = []
    }
  }
  grant_controls {
    built_in_controls = ["compliantApplication"]
    // custom_authentication_factors = []
    operator = "OR"
    // terms_of_use                  = []
  }
}

resource "azuread_conditional_access_policy" "CA006" {
  display_name = "${var.tenant} - ${local.policy6.sequence_number} - ${local.policy6.personas_groups} - ${local.policy6.cloud_app_target} : ${local.policy6.response}"
  state        = var.Enabled
  conditions {
    client_app_types = ["mobileAppsAndDesktopClients"]
    // sign_in_risk_levels = []
    // user_risk_levels    = []
    applications {
      // excluded_applications = []
      included_applications = ["Office365"]
      // included_user_actions = []
    }
    platforms {
      // excluded_platforms = []
      included_platforms = ["android", "iOS", "windowsPhone"]
    }
    users {
      // excluded_groups = []
      // excluded_roles  = []
      // excluded_users  = []
      included_groups = [var.pol-apply-user-AllowBYoDAccess]
      // included_roles  = []
      // included_users  = []
    }
  }
  grant_controls {
    built_in_controls = ["approvedApplication", "compliantApplication"]
    // custom_authentication_factors = []
    operator = "OR"
    // terms_of_use                  = []
  }
}

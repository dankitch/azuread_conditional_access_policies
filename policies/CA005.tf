resource "azuread_conditional_access_policy" "CA005" {
  display_name = "${var.tenant} - ${local.policy5.sequence_number} - ${local.policy5.personas_groups} - ${local.policy5.cloud_app_target} : ${local.policy5.response}"
  state        = var.Enabled
  conditions {
    client_app_types = ["exchangeActiveSync", "mobileAppsAndDesktopClients", "other"]
    // sign_in_risk_levels = []
    // user_risk_levels    = []
    applications {
      // excluded_applications = []
      included_applications = ["Office365"]
      // included_user_actions = []
    }
    platforms {
      // excluded_platforms = []
      included_platforms = ["macOS"]
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
    built_in_controls = ["compliantDevice"]
    // custom_authentication_factors = []
    operator = "OR"
    // terms_of_use                  = []
  }
}

resource "azuread_conditional_access_policy" "CA004" {
  display_name = "${var.tenant} - ${local.policy4.sequence_number} - ${local.policy4.personas_groups} - ${local.policy4.cloud_app_target} : ${local.policy4.response}"
  state        = var.Enabled
  conditions {
    client_app_types = ["all"]
    // sign_in_risk_levels = []
    // user_risk_levels    = []
    applications {
      // excluded_applications = []
      included_applications = ["Office365"]
      // included_user_actions = []
    }
    platforms {
      // excluded_platforms = []
      included_platforms = ["all"]
    }
    users {
      excluded_groups = [var.pol-apply-user-BYoDCAExclusion, var.pol-apply-user-ExtBYoDCAExclusion, var.RPA-User-Bots]
      // excluded_roles  = []
      // excluded_users  = []
      included_groups = [var.pol-apply-user-AllowBYoDAccess]
      // included_roles  = []
      // included_users  = []
    }
  }
  session_controls {
    application_enforced_restrictions_enabled = true
    // cloud_app_security_policy                 = null
    // persistent_browser_mode                   = null
    // sign_in_frequency                         = 0
    // sign_in_frequency_period                  = null
  }

}

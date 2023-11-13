resource "azuread_conditional_access_policy" "CA008" {
  display_name = "${var.tenant} - ${local.policy8.sequence_number} - ${local.policy8.personas_groups} - ${local.policy8.cloud_app_target} : ${local.policy8.response}"
  state        = var.Enabled
  conditions {
    client_app_types = ["exchangeActiveSync", "mobileAppsAndDesktopClients", "other"]
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
        rule = "device.isCompliant -ne True -and device.trustType -ne \"ServerAD\""
      }
    }
    platforms {
      // excluded_platforms = []
      included_platforms = ["windows"]
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
  grant_controls {
    built_in_controls = ["domainJoinedDevice"]
    // custom_authentication_factors = []
    operator = "OR"
    // terms_of_use                  = []
  }
}

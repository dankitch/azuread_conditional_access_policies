resource "azuread_conditional_access_policy" "CA005" {
  display_name = "${var.tenant} - CA005 - macOS - Desktop Clients - Office 365 : Require Compliant Device"
  state        = var.enabled

  conditions {
    client_app_types = ["exchangeActiveSync", "mobileAppsAndDesktopClients", "other"]

    applications {
      included_applications = ["Office365"]
    }

    platforms {
      included_platforms = ["macOS"]
    }

    users {
      included_groups = [var.pol_apply_user_allow_byod_access]
    }

  }
  grant_controls {
    built_in_controls = ["compliantDevice"]
    operator          = "OR"
  }

}

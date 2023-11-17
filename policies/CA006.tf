resource "azuread_conditional_access_policy" "CA006" {
  display_name = "${var.tenant} - CA006 - iOS + Android - Mobile Apps - Office 365 : Require Approved App OR App Protection Policy"
  state        = var.enabled

  conditions {
    client_app_types = ["mobileAppsAndDesktopClients"]

    applications {
      included_applications = ["Office365"]
    }

    platforms {
      included_platforms = ["android", "iOS", "windowsPhone"]
    }

    users {
      included_groups = [var.pol_apply_user_allow_byod_access]
    }
  }

  grant_controls {
    built_in_controls = ["approvedApplication", "compliantApplication"]
    operator          = "OR"
  }

}

resource "azuread_conditional_access_policy" "CA007" {
  display_name = "${var.tenant} - CA007 - iOS + Android - Mobile Apps - All Cloud Apps : Require Compliant Device"
  state        = var.enabled

  conditions {
    client_app_types = ["browser", "mobileAppsAndDesktopClients"]

    applications {
      included_applications = ["All"]
    }

    devices {
      filter {
        mode = "include"
        rule = "device.deviceOwnership -eq \"Company\""
      }
    }

    platforms {
      included_platforms = ["android", "iOS"]
    }

    users {
      included_groups = [var.intune_users]
    }
  }

  grant_controls {
    built_in_controls = ["compliantDevice"]
    operator          = "OR"
  }

}

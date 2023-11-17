resource "azuread_conditional_access_policy" "CA010" {
  display_name = "${var.tenant} - CA010 - Windows - Browser - Office 365 : Require App Protection Policy"
  state        = var.enabled

  conditions {
    client_app_types = ["browser"]

    applications {
      included_applications = ["Office365"]
    }

    devices {
      filter {
        mode = "include"
        rule = "device.trustType -ne \"ServerAD\""
      }
    }

    platforms {
      included_platforms = ["windows"]
    }

    users {
      included_groups = [var.test_mam]
    }
  }

  grant_controls {
    built_in_controls = ["compliantApplication"]
    operator          = "OR"
  }

}

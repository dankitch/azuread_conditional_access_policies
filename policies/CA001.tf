resource "azuread_conditional_access_policy" "CA001" {
  display_name = "${var.tenant} - CA001 - All Users - Legacy Auth : Block"
  state        = var.enabled

  conditions {
    client_app_types = ["exchangeActiveSync", "other"]


    applications {
      included_applications = ["All"]
    }

    users {
      included_users = ["All"]
    }

    locations {
      included_locations = ["All"]
    }

    platforms {
      included_platforms = ["all"]
    }

  }
  grant_controls {
    operator          = "OR"
    built_in_controls = ["block"]
  }

}

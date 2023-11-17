resource "azuread_conditional_access_policy" "CA002" {
  display_name = "${var.tenant} - CA002 - Test-RING - User Sign-in Risk (High) - All Cloud Apps : Block"
  state        = var.report_only

  conditions {
    client_app_types    = ["all"]
    sign_in_risk_levels = ["high"]

    applications {
      included_applications = ["All"]
    }

    users {
      excluded_users  = [var.break_glass]
      included_groups = [var.ca002_test_ring]
    }

  }
  grant_controls {
    built_in_controls = ["block"]
    operator          = "OR"
  }

}

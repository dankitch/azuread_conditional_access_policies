resource "azuread_conditional_access_policy" "CA004" {
  display_name = "${var.tenant} - CA004 - All Device Platforms - All Clients - Office 365 : Use App Enforced Restrictions"
  state        = var.enabled

  conditions {
    client_app_types = ["all"]

    applications {
      included_applications = ["Office365"]
    }

    platforms {
      included_platforms = ["all"]
    }

    users {
      excluded_groups = [var.pol_apply_user_byod_ca_exclusion, var.pol_apply_user_ext_byod_ca_exclusion, var.rpa_user_bots]
      included_groups = [var.pol_apply_user_allow_byod_access]
    }

  }
  session_controls {
    application_enforced_restrictions_enabled = true
  }

}

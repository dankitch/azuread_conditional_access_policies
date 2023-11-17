resource "azuread_conditional_access_policy" "CA008" {
  display_name = "${var.tenant} - CA008 - Windows - Desktop Clients - Office 365 : Require Microsoft Entra Hybrid Joined Device"
  state        = var.enabled

  conditions {
    client_app_types = ["exchangeActiveSync", "mobileAppsAndDesktopClients", "other"]

    applications {
      included_applications = ["Office365"]
    }

    devices {
      filter {
        mode = "include"
        rule = "device.isCompliant -ne True -and device.trustType -ne \"ServerAD\""
      }
    }

    platforms {
      included_platforms = ["windows"]
    }

    users {
      excluded_groups = [var.pol_apply_user_byod_ca_exclusion, var.pol_apply_user_ext_byod_ca_exclusion, var.rpa_user_bots]
      included_groups = [var.pol_apply_user_allow_byod_access]
    }

  }
  grant_controls {
    built_in_controls = ["domainJoinedDevice"]
    operator          = "OR"
  }

}

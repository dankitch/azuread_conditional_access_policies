resource "azuread_conditional_access_policy" "CA001" {
  display_name = "${var.tenant} - ${local.policy1.sequence_number} - ${local.policy1.personas_groups} - ${local.policy1.cloud_app_target} : ${local.policy1.response}"
  state        = var.Enabled
  conditions {
    client_app_types = ["exchangeActiveSync", "other"]
    // sign_in_risk_levels = []
    // user_risk_levels    = []

    applications {
      included_applications = ["All"]
      // excluded_applications = []
    }
    /*
    devices {
      filter {
        mode = ""
        rule = ""
      }
    }
    */
    users {
      // included_groups = []
      included_users = ["All"]
      // excluded_users = []
    }
    locations {
      included_locations = ["All"]
      // excluded_locations = []
    }
    platforms {
      included_platforms = ["all"]
      // excluded_platforms = []
    }
  }
  grant_controls {
    operator          = "OR"
    built_in_controls = ["block"]
  }
  /*
  session_controls {
    application_enforced_restrictions_enabled = 
    sign_in_frequency                         = 
    sign_in_frequency_period                  = ""
    cloud_app_security_policy                 = ""
  }
  */
}

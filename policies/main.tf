locals {
  policy1 = {
    sequence_number  = "CA001"
    personas_groups  = "All Users"
    cloud_app_target = "Legacy Auth"
    response         = "Block"
  }
  policy2 = {
    sequence_number  = "CA002"
    personas_groups  = "Test-RING"
    cloud_app_target = "User Sign-in Risk (High) - All Cloud Apps"
    response         = "Block"
  }
  policy3 = {
    sequence_number  = "CA003"
    personas_groups  = ""
    cloud_app_target = ""
    response         = ""
  }
  policy4 = {
    sequence_number  = "CA004"
    personas_groups  = "All Device Platforms - All Clients"
    cloud_app_target = "Office 365"
    response         = "Use App Enforced Restrictions"
  }
  policy5 = {
    sequence_number  = "CA005"
    personas_groups  = "macOS - Desktop Clients"
    cloud_app_target = "Office 365"
    response         = "Require Compliant Device"
  }
  policy6 = {
    sequence_number  = "CA006"
    personas_groups  = "iOS + Android - Mobile Apps"
    cloud_app_target = "Office 365"
    response         = "Require Approved App OR App Protection Policy"
  }
  policy7 = {
    sequence_number  = "CA007"
    personas_groups  = "iOS + Android - Mobile Apps"
    cloud_app_target = "All Cloud Apps"
    response         = "Require Compliant Device"
  }
  policy8 = {
    sequence_number  = "CA008"
    personas_groups  = "Windows - Desktop Clients"
    cloud_app_target = "Office 365"
    response         = "Require Microsoft Entra Hybrid Joined Device"
  }
  policy9 = {
    sequence_number  = "CA009"
    personas_groups  = ""
    cloud_app_target = ""
    response         = ""
  }
  policy10 = {
    sequence_number  = "CA010"
    personas_groups  = "Windows - Browser"
    cloud_app_target = "Office 365"
    response         = "Require App Protection Policy"
  }
}





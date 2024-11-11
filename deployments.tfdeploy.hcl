# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

deployment "simple" {
  inputs = {
    prefix           = "simple"
    instances        = 1
  }
}

deployment "complex" {
  inputs = {
    prefix           = "complex"
    instances        = 5
  }
}

orchestrate "auto_approve" "no_pet_changes" {
    check {
        # Check that the pet component has no changes
        condition = context.plan.component_changes["component.pet"].total == 0
        reason = "Not automatically approved because changes proposed to pet component."
    }
}

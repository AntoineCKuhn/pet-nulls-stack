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
    instances        = 15
  }
}

orchestrate "auto_approve" "no_pet_changes" {
    check {
        condition = context.plan.component_changes["component.pet"].total == 0
        reason = "Not automatically approved because changes proposed to pet component."
    }
}

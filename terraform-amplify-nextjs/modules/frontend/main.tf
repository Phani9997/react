
resource "aws_iam_role" "amplify_role" {
  name = "amplify_deploy_terraform_role"


  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "amplify.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
  

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_iam_role_policy" "amplify_role_policy" {
  name = "amplify_iam_role_policy"
  role = aws_iam_role.amplify_role.id
policy = file("${path.cwd}/modules/frontend/amplify_role_policies.json")
}


resource "aws_amplify_app" "frontend" {
  name = "${var.project_name}-${var.environment}"
  repository = var.github_repository
  access_token= local.git_hub_token

  build_spec = <<-EOT
version: 1
frontend:
  phases:
    preBuild:
      commands:
        - npm ci
    build:
      commands:
        - npm run build
  artifacts:
    baseDirectory: build
    files:
      - '**/*'
  cache:
    paths:
      - node_modules/**/*

  EOT

  enable_auto_branch_creation = true
  # enable_branch_auto_build = true
  enable_branch_auto_deletion = true
  platform = "WEB"

  auto_branch_creation_config {
    enable_pull_request_preview = true
    enable_auto_build  = true
    environment_variables = {
      APP_ENVIRONMENT = "develop"
    }
  }

  iam_service_role_arn = aws_iam_role.amplify_role.arn
  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_amplify_branch" "main" {
  app_id      = aws_amplify_app.frontend.id
  branch_name = "main"

  enable_auto_build = true

  environment_variables = {
    APP_ENVIRONMENT = "main"
  }
}

#- - - - - - - - - - - - - - -- - - -- - - - - -- - - - - - -

# resource "aws_amplify_domain_association" "develop" {
#   app_id      = aws_amplify_app.frontend.id
#   domain_name = "staging.${var.domain}"

#   sub_domain {
#     branch_name = aws_amplify_branch.develop.branch_name
#     prefix      = ""
#   }

#   sub_domain {
#     branch_name = aws_amplify_branch.develop.branch_name
#     prefix      = "www"
#   }
# }


# resource "aws_amplify_domain_association" "main" {
#   app_id      = aws_amplify_app.frontend.id
#   domain_name = "${var.domain}"

#   # https://---.co
#   sub_domain {
#     branch_name = aws_amplify_branch.main.branch_name
#     prefix      = ""
#   }

#   # https://www.---.co
#   sub_domain {
#     branch_name = aws_amplify_branch.main.branch_name
#     prefix      = "www"
#   }
# }
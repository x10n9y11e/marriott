package policies.approval

deny[msg] {
    input.environment == "staging"
    not input.approved
    msg := "Deployment to staging requires approval"
}

deny[msg] {
    input.environment == "prod"
    not input.approved
    msg := "Deployment to prod requires approval"
}

default allow = false

allow {
    count(deny) == 0
}

package policies.secret_scan

deny[msg] {
    contains(input.code, "password=")
    msg := "Hardcoded password detected in code"
}

deny[msg] {
    contains(input.code, "secret_key=")
    msg := "Hardcoded secret key detected in code"
}

deny[msg] {
    contains(input.code, "api_key=")
    msg := "Hardcoded API key detected in code"
}

deny[msg] {
    contains(input.code, "AKIA")
    msg := "AWS access key detected in code"
}

deny[msg] {
    contains(input.code, "-----BEGIN RSA PRIVATE KEY-----")
    msg := "RSA private key detected in code"
}

deny[msg] {
    contains(input.code, "-----BEGIN PRIVATE KEY-----")
    msg := "Private key detected in code"
}

default allow = false

allow {
    count(deny) == 0
}

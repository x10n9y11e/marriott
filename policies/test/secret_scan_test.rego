package policies.secret_scan

test_password_detected {
    result := deny with input as {"code": "password=mysecretpassword"}
    count(result) > 0
}

test_secret_key_detected {
    result := deny with input as {"code": "secret_key=mysecretkey"}
    count(result) > 0
}

test_api_key_detected {
    result := deny with input as {"code": "api_key=myapikey"}
    count(result) > 0
}

test_aws_access_key {
    result := deny with input as {"code": "AKIAIOSFODNN7EXAMPLE"}
    count(result) > 0
}

test_rsa_private_key {
    result := deny with input as {"code": "-----BEGIN RSA PRIVATE KEY-----"}
    count(result) > 0
}
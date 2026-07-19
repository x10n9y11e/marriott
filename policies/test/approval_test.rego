package policies.approval

test_dev_no_approval {
    result := deny with input as {"environment": "dev", "approved": false}
    count(result) == 0
}

test_staging_no_approval {
    result := deny with input as {"environment": "staging", "approved": false}
    count(result) > 0
}

test_staging_with_approval {
    result := deny with input as {"environment": "staging", "approved": true}
    count(result) == 0
}

test_prod_no_approval {
    result := deny with input as {"environment": "prod", "approved": false}
    count(result) > 0
}

test_prod_with_approval {
    result := deny with input as {"environment": "prod", "approved": true}
    count(result) == 0
}

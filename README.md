# Blue-Green Deployment with S3, CloudFront, and Route53

## Overview
This project implements a Blue-Green Deployment model using AWS services and Terraform. Deploying different index files allows users to toggle between "Blue" and "Green" application versions.

---
## Prerequisites
- An Account with AWS
- The right permissions (IAM)
- A Custom domain to use. E.g., t2s-services.com

---
## File Structure
- **Modules**:
  - `s3-buckets`: Provisions S3 buckets.
  - `route53`: Sets up Route53 records.
- **Environments**:
  - Dev:
      - **`files/index-blue.html`**: Displays the blue version of the service.
      - **`files/index-green.html`**: Displays the green version of the service.
  - Stage:
      - **`files/index-blue.html`**: Displays the blue version of the service.
      - **`files/index-green.html`**: Displays the green version of the service.
  - Prod:
      - **`files/index-blue.html`**: Displays the blue version of the service.
      - **`files/index-green.html`**: Displays the green version of the service.

---
## Deployment Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/Here2ServeU/aws-blue-green-deployment
   cd aws-blue-green-deployment/
   ``` 
3. Navigate to the desired environment folder (`dev`, `stage`, or `prod`).
4. Initialize Terraform:
   ```bash
   terraform init
   ```
5. Plan and Validate:
   ```bash
   terraform plan
   ```
6. Apply the Configuration:
   ```bash
   terraform apply
   ```
---
## Set Up CloudFront Manually in the AWS Console
1. Log in to the AWS Management Console and Navigate to the CloudFront service.
2. Create a CloudFront Distribution:
   - Origin Settings:
       - Origin Domain Name: Select your S3 bucket (e.g., t2s-dev-blue-bucket.s3.amazonaws.com).
       - Origin Access Control: If you want private access, enable an OAC (Origin Access Control) for your bucket.
       - Origin Path: Leave empty unless you want to serve content from a specific folder in your bucket.
   - Default Cache Behavior:
       - Viewer Protocol Policy: Choose “Redirect HTTP to HTTPS” or “HTTPS Only.”
       - Cache Policy: Use the default policy or customize it.
   - Settings:
       - 	Distribution Settings: Choose the price class and logging preferences.
       - 	Alternate Domain Names (CNAMEs): Add your custom domain (e.g., www.t2s-services.com).
       - 	SSL Certificate: Use a default CloudFront certificate or upload a custom certificate via ACM.
   - Save the Distribution.
3. Repeat the Above for the Green Bucket:
   - Create a separate CloudFront distribution for the green bucket.
4. Copy the CloudFront Domain Names:
   - 	After creating distributions, note the domain names (e.g., t2sblue.cloudfront.net and t2sgreen.cloudfront.net).
---

## Update Route 53 to Use CloudFront
Integrate the manually created CloudFront distributions into your Terraform-managed Route 53 setup.

**Update terraform.tfvars**
Include the CloudFront domain names for the blue and green environments.
```hcl
blue_cloudfront_url  = "t2sblue.cloudfront.net"
green_cloudfront_url = "t2sgreen.cloudfront.net"
```

**Update modules/route53/main.tf**
Modify the active_record resource to use the CloudFront domain names.
```hcl
resource "aws_route53_record" "active_record" {
  zone_id = aws_route53_zone.main.id
  name    = var.record_name
  type    = "A"

  alias {
    name                   = var.active_environment == "blue" ? var.blue_cloudfront_url : var.green_cloudfront_url
    zone_id                = "Z2FDTNDATAQYW2" # Default CloudFront zone ID
    evaluate_target_health = false
  }
}
```

**Update modules/route53/variables.tf**
Add the variables for the CloudFront URLs.
```hcl
variable "blue_cloudfront_url" {
  description = "CloudFront domain name for the Blue environment"
  type        = string
}

variable "green_cloudfront_url" {
  description = "CloudFront domain name for the Green environment"
  type        = string
}

variable "active_environment" {
  description = "Active environment (blue or green)"
  type        = string
}
```

**Deploy Updated Route 53 Configuration**
```bash
terraform init  # To initialize Terraform.
terraform plan  # To plan the changes
terraform apply # To apply the chances.
```

**Test the Setup**
1.	Open your domain (e.g., www.t2s-services.com) in a browser.
2.	The CloudFront distribution should serve the correct content Depending on the active environment (blue or green).
---

## Switching Between Blue and Green
To switch environments, update the active_environment variable in terraform.tfvars:
```hcl
active_environment = "green"
```

Then reapply Terraform:
```hcl
terraform apply
```
---

### Key Notes
- CloudFront distributions must be set up correctly in the AWS Management Console with the correct S3 origins.
- Use the CloudFront domain names in the Route 53 alias record.
- Ensure your custom domain is associated with CloudFront via the Alternate Domain Names (CNAMEs) setting in CloudFront and an SSL certificate from ACM.

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

# Blue-Green Deployment with S3, CloudFront, and Route53

## Overview
This project implements a Blue-Green Deployment model using AWS services and Terraform. The project allows toggling between "Blue" and "Green" versions of the application by deploying different index files.

---
## File Structure
- **`files/index-blue.html`**: Displays the blue version of the service.
- **`files/index-green.html`**: Displays the green version of the service.
- **Modules**:
  - `s3-buckets`: Provisions S3 buckets.
  - `route53`: Sets up Route53 records.
- **Environments**: Dev, Stage, Prod.

---
## Deployment Instructions
1. Navigate to the desired environment folder (`dev`, `stage`, or `prod`).
2. Initialize Terraform:
   ```bash
   terraform init

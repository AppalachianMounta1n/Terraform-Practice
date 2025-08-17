## Basic Commands
---
- `terraform init` sets the directory up
- `terraform apply` builds the resources from the file
    - This can also be used to update an existing configuration
- `terraform destroy` tears down resources made/controlled by the file
- You can overwrite a variable with the `-var` flag followed by the name of the variable and value, such as `container_name=name`
    - This does not save the value of the variables like a variables file would
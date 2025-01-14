# Chef Inspec Compliance and Remediation

Studies based in day 53-54 of 100 Days System Design for DevOps and Cloud Engineers.

https://deoshankar.medium.com/100-days-system-design-for-devops-and-cloud-engineers-18af7a80bc6f

Days 51–60: Security and Compliance at Scale

Day 53–54: Automate compliance checks and remediation using tools like Chef InSpec or Open Policy Agent (OPA).

## Project Overview

This project demonstrates how to use Chef InSpec to monitor the status of a container, ensuring it is running correctly. If the container is found to be non-compliant (i.e., not running), the project automates the remediation process by rebuilding and restarting the container.

## How to Use

* Clone this repo:
```
git clone https://github.com/QIRoss/Chef-Inspect-Compliance-and-Remediantion
```

* Install Chef Inspec and get a free Licence Key in the Website:
```
curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P inspec
```

Execute inspec to check negative result (container not running)
```
inspec exec fastapi-compliance-check
```

Build and run container:
```
docker build -t fastapi-chef-inspec .
docker run -d -p 8000:8000 --name fastapi-app fastapi-chef-inspec
```

Now you can run again to check positive result:
```
inspec exec fastapi-compliance-check
```

Make the scripts executable:
```
chmod +x remediate_fastapi.sh
chmod +x run_inspec_and_remediate.sh
```

The ```run_inspec_and_remediate.sh``` script will automatically handle the remediation process if the container is not running. If everything is fine, it will simply log that the container is compliant. The script also generates an output log (inspec_output.txt), which captures the results of the compliance check.

The ```remediate_fastapi.sh``` script checks the current state of the Docker container. If the container is not running, it will trigger the build and run process.

## Author
This project was implemented by [Lucas de Queiroz dos Reis][2]. It is based on the [100 Days System Design for DevOps and Cloud Engineers][1].

[1]: https://deoshankar.medium.com/100-days-system-design-for-devops-and-cloud-engineers-18af7a80bc6f "Medium - Deo Shankar 100 Days"
[2]: https://www.linkedin.com/in/lucas-de-queiroz/ "LinkedIn - Lucas de Queiroz"
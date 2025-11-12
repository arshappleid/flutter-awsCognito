# flutter-awsCognito
Flutter APP handling authentication with AWS Cognito.

[Link to Demo Video](https://youtu.be/IICqQT1updg)

### Repo Design 
```
flutter-awsCognito/
├── app/ 
│ └── lib/ # Amplify Cognito Config File
│
├── awsinfra/ # AWS IaC setup (Terraform)
│ └── iac/ # Cognito User Pool and App Client config
│
├── docker-compose.yaml 
└── README.md # Project documentation
```

# Run commands
Summary
1. Configure a AWS Cognito pool instance with your AWS user account.
2. Configure Cognito Instance Credentials into ```app/lib/amplifyconfiguration.dart```
3. Spin up the application to test Account Sign up. 

## Setting up cognito pool
```
docker compose up -d
docker ps
docker exec -it <terraform_env_container_id> /bin/bash
aws configure sso ## Need to generate credentials from aws security credentials section
terraform init
terraform apply --auto-approve ## Will output Cognito Pool ID and App Client ID
```

## Configure AWS Cognito Pool , and Client ID
The app needs to know about the unique id of the cognite instance in ```app/lib/amplifyconfiguration.dart```. Configure the following parameters.

```
"Default": {
    "PoolId": "[COGNITO USER POOL ID]",
    "AppClientId": "[COGNITO USER POOL APP CLIENT ID]",
    "Region": "[REGION]"
},
```

## Hosting the application
```
docker ps
docker exec -it <flutter_app_container_id> /bin/bash
flutter run -d web-server --web-port=8080 --web-hostname=0.0.0.0

```

## References
1. https://docs.amplify.aws/gen1/flutter/build-a-backend/auth/set-up-auth/
2. https://docs.amplify.aws/flutter/build-a-backend/auth/connect-your-frontend/sign-up/
3. [Terraform ENV setup](https://github.com/arshappleid/terraform-dev-env)
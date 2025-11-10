# flutter-awsCognito
Flutter APP with AWS Cognito Authentication

# Run commands
```
docker compose up -d
docker ps
docker exec -it <container_id> /bin/bash
flutter run -d web-server
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

## References
1. https://docs.amplify.aws/gen1/flutter/build-a-backend/auth/set-up-auth/
2. https://docs.amplify.aws/flutter/build-a-backend/auth/connect-your-frontend/sign-up/
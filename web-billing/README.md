## Shutting down the stack
docker stack rm web-billing

## Running up the stack
docker stack deploy --compose-file=web-billing-stack.yaml web-billing

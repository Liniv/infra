## Shutting down the stack
docker stack rm wildfly

## Running up the stack
docker stack deploy --compose-file=wildfly-stack.yaml wildfly

## Shutting down the stack
docker stack rm tftp

## Running up the stack
docker stack deploy --compose-file=tftp-stack.yaml tftp

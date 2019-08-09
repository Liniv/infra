## Shutting down the stack
docker stack rm scheduler
## Running up the stack
docker stack deploy --compose-file=scheduler-stack.yaml scheduler

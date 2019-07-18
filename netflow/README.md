mapping bond0
!!! Swarm not support

## Shutting down the stack
docker stack rm netflow

## Running up the stack
docker stack deploy --compose-file=netflow-stack.yaml netflow


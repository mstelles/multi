# multi tools docker image
* multi function docker image based on debian
* available tools: tcpdump, dig, ab, awscli, boto3, stress, procps (top, ps, etc)
simple use:
```
docker run -it --name multi mstelles/multi:latest sh
```
to use AWS CLI, credentials may be passed via environment variables
```
docker run -it --env KEY="your aws key" --env SECKEY="secret key" --name multi mstelles/multi:latest sh
```

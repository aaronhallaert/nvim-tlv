docker build -t nvim-tlv .
docker run -d \
  -it \
  --name devtest \
  --mount type=bind,source=/home/aaron/Developer,target=/home/aaron/Developer \
  nvim-tlv

docker exec -it devtest /bin/bash

#!bin/bash

#Starting container
docker run -d \
  -v /root/repositorio/:/usr/src/app \
  -v /usr/src/app/node_modules \
  -p 3002:3000 \
  --rm \
  --name=front-react-hom \
  projeto/front-react-hom

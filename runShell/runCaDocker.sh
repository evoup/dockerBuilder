#!/bin/bash
sudo docker run -it --privileged -v /home/evoup/project/dockerData/readyHadoopData:/readyHadoopData \
    -v /home/evoup/project/dockerData/caHdfs:/data \
    --ip=172.18.0.32 --net=b0 264424cc2cee /bin/bash

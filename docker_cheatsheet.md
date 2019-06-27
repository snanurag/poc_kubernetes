* #### To run container on no network. (By default container starts on Bridge network)
> docker run -it --net=none golang /bin/bash

* #### To do port forwarding to docker container
> docker run -d -p 8080:80 nginx
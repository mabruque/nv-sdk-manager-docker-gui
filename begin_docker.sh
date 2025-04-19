xhost +local:docker

mkdir -p .nvsdkm
mkdir -p downloads
mkdir -p nvidia

docker run --rm -it --net=host \
    --env="DISPLAY=$DISPLAY" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="./.nvsdkm:/home/user/.nvsdkm" \
    --volume="./downloads:/home/user/Downloads" \
    --volume="./nvidia:/home/user/nvidia" \
    --volume="/dev:/dev" \
    --privileged \
    --cap-add=ALL \
    --name sdk_gui \
    sdkmanager-gui
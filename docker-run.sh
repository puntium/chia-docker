#!/bin/sh

docker run -it --rm \
	--name=chia --net=host \
	-v /raid0/chia:/plotter0 \
	-v /disk4tb/chia-plots:/plots0 \
	-v /disk4tb/root-dot-chia:/root/.chia \
	-v /mnt/nasucore/chia:/plots-remote0 \
	chia:v1

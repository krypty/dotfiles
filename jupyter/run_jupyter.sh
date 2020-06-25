#!/usr/bin/env bash
mkdir -p /home/gary/jupyter_data
docker pull jupyter/scipy-notebook:latest
docker run -v /home/gary/jupyter_data:/home/jovyan/work -p 8888:8888 jupyter/scipy-notebook

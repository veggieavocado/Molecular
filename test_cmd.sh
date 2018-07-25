#! /bin/bash

docker exec -it molecular-server python -m pytest -n 3 --cov-config .coveragerc --cov=. -v

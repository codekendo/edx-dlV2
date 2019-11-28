run: build
	docker run --rm=true -v `pwd`:/tmp/:rw -t -i --name edx-dl-container edx-dl-docker bash

build:
	docker build -t edx-dl-docker .
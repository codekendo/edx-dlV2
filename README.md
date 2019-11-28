


This is an installation and runnable Docker for edx-dl

The instructions assumes you have docker and Make installed on your system. It was tested on OSx, but should work on Linux as well.

Run

`make`

Now are in a docker with an installed edx-downloader Your computer's current folder is mounted inside the docker's current folder

Simply run

`python /edx-dl/edx-dl.py -u '<username>' -p '<password>' <course url>`

Or for on demand courses

`python /edx-dl/edx-dl.py -u '<username>' -p '<password>' --on-demand <course url>`

Here is an example of a course url: https://courses.edx.org/courses/edX/DemoX.1/2014/info

It can also be checked with:

python /edx-downloader/edx-dl.py -u '<username>' -p '<password>' --list-courses

When the download is complete run

exit

Now your current folder should contain all the videos.

Enjoy!!!



Dockerfile
FROM python:3.6.9-buster

RUN git clone https://github.com/codekendo/edx-dl
RUN (cd edx-downloader && pip install -r requirements.txt)
RUN pip install --upgrade youtube_dl

VOLUME /tmp/
WORKDIR /tmp/

ENTRYPOINT bash
Makefile
run: build
	docker run --rm=true -v `pwd`:/tmp/:rw -t -i --name edx-dl-container edx-dl-docker bash

build:
	docker build -t edx-dl-docker .


python /edx-dl/edx-dl.py -u '<EMAIL>' -p '<PASSWORD>' https://courses.edx.org/courses/course-v1:MITx+6.008.1x+3T2016/course/

python /edx-dl/edx-dl.py -u '<EMAIL>' -p '<PASSWORD>' --list-courses

python /edx-dl/edx-dl.py -u '<EMAIL>' -p '<PASSWORD>' -o 'Downloaded/The_Analytics_Edge2018' https://courses.edx.org/courses/course-v1:MITx+15.071x+3T2018/course/


https://gist.github.com/awalterschulze/531ae5c688746eece5db



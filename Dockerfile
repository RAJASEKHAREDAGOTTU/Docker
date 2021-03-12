FROM golang:1.14-alpine As build

ARG app_env
ENV APP_ENV $app_env

COPY ./app /go/src/github.com/RAJASEKHAREDAGOTTU/docker
WORKDIR /go/src/github.com/RAJASEKHAREDAGOTT/docker

RUN go get ./
RUN go build

CMD if [ ${APP_ENV} = production ]; \
	then \
	app; \
	else \
	go get github.com/pilu/fresh && \
	fresh; \
	fi
	
EXPOSE 8080

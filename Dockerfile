FROM golang:1.10

ARG app_env
ENV APP_ENV dev

COPY ./app /go/src/github.com/user/worldcup.go/app
WORKDIR /go/src/github.com/user/worldcup.go/app

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

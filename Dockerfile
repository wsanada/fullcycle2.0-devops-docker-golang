FROM golang:1.12.0-alpine3.9 AS build


WORKDIR /app

RUN mkdir app

COPY index.go /app/

RUN cd /app && \
    go build index.go 

FROM scratch

COPY --from=build /app/index /app/

CMD [ "/app/index" ]

# BUILD
FROM golang:1.17-alpine AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o api main.go

  # DEPLOY
FROM scratch
COPY --from=build /app/api /usr/local/bin/api
EXPOSE 5000
CMD ["/usr/local/bin/api"]

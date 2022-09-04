FROM golang:1.17-alpine as build

WORKDIR /home/app/src

COPY . .

RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -o app .

FROM alpine:latest

WORKDIR /app

COPY --from=build /home/app/src/app .

EXPOSE 3000

CMD [ "./app" ]
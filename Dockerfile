FROM golang:1.22.3
WORKDIR /app
COPY . /app
RUN go build /app
EXPOSE 3000
CMD ["./main"]

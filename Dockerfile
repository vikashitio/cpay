# Start with an official Golang base image
FROM golang:1.22.3

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files first to leverage Docker cache
COPY go.mod go.sum ./

# Download the Go modules needed
RUN go mod download

# Copy the rest of the application code
COPY . .

# Build the Go app
RUN go build -o main .

# Expose the application port (modify according to your app)
EXPOSE 8080

# Command to run the executable
CMD ["./main"]

# Use Golang version 1.22.3 as the base image
FROM golang:1.22.3

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files and download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the application source code
COPY . /app

# Build the Go application and create an executable named 'main'
RUN go build /app

# Expose the port that the application will listen on
EXPOSE 3000

# Command to run the application
CMD ["./template"]

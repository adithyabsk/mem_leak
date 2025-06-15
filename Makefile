.PHONY: help run docker-build docker-run clean

help:
	@cat Makefile

# Build Docker image
docker-build:
	docker build -t mem-leak-detector .

# Run Docker container
docker-run: docker-build
	docker run --rm mem-leak-detector

docker:
	${MAKE} docker-build
	${MAKE} docker-run

# Clean up local files and Docker images
clean:
	docker rmi mem-leak-detector 2>/dev/null || true

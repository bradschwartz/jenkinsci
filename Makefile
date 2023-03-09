IMAGE := jenkinsci
build:
	docker build . -t $(IMAGE)

run: build
	docker run --rm -it -p 8080:8080 $(IMAGE)

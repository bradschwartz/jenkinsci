IMAGE := jenkinsci
build:
	docker build . -t $(IMAGE)

run: build
	docker run --rm --name $(IMAGE) -it -p 8080:8080 $(IMAGE)

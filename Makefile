IMAGE := jenkinsci
build:
	docker build . -t $(IMAGE)

run: build
	docker run --rm --name $(IMAGE) \
	 -e GITHUB_CRED_ID \
	 -e GITHUB_ORG \
	 -p 8080:8080 \
	 -it $(IMAGE)

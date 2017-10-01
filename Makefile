build:
	docker build -t sheepdoge/pup-golang .

test: build
	docker run sheepdoge/pup-golang /bin/bash -c "./test.sh"


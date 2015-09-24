default: install

build-go:
	 CGO_ENABLED=0 GOOS=linux go build \
		-ldflags "-s" \
		-a -installsuffix cgo \
		-o eslintd-tr $(shell pwd)/main.go

build-docker:
	docker build --rm -t eslintd:v1.5.1 .

install: build-docker
	sudo cp $(shell pwd)/eslint /usr/local/bin/eslint
	sudo cp $(shell pwd)/eslintd-tr /usr/local/bin/eslintd-tr


default: install

build-go:
	 CGO_ENABLED=0 GOOS=linux go build \
		-ldflags "-s" \
		-a -installsuffix cgo \
		-o eslintd $(shell pwd)/main.go

build-docker:
	docker build --rm -t eslint:v1.5.1 .

install:
	sudo ln -s $(shell pwd)/eslint /usr/local/bin/eslint
	sudo ln -s $(shell pwd)/eslintd /usr/local/bin/eslintd


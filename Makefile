default: install

build-go:
	 CGO_ENABLED=0 GOOS=linux go build \
		-ldflags "-s" \
		-a -installsuffix cgo \
		-o vim-eslintd $(shell pwd)/main.go

build-docker:
	docker build --rm -t vim-eslintd:v1.5.1 .

install: build-docker
	sudo ln -s $(shell pwd)/eslint /usr/local/bin/eslint
	sudo ln -s $(shell pwd)/vim-eslintd /usr/local/bin/vim-eslintd


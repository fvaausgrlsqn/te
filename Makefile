image: build

env:
	$(eval GIT_REF=$(shell git rev-parse --short HEAD))
	$(eval CPUS=$(shell cat cpus.txt))

build: env
	@echo building webchainminer:${GIT_REF}
	@docker build -f Dockerfile -t webchainminer:${GIT_REF} .

daemon: build
	@docker run --cpus=${CPUS} webchainminer:${GIT_REF}

miner: daemon

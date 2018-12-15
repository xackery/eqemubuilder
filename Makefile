VERSION=latest
docker-build:
	@(docker build -t eqemubuilder .)
docker-push: docker-build
	@(docker tag eqemubuilder eqemu/builder:$(VERSION))
	@(docker push eqemu/builder:$(VERSION))
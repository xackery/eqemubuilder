VERSION=0.0.1
docker-build:
	@(docker build -t eqemubuilder .)
docker-push: docker-build
	@(docker tag eqemuserver eqemu/builder:$(VERSION))
	@(docker push eqemu/builder:$(VERSION))
build: check-env-VERSION
	$(MAKE) build-version
	$(MAKE) build-latest

build-latest:
	docker build -t greyzmeem/oauth2_proxy:latest .
	docker push greyzmeem/oauth2_proxy:latest

build-version: check-env-VERSION
	docker build -t greyzmeem/oauth2_proxy:${VERSION} .
	docker push greyzmeem/oauth2_proxy:${VERSION}

check-env-%:
	@ if [ "${${*}}" = "" ]; then \
		echo "Environment variable $* not set"; \
		exit 1; \
	fi

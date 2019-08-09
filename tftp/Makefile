NAME = 10.90.2.111:5000/mtis/tftp
VERSION = 1.0.0

.PHONY: build build-nocache test tag-latest push push-latest release git-tag-version

build:
	docker build -t $(NAME):$(VERSION) -t $(NAME):latest --rm ./

build-nocache:
	docker build -t $(NAME):$(VERSION) -t $(NAME):latest --no-cache --rm ./

test:
	env NAME=$(NAME) VERSION=$(VERSION) bats test/test.bats

tag-latest:
	docker tag $(NAME):$(VERSION) $(NAME):latest

push:
	docker push $(NAME):$(VERSION)

push-latest:
	docker push $(NAME):latest

release: build tag-latest push push-latest

git-tag-version: release
	git tag -a v$(VERSION) -m "v$(VERSION)"
	git push origin v$(VERSION)

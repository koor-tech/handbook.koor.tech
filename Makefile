IMAGE ?= squidfunk/mkdocs-material

serve:
	docker run --net=host --volume "$$(pwd)":"$$(pwd)" --workdir "$$(pwd)" -it $(IMAGE)

build:
	docker run --net=host --volume "$$(pwd)":"$$(pwd)" --workdir "$$(pwd)" -it $(IMAGE) build --clean

prepare:
	pip install --upgrade \
		"git+https://${GH_TOKEN}@github.com/galexrt/mkdocs-material-insiders.git"
	pip install "mkdocs-minify-plugin>=0.3" "mkdocs-redirects>=1.0"

deploy:
	mkdocs build --clean

deploy-development: prepare
	$(MAKE) deploy

deploy-production: prepare
	$(MAKE) deploy

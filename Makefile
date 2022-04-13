IMAGE ?= squidfunk/mkdocs-material

serve:
	docker run --net=host --volume "$$(pwd)":"$$(pwd)" --workdir "$$(pwd)" -it $(IMAGE)

build:
	docker run --net=host --volume "$$(pwd)":"$$(pwd)" --workdir "$$(pwd)" -it $(IMAGE) build --clean

prepare:
	pip3 install --upgrade \
		"git+https://${GH_USERNAME}:${GH_TOKEN}@github.com/galexrt/mkdocs-material-insiders.git"
	pip3 install "mkdocs-minify-plugin>=0.3" "mkdocs-redirects>=1.0"

deploy: prepare
	mkdocs build --clean

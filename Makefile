book_path = books/$(book)/index.adoc

epub:
	docker run -it -u $(id -u):$(id -g) -v .:/documents/ asciidoctor/docker-asciidoctor asciidoctor-epub3 $(book_path) -o build/$(book).epub

pdf:
	docker run -it -u $(id -u):$(id -g) -v .:/documents/ asciidoctor/docker-asciidoctor asciidoctor-pdf $(book_path) -o build/$(book).pdf

build: pdf epub

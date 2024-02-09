book_path = books/$(book)/index.adoc

epub:
	docker run -it --rm -u $(id -u):$(id -g) -v .:/documents/ asciidoctor/docker-asciidoctor asciidoctor-epub3 $(book_path) -o build/$(book).epub

pdf_print:
	docker run -it --rm -u $(id -u):$(id -g) -v .:/documents/ asciidoctor/docker-asciidoctor asciidoctor-pdf --theme default-for-print -a media=prepress $(book_path) -o build/$(book).prepress.pdf

pdf_press:
	docker run -it --rm -u $(id -u):$(id -g) -v .:/documents/ asciidoctor/docker-asciidoctor asciidoctor-pdf --theme default-for-print -a media=print $(book_path) -o build/$(book).print.pdf

build: pdf_print pdf_press epub

build:
	sh build-linux.sh
	cp *.pdf ~/Library/Mobile\ Documents/com~apple~CloudDocs/resume/typst

clean:
	rm -rf *.pdf

DEFAULT: build
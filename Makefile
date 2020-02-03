all: Zuul.image

dist: Zuul.image
	mkdir -p dist
	cp -a pharo-vm pharo-ui pharo Zuul.* zuul.sh dist/
	cd dist && zip -r ../release.zip *

Zuul.image: Pharo.image pharo-vm
	cp Pharo.image Zuul.image
	cp Pharo.changes Zuul.changes
	./pharo Zuul.image eval --save "Metacello new repository: 'filetree://source'; baseline: #Zuul; load: 'full'"

Pharo.image:
	curl get.pharo.org/64/80 | bash

pharo-vm: 
	curl get.pharo.org/64/vmHeadlessLatest90 | bash

clean: 
	rm -rf dist/
	rm -f Zuul.image Zuul.changes

realclean: clean
	rm -f Pharo.image Pharo-changes
	rm -rf pharo-vm pharo-ui pharo

all: Zuul.image

dist:
	echo "works"

Zuul.image: Pharo.image pharo-vm
	cp Pharo.image Zuul.image
	cp Pharo.changes Zuul.changes
	./pharo Zuul.image eval --save "Metacello new repository: 'filetree://source'; baseline: #Zuul; load"

Pharo.image:
	curl get.pharo.org/64/80 | bash

pharo-vm: 
	curl get.pharo.org/64/vmHeadlessLatest90 | bash


all: Zuul.image

dist: release.zip 

release.zip: Zuul.image
	mkdir -p dist
	cp -a Zuul.* linux-vm macos-vm zuul.sh zuul.command dist/
	rm -f release.zip
	cd dist && zip -r ../release.zip *

Zuul.image: Pharo.image macos-vm linux-vm
	cp Pharo.image Zuul.image
	cp Pharo.changes Zuul.changes
	./vm.sh Zuul.image eval --save "Metacello new repository: 'filetree://source'; baseline: #Zuul; load: 'full'"

Pharo.image:
	curl get.pharo.org/64/80 | bash

linux-vm: 
	mkdir -p linux-vm
	curl http://files.pharo.org/get-files/90/pharo64-linux-headless-latest.zip > linux-vm/vm.zip
	cd linux-vm && unzip vm.zip && rm vm.zip

macos-vm: 
	mkdir -p macos-vm
	curl http://files.pharo.org/get-files/90/pharo64-mac-headless-latest.zip > macos-vm/vm.zip
	cd macos-vm && unzip vm.zip && rm vm.zip

clean: 
	rm -rf dist/
	rm -f Zuul.image Zuul.changes

realclean: clean
	rm -f Pharo.image Pharo-changes
	rm -rf pharo-vm pharo-ui pharo
	rm -rf linux-vm macos-vm
	rm -f release.zip

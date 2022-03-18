run:
	bash .github/workflows/run_all.sh

install:
	sudo apt-get install qemu gcc-arm-linux-gnueabi qemu-user
	
clean:
	find ./*/ -type f -name Makefile -execdir make clean \; > /dev/null

info: run
	find . -type f -name "*.bin" -exec file {} \;

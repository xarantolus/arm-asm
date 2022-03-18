PROGRAM_NAME=alphabet

build: $(PROGRAM_NAME).bin

run: $(PROGRAM_NAME).bin
	qemu-arm ./$(PROGRAM_NAME).bin

$(PROGRAM_NAME).o:
	arm-linux-gnueabi-as $(PROGRAM_NAME).s -o $(PROGRAM_NAME).o

$(PROGRAM_NAME).bin: $(PROGRAM_NAME).o
	arm-linux-gnueabi-gcc $(PROGRAM_NAME).o -o $(PROGRAM_NAME).bin -nostdlib -static

clean:
	rm -f $(PROGRAM_NAME).bin $(PROGRAM_NAME).o

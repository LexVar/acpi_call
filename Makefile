obj-m := acpi_call.o

KVERSION := $(shell uname -r)
KDIR := /lib/modules/$(KVERSION)/build
PWD := $(shell pwd)

default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean

install:
	$(MAKE) -C $(KDIR) M=$(PWD) modules_install
	mkdir -p /lib/modules/$(KVERSION)/kernel/drivers/acpi_call
	cp -n acpi_call.ko /lib/modules/$(KVERSION)/kernel/drivers/acpi_call

load:
	-/sbin/rmmod acpi_call
	/sbin/insmod acpi_call.ko

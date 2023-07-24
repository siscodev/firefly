# Define variables
ARCHPROFILE := ./releng
OUTDIR := ./build
WORKDIR := /tmp/firefly
ISO_NAME := firefly
ISO_LABEL := Firefly_Arch

# Implement actions based on the input
.PHONY: run

run:
	@echo "Running the main application..."
	@mkdir -p $(WORKDIR) $(OUTDIR)
	@sudo mkarchiso -v -w $(WORKDIR) -L $(ISO_LABEL) -o $(OUTDIR) $(ARCHPROFILE) 
	mv $(OUTDIR)/firefly-*-*.iso $(OUTDIR)/firefly.iso

repoadd:
	@echo "Updating local repository..."
	repo-add $(ARCHPROFILE)/packages/custom.db.tar.gz $(ARCHPROFILE)/packages/*.zst
	rm -rf $(ARCHPROFILE)/packages/*.old

mount:
	# Add commands to mount a directory or device
	@echo "Mounting a directory or device...[ jk ]"

unmount:
	# Add commands to unmount a directory or device
	@echo "Unmounting a directory or device...[ jk ]"
	#@sudo ./scripts/umount-firefly.sh

build:
	@echo "Building the project..."
	@echo "dd bs=4M if=$(ARCHPROFILE)/$(ISO_NAME) of=/mnt/linux conv=fsync oflag=direct status=progress"
	
clean:
	# Add commands to clean up temporary files
	@echo "Cleaning up temporary files..."
	@sudo rm -rf $(WORKDIR)

clean:
	sudo rm -fr flathub output
	sudo podman system prune

oci:
	sudo podman build --network=host -t podman-image .

CONTAINER_IMAGE=localhost/podman-image
FILESYSTEM_TYPE=ext4
qcow:
	mkdir -p output
	sudo podman run --rm -it --privileged --pull=newer --security-opt label=type:unconfined_t -v ./disk_config/user.toml:/config.toml:ro -v ./output:/output -v /var/lib/containers/storage:/var/lib/containers/storage quay.io/centos-bootc/bootc-image-builder:latest --type=qcow2 --rootfs $(FILESYSTEM_TYPE) $(CONTAINER_IMAGE)

run:
	qemu-system-x86_64 -k de -L /usr/share/qemu/keymaps -M accel=kvm -cpu host -smp 2 -m 4096 -serial stdio -snapshot output/qcow2/disk.qcow2

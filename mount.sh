sudo mount -t ntfs-3g /dev/nvme0n1p3 /media/kony/windows -o rw,auto,users,exec,umask=000,uid=$(id -u kony),gid=$(id -g kony)

sudo rm -f /private/var/vm/s* && sudo ditto -czX / /Volumes/siberian/Backups/panther.cpgz
diskutil eraseVolume JHFS+ Macintosh\ HD /Volumes/Macintosh\ HD && ditto -x /Volumes/siberian/Backups/panther.cpgz /Volumes/Macintosh\ HD/
umount /Volumes/siberian
sudo dd if=/dev/sda conv=sync,noerror bs=64K | gzip -c > panther.img.gz
gunzip -c panther.img.gz | sudo dd bs=64K of=/dev/sda
tar -xz --strip 1 -f Downloads/cougar-master.tar.gz && tar -xz --strip 1 -f Downloads/panda-master.tar.gz && tar -xz --strip 1 -f Downloads/panther-master.tar.gz && rm Downloads/*.tar.gz
sudo softwareupdate -i -a
g c gh:kingpearl/panther.git
rmdir .git && g init && g ca && g remote add origin gh:kingpearl/panther.git && g push origin master
vagrant up && vagrant ssh
caffeinate -t 14400
date '+%s'
echo GRUB_CMDLINE_LINUX="mem_sleep_default=deep"
sudo vim /etc/default/grub && sudo update-grub
sudo kernelstub -a mem_sleep_default=deep
sudo prime-select on-demand
sudo vim /etc/gdm3/custom.conf
sudo vim /lib/udev/rules.d/61-gdm.rules
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
sudo apt update
sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y
flatpak update
docker build -t kingpearl/cougar:0.9.41 .
docker push kingpearl/cougar:0.9.41
docker run -p 3000:3000 -itv ~/:/docker kingpearl/cougar:0.9.41 bash
docker rm $(docker ps -aqf status=exited)

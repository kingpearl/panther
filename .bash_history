sudo rm -f /private/var/vm/s* && sudo ditto -czX / /Volumes/siberian/Backups/panther.cpgz
diskutil eraseVolume JHFS+ Macintosh\ HD /Volumes/Macintosh\ HD && ditto -x /Volumes/siberian/Backups/panther.cpgz /Volumes/Macintosh\ HD/
umount /Volumes/siberian
tar -xz --strip 1 -f Downloads/cougar-master.tar.gz && tar -xz --strip 1 -f Downloads/panda-master.tar.gz && tar -xz --strip 1 -f Downloads/panther-master.tar.gz && rm Downloads/*.tar.gz
sudo softwareupdate -i -a
g c gh:kingpearl/panther.git
rmdir .git && g init && g ca && g remote add origin gh:kingpearl/panther.git && g push origin master
vagrant up && vagrant ssh
caffeinate -t 14400
date '+%s'
docker build -t kingpearl/cougar:0.9.15 .
docker push kingpearl/cougar:0.9.15
docker run -p 3000:3000 -itv ~/Projects/spawn:/docker kingpearl/cougar:0.9.15 bash
docker rm $(docker ps -aqf status=exited)

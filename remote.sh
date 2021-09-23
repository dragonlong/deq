ps -ax | g sshfs | awk '{print $1}' | xargs -I@ | echo @
fusermount -u YOUR_MNT_DIR
sudo umount -l YOUR_MNT_DIR
sudo diskutil umount Downloads/ARChome
umount -f ~/Downloads/ARChome
#
sshfs lxiaol9@cascades1.arc.vt.edu:/groups/deq/cascades/models/MOVES3/4-testruns/nonroad_chesterfield_2tests /home/dragon/ARCwork/ -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3
sshfs lxiaol9@cascades1.arc.vt.edu:/groups/deq/cascades/models/MOVES3/4-testruns/nonroad_chesterfield_2tests /home/dragon/ARCwork/ -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3

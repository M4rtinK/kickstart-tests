%pre
mkdir -p /etc/ostree
cat > /etc/ostree/auth.json << 'EOF'
{
    "auths": {
      "registry.stage.redhat.io": {
     }
    }
}
EOF
%end

%post --nochroot
echo "###********************************************************###" >> /tmp/kstest_debug.txt
echo "BBB INSTALL ENV DEBUG TEST" >> /tmp/kstest_debug.txt
echo "###********************************************************###" >> /tmp/kstest_debug.txt
echo "ETC GREP" >> /tmp/kstest_debug.txt
ls -lah /etc | grep "resolv" >> /tmp/kstest_debug.txt
echo "###********************************************************###" >> /tmp/kstest_debug.txt
echo "SYSTEMD RESOLVED in installation env ?" >> /tmp/kstest_debug.txt
which systemd-resolve >> /tmp/kstest_debug.txt
echo "###********************************************************###" >> /tmp/kstest_debug.txt
echo "OSTREE version on boot.iso ?" >> /tmp/kstest_debug.txt
cat /root/lorax-packages.log | grep ostree >> /tmp/kstest_debug.txt
echo "###********************************************************###" >> /tmp/kstest_debug.txt
echo "BOOTC version on boot.iso ?" >> /tmp/kstest_debug.txt
cat /root/lorax-packages.log | grep bootc >> /tmp/kstest_debug.txt
echo "###********************************************************###" >> /tmp/kstest_debug.txt
echo "RESOLV.CONF" >> /tmp/kstest_debug.txt
cat /etc/resolv.conf >> /tmp/kstest_debug.txt
echo "###********************************************************###" >> /tmp/kstest_debug.txt
echo "CHECK MOUNT - INSTALL ENV " >> /tmp/kstest_debug.txt
mount -v >> /tmp/kstest_debug.txt
echo "###********************************************************###" >> /tmp/kstest_debug.txt
echo "NSLOOKUP" >> /tmp/kstest_debug.txt
nslookup redhat.com >> /tmp/kstest_debug.txt
echo "###********************************************************###" >> /tmp/kstest_debug.txt
echo "CURL" >> /tmp/kstest_debug.txt
curl -vs fedoraproject.org 2>> /tmp/kstest_debug.txt
echo "###********************************************************###" >> /tmp/kstest_debug.txt
cat /tmp/kstest_debug.txt | systemd-cat -t kstest_debug
%end

%post
echo "###********************************************************###" >> /tmp/kstest_debug.txt
echo "BBB CHROOT DEBUG TEST" >> /tmp/kstest_debug.txt
echo "###********************************************************###" >> /tmp/kstest_debug.txt
echo "# ADDED BY ANACONDA" >> /etc/resolv.conf
echo "ETC GREP" >> /tmp/kstest_debug.txt
ls -lah /etc | grep "resolv" >> /tmp/kstest_debug.txt
echo "###********************************************************###" >> /tmp/kstest_debug.txt
echo "RESOLV.CONF CONTENT" >> /tmp/kstest_debug.txt
cat /etc/resolv.conf >> /tmp/kstest_debug.txt
echo "###********************************************************###" >> /tmp/kstest_debug.txt
echo "CHECK ROOT" >> /tmp/kstest_debug.txt
ls -la / >> /tmp/kstest_debug.txt
echo "###********************************************************###" >> /tmp/kstest_debug.txt
echo "CHECK ETC" >> /tmp/kstest_debug.txt
ls -la /etc >> /tmp/kstest_debug.txt
echo "###********************************************************###" >> /tmp/kstest_debug.txt
echo "CHECK MOUNT - CHROOT " >> /tmp/kstest_debug.txt
mount -v >> /tmp/kstest_debug.txt
echo "###********************************************************###" >> /tmp/kstest_debug.txt
echo "SYSTEMD RESOLVED in chroot - path ?" >> /tmp/kstest_debug.txt
which systemd-resolve >> /tmp/kstest_debug.txt
echo "SYSTEMD RESOLVED in chroot - RPM ?" >> /tmp/kstest_debug.txt
rpm -ql systemd-resolved >> /tmp/kstest_debug.txt
rpm -qi systemd-resolved >> /tmp/kstest_debug.txt
echo "###********************************************************###" >> /tmp/kstest_debug.txt
echo "SCRIPTLETS" >> /tmp/kstest_debug.txt
rpm -qa --scripts | grep -C10 resolv.conf >> /tmp/kstest_debug.txt
echo "###********************************************************###" >> /tmp/kstest_debug.txt
echo "NSLOOKUP" >> /tmp/kstest_debug.txt
nslookup redhat.com >> /tmp/kstest_debug.txt
echo "###********************************************************###" >> /tmp/kstest_debug.txt
echo "CURL" >> /tmp/kstest_debug.txt
curl -vs fedoraproject.org 2>> /tmp/kstest_debug.txt
echo "###********************************************************###" >> /tmp/kstest_debug.txt
cat /tmp/kstest_debug.txt | systemd-cat -t kstest_debug
%end

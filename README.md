# ubuntu-scripts

## Some nice scripts for Ubuntu (servers)

### Install git if not installed (ubuntu does not install this by default)

```
$ sudo apt install git -y
```

### Usage, login to the target system and elevate rights

```
$ sudo -i
```

### Clone this git

```
# git clone -b cleanup https://github.com/PMeylemans/ununtu-scripts
```

### Cd into the functions directory 

```
# cd ubuntu-scripts/functions
```

### Execute the scripts in function of the needs


script name | purpose | location
:---------- | :-------| :-----
 ... | **Stop sending feedback**  | ...
popularity.sh| *disable feed-back to Ubuntu* | ./functions/popularity.sh
apport.sh | *disable crash dump feed-back* | ./functions/apport.sh
ubuntu-report.sh | *some more feed-back* | ./functions/ubuntu-report.sh
... | **network and access**| ..
disable-ipv6.sh | *disable IPv6 stuff* | ./functions/disable-ipv6.sh
disable-firewall.sh | *disable UFW (use with caution)* | ./functions/disable-firewall.sh
enable_root.sh | *enable login with root (caution)* | ./functions/enable_root.sh
install_sshd_enable_root.sh | *install ssh and enable for root user* | ./functions/install_sshd_enable_root.sh
install-netscript | *tools for networking* | ./functions/install-netscript.sh

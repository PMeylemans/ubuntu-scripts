# ubuntu-scripts

## Some nice scripts for Ubuntu (servers)

### Usage, login to the target system and elevate rights

```
$ sudo -i
# cd /tmp
```

### Clone this git

```
# git clone -b cleanup https://github.com/PMeylemans/ununtu-scripts
```

### Cd into the functions directory and make the scripts executable

```
# cd ubuntu-scripts/functions
# chmod +x *.sh
```

### Execute the scripts in function of the needs


script name | purpose | location
:---------- | :-------| :-----
popularity.sh|disable feed-back to Ubuntu| ./functions/popularity.sh
apport.sh | sidable crash dump feed-back| ./functions/apport.sh

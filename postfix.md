## Created demo debian on azure, will install postfix but with no config in place (won't able to test end result)

### If that would be interesting, I can provide the ssh key to access the machine
ssh chemdemo@20.107.240.163

### In my case, I need first to init postfix
```sh
sudo apt update
sudo apt install postfix
```
### open the postfix config file with root privileges

```sh
sudo vi /etc/postfix/main.cf
```
### In config file, add path to header_checks rules file and :wq
```sh
header_checks = regexp:/etc/postfix/header_checks
```

### create the file
```sh
sudo vi /etc/postfix/header_checks
```
### add the rule and :wq
```sh
/^Received:._from._\(.*\)\sby\s.*chemmedia\.de.\*/ IGNORE
```
### compile
```sh
sudo postmap /etc/postfix/header_checks
```
=> /etc/postfix/header_checks.db is created

### restart server
```sh
sudo systemctl restart postfix
```
Inspired from [Server Fault](https://serverfault.com/questions/91954/how-do-i-remove-received-headers-from-emails)

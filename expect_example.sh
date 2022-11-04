#!/usr/bin/expect -f

set timeout 10
set user xxxx
set pswd yyyy
set host [lindex $argv 0]

eval spawn ssh -o UserKnownHostsFile=/dev/null -o PubKeyAuthentication=no -o StrictHostKeyChecking=no -o CheckHostIP=no ${user}@${host}
set prompt {[:#>$]}
expect "password:\ "
send "$pswd\n"
expect -re "$prompt"
send "\n"
expect "$prompt"
send "exit\n"
expect "$prompt"
send "exit\n"

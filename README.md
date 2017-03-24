**Secvibe**


**Secvibe** is a repository of scripts used for various security testing/ ethical hacking phases.

The repo currently includes the following scripts.
1. Pingscanner.bash
2. Pingscanner.py
3. Phishingmetrics.bas

**1. Pingscanner.bash**

Pingscanner.bash is a bash script for ping scanning the hosts in a network to find live hosts. The output gives the list of hosts which responded to an ICMP echo request. 

**Usage:**

`./pingscanner.bash <network>`

**Example:**

`./pingscanner.bash 192.168.1.0/24`

`./pingscanner.bash 10.21.30.64/26`

**Note:** 
Pingscanner.bash currently supports only networks with mask bits greater than or equal to 24.

**2. Pingscanner.py**

Pingscanner.py is a python script for ping scanning the hosts in a network to find live hosts. The output gives the list of hosts which responded to an ICMP echo request. The script uses scapy libraries.

**Usage:**

`./pingscanner.py <network>`

**Example:**

`./pingscanner.py 192.168.1.0/24`

`./pingscanner.py 10.21.30.64/26`

**Note:** 
Pingscanner.py currently supports only networks with mask bits greater than or equal to 24.

**3. Phishingmetrics.bash**

Phishingmetrics.bash is a VBA script can be used to collect metrics for a phishing campaign. The macro appends the username and email address of the target user to a query string and fires a get request to the specified target server, when the user opens the word attachment with macro from the outlook inbox. The formatted details can be obtained from the access log of server using the following command..

**Usage:**

Add the macro to a word file and send it to the target user.
On the server run the following command.
`cat /var/log/apache2/access.log | grep "grepusingthis" | awk -F '[ -]' '{print $1 "\t" $6 "\t" $7 "\t" $11 "\t" $12}'`

**Example:**

`$cat /var/log/apache2/access.log | grep "grepusingthis" | awk -F '[ -]' '{print $1 "\t" $6 "\t" $7 "\t" $11 "\t" $12}'
XXX.XXX.XXX.XXX   [24/Mar/2017:19:03:41   +0000]  user1 JohnDoe@Mydomain.com
XXX.XXX.XXX.XXX   [24/Mar/2017:19:05:45   +0000]  user2 JaneDoe@Mydomain.com`

**Note:** 
The macro will work only on Windows systems.
The server used here is Apache2 on ubuntu 16.04. You may need to modify the commands to format the output if you are using 
'a different server.

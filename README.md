#Secvibe


Secvibe is a repository of scripts used for various security testing/ ethical hacking phases.

The repo currently includes the following scripts.

1. Pingscanner.bash 

Pingscanner.bash is a bash script for ping scanning the hosts in a network to find live hosts. The output gives the list of hosts which responded to an ICMP echo request. 

Usage: 

./pingscanner.bash <network>

Example:

./pingscanner.bash 192.168.1.0/24

./pingscanner.bash 10.21.30.64/26

Note: Pingscanner.bash currently supports only networks with mask bits greater than or equal to 24.

#!/usr/bin/python

from scapy.all import *
from sys import argv

script, cidr = argv

mask = cidr.split("/")[1]
sub = 32-int(mask)
cnt = pow(2,sub)-2
tmp1 = cidr.split(".")[3]
start = tmp1.split("/")[0]

net_id1 = cidr.split(".")[0]
net_id2 = cidr.split(".")[1]
net_id3 = cidr.split(".")[2]
net_id = net_id1+"."+net_id2+"."+net_id3+"."

conf.verb = 0
TIMEOUT = 2
for ip in range(int(start),cnt):
        packet = IP(dst=net_id+str(ip), ttl=1)/ICMP()
        reply = sr1(packet, timeout=TIMEOUT)
        if not (reply is None):
                print reply.dst, "is up!"
        else:
                print "Timed ouut waiting for a response from %s" % packet[IP].dst

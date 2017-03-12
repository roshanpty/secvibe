#!/bin/bash
echo "Usage: $0 <Network CIDR format>"
echo "Examples:"
echo "$0 192.168.1.0/24" 
echo "$0 10.0.120.0/27"
echo "The script currently works only for networks with mask bits greater than or equal to 24 "
in=$1
mask=`echo $in | cut -d '/' -f 2`
sub=$((32 - $mask))
cnt=$((2**$sub-3))
net_id=`echo $in | cut -d '.' -f 1,2,3`
star=`echo $in | cut -d '/' -f 1 | cut -d '.' -f 4`
host_start=$(($star+1))
for ((i=$host_start; i<=$cnt; i++))
        do
        ip=`echo "$net_id.$i"` 
        ping -c 1 $ip |grep "bytes from" | cut -d ":" -f 1 | cut -d " " -f 4&
done

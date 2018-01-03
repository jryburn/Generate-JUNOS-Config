#! /usr/bin/env python

octet1 = 10
octet2 = 0
octet3 = 2
octet4 = 2
numhosts = 255

for i in range(octet4, numhosts):
    print('iface ens6.20 inet static')
    print('   address %d.%d.%d.%d/24' % (octet1, octet2, octet3, i))
    #print(i)
    print('   vlan-raw-device ens6')

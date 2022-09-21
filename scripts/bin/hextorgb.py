#!/usr/bin/python
import sys
h = sys.argv[1].lstrip('#')
o = sys.argv[2]
aa = tuple(int(h[i:i+2], 16) for i in (0, 2 ,4))
print('background = rgba(' , aa[0] , ',' , aa[1] , ',' , aa[2] , ',' , o ,')')

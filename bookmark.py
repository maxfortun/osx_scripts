#!/usr/bin/python

import sys
from mac_alias import Bookmark

fileName=sys.argv[1]
b=Bookmark.for_file(fileName)
print b.to_bytes()

import math
import string
f = open("sinerom.mem","w")
for i in range(256):
    v = int(math.cos(2*3.1416*i/256)*127+127)
    if (i+1)%16 == 0:
        s = "{hex:2X}\n"  # hex and changing a line because 16*16 = 256
    else:
        s = "{hex:2X} "
    f.write(s.format(hex=v))  # write v in hex in the form defined before

f.close()
import os
import struct

size = os.path.getsize("boot.bin")

load_addr = int("402F0400", 16)

size_bytes = size.to_bytes(4, 'little')
load_addr_bytes = load_addr.to_bytes(4, 'little')

with open('boot.bin', 'rb') as in_f:
    boot_bin = in_f.read()

with open("MLO", "wb") as out_f:
    out_f.write(size_bytes + load_addr_bytes + boot_bin)


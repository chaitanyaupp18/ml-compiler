#!/usr/bin/env python3
# Inline dense_resource weight blobs as dense<...> literals so the kernel MLIR is
# self-contained (mlir-translate can't read separated dialect resources).
import re, struct, sys

src, dst = sys.argv[1], sys.argv[2]
txt = open(src).read()

blobs = dict(re.findall(r'([A-Za-z0-9_.]+):\s*"0x([0-9A-Fa-f]+)"', txt))

def decode(h):
    raw = bytes.fromhex(h)[4:]
    return list(struct.unpack("<%df" % (len(raw) // 4), raw))

def fmt(vals, dims):
    if len(dims) == 1:
        return "[" + ", ".join(repr(v) for v in vals) + "]"
    step = len(vals) // dims[0]
    return "[" + ", ".join(fmt(vals[i*step:(i+1)*step], dims[1:]) for i in range(dims[0])) + "]"

def repl(m):
    dims = [int(d) for d in m.group(2).split("x")]
    return "dense<%s> : tensor<%sxf32>" % (fmt(decode(blobs[m.group(1)]), dims), m.group(2))

txt = re.subn(r"dense_resource<([A-Za-z0-9_.]+)>\s*:\s*tensor<([0-9x]+)xf32>", repl, txt)[0]
txt = re.sub(r"\n\{-#.*?#-\}\s*$", "\n", txt, flags=re.S)
open(dst, "w").write(txt)

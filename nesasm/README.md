nesasm -- a 6502 assembler with specific NES support

This is a re-packaging of the nesasm assembler, so that nbasic users can
have it readily available to them. nesasm is part of the MagicEngine
MagicKit, for NES and TG16 development. The URL for the MagicKit homepage
is below.

http://www.magicengine.com/mkit/

The sources in this archive have been unchanged from the assembler
provided with MagicKit 2.51. The makefiles have been altered some,
however, to build the targets more easily for my tastes.

To build:

```bash
make
```

This will place the finished binary in `bin/nesasm` (or `bin/nesasm.exe`).

Depending on your platform, you may also need to specify the working
directory to run the program
	./nesasm

I recommend that you put the nesasm binary in your system's bin directory.

```bash
sudo make install
```

-Bob Rost
author of nbasic and Sack of Flour
rrost+nes@andrew.cmu.edu

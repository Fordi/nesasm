//header for nesasm
asm
	.inesprg 1 ;//one PRG bank
	.ineschr 1 ;//one CHR bank
	.inesmir 0 ;//mirroring type 0
	.inesmap 0 ;//memory mapper 0 (none)
	.org $8000
	.bank 0
endasm

//the program starts here on NES boot (see footer)
goto start
myname:
	data "YOUR NAME HERE",0

start:
	gosub vwait
	set $2000 %00000000
	set $2001 %00011100 //sprites and bg visible, no sprite clipping
	gosub vwait
	gosub load_palette
	gosub vwait
	gosub load_name
//the main program loop
mainloop:
	gosub vwait
	goto mainloop

//load the colors
load_palette:
	//set the PPU start address (background color 0)
	set $2006 $3f
	set $2006 0
	set $2007 $0e //set base color black
	set $2007 $30
	//set the PPU start address (foreground color 1)
	set $2006 $3f
	set $2006 $11
	set $2007 $30 //set fg color 1 white
	return	

//write your name into the background
load_name:
	set $2006 $21
	set $2006 3
	set x 0		
	load_name_1:
		set $2007 [myname x]
		inc x
		set a [myname x]
		if a <> 0 branchto load_name_1
	return

//wait until screen refresh
vwait:
	asm
		lda $2002
		bpl vwait ;//wait for start of retrace
	vwait_1:
		lda $2002
		bmi vwait_1 ;//wait for end of retrace
	endasm
	//set scroll and PPU base address
	set $2005 0
	set $2005 0
	set $2006 0
	set $2006 0
	return

//file footer
asm
;//jump table points to NMI, Reset, and IRQ start points
	.bank 1
	.org $fffa
	.dw start, start, start
;//include CHR ROM
	.bank 2
	.org $0000
	.incbin "ascii.chr"
	.incbin "ascii.chr"
endasm

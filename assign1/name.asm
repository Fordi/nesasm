nbasic_stack = 256
	.inesprg 1 ;//one PRG bank
	.ineschr 1 ;//one CHR bank
	.inesmir 0 ;//mirroring type 0
	.inesmap 0 ;//memory mapper 0 (none)
	.org $8000
	.bank 0
 jmp start

myname:
 .db 89,79,85,82,32,78,65,77,69,32
 .db 72,69,82,69,0

start:
 jsr vwait
 lda #0
 sta 8192
 lda #28
 sta 8193
 jsr vwait
 jsr load_palette
 jsr vwait
 jsr load_name

mainloop:
 jsr vwait
 jmp mainloop

load_palette:
 lda #63
 sta 8198
 lda #0
 sta 8198
 lda #14
 sta 8199
 lda #48
 sta 8199
 lda #63
 sta 8198
 lda #17
 sta 8198
 lda #48
 sta 8199
 rts

load_name:
 lda #33
 sta 8198
 lda #3
 sta 8198
 ldx #0

load_name_1:
 lda myname,x
 sta 8199
 inx
 lda myname,x
 cmp #0
 bne load_name_1
 rts

vwait:
		lda $2002
		bpl vwait ;//wait for start of retrace
	vwait_1:
		lda $2002
		bmi vwait_1 ;//wait for end of retrace
 lda #0
 sta 8197
 lda #0
 sta 8197
 lda #0
 sta 8198
 lda #0
 sta 8198
 rts
;//jump table points to NMI, Reset, and IRQ start points
	.bank 1
	.org $fffa
	.dw start, start, start
;//include CHR ROM
	.bank 2
	.org $0000
	.incbin "ascii.chr"
	.incbin "ascii.chr"


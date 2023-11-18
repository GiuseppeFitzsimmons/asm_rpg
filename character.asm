# PLAYER #

.section .data

.globl playername
playername:
    .ascii "PLAYER\0"

.globl player
player:
    .quad playername  # Pointer to player name
    .quad 1           # Level (example value 1)
    .quad 100         # HP (example value 100)

.globl NAME_OFFSET, LEVEL_OFFSET, HP_OFFSET
.equ NAME_OFFSET, 0
.equ LEVEL_OFFSET, 8
.equ HP_OFFSET, 16

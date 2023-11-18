# DIALOG #

.section .data

.globl greeting
.globl greeting2
.globl print_format

greeting:
    .string "Hello, traveler. What is your name?\n"

greeting2:
    .string "Welcome, %s. We have been waiting for you.\n"

print_format:
    .string "%s\n"
    
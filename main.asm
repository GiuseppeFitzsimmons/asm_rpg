.section .bss
    INPUT_BUFFER: .space 1024 # Input buffer

# TODO: Fix .rodata magic number
# .section .rodata
    # BUFFER_SIZE: .quad 1024

.section .text
.globl _start

_start:

    # Greet player
    movq $print_format, %rdi    # format
    leaq greeting(%rip), %rsi   # content
    movq $0, %rax               # length
    call printf                 # printf(format, content, length)

    # Get name
    mov $0, %rdi                    # file descriptor for stdin is 0
    leaq INPUT_BUFFER(%rip), %rsi   # buffer address
    mov $1024, %rdx                 # buffer size
    mov $0, %rax                    # sys_read
    syscall

    # Null-terminate the name in INPUT_BUFFER
    mov $0, %rdi            # Start searching for null terminator from the beginning
    movq $1024, %rcx        # Number of bytes to scan (buffer size)
    repnz scasb             # Search for null terminator   

    # Put name into player name pointer address
    leaq player(%rip), %rdi     # get player
    addq $NAME_OFFSET, %rdi     # get name
    movq $1024, %rcx            # repeat 1024 times
    rep movsb                   # write buffer to player name

    # Repeat player's name
    movq %rdi, %rsi         # put name in content
    movq $greeting2, %rdi   # format
    movq $0, %rax           # length(0; null terminated)
    call printf

    # Exit
    movq $60, %rax
    xor %rdi, %rdi
    syscall

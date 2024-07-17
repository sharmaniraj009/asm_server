/*
 * This assembly code is for a server program that demonstrates basic socket programming.
 * It uses system calls to perform various operations related to network communication.
 * The code sets up a socket, binds it to a specific port, listens for incoming connections,
 * and then exits.
 */

.intel_syntax noprefix
.globl _start

.section .text

_start:

    mov rax, 41
    mov rdi, 2
    mov rsi, 1
    mov rdx, 0
    syscall

    mov rax, 49
    mov rdi, 3      
    mov rsi, offset sockaddr
    mov rdx, 16
    syscall
    
    mov rax, 50
    mov rdi, 3
    mov rsi, 0
    syscall

    mov rax, 43
    mov rdi, 3
    mov rsi, 0
    mov rdx, 0
    syscall

    mov rdi, 0
    mov rax, 60     # SYS_exit
    syscall

.section .data

/*
 * This section contains the data segment of the assembly code.
 * It is used to declare and initialize variables.
 */

sockaddr:
    .byte 2
    .byte 0
    .byte 0
    .byte 80
    .byte 0       
    .byte 0
    .byte 0
    .byte 0        
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0
    .byte 0

/*
 * The 'sockaddr' label represents the start of a data structure
 * that defines the socket address. It is used for network
 * communication.
 *
 * The structure consists of 16 bytes, with the following layout:
 * - 2 bytes: Address family (AF_INET)
 * - 2 bytes: Port number (80)
 * - 4 bytes: IP address (0.0.0.0)
 * - 8 bytes: Reserved (all zeros)
 */

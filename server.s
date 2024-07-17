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

    ; This code is written in assembly language for the x86-64 architecture.
    ; It represents a server program that performs various system calls.

    ; The first system call (syscall) is used to create a socket.
    ; It sets the value of rax to 41 (SYS_socketcall) to indicate the type of system call.
    ; The values of rdi, rsi, and rdx are set to 2, 1, and 0 respectively, which specify the arguments for the system call.

    ; The second system call is used to bind the socket to a specific address.
    ; It sets the value of rax to 49 (SYS_bind) to indicate the type of system call.
    ; The values of rdi, rsi, and rdx are set to 3, offset sockaddr, and 16 respectively.
    ; The offset sockaddr is the address of the sockaddr structure that contains the IP address and port number.

    ; The third system call is used to listen for incoming connections on the socket.
    ; It sets the value of rax to 50 (SYS_listen) to indicate the type of system call.
    ; The values of rdi and rsi are set to 3 and 0 respectively.

    ; The fourth system call is used to accept an incoming connection.
    ; It sets the value of rax to 43 (SYS_accept) to indicate the type of system call.
    ; The values of rdi and rsi are set to 3 and 0 respectively.
    ; The value of rdx is set to 0, which indicates that the address of the client socket structure is not needed.

    ; After accepting the connection, the program exits by calling the exit system call.
    ; It sets the value of rdi to 0 and rax to 60 (SYS_exit) to indicate the type of system call.
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

# Read {name} from user input and store the value in the "buffer" variable.

# Print "Hello, {name}" to the console using the value in the buffer.


.data 
h: .asciiz "Hello, "
.align 2
buffer: .space 64
.text
main:
###############################################
# Your code here:

li $v0, 8
la $a0, buffer

move $t0, $a0
syscall

la $a0, h
li $v0, 4
syscall

la $a0 , buffer
move $a0, $t0
li $v0 , 4
syscall

###############################################

# Exit the Program
li $v0, 10
syscall

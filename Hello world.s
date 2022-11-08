.data

###############################################
# Define string here:

Hello: .asciiz "Hello World\n"
###############################################

.text 
main:
###############################################
# Your code here:
li $v0, 4
la $a0, Hello
syscall

###############################################

# Exit the Program
li $v0, 10
syscall

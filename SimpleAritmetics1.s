# Perform: 5 + 11 and print the result to the console.

.text
main:
###############################################
# Your code here:
la $t0, 5
la $t1, 11

add $a0, $t0, $t1

li $v0, 1
move $a0, $t2
syscall

###############################################

# Exit the Program
li $v0, 10
syscall
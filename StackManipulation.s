# Pop the current integer at the top of the stack and print it.
#Push the following items to the stack:
# {user input}
# {user input} * 5
# {user input} * 10

.text
main:
# Push int to top of stack
subu $sp, $sp, 4
li $t0, 4206
sw $t0 ($sp)

# Get int value from user
li $v0, 5
syscall
move $s0, $v0	# $s0 = user input

###############################################
# $s0 contains {user input}
# Your code here:

mul $s1 , $s0, 5
mul $s2 , $s0, 10

#pop from top of stack
lw $a0, ($sp)
addu $sp, $sp, 4
li $v0, 1
syscall
#push numbers to stack


subu $sp, $sp, 12
sw $s2 ($sp)
sw $s1 4($sp)
sw $s0 8($sp)
###############################################

# Pop values from stack
lw $s0, ($sp)
lw $s1, 4($sp)
lw $s2, 8($sp)
addu $sp, $sp, 12

# Add the values
add $t0, $s0, $s1
add $t0, $t0, $s2

# Print the sum
li $v0, 11
li $a0, 10
syscall
li $v0, 1
move $a0, $t0
syscall

# Exit the Program
li $v0, 10
syscall
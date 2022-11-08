# Accept user input to perform: X * 10 - 2 and 
# print the result to the console.

# X = Positive integers

.text 
main:

###############################################
# Use syscall 5 to accept input from the test cases
# Your code here:

li $v0 , 5
syscall

move $t0, $v0
li $v0 , 1
mul	$t1, $t0, 10
add	$a0, $t1, -2
syscall

###############################################

# Exit the Program
li $v0, 10
syscall

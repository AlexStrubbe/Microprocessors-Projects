################################################################
# Push all the items in the array to the stack:
# Take a user input (int value) and pop those many items from the stack and print each value, separated with a comma and space 
# For example: if the user enters the number 5, you would print:
# 1, 3, 5, 7, 9
# (note that there is no comma after the last number)
# If the user inputs a number greater than the length of the array (30), only print the numbers contained in the array, no additional numbers
# If the user inputs a negative number, print the error string and exit
################################################################

.data
array: .word 13, 22, 15, 71, 29, 1, 3, 35, 57, 13
.word 21, 23, 25, 27, 29, 31, 33, 35, 37, 39
.word 19, 17, 15, 13, 11, 9, 7, 5, 3, 1
length: .word 30
error .asciiz "\nWrong input. Good bye\n"

.text
main:
################################################################
# Your code here

#Read User input

li $v0, 5
syscall

# move the input to $s0, this will be our counter
move $v0, $s0
sub $s0, $s0, 1

# for push/pop loop counter
li $t0, 0

# loading the array and its lenght to counter
la $t1, array
lw $t2, length
sub $t2, t2, 1

# for the cases
bltz $s0, negative	 
beqz $s0, zero	

pushLoop:
    lw $t3, ($t1)

    subu $sp, $sp, 4
    sw $t4, ($sp)

    add $t0, $t0, 1 # counter ++
    add $t1, $t1,4

    blt $t0, $t2, pushLoop

# reset counter
la $t1, array
li $t0, 0

popLoop:
    lw $t3, ($t1)
    addu $sp, $sp, 4

    # Check if the counter is < input || reached max index

    beq $t0, $t2, done
    beq $t0, $s0, done

    #print top number
    move $a0, $t1
    li $v0, 1
    syscall

    #print comma
    li $a0, comma
    li $v0, 1
    syscall

    #print space
    li $a0, space
    li $v0, 1
    syscall

    add $t0, $t0, 1 # counter ++
    add $t1, $t1,4

    beqz $t0, popLoop

done:
    move $a0, 
    li $v0, 1
    syscall
    j exit

#zero input
zero:
    li $a0, 0
    li $v0, 1
    syscall
    j exit

#negative input
negative:
    la $a0, error
    li $v0, 4
    j exit

# Exit the Program
exit: 
    li $v0, 10
    syscall


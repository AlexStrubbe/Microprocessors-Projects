# Access every value in the given array and add (value * multiplier) to the "sum" variable.

.data
array: .word 10, 25, 1, 4206, 5, 100, 20, 2
sum: .word 0
.text 
main:

# Read integer value
li $v0, 5
syscall
move $s0, $v0	# $s0 = Multiplier

###############################################
# Your code here:

# for loop counter
li      $t0, 0

# loading the array and its lenght to counter
la      $t1, array
li      $t2, 8
la      $t4, sum

loop:

    
    lw      $t5, ($t4)
    lw      $t6, ($t1)
    mul     $t7, $t6, $s0
    add    $t5, $t5, $t7
    
    sw      $t5, ($t4)
    add     $t1, $t1, 4
    # sll     $t3, $t6, 2 # basically to shift to the next value of the array

    add    $t0, $t0, 1
    bgt     $t2, $t0, loop
###############################################

# Print sum
li $v0, 1
lw $a0, sum
syscall

exit:
    # Exit the Program
    li $v0, 10
    syscall

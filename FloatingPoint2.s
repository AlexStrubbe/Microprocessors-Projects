.data
pi: .double 3.14	# Pi
r:  .double 0.00	# Radius

.text
main:
# Input R
li $v0, 7
syscall
sdc1 $f0, r

###############################################
# Your code here:

l.d $f10, pi

la $t0, 4
la $t1, 3

mtc1 $t0, $f2 
mtc1 $t1, $f4

cvt.d.w $f2, $f2
cvt.d.w $f4, $f4

mul.d $f14, $f0 ,$f0     # r^2
mul.d $f0, $f0 ,$f14     # r^3

div.d $f6, $f2, $f4

mul.d $f8, $f10, $f6
mul.d $f12, $f8, $f0

li $v0, 3
syscall

###############################################

# Exit the program
li $v0, 10
syscall
# Perfom (X + Y) * 6 / (10 * Z - 1), where X, Y, and Z 
# are floating point numbers


.data
x: .float 1.50
y: .float 9.99
z: .float 0.00

.text
main:
# Input Z
li $v0, 6
syscall
swc1 $f0, z

###############################################
# Your code here:
l.s $f1, x
l.s $f2, y

la $t1, 6
la $t2, 10
la $t3, 1

mtc1 $t1, $f8 
mtc1 $t2, $f9
mtc1 $t3, $f10

cvt.s.w $f8, $f8
cvt.s.w $f9, $f9
cvt.s.w $f10, $f10

add.s $f3, $f1, $f2 
mul.s $f4, $f3, $f8     #First segment

mul.s $f5, $f0, $f9
sub.s $f6, $f5, $f10    #Second segment

div.s $f7, $f4, $f6    #Final division

mov.s $f12 , $f7
li $v0, 2
syscall

###############################################

# Exit the program
li $v0, 10
syscall


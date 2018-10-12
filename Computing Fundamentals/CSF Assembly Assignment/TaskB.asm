#CSF Assignment Task B
#17098640,Irfan Hanafi

.text
#Input ID
la $a0, IDInput #Input Prompt
li $v0, 4
syscall

li $v0, 5
syscall

la $t1, ($v0) #Stores Input in $t1

#Initialize Counter
li $t0, 10

#Intialize 2
li $t2, 2

#Divide By 2
div $s0, $t1,$t2

loop:
#Output
la $a0, NewLine #New Line
li $v0, 4
syscall

#output division
la $a0, ($s0)
li $v0, 1
syscall

#Count Up  
addi $t0, $t0, -1

bgtz $t0, loop

#Exit
li $v0, 10 
syscall

.data
IDInput: .asciiz "Enter the last two digits of your Student ID: "
NewLine: .asciiz "\n"

#CSF Assignment Task A
#17098640,Irfan Hanafi

.text
#Initialize Name
li $a1, 33 #Input Limit

#Input name
la $a0, NameInput #Input Prompt
li $v0, 4
syscall

li $v0, 8
syscall

la $t0, ($a0) #Stores Name into $t0

#Iniialize ID
li $a1, 9 #Input Limit

#Input ID
la $a0, IDInput #Input Prompt
li $v0, 4
syscall

li $v0, 8
syscall

la $t1, ($a0) #Stores ID into $t1

#Output
la $a0, NewLine #New Line
li $v0, 4
syscall

la $a0, ($t0) #Output Name
li $v0, 4
syscall

la $a0, ($t1) #Output ID
li $v0, 4
syscall

#Exit
li $v0, 10
syscall

.data
NameInput: .asciiz "Enter Your Name: "
IDInput: .asciiz "Enter Your Student ID: "
NewLine: .asciiz "\n"

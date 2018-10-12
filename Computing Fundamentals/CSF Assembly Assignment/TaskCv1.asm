#17098640, Irfan Hanafi
#Task C CSF Assignment

.text
#Input any 3 digit number
la $a0, InputPrompt #Input Prompt
li $v0, 4
syscall

la $v0, 5
syscall

la $t1, ($v0) #stores input into $t1

#Time
li $v0, 30 #Start Time
syscall
#Loads the Start Time into $t2 and $t3
la $t2, ($a0) 

Counter:
li $t0, 5 #Makes Input Result into Counter
li $t6, 5
la $t7, ($t1)

Loop1:
blez $t0, EndLoop1 #Branch if <= 0
	Loop2:
	blez $t6, EndLoop2
		Loop3:
		blez $t7, EndLoop3
		
		#Calculation
		add $s0, $t1, $t1
		
		#Count
		subi $t7, $t7, 1
		
		j Loop3
		EndLoop3:
	
	la $t7 ($t1)
	
	#Calculation
	add $s0, $t1, $t1

	#Count
	subi $t6, $t6, 1
	
	j Loop2
	EndLoop2:

la $t6, ($t1)
#Calculation
add $s0, $t1, $t1

#Count
subi $t0, $t0, 1

j Loop1
EndLoop1:

#Time
li $v0, 30 #End Time
syscall
#Loads the End Time into $s3 and $s4
la $t4, ($a0) 

#Program Time
sub $s2, $t4, $t2

li $s4, 1000
div $s3, $s2, $s4

#Test Output
la $a0, NewLine #New Line
li $v0, 4
syscall

la $a0, ($s0) #Calculation
li $v0, 1
syscall

la $a0, NewLine #New Line
li $v0, 4
syscall

la $a0, ($s3) #Time
li $v0, 1
syscall

la $a0, Seconds
la $v0, 4
syscall

#Exit
li $v0, 10 
syscall

.data
Seconds: .asciiz "seconds"
InputPrompt: .asciiz "Enter a Three Digit Number: " 
NewLine: .asciiz "\n"
Colon: .asciiz ":"

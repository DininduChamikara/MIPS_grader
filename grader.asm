#program file: grader.asm
#author: Dinindu Chamikara
#purpose: Gives a grade according to the marks
	.data
prompt1:.asciiz "Enter the marks: "	
prompt2:.asciiz "Your grade is "
grade: .byte grade 'D'			#allocate memmory for variable grade
num:	.word 0				#allocate memmory for variable num and initialize with 0
	.text 
	#show prompt1
	li $v0, 4			# load immediate 4 (service 4: print string) to register 2
	la $a0, prompt1			# load address of prompt1 to register 4
	syscall 			# issue a system call to print prompt1
	
	#read the marks
	li $v0, 5			# load immediate 5 (service 5: read integer) to register 2
	syscall 			# issue a system call to read integer
	sw $v0, num			# store value in register 2 at address labelled by num
	
	#store input taken from user into any register
	move  $t0, $v0
	
	#condition if(marks>=50)
	bgeu $t0, 50, printC		# if value of register 8 is equal or greater than 50, branch to label printC
	li $a0, 'D'			# load immediate character D to register 4
	j endx				# jump (unconditional branch) to label endx
	
printC: bgeu $t0, 60, printB		# if value of register 8 is equal or greater than 60, branch to label printB
	li $a0, 'C'			# load immediate character C to register 4
	j endx				# jump (unconditional branch) to label endx
	
printB: bgeu $t0, 70, printA		# if value of register 8 is equal or greater than 70, branch to label printA
	li $a0, 'B'			# load immediate character B to register 4
	j endx				# jump (unconditional branch) to label endx
	
printA: li $a0, 'A'			# load immediate character A to register 4

	#store value in register 4 to register 8
endx:	move $t0, $a0

	#show prompt2
	li $v0, 4			# load immediate 4 (service 4: print string) to register 2
	la $a0, prompt2			# load address of prompt2 to register 4
	syscall				# issue a system call to print prompt2

	#store input taken from user into any register
	move  $a0, $t0
	
	# print result
	li $v0, 11			# load immediate 11 (service 11: print byte) to register 2
	syscall 			# issue a system call to print byte
	
	# program end
	li $v0, 10			# load immediate 10 (service 10: terminate program) to register 2
	syscall				# issue a system call to terminate program
	
	

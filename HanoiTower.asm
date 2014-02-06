	.data
	.align 4
nDisks:  	.asciiz "\nNumber of Disks: "
moveD:		.asciiz "Move disk: "
from:		.asciiz " from peg: "
to:			.asciiz " to peg: "
newLine: 		.asciiz ".\n"
Done: 		.asciiz "\nDone.\n "
    .text
    .globl main

main:								
	li 		$2,4;					      # INPUT and INIZIALIZATINO
	la 		$4,nDischi;				  # 
	syscall;						      # 
	li 		$2,5;					      # 
	syscall;						      #
	add 	$a0, $zero, $v0;		#
	addi 	$a1, $zero, 1;			# 
	addi 	$a2, $zero, 2;			# 
	addi 	$a3, $zero, 3;			#
	
	jal 	hanoi;					    #  PROCEDURE CALL
									

Exit:								
	li 		$2, 4;       			  # ISTRUCTION TO EXIT
	la 		$a0, Done;    			# 
	syscall;						      # 
	li 		$2,10;					    # 
	syscall;                		######################################
	
hanoi:											
	addi	$sp,$sp,-20;			# PROCEDURE - SAVING  CALL INFO
	sw		$ra,0($sp);				# 
	sw		$a0,4($sp);				# 
	sw		$a1,8($sp);				#
	sw		$a2,12($sp);			# 
	sw		$a3,16($sp);			######################################

									
	beq		$a0, $zero, casoVero;	# COND
									
									
	addi	$a0,$a0,-1;				  # CASE FALSE
	add		$t2, $zero, $a2;		# 
	add		$a2, $zero, $a3;		# decrease and switch
	add		$a3, $zero, $t2;		#
									
	jal		hanoi;					    # FIRST RECURSION
									
	li 		$v0, 4;       			# PRINT INSTRUCTION
	la 		$a0, nDisks;    		#		
	syscall;						      #
	li 		$v0,1;              #         
	lw 		$a0, 4($sp);			  #         
	syscall;						      #
	li 		$v0, 4;       			#
	la 		$a0, from;    			#
	syscall;						      #
	li 		$v0, 1;       			#	
	lw 		$a0, 8($sp);			  #
	syscall;						      #
	li 		$v0, 4;       			#	
	la 		$a0, to;    			  #	
	syscall;						      #
	li 		$v0, 1;       			#	
	lw 		$a0, 12($sp);			  #
	syscall;						      #
	li 		$v0, 4;       			#	
	la 		$a0, newLine;    		#	
	syscall;						      #
								
	
	lw 		$a1, 16($sp);			# inizialization second call
	lw 		$a2, 12($sp);			# 
	lw 		$a3, 8($sp);			#
	lw 		$a0, 4($sp);			#
	addi	$a0,$a0,-1;				#
					
	jal 	hanoi;					  # SECOND RECURSION
									
	
casoVero:		
	lw		$ra,0($sp);				#	CASE TRUE			
	addi	$sp,$sp,20;				#
	jr 		$ra;					#################################

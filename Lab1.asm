# Made by Nazeer Ahmad.
.data
    prompt_1: .asciiz "Enter f: "
    prompt_2: .asciiz "Enter g:"
    result:   .asciiz " Result for f = g - (f + 5):"
    #Assume $t0 is g and $s1 is f
    
        
.text 
   main: 
   
   li $t5, 0 # set counter to 0
   
   
   loop:
   
    bge $t5, 3, Exit_loop # exit loop if greater or equal to 3
    addi $t5, $t5, 1 # increment counter
    
    jal Take_f # Prints the message and reads f function
    jal Take_g # Prints the message and reads g function
    jal Get_Function # Gets the computation
    jal Display_Result # Prints the function Display_Result
    
    j  loop
    
    Exit_loop:
    li $v0,10 # Lets the system know the process is concluded
    syscall # Executes command
   
   
   Take_f:
    li $v0, 4 # Code to print string
    la $a0, prompt_1 # Prints the text to ask user for f
    syscall # Does the command
    
    li $v0, 5 # Getting an Integer from user
    syscall # Does the above
    move $s1, $v0 # save f integer to $s1
   
    jr $ra # Jump back to the main function
    
    Take_g:
    li $v0, 4 # Printing the Prompt 2 for user to input g
    la $a0, prompt_2 # Prints prompt 2
    syscall # Executes the commands
    
    li $v0, 5 # Getting user input
    syscall # executes above command
    move $t0, $v0 # save g value in $t0
    
    jr $ra # Jump back to the main function
    
   Get_Function:
    addi $t1, $s1, 5 # First compute f + 5 and stores in a tmp1
    sub $t2, $t0, $t1 # then we compute g(t0) - t1 from the line above
    jr $ra   
   Display_Result:
    li $v0, 4 # Code 4 to print string
    la $a0, result # address of the string to print
    syscall # Does the command
    li $v0, 1 # prints intger
    move $a0, $t2 # move result to argument register
    syscall # Does the command above
   
    jr $ra # Jump back to the main function

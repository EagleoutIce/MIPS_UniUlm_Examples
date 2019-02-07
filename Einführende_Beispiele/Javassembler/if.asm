.text
main:
  li $t0, 42    #  a
  li $t1, 21    #  b
    
  beq $t0, $t1, if  # a==b
  j else
    
if: 
  ## true 
  j weiter
  
else:
  ## false
  j weiter
  
weiter:
  ## weiter
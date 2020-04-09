section .data
  message: db "Enter a two digit number : "
  message_length: equ $-message


section .bss
  digit1: resb  1
  digit2: resb  1
  digit3: resb  1
  digit4: resb  1
  num:    resb 1
  num1:   resb 1
  num2:   resb 1
  sum:   resw 1

section .text
  global _start

_start:

  mov eax, 4
  mov ebx, 1
  mov ecx, message
  mov edx, message_length
  int 80h
  
  ;Reding first digit
  mov eax, 3
  mov ebx, 0
  mov ecx, digit1
  mov edx, 1
  int 80h

  ;Reading second digit
  mov eax, 3
  mov ebx, 0
  mov ecx, digit2
  mov edx, 2
  int 80h

  sub byte[digit1], 30h
  sub byte[digit2], 30h

  movzx ax, byte[digit1]
  mov bl, 10
  mul bl
  movzx bx, byte[digit2]
  add ax, bx
  mov byte[num], al ;We are sure that no less than 256...
  
  mov word[sum], 0
  movzx ecx, byte[num]

;Loop for adding ecx to num
adding:
  add word[sum], cx ; Assuming maxium vale in ecx will use only 16 bits
Loop adding

  mov ax, word[sum]
  mov bl, 100
  div bl
  mov byte[num1], al
  mov byte[num2], ah


  movzx ax, byte[num1]
  mov bl, 10
  div bl
  mov byte[digit4], al
  mov byte[digit3], ah

  movzx ax, byte[num2]
  mov bl, 10
  div bl
  mov byte[digit2], al
  mov byte[digit1], ah


  add byte[digit1], 30h
  add byte[digit2], 30h
  add byte[digit3], 30h
  add byte[digit4], 30h


  mov eax, 4
  mov ebx, 1
  mov ecx, digit4
  mov edx, 1
  int 80h

  mov eax, 4
  mov ebx, 1
  mov ecx, digit3
  mov edx, 1
  int 80h

  mov eax, 4
  mov ebx, 1
  mov ecx, digit2
  mov edx, 1
  int 80h

  mov eax, 4
  mov ebx, 1
  mov ecx, digit1
  mov edx, 1
  int 80h  
  

  ;Exit code
  mov eax, 1
  mov ebx, 0
  int 80h 


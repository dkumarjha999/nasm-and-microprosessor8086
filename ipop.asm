section data
msg1:db ' Enter some string '
len1:equ  $-msg1

msg2:db ' You Entered '
len2:equ $-msg2

section .bss
input resb 256

section txt
global _start
_start:

mov eax,4
mov ebx,1
mov ecx,msg1
mov edx,len1
int 80h

mov eax,3
mov ebx,0
mov ecx,input
int 80h

mov eax,4
mov ebx,1
mov ecx,msg2
mov edx,len2
int 80h

mov eax,4
mov ebx,1
mov ecx,input
int 80h

mov eax,1
mov ebx,0
int 80h

section data
msg1:db ' Enter 1ST NUMBER '
len1:equ  $-msg1

msg2:db ' ENTER 2ND NUMBER '
len2:equ $-msg2

section .bss
N1 resb 50
N2 resb 50
N3 resb 50
N4 resb 50

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
mov ecx,N1
int 80h

mov eax,4
mov ebx,1
mov ecx,msg2
mov edx,len2
int 80h

mov eax,3
mov ebx,0
mov ecx,N2
int 80h


mov eax,N1
mov edx,N2
div edx

mov [N3],bx
;mov [N4],ah

mov eax,4
mov ebx,1
mov ecx,N2
int 80h


mov eax,1
mov ebx,0
int 80h

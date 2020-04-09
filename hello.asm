section data
hello:db ' Hello World '
len:equ $-hello

section txt
global _start
_start:

mov eax,4
mov ebx,1
mov ecx,hello
mov edx,len
int 80h

mov eax,1
mov ebx,0
int 80h

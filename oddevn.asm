section data
msg1:db' Enter a number '
len1:equ $-msg1

oddmsg:db' Is an odd number '
oddlen:equ $-oddmsg

evnmsg:db' Is an even number '
evnlen:equ $-evnmsg

section .bss
num resb  256

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
mov ecx,num
int 80h


mov ax,[eax+num-2]
and ax,1
jz evn

mov eax,4
mov ebx,1
mov ecx,oddmsg
mov edx,oddlen
int 80h
jmp exit

evn:
mov eax,4
mov ebx,1
mov ecx,evnmsg
mov edx,evnlen
int 80h
jmp exit

exit:
mov eax,1
mov ebx,0
int 80h









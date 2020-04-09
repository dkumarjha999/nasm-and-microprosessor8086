section .data
msg1:db' Enter a number '
len1:equ  $-msg1

msg:db' Factorial of number is     '
len2:equ  $-msg

section .bss
number resb 5
num resb 5
n resb 5

section .text
global _start
_start:

mov eax,4
mov ebx,1
mov ecx,msg1
mov edx,len1
int 80h

mov eax,3
mov ebx,1
mov ecx,number
mov edx,1
int 80h

sub word[number],30h
mov al,byte[number]
mov ah,0
mov  word[n],ax

call fact
mov word[num],cx

mov eax,4
mov ebx,1
mov ecx,msg
mov edx,len2
int 80h

mov eax,1
mov ebx,0
int 80h


fact:
mov ax,word[n]
cmp ax,1
je terminate
push word[n]
dec word[n]
call fact

pop word[n]
mov dx,word[n]
mov ax,cx
mul dx
mov cx,ax
jmp exit

terminate:
mov cx,1

exit:
ret


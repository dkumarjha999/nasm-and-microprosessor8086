section data
msg1:db' Enter a number '
len1:equ  $-msg1

vac:db'   '
len3:equ $-vac

factmsg:db' Factorial of number is     '
len2:equ  $-factmsg

section .bss
number resb 5
temp resb 5
num resb 5
n resb 5
nod resb 5

section txt
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
mov byte[nod],0

mov eax,4
mov ebx,1
mov ecx,factmsg
mov edx,len2
int 80h

extractnum:
cmp word[num],0
je printnum
inc byte[nod]
mov dx,0
mov ax,word[num]
mov bx,10
div bx
push dx
mov word[num],ax
jmp extractnum

printnum:
cmp byte[nod],0
je space
dec byte[nod]
pop dx
mov byte[temp],dl
add byte[temp],30h

mov eax,4
mov ebx,1
mov ecx,temp
mov edx,1
int 80h
jmp printnum

space:
mov eax,4
mov ebx,1
mov ecx,vac
mov edx,len3
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






  

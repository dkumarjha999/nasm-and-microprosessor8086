section .data
	msg1 db " enter the string  : "
	len1 equ $-msg1
	msg2 db " number of words = : "
	len2 equ $-msg2

section .bss
	string resb 50
	temp resb 1
	len resb 1
	i resb 1
	
section .text
global _start
_start:
	
	mov eax,4
	mov ebx,1
	mov ecx,msg1
	mov edx,len1
	int 80h
        
        mov byte[i],0
	mov ebx,string
	mov byte[len],0
 read:
	 push ebx
	 mov eax,3
	 mov ebx,0
	 mov ecx,temp
	 mov edx,1
	 int 80h
	 
	 pop ebx
	 mov al,byte[temp]
	 mov byte[ebx],al
	 inc byte[len]
	 inc ebx
	 cmp byte[temp],32
	 jne skip
	 inc byte[i]
	 
skip:
	cmp byte[temp],10
	jne read

	mov eax,4
	mov ebx,1
	mov ecx,msg2
	mov edx,len2
	int 80h

	add byte[i],49

	mov eax,4
	mov ebx,1
	mov ecx,1
	mov edx,1
	int 80h

mov eax,1
mov ebx,0
int 80h

	 
	 
 
 

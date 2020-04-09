section .data
	msg1 db " enter the number  : "
	len1 equ $-msg1
	msg2 db " number is even  "
	len2 equ $-msg2
	msg3 db " number is odd  "
	len3 equ $-msg2

section .bss
	num resb 1
	
section .text
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
	
	mov ax,[num+eax-2]
	and ax,1
        jz evn
        
       	mov eax,4
	mov ebx,1
	mov ecx,num
        int 80h
        
       	mov eax,4
	mov ebx,1
	mov ecx,msg3
	mov edx,len3
	int 80h
	jmp exit
        
     evn:
       	mov eax,4
	mov ebx,1
	mov ecx,num
        int 80h
        
       	mov eax,4
	mov ebx,1
	mov ecx,msg2
	mov edx,len2
	int 80h
	jmp exit
        
     exit:
        mov eax,1
        mov ebx,0
        int 80h   
       

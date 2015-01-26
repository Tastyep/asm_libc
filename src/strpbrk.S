[BITS 64]
	global strpbrk:function
	section .text

strpbrk:
	push rbp
	mov rbp, rsp

	jmp floop
	ret

floop:
	mov al, byte[rdi]
	cmp al, 0
	je end

	mov rcx, 0
	jmp sloop

sloop:
	mov ah, byte[rsi + rcx]
	cmp ah, 0
	je incfirst
	cmp al, ah
	je success
	inc rcx
	jmp sloop

incfirst:
	inc rdi
	jmp floop

success:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret

end:
	mov rax, 0
	mov rsp, rbp
	pop rbp
	ret

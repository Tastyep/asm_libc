[BITS 64]
	global memcpy:function
	section .text

memcpy:
	push rbp
	mov rbp, rsp

	mov rcx, 0
	jmp mloop

	ret

mloop:
	cmp rcx, rdx
	je success
	mov al, byte[rsi + rcx]
	mov [rdi + rcx], al
	inc rcx
	jmp mloop

success:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret

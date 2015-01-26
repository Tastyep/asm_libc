[BITS 64]
	global strcspn:function
	section .text

strcspn:
	push rbp
	mov rbp, rsp

	mov r10, rdi
	jmp floop

	ret

floop:
	mov al, byte[rdi]
	cmp al, 0
	je success

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
	sub rdi, r10
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret

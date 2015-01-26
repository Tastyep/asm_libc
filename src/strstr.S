[BITS 64]
	global strstr:function
	section .text

strstr:
	push rbp
	mov rbp, rsp

	jmp floop
	ret

floop:
	mov al, byte[rdi]
	cmp al, 0
	je fail
	mov rdx, 0
	mov rcx, 0
	jmp sloop

sloop:
	mov ah, byte[rsi + rcx]
	cmp ah, 0
	je success
	cmp ah, al
	jne inc_first
	inc rdx
	mov al, byte[rdi + rdx]
	inc rcx
	jmp sloop

inc_first:
	inc rdi
	jmp floop

fail:
	mov rax, 0
	mov rsp, rbp
	pop rbp
	ret

success:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret

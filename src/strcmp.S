[BITS 64]
	global strcmp:function
	section .text

strcmp:
	push rbp
	mov rbp, rsp
	mov rcx, 0

	jmp mloop
	ret

mloop:
	mov al, byte[rdi + rcx]
	mov ah, byte[rsi + rcx]
	cmp al, 0
	je cmp_ah
	cmp al, ah
	jne fail
	inc rcx
	jmp mloop

cmp_ah:
	cmp ah, 0
	je success
	jmp fail

success:
	mov rax, 0
	mov rsp, rbp
	pop rbp
	ret

fail:
	sub al, ah
	movsx rax, al
	mov rsp, rbp
	pop rbp
	ret

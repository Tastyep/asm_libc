[BITS 64]
	global strlen:function
	section .text

strlen:
	push rbp
	mov rbp, rsp
	mov rcx, 0

	jmp mloop
	ret

mloop:
	cmp byte[rdi + rcx], 0
	je end
	inc rcx
	jmp mloop

end:
	mov rax, rcx
	mov rsp, rbp
	pop rbp
	ret

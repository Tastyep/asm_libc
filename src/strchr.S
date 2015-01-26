[BITS 64]
	global strchr:function
	section .text

strchr:
	push rbp
	mov rbp, rsp
	mov rcx, 0

	jmp mloop

	ret

mloop:
	cmp byte[rdi], SIL
	je success
	cmp byte[rdi], 0
	je end
	inc rdi

	jmp mloop

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

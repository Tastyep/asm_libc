[BITS 64]
	global memset:function
	section .text

memset:
	push rbp
	mov rbp, rsp
	mov rcx, 0

	jmp mloop
	ret

mloop:
	cmp rcx, rdx
	je end
	mov [rdi + rcx], SIL
	inc rcx
	jmp mloop

end:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret

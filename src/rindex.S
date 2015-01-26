[BITS 64]
	global rindex:function
	section .text

rindex:
	push rbp
	mov rbp, rsp
	mov rcx, 0

	jmp mloop

	ret

mloop:
	cmp byte[rdi + rcx], 0
	je find_reverse
	inc rcx
	jmp mloop

find_reverse:
	cmp rcx, 0
	jl fail
	cmp byte[rdi + rcx], sil
	je success
	dec rcx
	jmp find_reverse

fail:
	mov rax, 0
	mov rsp, rbp
	pop rbp
	ret

success:
	mov rax, rdi
	add rax, rcx
	mov rsp, rbp
	pop rbp
	ret

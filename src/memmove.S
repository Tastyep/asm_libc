[BITS 64]
	global memmove:function
	section .text

memmove:
	push rbp
	mov rbp, rsp
	mov rcx, 0

	cmp rdi, rsi
	je success
	jb forward_cpy
	jg back

forward_cpy:
	cmp rcx, rdx
	je success
	mov al, [rsi + rcx]
	mov [rdi + rcx], al
	inc rcx
	jmp forward_cpy

back:
	dec rdx
	jmp back_cpy

back_cpy:
	cmp rdx, 0
	jl success
	mov al, [rsi + rdx]
	mov [rdi + rdx], al
	dec rdx
	jmp back_cpy

success:
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret

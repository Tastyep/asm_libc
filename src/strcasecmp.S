[BITS 64]
	global strcasecmp:function
	section .text

strcasecmp:
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
	jmp fcheck

cmp_ah:
	cmp ah, 0
	je success
	jmp fcheck

check_both:
	cmp al, ah
	jne fail
	inc rcx
	jmp mloop

fcheck:
	cmp al, 64
	ja al_down
	jmp scheck
scheck:
	cmp ah, 64
	ja ah_down
	jmp check_both

al_down:
	cmp al, 91
	jl al_change
	jmp scheck
al_change:
	add al, 32
	jmp scheck
ah_down:
	cmp ah, 91
	jl ah_change
	jmp check_both
ah_change:
	add ah, 32
	jmp check_both

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

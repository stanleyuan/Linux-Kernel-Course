
./zero_width_bit_field_O_2:     file format elf64-x86-64


Disassembly of section .init:

0000000000400448 <_init>:
  400448:	48 83 ec 08          	sub    rsp,0x8
  40044c:	48 8b 05 a5 0b 20 00 	mov    rax,QWORD PTR [rip+0x200ba5]        # 600ff8 <_DYNAMIC+0x1d0>
  400453:	48 85 c0             	test   rax,rax
  400456:	74 05                	je     40045d <_init+0x15>
  400458:	e8 53 00 00 00       	call   4004b0 <__printf_chk@plt+0x10>
  40045d:	48 83 c4 08          	add    rsp,0x8
  400461:	c3                   	ret    

Disassembly of section .plt:

0000000000400470 <__stack_chk_fail@plt-0x10>:
  400470:	ff 35 92 0b 20 00    	push   QWORD PTR [rip+0x200b92]        # 601008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400476:	ff 25 94 0b 20 00    	jmp    QWORD PTR [rip+0x200b94]        # 601010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40047c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000400480 <__stack_chk_fail@plt>:
  400480:	ff 25 92 0b 20 00    	jmp    QWORD PTR [rip+0x200b92]        # 601018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400486:	68 00 00 00 00       	push   0x0
  40048b:	e9 e0 ff ff ff       	jmp    400470 <_init+0x28>

0000000000400490 <__libc_start_main@plt>:
  400490:	ff 25 8a 0b 20 00    	jmp    QWORD PTR [rip+0x200b8a]        # 601020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400496:	68 01 00 00 00       	push   0x1
  40049b:	e9 d0 ff ff ff       	jmp    400470 <_init+0x28>

00000000004004a0 <__printf_chk@plt>:
  4004a0:	ff 25 82 0b 20 00    	jmp    QWORD PTR [rip+0x200b82]        # 601028 <_GLOBAL_OFFSET_TABLE_+0x28>
  4004a6:	68 02 00 00 00       	push   0x2
  4004ab:	e9 c0 ff ff ff       	jmp    400470 <_init+0x28>

Disassembly of section .plt.got:

00000000004004b0 <.plt.got>:
  4004b0:	ff 25 42 0b 20 00    	jmp    QWORD PTR [rip+0x200b42]        # 600ff8 <_DYNAMIC+0x1d0>
  4004b6:	66 90                	xchg   ax,ax

Disassembly of section .text:

00000000004004c0 <main>:
  4004c0:	48 83 ec 18          	sub    rsp,0x18
  4004c4:	b9 ff ff ff ff       	mov    ecx,0xffffffff
  4004c9:	be 94 06 40 00       	mov    esi,0x400694
  4004ce:	bf 01 00 00 00       	mov    edi,0x1
  4004d3:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  4004da:	00 00 
  4004dc:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
  4004e1:	31 c0                	xor    eax,eax
  4004e3:	89 ca                	mov    edx,ecx
  4004e5:	c7 44 24 04 ff ff 00 	mov    DWORD PTR [rsp+0x4],0xffff
  4004ec:	00 
  4004ed:	44 0f b6 44 24 08    	movzx  r8d,BYTE PTR [rsp+0x8]
  4004f3:	47 8d 0c 00          	lea    r9d,[r8+r8*1]
  4004f7:	41 c1 e0 04          	shl    r8d,0x4
  4004fb:	41 c0 f9 05          	sar    r9b,0x5
  4004ff:	41 c0 f8 04          	sar    r8b,0x4
  400503:	45 0f be c9          	movsx  r9d,r9b
  400507:	45 0f be c0          	movsx  r8d,r8b
  40050b:	e8 90 ff ff ff       	call   4004a0 <__printf_chk@plt>
  400510:	48 8b 74 24 08       	mov    rsi,QWORD PTR [rsp+0x8]
  400515:	64 48 33 34 25 28 00 	xor    rsi,QWORD PTR fs:0x28
  40051c:	00 00 
  40051e:	75 07                	jne    400527 <main+0x67>
  400520:	31 c0                	xor    eax,eax
  400522:	48 83 c4 18          	add    rsp,0x18
  400526:	c3                   	ret    
  400527:	e8 54 ff ff ff       	call   400480 <__stack_chk_fail@plt>
  40052c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000400530 <_start>:
  400530:	31 ed                	xor    ebp,ebp
  400532:	49 89 d1             	mov    r9,rdx
  400535:	5e                   	pop    rsi
  400536:	48 89 e2             	mov    rdx,rsp
  400539:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
  40053d:	50                   	push   rax
  40053e:	54                   	push   rsp
  40053f:	49 c7 c0 80 06 40 00 	mov    r8,0x400680
  400546:	48 c7 c1 10 06 40 00 	mov    rcx,0x400610
  40054d:	48 c7 c7 c0 04 40 00 	mov    rdi,0x4004c0
  400554:	e8 37 ff ff ff       	call   400490 <__libc_start_main@plt>
  400559:	f4                   	hlt    
  40055a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000400560 <deregister_tm_clones>:
  400560:	b8 40 10 60 00       	mov    eax,0x601040
  400565:	48 3d 40 10 60 00    	cmp    rax,0x601040
  40056b:	74 13                	je     400580 <deregister_tm_clones+0x20>
  40056d:	b8 00 00 00 00       	mov    eax,0x0
  400572:	48 85 c0             	test   rax,rax
  400575:	74 09                	je     400580 <deregister_tm_clones+0x20>
  400577:	bf 40 10 60 00       	mov    edi,0x601040
  40057c:	ff e0                	jmp    rax
  40057e:	66 90                	xchg   ax,ax
  400580:	c3                   	ret    
  400581:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  400586:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40058d:	00 00 00 

0000000000400590 <register_tm_clones>:
  400590:	be 40 10 60 00       	mov    esi,0x601040
  400595:	48 81 ee 40 10 60 00 	sub    rsi,0x601040
  40059c:	48 c1 fe 03          	sar    rsi,0x3
  4005a0:	48 89 f0             	mov    rax,rsi
  4005a3:	48 c1 e8 3f          	shr    rax,0x3f
  4005a7:	48 01 c6             	add    rsi,rax
  4005aa:	48 d1 fe             	sar    rsi,1
  4005ad:	74 11                	je     4005c0 <register_tm_clones+0x30>
  4005af:	b8 00 00 00 00       	mov    eax,0x0
  4005b4:	48 85 c0             	test   rax,rax
  4005b7:	74 07                	je     4005c0 <register_tm_clones+0x30>
  4005b9:	bf 40 10 60 00       	mov    edi,0x601040
  4005be:	ff e0                	jmp    rax
  4005c0:	c3                   	ret    
  4005c1:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4005c6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  4005cd:	00 00 00 

00000000004005d0 <__do_global_dtors_aux>:
  4005d0:	80 3d 69 0a 20 00 00 	cmp    BYTE PTR [rip+0x200a69],0x0        # 601040 <__TMC_END__>
  4005d7:	75 17                	jne    4005f0 <__do_global_dtors_aux+0x20>
  4005d9:	55                   	push   rbp
  4005da:	48 89 e5             	mov    rbp,rsp
  4005dd:	e8 7e ff ff ff       	call   400560 <deregister_tm_clones>
  4005e2:	c6 05 57 0a 20 00 01 	mov    BYTE PTR [rip+0x200a57],0x1        # 601040 <__TMC_END__>
  4005e9:	5d                   	pop    rbp
  4005ea:	c3                   	ret    
  4005eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4005f0:	c3                   	ret    
  4005f1:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4005f6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  4005fd:	00 00 00 

0000000000400600 <frame_dummy>:
  400600:	eb 8e                	jmp    400590 <register_tm_clones>
  400602:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  400609:	00 00 00 
  40060c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000400610 <__libc_csu_init>:
  400610:	41 57                	push   r15
  400612:	41 56                	push   r14
  400614:	41 89 ff             	mov    r15d,edi
  400617:	41 55                	push   r13
  400619:	41 54                	push   r12
  40061b:	4c 8d 25 f6 07 20 00 	lea    r12,[rip+0x2007f6]        # 600e18 <__frame_dummy_init_array_entry>
  400622:	55                   	push   rbp
  400623:	48 8d 2d f6 07 20 00 	lea    rbp,[rip+0x2007f6]        # 600e20 <__init_array_end>
  40062a:	53                   	push   rbx
  40062b:	49 89 f6             	mov    r14,rsi
  40062e:	49 89 d5             	mov    r13,rdx
  400631:	4c 29 e5             	sub    rbp,r12
  400634:	48 83 ec 08          	sub    rsp,0x8
  400638:	48 c1 fd 03          	sar    rbp,0x3
  40063c:	e8 07 fe ff ff       	call   400448 <_init>
  400641:	48 85 ed             	test   rbp,rbp
  400644:	74 20                	je     400666 <__libc_csu_init+0x56>
  400646:	31 db                	xor    ebx,ebx
  400648:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40064f:	00 
  400650:	4c 89 ea             	mov    rdx,r13
  400653:	4c 89 f6             	mov    rsi,r14
  400656:	44 89 ff             	mov    edi,r15d
  400659:	41 ff 14 dc          	call   QWORD PTR [r12+rbx*8]
  40065d:	48 83 c3 01          	add    rbx,0x1
  400661:	48 39 eb             	cmp    rbx,rbp
  400664:	75 ea                	jne    400650 <__libc_csu_init+0x40>
  400666:	48 83 c4 08          	add    rsp,0x8
  40066a:	5b                   	pop    rbx
  40066b:	5d                   	pop    rbp
  40066c:	41 5c                	pop    r12
  40066e:	41 5d                	pop    r13
  400670:	41 5e                	pop    r14
  400672:	41 5f                	pop    r15
  400674:	c3                   	ret    
  400675:	90                   	nop
  400676:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40067d:	00 00 00 

0000000000400680 <__libc_csu_fini>:
  400680:	f3 c3                	repz ret 

Disassembly of section .fini:

0000000000400684 <_fini>:
  400684:	48 83 ec 08          	sub    rsp,0x8
  400688:	48 83 c4 08          	add    rsp,0x8
  40068c:	c3                   	ret    

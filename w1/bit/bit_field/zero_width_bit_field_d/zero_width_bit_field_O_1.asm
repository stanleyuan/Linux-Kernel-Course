
./zero_width_bit_field_O_1:     file format elf64-x86-64


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

00000000004004c0 <_start>:
  4004c0:	31 ed                	xor    ebp,ebp
  4004c2:	49 89 d1             	mov    r9,rdx
  4004c5:	5e                   	pop    rsi
  4004c6:	48 89 e2             	mov    rdx,rsp
  4004c9:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
  4004cd:	50                   	push   rax
  4004ce:	54                   	push   rsp
  4004cf:	49 c7 c0 80 06 40 00 	mov    r8,0x400680
  4004d6:	48 c7 c1 10 06 40 00 	mov    rcx,0x400610
  4004dd:	48 c7 c7 92 05 40 00 	mov    rdi,0x400592
  4004e4:	e8 a7 ff ff ff       	call   400490 <__libc_start_main@plt>
  4004e9:	f4                   	hlt    
  4004ea:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000004004f0 <deregister_tm_clones>:
  4004f0:	b8 40 10 60 00       	mov    eax,0x601040
  4004f5:	48 3d 40 10 60 00    	cmp    rax,0x601040
  4004fb:	74 13                	je     400510 <deregister_tm_clones+0x20>
  4004fd:	b8 00 00 00 00       	mov    eax,0x0
  400502:	48 85 c0             	test   rax,rax
  400505:	74 09                	je     400510 <deregister_tm_clones+0x20>
  400507:	bf 40 10 60 00       	mov    edi,0x601040
  40050c:	ff e0                	jmp    rax
  40050e:	66 90                	xchg   ax,ax
  400510:	c3                   	ret    
  400511:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  400516:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40051d:	00 00 00 

0000000000400520 <register_tm_clones>:
  400520:	be 40 10 60 00       	mov    esi,0x601040
  400525:	48 81 ee 40 10 60 00 	sub    rsi,0x601040
  40052c:	48 c1 fe 03          	sar    rsi,0x3
  400530:	48 89 f0             	mov    rax,rsi
  400533:	48 c1 e8 3f          	shr    rax,0x3f
  400537:	48 01 c6             	add    rsi,rax
  40053a:	48 d1 fe             	sar    rsi,1
  40053d:	74 11                	je     400550 <register_tm_clones+0x30>
  40053f:	b8 00 00 00 00       	mov    eax,0x0
  400544:	48 85 c0             	test   rax,rax
  400547:	74 07                	je     400550 <register_tm_clones+0x30>
  400549:	bf 40 10 60 00       	mov    edi,0x601040
  40054e:	ff e0                	jmp    rax
  400550:	c3                   	ret    
  400551:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  400556:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40055d:	00 00 00 

0000000000400560 <__do_global_dtors_aux>:
  400560:	80 3d d9 0a 20 00 00 	cmp    BYTE PTR [rip+0x200ad9],0x0        # 601040 <__TMC_END__>
  400567:	75 17                	jne    400580 <__do_global_dtors_aux+0x20>
  400569:	55                   	push   rbp
  40056a:	48 89 e5             	mov    rbp,rsp
  40056d:	e8 7e ff ff ff       	call   4004f0 <deregister_tm_clones>
  400572:	c6 05 c7 0a 20 00 01 	mov    BYTE PTR [rip+0x200ac7],0x1        # 601040 <__TMC_END__>
  400579:	5d                   	pop    rbp
  40057a:	c3                   	ret    
  40057b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  400580:	c3                   	ret    
  400581:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  400586:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40058d:	00 00 00 

0000000000400590 <frame_dummy>:
  400590:	eb 8e                	jmp    400520 <register_tm_clones>

0000000000400592 <main>:
  400592:	53                   	push   rbx
  400593:	48 83 ec 10          	sub    rsp,0x10
  400597:	bb 28 00 00 00       	mov    ebx,0x28
  40059c:	64 48 8b 03          	mov    rax,QWORD PTR fs:[rbx]
  4005a0:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
  4005a5:	31 c0                	xor    eax,eax
  4005a7:	c7 44 24 04 ff ff 00 	mov    DWORD PTR [rsp+0x4],0xffff
  4005ae:	00 
  4005af:	44 0f b6 44 24 08    	movzx  r8d,BYTE PTR [rsp+0x8]
  4005b5:	47 8d 0c 00          	lea    r9d,[r8+r8*1]
  4005b9:	41 c0 f9 05          	sar    r9b,0x5
  4005bd:	41 c1 e0 04          	shl    r8d,0x4
  4005c1:	41 c0 f8 04          	sar    r8b,0x4
  4005c5:	ba ff ff ff ff       	mov    edx,0xffffffff
  4005ca:	0f be ca             	movsx  ecx,dl
  4005cd:	89 ca                	mov    edx,ecx
  4005cf:	45 0f be c9          	movsx  r9d,r9b
  4005d3:	45 0f be c0          	movsx  r8d,r8b
  4005d7:	be 94 06 40 00       	mov    esi,0x400694
  4005dc:	bf 01 00 00 00       	mov    edi,0x1
  4005e1:	e8 ba fe ff ff       	call   4004a0 <__printf_chk@plt>
  4005e6:	48 8b 74 24 08       	mov    rsi,QWORD PTR [rsp+0x8]
  4005eb:	64 48 33 33          	xor    rsi,QWORD PTR fs:[rbx]
  4005ef:	75 0b                	jne    4005fc <main+0x6a>
  4005f1:	b8 00 00 00 00       	mov    eax,0x0
  4005f6:	48 83 c4 10          	add    rsp,0x10
  4005fa:	5b                   	pop    rbx
  4005fb:	c3                   	ret    
  4005fc:	e8 7f fe ff ff       	call   400480 <__stack_chk_fail@plt>
  400601:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  400608:	00 00 00 
  40060b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

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

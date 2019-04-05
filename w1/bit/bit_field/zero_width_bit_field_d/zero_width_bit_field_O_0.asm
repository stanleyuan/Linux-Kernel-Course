
./zero_width_bit_field_O_0:     file format elf64-x86-64


Disassembly of section .init:

0000000000400428 <_init>:
  400428:	48 83 ec 08          	sub    rsp,0x8
  40042c:	48 8b 05 c5 0b 20 00 	mov    rax,QWORD PTR [rip+0x200bc5]        # 600ff8 <_DYNAMIC+0x1d0>
  400433:	48 85 c0             	test   rax,rax
  400436:	74 05                	je     40043d <_init+0x15>
  400438:	e8 53 00 00 00       	call   400490 <__libc_start_main@plt+0x10>
  40043d:	48 83 c4 08          	add    rsp,0x8
  400441:	c3                   	ret    

Disassembly of section .plt:

0000000000400450 <__stack_chk_fail@plt-0x10>:
  400450:	ff 35 b2 0b 20 00    	push   QWORD PTR [rip+0x200bb2]        # 601008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400456:	ff 25 b4 0b 20 00    	jmp    QWORD PTR [rip+0x200bb4]        # 601010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40045c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000400460 <__stack_chk_fail@plt>:
  400460:	ff 25 b2 0b 20 00    	jmp    QWORD PTR [rip+0x200bb2]        # 601018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400466:	68 00 00 00 00       	push   0x0
  40046b:	e9 e0 ff ff ff       	jmp    400450 <_init+0x28>

0000000000400470 <printf@plt>:
  400470:	ff 25 aa 0b 20 00    	jmp    QWORD PTR [rip+0x200baa]        # 601020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400476:	68 01 00 00 00       	push   0x1
  40047b:	e9 d0 ff ff ff       	jmp    400450 <_init+0x28>

0000000000400480 <__libc_start_main@plt>:
  400480:	ff 25 a2 0b 20 00    	jmp    QWORD PTR [rip+0x200ba2]        # 601028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400486:	68 02 00 00 00       	push   0x2
  40048b:	e9 c0 ff ff ff       	jmp    400450 <_init+0x28>

Disassembly of section .plt.got:

0000000000400490 <.plt.got>:
  400490:	ff 25 62 0b 20 00    	jmp    QWORD PTR [rip+0x200b62]        # 600ff8 <_DYNAMIC+0x1d0>
  400496:	66 90                	xchg   ax,ax

Disassembly of section .text:

00000000004004a0 <_start>:
  4004a0:	31 ed                	xor    ebp,ebp
  4004a2:	49 89 d1             	mov    r9,rdx
  4004a5:	5e                   	pop    rsi
  4004a6:	48 89 e2             	mov    rdx,rsp
  4004a9:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
  4004ad:	50                   	push   rax
  4004ae:	54                   	push   rsp
  4004af:	49 c7 c0 80 06 40 00 	mov    r8,0x400680
  4004b6:	48 c7 c1 10 06 40 00 	mov    rcx,0x400610
  4004bd:	48 c7 c7 72 05 40 00 	mov    rdi,0x400572
  4004c4:	e8 b7 ff ff ff       	call   400480 <__libc_start_main@plt>
  4004c9:	f4                   	hlt    
  4004ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000004004d0 <deregister_tm_clones>:
  4004d0:	b8 40 10 60 00       	mov    eax,0x601040
  4004d5:	48 3d 40 10 60 00    	cmp    rax,0x601040
  4004db:	74 13                	je     4004f0 <deregister_tm_clones+0x20>
  4004dd:	b8 00 00 00 00       	mov    eax,0x0
  4004e2:	48 85 c0             	test   rax,rax
  4004e5:	74 09                	je     4004f0 <deregister_tm_clones+0x20>
  4004e7:	bf 40 10 60 00       	mov    edi,0x601040
  4004ec:	ff e0                	jmp    rax
  4004ee:	66 90                	xchg   ax,ax
  4004f0:	c3                   	ret    
  4004f1:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  4004f6:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  4004fd:	00 00 00 

0000000000400500 <register_tm_clones>:
  400500:	be 40 10 60 00       	mov    esi,0x601040
  400505:	48 81 ee 40 10 60 00 	sub    rsi,0x601040
  40050c:	48 c1 fe 03          	sar    rsi,0x3
  400510:	48 89 f0             	mov    rax,rsi
  400513:	48 c1 e8 3f          	shr    rax,0x3f
  400517:	48 01 c6             	add    rsi,rax
  40051a:	48 d1 fe             	sar    rsi,1
  40051d:	74 11                	je     400530 <register_tm_clones+0x30>
  40051f:	b8 00 00 00 00       	mov    eax,0x0
  400524:	48 85 c0             	test   rax,rax
  400527:	74 07                	je     400530 <register_tm_clones+0x30>
  400529:	bf 40 10 60 00       	mov    edi,0x601040
  40052e:	ff e0                	jmp    rax
  400530:	c3                   	ret    
  400531:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  400536:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40053d:	00 00 00 

0000000000400540 <__do_global_dtors_aux>:
  400540:	80 3d f9 0a 20 00 00 	cmp    BYTE PTR [rip+0x200af9],0x0        # 601040 <__TMC_END__>
  400547:	75 17                	jne    400560 <__do_global_dtors_aux+0x20>
  400549:	55                   	push   rbp
  40054a:	48 89 e5             	mov    rbp,rsp
  40054d:	e8 7e ff ff ff       	call   4004d0 <deregister_tm_clones>
  400552:	c6 05 e7 0a 20 00 01 	mov    BYTE PTR [rip+0x200ae7],0x1        # 601040 <__TMC_END__>
  400559:	5d                   	pop    rbp
  40055a:	c3                   	ret    
  40055b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  400560:	c3                   	ret    
  400561:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
  400566:	66 2e 0f 1f 84 00 00 	nop    WORD PTR cs:[rax+rax*1+0x0]
  40056d:	00 00 00 

0000000000400570 <frame_dummy>:
  400570:	eb 8e                	jmp    400500 <register_tm_clones>

0000000000400572 <main>:
  400572:	55                   	push   rbp
  400573:	48 89 e5             	mov    rbp,rsp
  400576:	48 83 ec 20          	sub    rsp,0x20
  40057a:	64 48 8b 04 25 28 00 	mov    rax,QWORD PTR fs:0x28
  400581:	00 00 
  400583:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  400587:	31 c0                	xor    eax,eax
  400589:	c7 45 ec ff ff 00 00 	mov    DWORD PTR [rbp-0x14],0xffff
  400590:	48 8d 45 ec          	lea    rax,[rbp-0x14]
  400594:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  400598:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  40059c:	0f b6 40 04          	movzx  eax,BYTE PTR [rax+0x4]
  4005a0:	01 c0                	add    eax,eax
  4005a2:	c0 f8 05             	sar    al,0x5
  4005a5:	0f be f0             	movsx  esi,al
  4005a8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  4005ac:	0f b6 40 04          	movzx  eax,BYTE PTR [rax+0x4]
  4005b0:	c1 e0 04             	shl    eax,0x4
  4005b3:	c0 f8 04             	sar    al,0x4
  4005b6:	0f be c8             	movsx  ecx,al
  4005b9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  4005bd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  4005c0:	c1 e0 03             	shl    eax,0x3
  4005c3:	c0 f8 06             	sar    al,0x6
  4005c6:	0f be d0             	movsx  edx,al
  4005c9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  4005cd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  4005d0:	c1 e0 05             	shl    eax,0x5
  4005d3:	c0 f8 05             	sar    al,0x5
  4005d6:	0f be c0             	movsx  eax,al
  4005d9:	41 89 f0             	mov    r8d,esi
  4005dc:	89 c6                	mov    esi,eax
  4005de:	bf 94 06 40 00       	mov    edi,0x400694
  4005e3:	b8 00 00 00 00       	mov    eax,0x0
  4005e8:	e8 83 fe ff ff       	call   400470 <printf@plt>
  4005ed:	b8 00 00 00 00       	mov    eax,0x0
  4005f2:	48 8b 7d f8          	mov    rdi,QWORD PTR [rbp-0x8]
  4005f6:	64 48 33 3c 25 28 00 	xor    rdi,QWORD PTR fs:0x28
  4005fd:	00 00 
  4005ff:	74 05                	je     400606 <main+0x94>
  400601:	e8 5a fe ff ff       	call   400460 <__stack_chk_fail@plt>
  400606:	c9                   	leave  
  400607:	c3                   	ret    
  400608:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  40060f:	00 

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
  40063c:	e8 e7 fd ff ff       	call   400428 <_init>
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

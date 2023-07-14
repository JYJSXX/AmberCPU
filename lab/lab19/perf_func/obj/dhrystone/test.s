
obj/dhrystone/main.elf:     file format elf32-tradlittlemips
obj/dhrystone/main.elf


Disassembly of section .text:

bfc00000 <_ftext>:
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:15
bfc00000:	3c1bbfb0 	lui	k1,0xbfb0
bfc00004:	af608ffc 	sw	zero,-28676(k1)
bfc00008:	af608ffc 	sw	zero,-28676(k1)
bfc0000c:	af60fff8 	sw	zero,-8(k1)
bfc00010:	af608ffc 	sw	zero,-28676(k1)
bfc00014:	af608ffc 	sw	zero,-28676(k1)
bfc00018:	8f608ffc 	lw	zero,-28676(k1)
bfc0001c:	8f7bfff8 	lw	k1,-8(k1)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:16
bfc00020:	3c08bfaf 	lui	t0,0xbfaf
bfc00024:	3508fffc 	ori	t0,t0,0xfffc
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:17
bfc00028:	ad000000 	sw	zero,0(t0)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:18
bfc0002c:	3c0a0040 	lui	t2,0x40
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:19
bfc00030:	3c1dbfc0 	lui	sp,0xbfc0
bfc00034:	27bd619c 	addiu	sp,sp,24988
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:20
bfc00038:	3c1cbfc1 	lui	gp,0xbfc1
bfc0003c:	279ca1c0 	addiu	gp,gp,-24128
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:24
bfc00040:	40088000 	mfc0	t0,$16
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:25
bfc00044:	3108fff8 	andi	t0,t0,0xfff8
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:26
bfc00048:	35080003 	ori	t0,t0,0x3
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:27
bfc0004c:	40888000 	mtc0	t0,$16
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:31
bfc00050:	3c08bfc0 	lui	t0,0xbfc0
bfc00054:	2508006c 	addiu	t0,t0,108
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:32
bfc00058:	3c092000 	lui	t1,0x2000
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:33
bfc0005c:	01094023 	subu	t0,t0,t1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:34
bfc00060:	01000008 	jr	t0
bfc00064:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:35
bfc00068:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:37
bfc0006c:	041100c8 	bal	bfc00390 <shell>
bfc00070:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:38
bfc00074:	0bf00040 	j	bfc00100 <test_finish>
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:40
bfc00078:	00000000 	nop
	...

bfc00100 <test_finish>:
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:45
bfc00100:	25080001 	addiu	t0,t0,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:46
bfc00104:	240900ff 	li	t1,255
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:47
bfc00108:	3c0abfb0 	lui	t2,0xbfb0
bfc0010c:	254afff0 	addiu	t2,t2,-16
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:48
bfc00110:	1000fffb 	b	bfc00100 <test_finish>
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:49
bfc00114:	ad490000 	sw	t1,0(t2)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:50
bfc00118:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:52
bfc0011c:	3c088000 	lui	t0,0x8000
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:53
bfc00120:	25290001 	addiu	t1,t1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:54
bfc00124:	01005025 	move	t2,t0
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:55
bfc00128:	01ae5821 	addu	t3,t5,t6
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:56
bfc0012c:	8d0c0000 	lw	t4,0(t0)
	...
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:63
bfc00380:	1000ffff 	b	bfc00380 <test_finish+0x280>
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:64
bfc00384:	25080001 	addiu	t0,t0,1
	...

bfc00390 <shell>:
shell():
bfc00390:	3c04bfc0 	lui	a0,0xbfc0
bfc00394:	27bdffe8 	addiu	sp,sp,-24
bfc00398:	afbf0014 	sw	ra,20(sp)
bfc0039c:	0ff005ea 	jal	bfc017a8 <puts>
bfc003a0:	24841a40 	addiu	a0,a0,6720
bfc003a4:	0ff00198 	jal	bfc00660 <dhrystone>
bfc003a8:	2404000a 	li	a0,10
bfc003ac:	10400010 	beqz	v0,bfc003f0 <shell+0x60>
bfc003b0:	3c18bfc0 	lui	t8,0xbfc0
bfc003b4:	0ff005ea 	jal	bfc017a8 <puts>
bfc003b8:	27041a68 	addiu	a0,t8,6760
bfc003bc:	3c0fbfaf 	lui	t7,0xbfaf
bfc003c0:	8fbf0014 	lw	ra,20(sp)
bfc003c4:	35eaf000 	ori	t2,t7,0xf000
bfc003c8:	35eef008 	ori	t6,t7,0xf008
bfc003cc:	35ecf004 	ori	t4,t7,0xf004
bfc003d0:	240d0001 	li	t5,1
bfc003d4:	240b0002 	li	t3,2
bfc003d8:	adcd0000 	sw	t5,0(t6)
bfc003dc:	27bd0018 	addiu	sp,sp,24
bfc003e0:	ad8b0000 	sw	t3,0(t4)
bfc003e4:	ad400000 	sw	zero,0(t2)
bfc003e8:	03e00008 	jr	ra
bfc003ec:	00000000 	nop
bfc003f0:	3c09bfc0 	lui	t1,0xbfc0
bfc003f4:	0ff005ea 	jal	bfc017a8 <puts>
bfc003f8:	25241a58 	addiu	a0,t1,6744
bfc003fc:	3c08bfaf 	lui	t0,0xbfaf
bfc00400:	8fbf0014 	lw	ra,20(sp)
bfc00404:	24060001 	li	a2,1
bfc00408:	3505f000 	ori	a1,t0,0xf000
bfc0040c:	3507f008 	ori	a3,t0,0xf008
bfc00410:	3503f004 	ori	v1,t0,0xf004
bfc00414:	3402ffff 	li	v0,0xffff
bfc00418:	ace60000 	sw	a2,0(a3)
bfc0041c:	27bd0018 	addiu	sp,sp,24
bfc00420:	ac660000 	sw	a2,0(v1)
bfc00424:	aca20000 	sw	v0,0(a1)
bfc00428:	03e00008 	jr	ra
bfc0042c:	00000000 	nop

bfc00430 <Proc_2>:
Proc_2():
bfc00430:	83838030 	lb	v1,-32720(gp)
bfc00434:	24020041 	li	v0,65
bfc00438:	8c850000 	lw	a1,0(a0)
bfc0043c:	10620004 	beq	v1,v0,bfc00450 <Proc_2+0x20>
bfc00440:	00000000 	nop
bfc00444:	03e00008 	jr	ra
bfc00448:	00000000 	nop
bfc0044c:	00000000 	nop
bfc00450:	8f87802c 	lw	a3,-32724(gp)
bfc00454:	00000000 	nop
bfc00458:	00a73023 	subu	a2,a1,a3
bfc0045c:	24c50009 	addiu	a1,a2,9
bfc00460:	03e00008 	jr	ra
bfc00464:	ac850000 	sw	a1,0(a0)
	...

bfc00470 <Proc_4>:
Proc_4():
bfc00470:	83878030 	lb	a3,-32720(gp)
bfc00474:	8f858038 	lw	a1,-32712(gp)
bfc00478:	38e60041 	xori	a2,a3,0x41
bfc0047c:	2cc20001 	sltiu	v0,a2,1
bfc00480:	00a21825 	or	v1,a1,v0
bfc00484:	24040042 	li	a0,66
bfc00488:	af838038 	sw	v1,-32712(gp)
bfc0048c:	03e00008 	jr	ra
bfc00490:	a3848031 	sb	a0,-32719(gp)
	...

bfc004a0 <Proc_5>:
Proc_5():
bfc004a0:	24020041 	li	v0,65
bfc004a4:	a3828030 	sb	v0,-32720(gp)
bfc004a8:	03e00008 	jr	ra
bfc004ac:	af808038 	sw	zero,-32712(gp)

bfc004b0 <Proc_3>:
Proc_3():
bfc004b0:	8f828034 	lw	v0,-32716(gp)
bfc004b4:	00000000 	nop
bfc004b8:	10400005 	beqz	v0,bfc004d0 <Proc_3+0x20>
bfc004bc:	00000000 	nop
bfc004c0:	8c420000 	lw	v0,0(v0)
bfc004c4:	00000000 	nop
bfc004c8:	ac820000 	sw	v0,0(a0)
bfc004cc:	8f828034 	lw	v0,-32716(gp)
bfc004d0:	8f85802c 	lw	a1,-32724(gp)
bfc004d4:	2446000c 	addiu	a2,v0,12
bfc004d8:	0bf004a0 	j	bfc01280 <Proc_7>
bfc004dc:	2404000a 	li	a0,10

bfc004e0 <Proc_1>:
Proc_1():
bfc004e0:	8f8b8034 	lw	t3,-32716(gp)
bfc004e4:	27bdffe0 	addiu	sp,sp,-32
bfc004e8:	afb10018 	sw	s1,24(sp)
bfc004ec:	afb00014 	sw	s0,20(sp)
bfc004f0:	afbf001c 	sw	ra,28(sp)
bfc004f4:	8c900000 	lw	s0,0(a0)
bfc004f8:	8d630000 	lw	v1,0(t3)
bfc004fc:	8d62000c 	lw	v0,12(t3)
bfc00500:	8d7f0008 	lw	ra,8(t3)
bfc00504:	00808821 	move	s1,a0
bfc00508:	8d640004 	lw	a0,4(t3)
bfc0050c:	25790010 	addiu	t9,t3,16
bfc00510:	ae030000 	sw	v1,0(s0)
bfc00514:	ae02000c 	sw	v0,12(s0)
bfc00518:	ae040004 	sw	a0,4(s0)
bfc0051c:	ae1f0008 	sw	ra,8(s0)
bfc00520:	8f2f000c 	lw	t7,12(t9)
bfc00524:	8d780010 	lw	t8,16(t3)
bfc00528:	8f2e0004 	lw	t6,4(t9)
bfc0052c:	8f2d0008 	lw	t5,8(t9)
bfc00530:	260c0010 	addiu	t4,s0,16
bfc00534:	ae180010 	sw	t8,16(s0)
bfc00538:	256a0020 	addiu	t2,t3,32
bfc0053c:	ad8f000c 	sw	t7,12(t4)
bfc00540:	ad8e0004 	sw	t6,4(t4)
bfc00544:	ad8d0008 	sw	t5,8(t4)
bfc00548:	8d690020 	lw	t1,32(t3)
bfc0054c:	8d46000c 	lw	a2,12(t2)
bfc00550:	8d450004 	lw	a1,4(t2)
bfc00554:	8d470008 	lw	a3,8(t2)
bfc00558:	26080020 	addiu	t0,s0,32
bfc0055c:	ae090020 	sw	t1,32(s0)
bfc00560:	ad06000c 	sw	a2,12(t0)
bfc00564:	ad050004 	sw	a1,4(t0)
bfc00568:	ad070008 	sw	a3,8(t0)
bfc0056c:	8e220000 	lw	v0,0(s1)
bfc00570:	24040005 	li	a0,5
bfc00574:	ae24000c 	sw	a0,12(s1)
bfc00578:	ae020000 	sw	v0,0(s0)
bfc0057c:	ae04000c 	sw	a0,12(s0)
bfc00580:	0ff0012c 	jal	bfc004b0 <Proc_3>
bfc00584:	02002021 	move	a0,s0
bfc00588:	8e030004 	lw	v1,4(s0)
bfc0058c:	00000000 	nop
bfc00590:	10600023 	beqz	v1,bfc00620 <Proc_1+0x140>
bfc00594:	262e0010 	addiu	t6,s1,16
bfc00598:	8e2c0000 	lw	t4,0(s1)
bfc0059c:	00000000 	nop
bfc005a0:	8d820000 	lw	v0,0(t4)
bfc005a4:	8d840004 	lw	a0,4(t4)
bfc005a8:	8d880008 	lw	t0,8(t4)
bfc005ac:	8d83000c 	lw	v1,12(t4)
bfc005b0:	259f0010 	addiu	ra,t4,16
bfc005b4:	ae220000 	sw	v0,0(s1)
bfc005b8:	ae240004 	sw	a0,4(s1)
bfc005bc:	ae280008 	sw	t0,8(s1)
bfc005c0:	ae23000c 	sw	v1,12(s1)
bfc005c4:	8ff8000c 	lw	t8,12(ra)
bfc005c8:	8fef0004 	lw	t7,4(ra)
bfc005cc:	8fed0008 	lw	t5,8(ra)
bfc005d0:	8d990010 	lw	t9,16(t4)
bfc005d4:	258b0020 	addiu	t3,t4,32
bfc005d8:	ae390010 	sw	t9,16(s1)
bfc005dc:	add8000c 	sw	t8,12(t6)
bfc005e0:	adcf0004 	sw	t7,4(t6)
bfc005e4:	adcd0008 	sw	t5,8(t6)
bfc005e8:	8d8a0020 	lw	t2,32(t4)
bfc005ec:	8d65000c 	lw	a1,12(t3)
bfc005f0:	8d660004 	lw	a2,4(t3)
bfc005f4:	8d690008 	lw	t1,8(t3)
bfc005f8:	26300020 	addiu	s0,s1,32
bfc005fc:	ae2a0020 	sw	t2,32(s1)
bfc00600:	ae05000c 	sw	a1,12(s0)
bfc00604:	ae060004 	sw	a2,4(s0)
bfc00608:	ae090008 	sw	t1,8(s0)
bfc0060c:	8fbf001c 	lw	ra,28(sp)
bfc00610:	8fb10018 	lw	s1,24(sp)
bfc00614:	8fb00014 	lw	s0,20(sp)
bfc00618:	03e00008 	jr	ra
bfc0061c:	27bd0020 	addiu	sp,sp,32
bfc00620:	8e240008 	lw	a0,8(s1)
bfc00624:	24070006 	li	a3,6
bfc00628:	26050008 	addiu	a1,s0,8
bfc0062c:	0ff00480 	jal	bfc01200 <Proc_6>
bfc00630:	ae07000c 	sw	a3,12(s0)
bfc00634:	8f888034 	lw	t0,-32716(gp)
bfc00638:	8e04000c 	lw	a0,12(s0)
bfc0063c:	8d110000 	lw	s1,0(t0)
bfc00640:	2606000c 	addiu	a2,s0,12
bfc00644:	ae110000 	sw	s1,0(s0)
bfc00648:	8fbf001c 	lw	ra,28(sp)
bfc0064c:	8fb10018 	lw	s1,24(sp)
bfc00650:	8fb00014 	lw	s0,20(sp)
bfc00654:	2405000a 	li	a1,10
bfc00658:	0bf004a0 	j	bfc01280 <Proc_7>
bfc0065c:	27bd0020 	addiu	sp,sp,32

bfc00660 <dhrystone>:
dhrystone():
bfc00660:	27bdff68 	addiu	sp,sp,-152
bfc00664:	afb40080 	sw	s4,128(sp)
bfc00668:	afa40098 	sw	a0,152(sp)
bfc0066c:	3c14bfc0 	lui	s4,0xbfc0
bfc00670:	2404000a 	li	a0,10
bfc00674:	afbf0094 	sw	ra,148(sp)
bfc00678:	afbe0090 	sw	s8,144(sp)
bfc0067c:	afb7008c 	sw	s7,140(sp)
bfc00680:	afb60088 	sw	s6,136(sp)
bfc00684:	afb50084 	sw	s5,132(sp)
bfc00688:	afb3007c 	sw	s3,124(sp)
bfc0068c:	afb20078 	sw	s2,120(sp)
bfc00690:	afb10074 	sw	s1,116(sp)
bfc00694:	0ff005bd 	jal	bfc016f4 <putchar>
bfc00698:	afb00070 	sw	s0,112(sp)
bfc0069c:	0ff005ea 	jal	bfc017a8 <puts>
bfc006a0:	26841a7c 	addiu	a0,s4,6780
bfc006a4:	0ff005bd 	jal	bfc016f4 <putchar>
bfc006a8:	2404000a 	li	a0,10
bfc006ac:	3c15bfc0 	lui	s5,0xbfc0
bfc006b0:	3c0cbfc0 	lui	t4,0xbfc0
bfc006b4:	26ab1aac 	addiu	t3,s5,6828
bfc006b8:	3c0abfc0 	lui	t2,0xbfc0
bfc006bc:	25951acc 	addiu	s5,t4,6860
bfc006c0:	3c07bfc0 	lui	a3,0xbfc0
bfc006c4:	3c08bfc0 	lui	t0,0xbfc0
bfc006c8:	8d6d000c 	lw	t5,12(t3)
bfc006cc:	8d6e0010 	lw	t6,16(t3)
bfc006d0:	8d6f0014 	lw	t7,20(t3)
bfc006d4:	8d790018 	lw	t9,24(t3)
bfc006d8:	9170001e 	lbu	s0,30(t3)
bfc006dc:	8d650004 	lw	a1,4(t3)
bfc006e0:	8d7e0008 	lw	s8,8(t3)
bfc006e4:	9571001c 	lhu	s1,28(t3)
bfc006e8:	8eb20004 	lw	s2,4(s5)
bfc006ec:	8d181acc 	lw	t8,6860(t0)
bfc006f0:	8ce91aac 	lw	t1,6828(a3)
bfc006f4:	25564940 	addiu	s6,t2,18752
bfc006f8:	3c06bfc0 	lui	a2,0xbfc0
bfc006fc:	8eb30008 	lw	s3,8(s5)
bfc00700:	26c40010 	addiu	a0,s6,16
bfc00704:	24d74910 	addiu	s7,a2,18704
bfc00708:	24030028 	li	v1,40
bfc0070c:	24020002 	li	v0,2
bfc00710:	aec90010 	sw	t1,16(s6)
bfc00714:	aec3000c 	sw	v1,12(s6)
bfc00718:	ac8d000c 	sw	t5,12(a0)
bfc0071c:	ac8e0010 	sw	t6,16(a0)
bfc00720:	ac8f0014 	sw	t7,20(a0)
bfc00724:	ac990018 	sw	t9,24(a0)
bfc00728:	a090001e 	sb	s0,30(a0)
bfc0072c:	ac850004 	sw	a1,4(a0)
bfc00730:	aec20008 	sw	v0,8(s6)
bfc00734:	ac9e0008 	sw	s8,8(a0)
bfc00738:	a491001c 	sh	s1,28(a0)
bfc0073c:	ad574940 	sw	s7,18752(t2)
bfc00740:	afb8001c 	sw	t8,28(sp)
bfc00744:	afb20020 	sw	s2,32(sp)
bfc00748:	af978028 	sw	s7,-32728(gp)
bfc0074c:	af968034 	sw	s6,-32716(gp)
bfc00750:	aec00004 	sw	zero,4(s6)
bfc00754:	3c10bfc0 	lui	s0,0xbfc0
bfc00758:	8eac000c 	lw	t4,12(s5)
bfc0075c:	8eab0010 	lw	t3,16(s5)
bfc00760:	8ea70014 	lw	a3,20(s5)
bfc00764:	8ea80018 	lw	t0,24(s5)
bfc00768:	26052200 	addiu	a1,s0,8704
bfc0076c:	afb30024 	sw	s3,36(sp)
bfc00770:	2402000a 	li	v0,10
bfc00774:	92a9001e 	lbu	t1,30(s5)
bfc00778:	96aa001c 	lhu	t2,28(s5)
bfc0077c:	2404000a 	li	a0,10
bfc00780:	aca2065c 	sw	v0,1628(a1)
bfc00784:	afac0028 	sw	t4,40(sp)
bfc00788:	afab002c 	sw	t3,44(sp)
bfc0078c:	afa70030 	sw	a3,48(sp)
bfc00790:	afa80034 	sw	t0,52(sp)
bfc00794:	a7aa0038 	sh	t2,56(sp)
bfc00798:	0ff005bd 	jal	bfc016f4 <putchar>
bfc0079c:	a3a9003a 	sb	t1,58(sp)
bfc007a0:	0ff005ea 	jal	bfc017a8 <puts>
bfc007a4:	26841a7c 	addiu	a0,s4,6780
bfc007a8:	0ff005bd 	jal	bfc016f4 <putchar>
bfc007ac:	2404000a 	li	a0,10
bfc007b0:	8f838010 	lw	v1,-32752(gp)
bfc007b4:	00000000 	nop
bfc007b8:	10600218 	beqz	v1,bfc0101c <dhrystone+0x9bc>
bfc007bc:	3c1fbfc0 	lui	ra,0xbfc0
bfc007c0:	27e41aec 	addiu	a0,ra,6892
bfc007c4:	0ff005ea 	jal	bfc017a8 <puts>
bfc007c8:	3c12bfc0 	lui	s2,0xbfc0
bfc007cc:	0ff005bd 	jal	bfc016f4 <putchar>
bfc007d0:	2404000a 	li	a0,10
bfc007d4:	8fa50098 	lw	a1,152(sp)
bfc007d8:	3c17bfaf 	lui	s7,0xbfaf
bfc007dc:	26441b48 	addiu	a0,s2,6984
bfc007e0:	0ff00524 	jal	bfc01490 <printf>
bfc007e4:	36f6fff8 	ori	s6,s7,0xfff8
bfc007e8:	8ed30000 	lw	s3,0(s6)
bfc007ec:	00000000 	nop
bfc007f0:	12600219 	beqz	s3,bfc01058 <dhrystone+0x9f8>
bfc007f4:	00000000 	nop
bfc007f8:	8fb80098 	lw	t8,152(sp)
bfc007fc:	00000000 	nop
bfc00800:	1b00021c 	blez	t8,bfc01074 <dhrystone+0xa14>
bfc00804:	3c14bfaf 	lui	s4,0xbfaf
bfc00808:	3c0fbfc0 	lui	t7,0xbfc0
bfc0080c:	3c0ebfc0 	lui	t6,0xbfc0
bfc00810:	3c19bfc0 	lui	t9,0xbfc0
bfc00814:	afaf0064 	sw	t7,100(sp)
bfc00818:	afae0068 	sw	t6,104(sp)
bfc0081c:	24140001 	li	s4,1
bfc00820:	27b7003c 	addiu	s7,sp,60
bfc00824:	25f51b78 	addiu	s5,t7,7032
bfc00828:	241e0001 	li	s8,1
bfc0082c:	27b60014 	addiu	s6,sp,20
bfc00830:	27331b98 	addiu	s3,t9,7064
bfc00834:	8fb80064 	lw	t8,100(sp)
bfc00838:	8ea80010 	lw	t0,16(s5)
bfc0083c:	8ebf0004 	lw	ra,4(s5)
bfc00840:	8ea60008 	lw	a2,8(s5)
bfc00844:	8ea7000c 	lw	a3,12(s5)
bfc00848:	8ea90014 	lw	t1,20(s5)
bfc0084c:	8eaa0018 	lw	t2,24(s5)
bfc00850:	96ab001c 	lhu	t3,28(s5)
bfc00854:	92ac001e 	lbu	t4,30(s5)
bfc00858:	8f121b78 	lw	s2,7032(t8)
bfc0085c:	02e02821 	move	a1,s7
bfc00860:	aee80010 	sw	t0,16(s7)
bfc00864:	24020042 	li	v0,66
bfc00868:	24030002 	li	v1,2
bfc0086c:	27a4001c 	addiu	a0,sp,28
bfc00870:	aef20000 	sw	s2,0(s7)
bfc00874:	aeff0004 	sw	ra,4(s7)
bfc00878:	aee60008 	sw	a2,8(s7)
bfc0087c:	aee7000c 	sw	a3,12(s7)
bfc00880:	aee90014 	sw	t1,20(s7)
bfc00884:	aeea0018 	sw	t2,24(s7)
bfc00888:	a6eb001c 	sh	t3,28(s7)
bfc0088c:	a2ec001e 	sb	t4,30(s7)
bfc00890:	24100041 	li	s0,65
bfc00894:	a3908030 	sb	s0,-32720(gp)
bfc00898:	af9e8038 	sw	s8,-32712(gp)
bfc0089c:	a3828031 	sb	v0,-32719(gp)
bfc008a0:	afa30010 	sw	v1,16(sp)
bfc008a4:	0ff004d8 	jal	bfc01360 <Func_2>
bfc008a8:	afbe0018 	sw	s8,24(sp)
bfc008ac:	8fa80010 	lw	t0,16(sp)
bfc008b0:	2c450001 	sltiu	a1,v0,1
bfc008b4:	290d0003 	slti	t5,t0,3
bfc008b8:	11a00036 	beqz	t5,bfc00994 <dhrystone+0x334>
bfc008bc:	af858038 	sw	a1,-32712(gp)
bfc008c0:	00082880 	sll	a1,t0,0x2
bfc008c4:	00a86821 	addu	t5,a1,t0
bfc008c8:	01002021 	move	a0,t0
bfc008cc:	25aefffd 	addiu	t6,t5,-3
bfc008d0:	24050003 	li	a1,3
bfc008d4:	02c03021 	move	a2,s6
bfc008d8:	0ff004a0 	jal	bfc01280 <Proc_7>
bfc008dc:	afae0014 	sw	t6,20(sp)
bfc008e0:	8faf0010 	lw	t7,16(sp)
bfc008e4:	24050003 	li	a1,3
bfc008e8:	25e80001 	addiu	t0,t7,1
bfc008ec:	00082080 	sll	a0,t0,0x2
bfc008f0:	0088c821 	addu	t9,a0,t0
bfc008f4:	29110003 	slti	s1,t0,3
bfc008f8:	02c03021 	move	a2,s6
bfc008fc:	01002021 	move	a0,t0
bfc00900:	2722fffd 	addiu	v0,t9,-3
bfc00904:	12200023 	beqz	s1,bfc00994 <dhrystone+0x334>
bfc00908:	afa80010 	sw	t0,16(sp)
bfc0090c:	0ff004a0 	jal	bfc01280 <Proc_7>
bfc00910:	afa20014 	sw	v0,20(sp)
bfc00914:	8fab0010 	lw	t3,16(sp)
bfc00918:	24050003 	li	a1,3
bfc0091c:	25680001 	addiu	t0,t3,1
bfc00920:	00086080 	sll	t4,t0,0x2
bfc00924:	01881021 	addu	v0,t4,t0
bfc00928:	29100003 	slti	s0,t0,3
bfc0092c:	02c03021 	move	a2,s6
bfc00930:	01002021 	move	a0,t0
bfc00934:	2443fffd 	addiu	v1,v0,-3
bfc00938:	12000016 	beqz	s0,bfc00994 <dhrystone+0x334>
bfc0093c:	afa80010 	sw	t0,16(sp)
bfc00940:	0ff004a0 	jal	bfc01280 <Proc_7>
bfc00944:	afa30014 	sw	v1,20(sp)
bfc00948:	8fa70010 	lw	a3,16(sp)
bfc0094c:	24050003 	li	a1,3
bfc00950:	24e80001 	addiu	t0,a3,1
bfc00954:	00084880 	sll	t1,t0,0x2
bfc00958:	01285021 	addu	t2,t1,t0
bfc0095c:	29110003 	slti	s1,t0,3
bfc00960:	02c03021 	move	a2,s6
bfc00964:	2543fffd 	addiu	v1,t2,-3
bfc00968:	01002021 	move	a0,t0
bfc0096c:	12200009 	beqz	s1,bfc00994 <dhrystone+0x334>
bfc00970:	afa80010 	sw	t0,16(sp)
bfc00974:	0ff004a0 	jal	bfc01280 <Proc_7>
bfc00978:	afa30014 	sw	v1,20(sp)
bfc0097c:	8fa60010 	lw	a2,16(sp)
bfc00980:	00000000 	nop
bfc00984:	24c80001 	addiu	t0,a2,1
bfc00988:	29050003 	slti	a1,t0,3
bfc0098c:	14a0ffcc 	bnez	a1,bfc008c0 <dhrystone+0x260>
bfc00990:	afa80010 	sw	t0,16(sp)
bfc00994:	3c0cbfc0 	lui	t4,0xbfc0
bfc00998:	8fa70014 	lw	a3,20(sp)
bfc0099c:	3c10bfc0 	lui	s0,0xbfc0
bfc009a0:	25844970 	addiu	a0,t4,18800
bfc009a4:	01003021 	move	a2,t0
bfc009a8:	0ff004a4 	jal	bfc01290 <Proc_8>
bfc009ac:	26052200 	addiu	a1,s0,8704
bfc009b0:	8f848034 	lw	a0,-32716(gp)
bfc009b4:	0ff00138 	jal	bfc004e0 <Proc_1>
bfc009b8:	00000000 	nop
bfc009bc:	83828031 	lb	v0,-32719(gp)
bfc009c0:	00000000 	nop
bfc009c4:	28430041 	slti	v1,v0,65
bfc009c8:	14600192 	bnez	v1,bfc01014 <dhrystone+0x9b4>
bfc009cc:	24100041 	li	s0,65
bfc009d0:	24120003 	li	s2,3
bfc009d4:	0bf0027f 	j	bfc009fc <dhrystone+0x39c>
bfc009d8:	24110041 	li	s1,65
bfc009dc:	00000000 	nop
bfc009e0:	26050001 	addiu	a1,s0,1
bfc009e4:	838e8031 	lb	t6,-32719(gp)
bfc009e8:	00056e00 	sll	t5,a1,0x18
bfc009ec:	000d8603 	sra	s0,t5,0x18
bfc009f0:	01d0f82a 	slt	ra,t6,s0
bfc009f4:	17e00026 	bnez	ra,bfc00a90 <dhrystone+0x430>
bfc009f8:	00000000 	nop
bfc009fc:	02202021 	move	a0,s1
bfc00a00:	0ff004c8 	jal	bfc01320 <Func_1>
bfc00a04:	24050043 	li	a1,67
bfc00a08:	8fab0018 	lw	t3,24(sp)
bfc00a0c:	00000000 	nop
bfc00a10:	144bfff3 	bne	v0,t3,bfc009e0 <dhrystone+0x380>
bfc00a14:	26310001 	addiu	s1,s1,1
bfc00a18:	00002021 	move	a0,zero
bfc00a1c:	0ff00480 	jal	bfc01200 <Proc_6>
bfc00a20:	27a50018 	addiu	a1,sp,24
bfc00a24:	26050001 	addiu	a1,s0,1
bfc00a28:	3c12bfc0 	lui	s2,0xbfc0
bfc00a2c:	838e8031 	lb	t6,-32719(gp)
bfc00a30:	00056e00 	sll	t5,a1,0x18
bfc00a34:	8e4f1b98 	lw	t7,7064(s2)
bfc00a38:	8e640004 	lw	a0,4(s3)
bfc00a3c:	8e790008 	lw	t9,8(s3)
bfc00a40:	8e78000c 	lw	t8,12(s3)
bfc00a44:	8e660010 	lw	a2,16(s3)
bfc00a48:	8e670014 	lw	a3,20(s3)
bfc00a4c:	8e680018 	lw	t0,24(s3)
bfc00a50:	9669001c 	lhu	t1,28(s3)
bfc00a54:	926a001e 	lbu	t2,30(s3)
bfc00a58:	000d8603 	sra	s0,t5,0x18
bfc00a5c:	01d0f82a 	slt	ra,t6,s0
bfc00a60:	02809021 	move	s2,s4
bfc00a64:	aeef0000 	sw	t7,0(s7)
bfc00a68:	aee40004 	sw	a0,4(s7)
bfc00a6c:	aef90008 	sw	t9,8(s7)
bfc00a70:	aef8000c 	sw	t8,12(s7)
bfc00a74:	aee60010 	sw	a2,16(s7)
bfc00a78:	aee70014 	sw	a3,20(s7)
bfc00a7c:	aee80018 	sw	t0,24(s7)
bfc00a80:	a6e9001c 	sh	t1,28(s7)
bfc00a84:	a2ea001e 	sb	t2,30(s7)
bfc00a88:	13e0ffdc 	beqz	ra,bfc009fc <dhrystone+0x39c>
bfc00a8c:	af94802c 	sw	s4,-32724(gp)
bfc00a90:	8fa70010 	lw	a3,16(sp)
bfc00a94:	8fa80014 	lw	t0,20(sp)
bfc00a98:	02470018 	mult	s2,a3
bfc00a9c:	27a40010 	addiu	a0,sp,16
bfc00aa0:	26940001 	addiu	s4,s4,1
bfc00aa4:	00004812 	mflo	t1
bfc00aa8:	01285023 	subu	t2,t1,t0
bfc00aac:	000a58c0 	sll	t3,t2,0x3
bfc00ab0:	15000002 	bnez	t0,bfc00abc <dhrystone+0x45c>
bfc00ab4:	0128001a 	div	zero,t1,t0
bfc00ab8:	0007000d 	break	0x7
bfc00abc:	016a6023 	subu	t4,t3,t2
bfc00ac0:	00008012 	mflo	s0
bfc00ac4:	01901023 	subu	v0,t4,s0
bfc00ac8:	afa20060 	sw	v0,96(sp)
bfc00acc:	0ff0010c 	jal	bfc00430 <Proc_2>
bfc00ad0:	afb00010 	sw	s0,16(sp)
bfc00ad4:	8fa30098 	lw	v1,152(sp)
bfc00ad8:	00000000 	nop
bfc00adc:	0074882a 	slt	s1,v1,s4
bfc00ae0:	1220ff54 	beqz	s1,bfc00834 <dhrystone+0x1d4>
bfc00ae4:	00000000 	nop
bfc00ae8:	3c14bfaf 	lui	s4,0xbfaf
bfc00aec:	3695fff8 	ori	s5,s4,0xfff8
bfc00af0:	8ebe0000 	lw	s8,0(s5)
bfc00af4:	00000000 	nop
bfc00af8:	13c00166 	beqz	s8,bfc01094 <dhrystone+0xa34>
bfc00afc:	00000000 	nop
bfc00b00:	3c1fbfc0 	lui	ra,0xbfc0
bfc00b04:	27e41bb8 	addiu	a0,ra,7096
bfc00b08:	0ff005ea 	jal	bfc017a8 <puts>
bfc00b0c:	3c15bfc0 	lui	s5,0xbfc0
bfc00b10:	0ff005bd 	jal	bfc016f4 <putchar>
bfc00b14:	2404000a 	li	a0,10
bfc00b18:	0ff005ea 	jal	bfc017a8 <puts>
bfc00b1c:	26a41bc8 	addiu	a0,s5,7112
bfc00b20:	0ff005bd 	jal	bfc016f4 <putchar>
bfc00b24:	2404000a 	li	a0,10
bfc00b28:	3c10bfc0 	lui	s0,0xbfc0
bfc00b2c:	8f85802c 	lw	a1,-32724(gp)
bfc00b30:	26041c00 	addiu	a0,s0,7168
bfc00b34:	0ff00524 	jal	bfc01490 <printf>
bfc00b38:	3c10bfc0 	lui	s0,0xbfc0
bfc00b3c:	26041c1c 	addiu	a0,s0,7196
bfc00b40:	0ff00524 	jal	bfc01490 <printf>
bfc00b44:	24050005 	li	a1,5
bfc00b48:	8f858038 	lw	a1,-32712(gp)
bfc00b4c:	3c02bfc0 	lui	v0,0xbfc0
bfc00b50:	0ff00524 	jal	bfc01490 <printf>
bfc00b54:	24441c38 	addiu	a0,v0,7224
bfc00b58:	26041c1c 	addiu	a0,s0,7196
bfc00b5c:	0ff00524 	jal	bfc01490 <printf>
bfc00b60:	24050001 	li	a1,1
bfc00b64:	3c16bfc0 	lui	s6,0xbfc0
bfc00b68:	83858030 	lb	a1,-32720(gp)
bfc00b6c:	26c41c54 	addiu	a0,s6,7252
bfc00b70:	0ff00524 	jal	bfc01490 <printf>
bfc00b74:	3c11bfc0 	lui	s1,0xbfc0
bfc00b78:	26241c70 	addiu	a0,s1,7280
bfc00b7c:	0ff00524 	jal	bfc01490 <printf>
bfc00b80:	24050041 	li	a1,65
bfc00b84:	3c03bfc0 	lui	v1,0xbfc0
bfc00b88:	83858031 	lb	a1,-32719(gp)
bfc00b8c:	0ff00524 	jal	bfc01490 <printf>
bfc00b90:	24641c8c 	addiu	a0,v1,7308
bfc00b94:	26241c70 	addiu	a0,s1,7280
bfc00b98:	0ff00524 	jal	bfc01490 <printf>
bfc00b9c:	24050042 	li	a1,66
bfc00ba0:	3c05bfc0 	lui	a1,0xbfc0
bfc00ba4:	24b24970 	addiu	s2,a1,18800
bfc00ba8:	8e450020 	lw	a1,32(s2)
bfc00bac:	3c13bfc0 	lui	s3,0xbfc0
bfc00bb0:	0ff00524 	jal	bfc01490 <printf>
bfc00bb4:	26641ca8 	addiu	a0,s3,7336
bfc00bb8:	26041c1c 	addiu	a0,s0,7196
bfc00bbc:	0ff00524 	jal	bfc01490 <printf>
bfc00bc0:	24050007 	li	a1,7
bfc00bc4:	3c0dbfc0 	lui	t5,0xbfc0
bfc00bc8:	8faf0098 	lw	t7,152(sp)
bfc00bcc:	25ae2200 	addiu	t6,t5,8704
bfc00bd0:	8dc5065c 	lw	a1,1628(t6)
bfc00bd4:	3c1ebfc0 	lui	s8,0xbfc0
bfc00bd8:	27c41cc4 	addiu	a0,s8,7364
bfc00bdc:	0ff00524 	jal	bfc01490 <printf>
bfc00be0:	25fe000a 	addiu	s8,t7,10
bfc00be4:	03c02821 	move	a1,s8
bfc00be8:	0ff00524 	jal	bfc01490 <printf>
bfc00bec:	26041c1c 	addiu	a0,s0,7196
bfc00bf0:	3c04bfc0 	lui	a0,0xbfc0
bfc00bf4:	0ff005ea 	jal	bfc017a8 <puts>
bfc00bf8:	24841ce0 	addiu	a0,a0,7392
bfc00bfc:	8f998034 	lw	t9,-32716(gp)
bfc00c00:	3c14bfc0 	lui	s4,0xbfc0
bfc00c04:	8f250000 	lw	a1,0(t9)
bfc00c08:	0ff00524 	jal	bfc01490 <printf>
bfc00c0c:	26841cec 	addiu	a0,s4,7404
bfc00c10:	3c18bfc0 	lui	t8,0xbfc0
bfc00c14:	0ff005ea 	jal	bfc017a8 <puts>
bfc00c18:	27041d08 	addiu	a0,t8,7432
bfc00c1c:	8f868034 	lw	a2,-32716(gp)
bfc00c20:	3c15bfc0 	lui	s5,0xbfc0
bfc00c24:	8cc50004 	lw	a1,4(a2)
bfc00c28:	0ff00524 	jal	bfc01490 <printf>
bfc00c2c:	26a41d38 	addiu	a0,s5,7480
bfc00c30:	26041c1c 	addiu	a0,s0,7196
bfc00c34:	0ff00524 	jal	bfc01490 <printf>
bfc00c38:	00002821 	move	a1,zero
bfc00c3c:	8f878034 	lw	a3,-32716(gp)
bfc00c40:	3c16bfc0 	lui	s6,0xbfc0
bfc00c44:	8ce50008 	lw	a1,8(a3)
bfc00c48:	0ff00524 	jal	bfc01490 <printf>
bfc00c4c:	26c41d54 	addiu	a0,s6,7508
bfc00c50:	26041c1c 	addiu	a0,s0,7196
bfc00c54:	0ff00524 	jal	bfc01490 <printf>
bfc00c58:	24050002 	li	a1,2
bfc00c5c:	8f888034 	lw	t0,-32716(gp)
bfc00c60:	3c11bfc0 	lui	s1,0xbfc0
bfc00c64:	8d05000c 	lw	a1,12(t0)
bfc00c68:	0ff00524 	jal	bfc01490 <printf>
bfc00c6c:	26241d70 	addiu	a0,s1,7536
bfc00c70:	26041c1c 	addiu	a0,s0,7196
bfc00c74:	0ff00524 	jal	bfc01490 <printf>
bfc00c78:	24050011 	li	a1,17
bfc00c7c:	8f898034 	lw	t1,-32716(gp)
bfc00c80:	3c12bfc0 	lui	s2,0xbfc0
bfc00c84:	25250010 	addiu	a1,t1,16
bfc00c88:	26441d8c 	addiu	a0,s2,7564
bfc00c8c:	0ff00524 	jal	bfc01490 <printf>
bfc00c90:	3c13bfc0 	lui	s3,0xbfc0
bfc00c94:	0ff005ea 	jal	bfc017a8 <puts>
bfc00c98:	26641da8 	addiu	a0,s3,7592
bfc00c9c:	3c0abfc0 	lui	t2,0xbfc0
bfc00ca0:	0ff005ea 	jal	bfc017a8 <puts>
bfc00ca4:	25441ddc 	addiu	a0,t2,7644
bfc00ca8:	8f8b8028 	lw	t3,-32728(gp)
bfc00cac:	00000000 	nop
bfc00cb0:	8d650000 	lw	a1,0(t3)
bfc00cb4:	0ff00524 	jal	bfc01490 <printf>
bfc00cb8:	26841cec 	addiu	a0,s4,7404
bfc00cbc:	3c0cbfc0 	lui	t4,0xbfc0
bfc00cc0:	0ff005ea 	jal	bfc017a8 <puts>
bfc00cc4:	25841dec 	addiu	a0,t4,7660
bfc00cc8:	8f828028 	lw	v0,-32728(gp)
bfc00ccc:	00000000 	nop
bfc00cd0:	8c450004 	lw	a1,4(v0)
bfc00cd4:	0ff00524 	jal	bfc01490 <printf>
bfc00cd8:	26a41d38 	addiu	a0,s5,7480
bfc00cdc:	26041c1c 	addiu	a0,s0,7196
bfc00ce0:	0ff00524 	jal	bfc01490 <printf>
bfc00ce4:	00002821 	move	a1,zero
bfc00ce8:	8f838028 	lw	v1,-32728(gp)
bfc00cec:	26c41d54 	addiu	a0,s6,7508
bfc00cf0:	8c650008 	lw	a1,8(v1)
bfc00cf4:	0ff00524 	jal	bfc01490 <printf>
bfc00cf8:	24160001 	li	s6,1
bfc00cfc:	26041c1c 	addiu	a0,s0,7196
bfc00d00:	0ff00524 	jal	bfc01490 <printf>
bfc00d04:	24050001 	li	a1,1
bfc00d08:	26241d70 	addiu	a0,s1,7536
bfc00d0c:	8f918028 	lw	s1,-32728(gp)
bfc00d10:	00000000 	nop
bfc00d14:	8e25000c 	lw	a1,12(s1)
bfc00d18:	0ff00524 	jal	bfc01490 <printf>
bfc00d1c:	00000000 	nop
bfc00d20:	26041c1c 	addiu	a0,s0,7196
bfc00d24:	0ff00524 	jal	bfc01490 <printf>
bfc00d28:	24050012 	li	a1,18
bfc00d2c:	8f858028 	lw	a1,-32728(gp)
bfc00d30:	26441d8c 	addiu	a0,s2,7564
bfc00d34:	0ff00524 	jal	bfc01490 <printf>
bfc00d38:	24a50010 	addiu	a1,a1,16
bfc00d3c:	0ff005ea 	jal	bfc017a8 <puts>
bfc00d40:	26641da8 	addiu	a0,s3,7592
bfc00d44:	3c0dbfc0 	lui	t5,0xbfc0
bfc00d48:	8fa50010 	lw	a1,16(sp)
bfc00d4c:	0ff00524 	jal	bfc01490 <printf>
bfc00d50:	25a41e2c 	addiu	a0,t5,7724
bfc00d54:	26041c1c 	addiu	a0,s0,7196
bfc00d58:	0ff00524 	jal	bfc01490 <printf>
bfc00d5c:	24050005 	li	a1,5
bfc00d60:	3c0ebfc0 	lui	t6,0xbfc0
bfc00d64:	8fa50060 	lw	a1,96(sp)
bfc00d68:	0ff00524 	jal	bfc01490 <printf>
bfc00d6c:	25c41e48 	addiu	a0,t6,7752
bfc00d70:	26041c1c 	addiu	a0,s0,7196
bfc00d74:	0ff00524 	jal	bfc01490 <printf>
bfc00d78:	2405000d 	li	a1,13
bfc00d7c:	3c12bfc0 	lui	s2,0xbfc0
bfc00d80:	8fa50014 	lw	a1,20(sp)
bfc00d84:	0ff00524 	jal	bfc01490 <printf>
bfc00d88:	26441e64 	addiu	a0,s2,7780
bfc00d8c:	26041c1c 	addiu	a0,s0,7196
bfc00d90:	0ff00524 	jal	bfc01490 <printf>
bfc00d94:	24050007 	li	a1,7
bfc00d98:	3c0fbfc0 	lui	t7,0xbfc0
bfc00d9c:	8fa50018 	lw	a1,24(sp)
bfc00da0:	0ff00524 	jal	bfc01490 <printf>
bfc00da4:	25e41e80 	addiu	a0,t7,7808
bfc00da8:	26041c1c 	addiu	a0,s0,7196
bfc00dac:	0ff00524 	jal	bfc01490 <printf>
bfc00db0:	24050001 	li	a1,1
bfc00db4:	3c04bfc0 	lui	a0,0xbfc0
bfc00db8:	27a5001c 	addiu	a1,sp,28
bfc00dbc:	0ff00524 	jal	bfc01490 <printf>
bfc00dc0:	24841e9c 	addiu	a0,a0,7836
bfc00dc4:	3c19bfc0 	lui	t9,0xbfc0
bfc00dc8:	0ff005ea 	jal	bfc017a8 <puts>
bfc00dcc:	27241eb8 	addiu	a0,t9,7864
bfc00dd0:	3c18bfc0 	lui	t8,0xbfc0
bfc00dd4:	27041eec 	addiu	a0,t8,7916
bfc00dd8:	0ff00524 	jal	bfc01490 <printf>
bfc00ddc:	02e02821 	move	a1,s7
bfc00de0:	3c06bfc0 	lui	a2,0xbfc0
bfc00de4:	0ff005ea 	jal	bfc017a8 <puts>
bfc00de8:	24c41f08 	addiu	a0,a2,7944
bfc00dec:	0ff005bd 	jal	bfc016f4 <putchar>
bfc00df0:	2404000a 	li	a0,10
bfc00df4:	8f938038 	lw	s3,-32712(gp)
bfc00df8:	8f84802c 	lw	a0,-32724(gp)
bfc00dfc:	127600f1 	beq	s3,s6,bfc011c4 <dhrystone+0xb64>
bfc00e00:	388c0005 	xori	t4,a0,0x5
bfc00e04:	24100001 	li	s0,1
bfc00e08:	83948030 	lb	s4,-32720(gp)
bfc00e0c:	240b0041 	li	t3,65
bfc00e10:	128b0002 	beq	s4,t3,bfc00e1c <dhrystone+0x7bc>
bfc00e14:	00000000 	nop
bfc00e18:	24100001 	li	s0,1
bfc00e1c:	83898031 	lb	t1,-32719(gp)
bfc00e20:	240a0042 	li	t2,66
bfc00e24:	112a0002 	beq	t1,t2,bfc00e30 <dhrystone+0x7d0>
bfc00e28:	3c18bfc0 	lui	t8,0xbfc0
bfc00e2c:	24100001 	li	s0,1
bfc00e30:	27064970 	addiu	a2,t8,18800
bfc00e34:	8cc70020 	lw	a3,32(a2)
bfc00e38:	24080007 	li	t0,7
bfc00e3c:	10e80002 	beq	a3,t0,bfc00e48 <dhrystone+0x7e8>
bfc00e40:	3c0fbfc0 	lui	t7,0xbfc0
bfc00e44:	24100001 	li	s0,1
bfc00e48:	25e42200 	addiu	a0,t7,8704
bfc00e4c:	8c99065c 	lw	t9,1628(a0)
bfc00e50:	00000000 	nop
bfc00e54:	13d90002 	beq	s8,t9,bfc00e60 <dhrystone+0x800>
bfc00e58:	00000000 	nop
bfc00e5c:	24100001 	li	s0,1
bfc00e60:	8f848034 	lw	a0,-32716(gp)
bfc00e64:	8f918028 	lw	s1,-32728(gp)
bfc00e68:	8c8e0000 	lw	t6,0(a0)
bfc00e6c:	8e3e0000 	lw	s8,0(s1)
bfc00e70:	00000000 	nop
bfc00e74:	11de0002 	beq	t6,s8,bfc00e80 <dhrystone+0x820>
bfc00e78:	00000000 	nop
bfc00e7c:	24100001 	li	s0,1
bfc00e80:	8c8d0004 	lw	t5,4(a0)
bfc00e84:	00000000 	nop
bfc00e88:	11a00002 	beqz	t5,bfc00e94 <dhrystone+0x834>
bfc00e8c:	00000000 	nop
bfc00e90:	24100001 	li	s0,1
bfc00e94:	8c920008 	lw	s2,8(a0)
bfc00e98:	24130002 	li	s3,2
bfc00e9c:	12530002 	beq	s2,s3,bfc00ea8 <dhrystone+0x848>
bfc00ea0:	00000000 	nop
bfc00ea4:	24100001 	li	s0,1
bfc00ea8:	8c83000c 	lw	v1,12(a0)
bfc00eac:	24050011 	li	a1,17
bfc00eb0:	10650002 	beq	v1,a1,bfc00ebc <dhrystone+0x85c>
bfc00eb4:	3c16bfc0 	lui	s6,0xbfc0
bfc00eb8:	24100001 	li	s0,1
bfc00ebc:	24840010 	addiu	a0,a0,16
bfc00ec0:	0ff00638 	jal	bfc018e0 <strcmp>
bfc00ec4:	26c51aac 	addiu	a1,s6,6828
bfc00ec8:	10400002 	beqz	v0,bfc00ed4 <dhrystone+0x874>
bfc00ecc:	00000000 	nop
bfc00ed0:	24100001 	li	s0,1
bfc00ed4:	8e220004 	lw	v0,4(s1)
bfc00ed8:	00000000 	nop
bfc00edc:	10400002 	beqz	v0,bfc00ee8 <dhrystone+0x888>
bfc00ee0:	00000000 	nop
bfc00ee4:	24100001 	li	s0,1
bfc00ee8:	8e3f0008 	lw	ra,8(s1)
bfc00eec:	24150001 	li	s5,1
bfc00ef0:	13f50002 	beq	ra,s5,bfc00efc <dhrystone+0x89c>
bfc00ef4:	00000000 	nop
bfc00ef8:	24100001 	li	s0,1
bfc00efc:	8e2b000c 	lw	t3,12(s1)
bfc00f00:	240c0012 	li	t4,18
bfc00f04:	116c0002 	beq	t3,t4,bfc00f10 <dhrystone+0x8b0>
bfc00f08:	26240010 	addiu	a0,s1,16
bfc00f0c:	24100001 	li	s0,1
bfc00f10:	3c11bfc0 	lui	s1,0xbfc0
bfc00f14:	0ff00638 	jal	bfc018e0 <strcmp>
bfc00f18:	26251aac 	addiu	a1,s1,6828
bfc00f1c:	10400002 	beqz	v0,bfc00f28 <dhrystone+0x8c8>
bfc00f20:	00000000 	nop
bfc00f24:	24100001 	li	s0,1
bfc00f28:	8fb40010 	lw	s4,16(sp)
bfc00f2c:	240a0005 	li	t2,5
bfc00f30:	128a0002 	beq	s4,t2,bfc00f3c <dhrystone+0x8dc>
bfc00f34:	00000000 	nop
bfc00f38:	24100001 	li	s0,1
bfc00f3c:	8fa80060 	lw	t0,96(sp)
bfc00f40:	2409000d 	li	t1,13
bfc00f44:	11090002 	beq	t0,t1,bfc00f50 <dhrystone+0x8f0>
bfc00f48:	00000000 	nop
bfc00f4c:	24100001 	li	s0,1
bfc00f50:	8fa70014 	lw	a3,20(sp)
bfc00f54:	24060007 	li	a2,7
bfc00f58:	10e60002 	beq	a3,a2,bfc00f64 <dhrystone+0x904>
bfc00f5c:	00000000 	nop
bfc00f60:	24100001 	li	s0,1
bfc00f64:	8fb80018 	lw	t8,24(sp)
bfc00f68:	24190001 	li	t9,1
bfc00f6c:	13190002 	beq	t8,t9,bfc00f78 <dhrystone+0x918>
bfc00f70:	3c0fbfc0 	lui	t7,0xbfc0
bfc00f74:	24100001 	li	s0,1
bfc00f78:	27a4001c 	addiu	a0,sp,28
bfc00f7c:	0ff00638 	jal	bfc018e0 <strcmp>
bfc00f80:	25e51acc 	addiu	a1,t7,6860
bfc00f84:	10400002 	beqz	v0,bfc00f90 <dhrystone+0x930>
bfc00f88:	02e02021 	move	a0,s7
bfc00f8c:	24100001 	li	s0,1
bfc00f90:	8fb70064 	lw	s7,100(sp)
bfc00f94:	0ff00638 	jal	bfc018e0 <strcmp>
bfc00f98:	26e51b78 	addiu	a1,s7,7032
bfc00f9c:	10400002 	beqz	v0,bfc00fa8 <dhrystone+0x948>
bfc00fa0:	00000000 	nop
bfc00fa4:	24100001 	li	s0,1
bfc00fa8:	3c19bfb0 	lui	t9,0xbfb0
bfc00fac:	af208ffc 	sw	zero,-28676(t9)
bfc00fb0:	af208ffc 	sw	zero,-28676(t9)
bfc00fb4:	af20fff8 	sw	zero,-8(t9)
bfc00fb8:	af208ffc 	sw	zero,-28676(t9)
bfc00fbc:	af208ffc 	sw	zero,-28676(t9)
bfc00fc0:	8f208ffc 	lw	zero,-28676(t9)
bfc00fc4:	8f39fff8 	lw	t9,-8(t9)
bfc00fc8:	3c04bfaf 	lui	a0,0xbfaf
bfc00fcc:	348efff8 	ori	t6,a0,0xfff8
bfc00fd0:	8dde0000 	lw	s8,0(t6)
bfc00fd4:	00000000 	nop
bfc00fd8:	13c00032 	beqz	s8,bfc010a4 <dhrystone+0xa44>
bfc00fdc:	3c16bfc0 	lui	s6,0xbfc0
bfc00fe0:	8fbf0094 	lw	ra,148(sp)
bfc00fe4:	02001021 	move	v0,s0
bfc00fe8:	8fbe0090 	lw	s8,144(sp)
bfc00fec:	8fb7008c 	lw	s7,140(sp)
bfc00ff0:	8fb60088 	lw	s6,136(sp)
bfc00ff4:	8fb50084 	lw	s5,132(sp)
bfc00ff8:	8fb40080 	lw	s4,128(sp)
bfc00ffc:	8fb3007c 	lw	s3,124(sp)
bfc01000:	8fb20078 	lw	s2,120(sp)
bfc01004:	8fb10074 	lw	s1,116(sp)
bfc01008:	8fb00070 	lw	s0,112(sp)
bfc0100c:	03e00008 	jr	ra
bfc01010:	27bd0098 	addiu	sp,sp,152
bfc01014:	0bf002a4 	j	bfc00a90 <dhrystone+0x430>
bfc01018:	24120003 	li	s2,3
bfc0101c:	3c14bfc0 	lui	s4,0xbfc0
bfc01020:	0ff005ea 	jal	bfc017a8 <puts>
bfc01024:	26841b18 	addiu	a0,s4,6936
bfc01028:	0ff005bd 	jal	bfc016f4 <putchar>
bfc0102c:	2404000a 	li	a0,10
bfc01030:	3c12bfc0 	lui	s2,0xbfc0
bfc01034:	8fa50098 	lw	a1,152(sp)
bfc01038:	3c17bfaf 	lui	s7,0xbfaf
bfc0103c:	26441b48 	addiu	a0,s2,6984
bfc01040:	0ff00524 	jal	bfc01490 <printf>
bfc01044:	36f6fff8 	ori	s6,s7,0xfff8
bfc01048:	8ed30000 	lw	s3,0(s6)
bfc0104c:	00000000 	nop
bfc01050:	1660fde9 	bnez	s3,bfc007f8 <dhrystone+0x198>
bfc01054:	00000000 	nop
bfc01058:	0ff00654 	jal	bfc01950 <get_ns>
bfc0105c:	00000000 	nop
bfc01060:	8fb80098 	lw	t8,152(sp)
bfc01064:	00000000 	nop
bfc01068:	1f00fde7 	bgtz	t8,bfc00808 <dhrystone+0x1a8>
bfc0106c:	af828020 	sw	v0,-32736(gp)
bfc01070:	3c14bfaf 	lui	s4,0xbfaf
bfc01074:	3695fff8 	ori	s5,s4,0xfff8
bfc01078:	8ebe0000 	lw	s8,0(s5)
bfc0107c:	3c11bfc0 	lui	s1,0xbfc0
bfc01080:	3c04bfc0 	lui	a0,0xbfc0
bfc01084:	27b7003c 	addiu	s7,sp,60
bfc01088:	afb10064 	sw	s1,100(sp)
bfc0108c:	17c0fe9c 	bnez	s8,bfc00b00 <dhrystone+0x4a0>
bfc01090:	afa40068 	sw	a0,104(sp)
bfc01094:	0ff00654 	jal	bfc01950 <get_ns>
bfc01098:	00000000 	nop
bfc0109c:	0bf002c0 	j	bfc00b00 <dhrystone+0x4a0>
bfc010a0:	af828024 	sw	v0,-32732(gp)
bfc010a4:	8f858020 	lw	a1,-32736(gp)
bfc010a8:	8f828024 	lw	v0,-32732(gp)
bfc010ac:	3483f010 	ori	v1,a0,0xf010
bfc010b0:	00459023 	subu	s2,v0,a1
bfc010b4:	ac720000 	sw	s2,0(v1)
bfc010b8:	26c41f3c 	addiu	a0,s6,7996
bfc010bc:	af92801c 	sw	s2,-32740(gp)
bfc010c0:	0ff00524 	jal	bfc01490 <printf>
bfc010c4:	3c13bfc0 	lui	s3,0xbfc0
bfc010c8:	8f858024 	lw	a1,-32732(gp)
bfc010cc:	0ff00524 	jal	bfc01490 <printf>
bfc010d0:	26641f4c 	addiu	a0,s3,8012
bfc010d4:	3c0dbfc0 	lui	t5,0xbfc0
bfc010d8:	8f85801c 	lw	a1,-32740(gp)
bfc010dc:	0ff00524 	jal	bfc01490 <printf>
bfc010e0:	25a41f5c 	addiu	a0,t5,8028
bfc010e4:	8f83801c 	lw	v1,-32740(gp)
bfc010e8:	00000000 	nop
bfc010ec:	28640078 	slti	a0,v1,120
bfc010f0:	14800036 	bnez	a0,bfc011cc <dhrystone+0xb6c>
bfc010f4:	241603e8 	li	s6,1000
bfc010f8:	16c00002 	bnez	s6,bfc01104 <dhrystone+0xaa4>
bfc010fc:	0076001a 	div	zero,v1,s6
bfc01100:	0007000d 	break	0x7
bfc01104:	8fa30098 	lw	v1,152(sp)
bfc01108:	8fb80098 	lw	t8,152(sp)
bfc0110c:	000390c0 	sll	s2,v1,0x3
bfc01110:	00039a00 	sll	s3,v1,0x8
bfc01114:	02726823 	subu	t5,s3,s2
bfc01118:	000d2180 	sll	a0,t5,0x6
bfc0111c:	008d7023 	subu	t6,a0,t5
bfc01120:	01d8f021 	addu	s8,t6,t8
bfc01124:	001e7980 	sll	t7,s8,0x6
bfc01128:	3c17bfc0 	lui	s7,0xbfc0
bfc0112c:	0000c812 	mflo	t9
bfc01130:	00000000 	nop
bfc01134:	17200002 	bnez	t9,bfc01140 <dhrystone+0xae0>
bfc01138:	01f9001a 	div	zero,t7,t9
bfc0113c:	0007000d 	break	0x7
bfc01140:	00003012 	mflo	a2
bfc01144:	af868018 	sw	a2,-32744(gp)
bfc01148:	17000002 	bnez	t8,bfc01154 <dhrystone+0xaf4>
bfc0114c:	0338001a 	div	zero,t9,t8
bfc01150:	0007000d 	break	0x7
bfc01154:	0000f812 	mflo	ra
bfc01158:	af9f8014 	sw	ra,-32748(gp)
bfc0115c:	0ff00524 	jal	bfc01490 <printf>
bfc01160:	26e41fc4 	addiu	a0,s7,8132
bfc01164:	3c07bfc0 	lui	a3,0xbfc0
bfc01168:	8f858018 	lw	a1,-32744(gp)
bfc0116c:	0ff00524 	jal	bfc01490 <printf>
bfc01170:	24e41ff4 	addiu	a0,a3,8180
bfc01174:	0ff005bd 	jal	bfc016f4 <putchar>
bfc01178:	2404000a 	li	a0,10
bfc0117c:	3c08bfc0 	lui	t0,0xbfc0
bfc01180:	25041ffc 	addiu	a0,t0,8188
bfc01184:	0ff00524 	jal	bfc01490 <printf>
bfc01188:	24050032 	li	a1,50
bfc0118c:	8f898018 	lw	t1,-32744(gp)
bfc01190:	240b06dd 	li	t3,1757
bfc01194:	00095100 	sll	t2,t1,0x4
bfc01198:	0009a080 	sll	s4,t1,0x2
bfc0119c:	028a8821 	addu	s1,s4,t2
bfc011a0:	15600002 	bnez	t3,bfc011ac <dhrystone+0xb4c>
bfc011a4:	022b001a 	div	zero,s1,t3
bfc011a8:	0007000d 	break	0x7
bfc011ac:	3c0cbfc0 	lui	t4,0xbfc0
bfc011b0:	00002812 	mflo	a1
bfc011b4:	0ff00524 	jal	bfc01490 <printf>
bfc011b8:	2584201c 	addiu	a0,t4,8220
bfc011bc:	0bf003f8 	j	bfc00fe0 <dhrystone+0x980>
bfc011c0:	00000000 	nop
bfc011c4:	0bf00382 	j	bfc00e08 <dhrystone+0x7a8>
bfc011c8:	000c802b 	sltu	s0,zero,t4
bfc011cc:	3c15bfc0 	lui	s5,0xbfc0
bfc011d0:	0ff005ea 	jal	bfc017a8 <puts>
bfc011d4:	26a41f6c 	addiu	a0,s5,8044
bfc011d8:	3c05bfc0 	lui	a1,0xbfc0
bfc011dc:	0ff005ea 	jal	bfc017a8 <puts>
bfc011e0:	24a41fa4 	addiu	a0,a1,8100
bfc011e4:	0ff005bd 	jal	bfc016f4 <putchar>
bfc011e8:	2404000a 	li	a0,10
bfc011ec:	0bf003f8 	j	bfc00fe0 <dhrystone+0x980>
bfc011f0:	00000000 	nop
	...

bfc01200 <Proc_6>:
Proc_6():
bfc01200:	24030002 	li	v1,2
bfc01204:	1083001a 	beq	a0,v1,bfc01270 <Proc_6+0x70>
bfc01208:	24020001 	li	v0,1
bfc0120c:	1082000c 	beq	a0,v0,bfc01240 <Proc_6+0x40>
bfc01210:	24060003 	li	a2,3
bfc01214:	1080000f 	beqz	a0,bfc01254 <Proc_6+0x54>
bfc01218:	00000000 	nop
bfc0121c:	10830014 	beq	a0,v1,bfc01270 <Proc_6+0x70>
bfc01220:	00000000 	nop
bfc01224:	24020004 	li	v0,4
bfc01228:	1482000d 	bne	a0,v0,bfc01260 <Proc_6+0x60>
bfc0122c:	00000000 	nop
bfc01230:	03e00008 	jr	ra
bfc01234:	aca30000 	sw	v1,0(a1)
	...
bfc01240:	8f82802c 	lw	v0,-32724(gp)
bfc01244:	00000000 	nop
bfc01248:	28420065 	slti	v0,v0,101
bfc0124c:	14400004 	bnez	v0,bfc01260 <Proc_6+0x60>
bfc01250:	00000000 	nop
bfc01254:	03e00008 	jr	ra
bfc01258:	aca00000 	sw	zero,0(a1)
bfc0125c:	00000000 	nop
bfc01260:	03e00008 	jr	ra
bfc01264:	aca60000 	sw	a2,0(a1)
	...
bfc01270:	03e00008 	jr	ra
bfc01274:	aca20000 	sw	v0,0(a1)
	...

bfc01280 <Proc_7>:
Proc_7():
bfc01280:	24820002 	addiu	v0,a0,2
bfc01284:	00452021 	addu	a0,v0,a1
bfc01288:	03e00008 	jr	ra
bfc0128c:	acc40000 	sw	a0,0(a2)

bfc01290 <Proc_8>:
Proc_8():
bfc01290:	24ca0005 	addiu	t2,a2,5
bfc01294:	000a70c0 	sll	t6,t2,0x3
bfc01298:	000a7940 	sll	t7,t2,0x5
bfc0129c:	01cf6821 	addu	t5,t6,t7
bfc012a0:	000d4080 	sll	t0,t5,0x2
bfc012a4:	01a81021 	addu	v0,t5,t0
bfc012a8:	24c30006 	addiu	v1,a2,6
bfc012ac:	24cb0023 	addiu	t3,a2,35
bfc012b0:	00a27021 	addu	t6,a1,v0
bfc012b4:	0003c080 	sll	t8,v1,0x2
bfc012b8:	000b6080 	sll	t4,t3,0x2
bfc012bc:	24c90004 	addiu	t1,a2,4
bfc012c0:	000ac880 	sll	t9,t2,0x2
bfc012c4:	008c4021 	addu	t0,a0,t4
bfc012c8:	00097880 	sll	t7,t1,0x2
bfc012cc:	01d96021 	addu	t4,t6,t9
bfc012d0:	00994821 	addu	t1,a0,t9
bfc012d4:	00986821 	addu	t5,a0,t8
bfc012d8:	01d85821 	addu	t3,t6,t8
bfc012dc:	ad270000 	sw	a3,0(t1)
bfc012e0:	01cf2821 	addu	a1,t6,t7
bfc012e4:	ada70000 	sw	a3,0(t5)
bfc012e8:	ad0a0000 	sw	t2,0(t0)
bfc012ec:	ad8a0000 	sw	t2,0(t4)
bfc012f0:	ad6a0000 	sw	t2,0(t3)
bfc012f4:	8ca60000 	lw	a2,0(a1)
bfc012f8:	24040005 	li	a0,5
bfc012fc:	24c20001 	addiu	v0,a2,1
bfc01300:	aca20000 	sw	v0,0(a1)
bfc01304:	8d230000 	lw	v1,0(t1)
bfc01308:	00000000 	nop
bfc0130c:	ad830fa0 	sw	v1,4000(t4)
bfc01310:	03e00008 	jr	ra
bfc01314:	af84802c 	sw	a0,-32724(gp)
	...

bfc01320 <Func_1>:
Func_1():
bfc01320:	00042600 	sll	a0,a0,0x18
bfc01324:	00051600 	sll	v0,a1,0x18
bfc01328:	00042603 	sra	a0,a0,0x18
bfc0132c:	00022e03 	sra	a1,v0,0x18
bfc01330:	10850003 	beq	a0,a1,bfc01340 <Func_1+0x20>
bfc01334:	00000000 	nop
bfc01338:	03e00008 	jr	ra
bfc0133c:	00001021 	move	v0,zero
bfc01340:	a3848030 	sb	a0,-32720(gp)
bfc01344:	03e00008 	jr	ra
bfc01348:	24020001 	li	v0,1
bfc0134c:	00000000 	nop

bfc01350 <Func_3>:
Func_3():
bfc01350:	38820002 	xori	v0,a0,0x2
bfc01354:	03e00008 	jr	ra
bfc01358:	2c420001 	sltiu	v0,v0,1
bfc0135c:	00000000 	nop

bfc01360 <Func_2>:
Func_2():
bfc01360:	80830002 	lb	v1,2(a0)
bfc01364:	80a20003 	lb	v0,3(a1)
bfc01368:	27bdffe8 	addiu	sp,sp,-24
bfc0136c:	afbf0014 	sw	ra,20(sp)
bfc01370:	24870002 	addiu	a3,a0,2
bfc01374:	10430038 	beq	v0,v1,bfc01458 <Func_2+0xf8>
bfc01378:	24a60003 	addiu	a2,a1,3
bfc0137c:	0ff00638 	jal	bfc018e0 <strcmp>
bfc01380:	00000000 	nop
bfc01384:	1840003e 	blez	v0,bfc01480 <Func_2+0x120>
bfc01388:	00000000 	nop
bfc0138c:	8fbf0014 	lw	ra,20(sp)
bfc01390:	2403000a 	li	v1,10
bfc01394:	24020001 	li	v0,1
bfc01398:	af83802c 	sw	v1,-32724(gp)
bfc0139c:	03e00008 	jr	ra
bfc013a0:	27bd0018 	addiu	sp,sp,24
	...
bfc013b0:	a3838030 	sb	v1,-32720(gp)
bfc013b4:	80e90000 	lb	t1,0(a3)
bfc013b8:	80c30000 	lb	v1,0(a2)
bfc013bc:	00000000 	nop
bfc013c0:	1469ffee 	bne	v1,t1,bfc0137c <Func_2+0x1c>
bfc013c4:	00000000 	nop
bfc013c8:	a3838030 	sb	v1,-32720(gp)
bfc013cc:	80ea0000 	lb	t2,0(a3)
bfc013d0:	80c30000 	lb	v1,0(a2)
bfc013d4:	00000000 	nop
bfc013d8:	146affe8 	bne	v1,t2,bfc0137c <Func_2+0x1c>
bfc013dc:	00000000 	nop
bfc013e0:	a3838030 	sb	v1,-32720(gp)
bfc013e4:	80eb0000 	lb	t3,0(a3)
bfc013e8:	80c30000 	lb	v1,0(a2)
bfc013ec:	00000000 	nop
bfc013f0:	146bffe2 	bne	v1,t3,bfc0137c <Func_2+0x1c>
bfc013f4:	00000000 	nop
bfc013f8:	a3838030 	sb	v1,-32720(gp)
bfc013fc:	80ec0000 	lb	t4,0(a3)
bfc01400:	80c30000 	lb	v1,0(a2)
bfc01404:	00000000 	nop
bfc01408:	146cffdc 	bne	v1,t4,bfc0137c <Func_2+0x1c>
bfc0140c:	00000000 	nop
bfc01410:	a3838030 	sb	v1,-32720(gp)
bfc01414:	80ed0000 	lb	t5,0(a3)
bfc01418:	80c30000 	lb	v1,0(a2)
bfc0141c:	00000000 	nop
bfc01420:	146dffd6 	bne	v1,t5,bfc0137c <Func_2+0x1c>
bfc01424:	00000000 	nop
bfc01428:	a3838030 	sb	v1,-32720(gp)
bfc0142c:	80ee0000 	lb	t6,0(a3)
bfc01430:	80c30000 	lb	v1,0(a2)
bfc01434:	00000000 	nop
bfc01438:	146effd0 	bne	v1,t6,bfc0137c <Func_2+0x1c>
bfc0143c:	00000000 	nop
bfc01440:	a3838030 	sb	v1,-32720(gp)
bfc01444:	80e30000 	lb	v1,0(a3)
bfc01448:	80cf0000 	lb	t7,0(a2)
bfc0144c:	00000000 	nop
bfc01450:	15e3ffca 	bne	t7,v1,bfc0137c <Func_2+0x1c>
bfc01454:	00000000 	nop
bfc01458:	a3838030 	sb	v1,-32720(gp)
bfc0145c:	80e80000 	lb	t0,0(a3)
bfc01460:	80c30000 	lb	v1,0(a2)
bfc01464:	00000000 	nop
bfc01468:	1068ffd1 	beq	v1,t0,bfc013b0 <Func_2+0x50>
bfc0146c:	00000000 	nop
bfc01470:	0ff00638 	jal	bfc018e0 <strcmp>
bfc01474:	00000000 	nop
bfc01478:	1c40ffc4 	bgtz	v0,bfc0138c <Func_2+0x2c>
bfc0147c:	00000000 	nop
bfc01480:	8fbf0014 	lw	ra,20(sp)
bfc01484:	00001021 	move	v0,zero
bfc01488:	03e00008 	jr	ra
bfc0148c:	27bd0018 	addiu	sp,sp,24

bfc01490 <printf>:
printf():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:2
bfc01490:	27bdffc8 	addiu	sp,sp,-56
bfc01494:	afb30024 	sw	s3,36(sp)
bfc01498:	afbf0034 	sw	ra,52(sp)
bfc0149c:	afb60030 	sw	s6,48(sp)
bfc014a0:	afb5002c 	sw	s5,44(sp)
bfc014a4:	afb40028 	sw	s4,40(sp)
bfc014a8:	afb20020 	sw	s2,32(sp)
bfc014ac:	afb1001c 	sw	s1,28(sp)
bfc014b0:	afb00018 	sw	s0,24(sp)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:10
bfc014b4:	80900000 	lb	s0,0(a0)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:2
bfc014b8:	00809821 	move	s3,a0
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:8
bfc014bc:	27a4003c 	addiu	a0,sp,60
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:2
bfc014c0:	afa5003c 	sw	a1,60(sp)
bfc014c4:	afa60040 	sw	a2,64(sp)
bfc014c8:	afa70044 	sw	a3,68(sp)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:10
bfc014cc:	12000013 	beqz	s0,bfc0151c <printf+0x8c>
bfc014d0:	afa40010 	sw	a0,16(sp)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:17
bfc014d4:	3c02bfc0 	lui	v0,0xbfc0
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:9
bfc014d8:	00809021 	move	s2,a0
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:17
bfc014dc:	24562040 	addiu	s6,v0,8256
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:9
bfc014e0:	00008821 	move	s1,zero
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:13
bfc014e4:	24140025 	li	s4,37
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:79
bfc014e8:	2415000a 	li	s5,10
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:13
bfc014ec:	12140016 	beq	s0,s4,bfc01548 <printf+0xb8>
bfc014f0:	02711021 	addu	v0,s3,s1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:79
bfc014f4:	1215002f 	beq	s0,s5,bfc015b4 <printf+0x124>
bfc014f8:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:80
bfc014fc:	0ff005bd 	jal	bfc016f4 <putchar>
bfc01500:	02002021 	move	a0,s0
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:10
bfc01504:	26310001 	addiu	s1,s1,1
bfc01508:	02711021 	addu	v0,s3,s1
bfc0150c:	80500000 	lb	s0,0(v0)
bfc01510:	00000000 	nop
bfc01514:	1600fff5 	bnez	s0,bfc014ec <printf+0x5c>
bfc01518:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:84
bfc0151c:	8fbf0034 	lw	ra,52(sp)
bfc01520:	00001021 	move	v0,zero
bfc01524:	8fb60030 	lw	s6,48(sp)
bfc01528:	8fb5002c 	lw	s5,44(sp)
bfc0152c:	8fb40028 	lw	s4,40(sp)
bfc01530:	8fb30024 	lw	s3,36(sp)
bfc01534:	8fb20020 	lw	s2,32(sp)
bfc01538:	8fb1001c 	lw	s1,28(sp)
bfc0153c:	8fb00018 	lw	s0,24(sp)
bfc01540:	03e00008 	jr	ra
bfc01544:	27bd0038 	addiu	sp,sp,56
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:13
bfc01548:	80440001 	lb	a0,1(v0)
bfc0154c:	24050001 	li	a1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:17
bfc01550:	2482ffdb 	addiu	v0,a0,-37
bfc01554:	304200ff 	andi	v0,v0,0xff
bfc01558:	2c430054 	sltiu	v1,v0,84
bfc0155c:	14600005 	bnez	v1,bfc01574 <printf+0xe4>
bfc01560:	00021080 	sll	v0,v0,0x2
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:73
bfc01564:	0ff005bd 	jal	bfc016f4 <putchar>
bfc01568:	24040025 	li	a0,37
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:10
bfc0156c:	0bf00542 	j	bfc01508 <printf+0x78>
bfc01570:	26310001 	addiu	s1,s1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:17
bfc01574:	02c21021 	addu	v0,s6,v0
bfc01578:	8c430000 	lw	v1,0(v0)
bfc0157c:	00000000 	nop
bfc01580:	00600008 	jr	v1
bfc01584:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:65
bfc01588:	26310001 	addiu	s1,s1,1
bfc0158c:	02711021 	addu	v0,s3,s1
bfc01590:	80440001 	lb	a0,1(v0)
bfc01594:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:67
bfc01598:	2482ffcf 	addiu	v0,a0,-49
bfc0159c:	304200ff 	andi	v0,v0,0xff
bfc015a0:	2c420009 	sltiu	v0,v0,9
bfc015a4:	1440003f 	bnez	v0,bfc016a4 <printf+0x214>
bfc015a8:	00002821 	move	a1,zero
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:17
bfc015ac:	0bf00555 	j	bfc01554 <printf+0xc4>
bfc015b0:	2482ffdb 	addiu	v0,a0,-37
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:79
bfc015b4:	0ff005bd 	jal	bfc016f4 <putchar>
bfc015b8:	2404000d 	li	a0,13
bfc015bc:	0bf0053f 	j	bfc014fc <printf+0x6c>
bfc015c0:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:30
bfc015c4:	8e440000 	lw	a0,0(s2)
bfc015c8:	2406000a 	li	a2,10
bfc015cc:	0ff005f8 	jal	bfc017e0 <printbase>
bfc015d0:	00003821 	move	a3,zero
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:31
bfc015d4:	26520004 	addiu	s2,s2,4
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:32
bfc015d8:	0bf00541 	j	bfc01504 <printf+0x74>
bfc015dc:	26310001 	addiu	s1,s1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:20
bfc015e0:	8e440000 	lw	a0,0(s2)
bfc015e4:	0ff005c8 	jal	bfc01720 <putstring>
bfc015e8:	26310001 	addiu	s1,s1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:21
bfc015ec:	0bf00541 	j	bfc01504 <printf+0x74>
bfc015f0:	26520004 	addiu	s2,s2,4
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:56
bfc015f4:	8e440000 	lw	a0,0(s2)
bfc015f8:	24060010 	li	a2,16
bfc015fc:	0ff005f8 	jal	bfc017e0 <printbase>
bfc01600:	00003821 	move	a3,zero
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:57
bfc01604:	26520004 	addiu	s2,s2,4
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:58
bfc01608:	0bf00541 	j	bfc01504 <printf+0x74>
bfc0160c:	26310001 	addiu	s1,s1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:45
bfc01610:	8e440000 	lw	a0,0(s2)
bfc01614:	24060008 	li	a2,8
bfc01618:	0ff005f8 	jal	bfc017e0 <printbase>
bfc0161c:	00003821 	move	a3,zero
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:46
bfc01620:	26520004 	addiu	s2,s2,4
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:47
bfc01624:	0bf00541 	j	bfc01504 <printf+0x74>
bfc01628:	26310001 	addiu	s1,s1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:40
bfc0162c:	8e440000 	lw	a0,0(s2)
bfc01630:	2406000a 	li	a2,10
bfc01634:	0ff005f8 	jal	bfc017e0 <printbase>
bfc01638:	00003821 	move	a3,zero
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:41
bfc0163c:	26520004 	addiu	s2,s2,4
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:42
bfc01640:	0bf00541 	j	bfc01504 <printf+0x74>
bfc01644:	26310002 	addiu	s1,s1,2
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:35
bfc01648:	8e440000 	lw	a0,0(s2)
bfc0164c:	2406000a 	li	a2,10
bfc01650:	0ff005f8 	jal	bfc017e0 <printbase>
bfc01654:	24070001 	li	a3,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:36
bfc01658:	26520004 	addiu	s2,s2,4
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:37
bfc0165c:	0bf00541 	j	bfc01504 <printf+0x74>
bfc01660:	26310001 	addiu	s1,s1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:25
bfc01664:	8e440000 	lw	a0,0(s2)
bfc01668:	0ff005bd 	jal	bfc016f4 <putchar>
bfc0166c:	26310001 	addiu	s1,s1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:26
bfc01670:	0bf00541 	j	bfc01504 <printf+0x74>
bfc01674:	26520004 	addiu	s2,s2,4
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:50
bfc01678:	8e440000 	lw	a0,0(s2)
bfc0167c:	24060002 	li	a2,2
bfc01680:	0ff005f8 	jal	bfc017e0 <printbase>
bfc01684:	00003821 	move	a3,zero
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:51
bfc01688:	26520004 	addiu	s2,s2,4
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:52
bfc0168c:	0bf00541 	j	bfc01504 <printf+0x74>
bfc01690:	26310001 	addiu	s1,s1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:61
bfc01694:	0ff005bd 	jal	bfc016f4 <putchar>
bfc01698:	24040025 	li	a0,37
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:62
bfc0169c:	0bf00541 	j	bfc01504 <printf+0x74>
bfc016a0:	26310001 	addiu	s1,s1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:67
bfc016a4:	02713021 	addu	a2,s3,s1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:68
bfc016a8:	000510c0 	sll	v0,a1,0x3
bfc016ac:	00051840 	sll	v1,a1,0x1
bfc016b0:	00621821 	addu	v1,v1,v0
bfc016b4:	00641821 	addu	v1,v1,a0
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:67
bfc016b8:	80c40002 	lb	a0,2(a2)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:68
bfc016bc:	2465ffd0 	addiu	a1,v1,-48
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:67
bfc016c0:	2482ffcf 	addiu	v0,a0,-49
bfc016c4:	304200ff 	andi	v0,v0,0xff
bfc016c8:	2c420009 	sltiu	v0,v0,9
bfc016cc:	26310001 	addiu	s1,s1,1
bfc016d0:	1040ff9f 	beqz	v0,bfc01550 <printf+0xc0>
bfc016d4:	24c60001 	addiu	a2,a2,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:68
bfc016d8:	0bf005ab 	j	bfc016ac <printf+0x21c>
bfc016dc:	000510c0 	sll	v0,a1,0x3

bfc016e0 <tgt_putchar>:
tgt_putchar():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/putchar.c:9
bfc016e0:	3c19bfb0 	lui	t9,0xbfb0
bfc016e4:	03e00008 	jr	ra
bfc016e8:	a324fff0 	sb	a0,-16(t9)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/putchar.c:18
bfc016ec:	03e00008 	jr	ra
bfc016f0:	00000000 	nop

bfc016f4 <putchar>:
putchar():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/putchar.c:2
bfc016f4:	27bdffe8 	addiu	sp,sp,-24
bfc016f8:	afbf0014 	sw	ra,20(sp)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/putchar.c:3
bfc016fc:	0ff005b8 	jal	bfc016e0 <tgt_putchar>
bfc01700:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/putchar.c:5
bfc01704:	8fbf0014 	lw	ra,20(sp)
bfc01708:	00001021 	move	v0,zero
bfc0170c:	03e00008 	jr	ra
bfc01710:	27bd0018 	addiu	sp,sp,24
	...

bfc01720 <putstring>:
putstring():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:2
bfc01720:	27bdffe0 	addiu	sp,sp,-32
bfc01724:	afb10014 	sw	s1,20(sp)
bfc01728:	afbf001c 	sw	ra,28(sp)
bfc0172c:	afb20018 	sw	s2,24(sp)
bfc01730:	afb00010 	sw	s0,16(sp)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:4
bfc01734:	80900000 	lb	s0,0(a0)
bfc01738:	00000000 	nop
bfc0173c:	12000013 	beqz	s0,bfc0178c <putstring+0x6c>
bfc01740:	00808821 	move	s1,a0
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:6
bfc01744:	0bf005d9 	j	bfc01764 <putstring+0x44>
bfc01748:	2412000a 	li	s2,10
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:7
bfc0174c:	0ff005bd 	jal	bfc016f4 <putchar>
bfc01750:	02002021 	move	a0,s0
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:4
bfc01754:	82300000 	lb	s0,0(s1)
bfc01758:	00000000 	nop
bfc0175c:	1200000b 	beqz	s0,bfc0178c <putstring+0x6c>
bfc01760:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:6
bfc01764:	1612fff9 	bne	s0,s2,bfc0174c <putstring+0x2c>
bfc01768:	26310001 	addiu	s1,s1,1
bfc0176c:	0ff005bd 	jal	bfc016f4 <putchar>
bfc01770:	2404000d 	li	a0,13
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:7
bfc01774:	0ff005bd 	jal	bfc016f4 <putchar>
bfc01778:	02002021 	move	a0,s0
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:4
bfc0177c:	82300000 	lb	s0,0(s1)
bfc01780:	00000000 	nop
bfc01784:	1600fff7 	bnez	s0,bfc01764 <putstring+0x44>
bfc01788:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:11
bfc0178c:	8fbf001c 	lw	ra,28(sp)
bfc01790:	00001021 	move	v0,zero
bfc01794:	8fb20018 	lw	s2,24(sp)
bfc01798:	8fb10014 	lw	s1,20(sp)
bfc0179c:	8fb00010 	lw	s0,16(sp)
bfc017a0:	03e00008 	jr	ra
bfc017a4:	27bd0020 	addiu	sp,sp,32

bfc017a8 <puts>:
puts():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:15
bfc017a8:	27bdffe8 	addiu	sp,sp,-24
bfc017ac:	afbf0014 	sw	ra,20(sp)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:16
bfc017b0:	0ff005c8 	jal	bfc01720 <putstring>
bfc017b4:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:17
bfc017b8:	0ff005bd 	jal	bfc016f4 <putchar>
bfc017bc:	2404000d 	li	a0,13
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:18
bfc017c0:	0ff005bd 	jal	bfc016f4 <putchar>
bfc017c4:	2404000a 	li	a0,10
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:20
bfc017c8:	8fbf0014 	lw	ra,20(sp)
bfc017cc:	00001021 	move	v0,zero
bfc017d0:	03e00008 	jr	ra
bfc017d4:	27bd0018 	addiu	sp,sp,24
	...

bfc017e0 <printbase>:
printbase():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:2
bfc017e0:	27bdff98 	addiu	sp,sp,-104
bfc017e4:	afb30060 	sw	s3,96(sp)
bfc017e8:	afb2005c 	sw	s2,92(sp)
bfc017ec:	afbf0064 	sw	ra,100(sp)
bfc017f0:	afb10058 	sw	s1,88(sp)
bfc017f4:	afb00054 	sw	s0,84(sp)
bfc017f8:	00801821 	move	v1,a0
bfc017fc:	00a09821 	move	s3,a1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:7
bfc01800:	10e00003 	beqz	a3,bfc01810 <printbase+0x30>
bfc01804:	00c09021 	move	s2,a2
bfc01808:	0480002f 	bltz	a0,bfc018c8 <printbase+0xe8>
bfc0180c:	2404002d 	li	a0,45
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:12
bfc01810:	00608021 	move	s0,v1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:14
bfc01814:	1200000c 	beqz	s0,bfc01848 <printbase+0x68>
bfc01818:	00008821 	move	s1,zero
bfc0181c:	27a50010 	addiu	a1,sp,16
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:16
bfc01820:	16400002 	bnez	s2,bfc0182c <printbase+0x4c>
bfc01824:	0212001b 	divu	zero,s0,s2
bfc01828:	0007000d 	break	0x7
bfc0182c:	00b12021 	addu	a0,a1,s1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:14
bfc01830:	26310001 	addiu	s1,s1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:16
bfc01834:	00001010 	mfhi	v0
bfc01838:	a0820000 	sb	v0,0(a0)
bfc0183c:	00001812 	mflo	v1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:14
bfc01840:	1460fff7 	bnez	v1,bfc01820 <printbase+0x40>
bfc01844:	00608021 	move	s0,v1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:22
bfc01848:	0233102a 	slt	v0,s1,s3
bfc0184c:	10400002 	beqz	v0,bfc01858 <printbase+0x78>
bfc01850:	02201821 	move	v1,s1
bfc01854:	02601821 	move	v1,s3
bfc01858:	1060000c 	beqz	v1,bfc0188c <printbase+0xac>
bfc0185c:	2470ffff 	addiu	s0,v1,-1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:2
bfc01860:	27a20010 	addiu	v0,sp,16
bfc01864:	00509021 	addu	s2,v0,s0
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:24
bfc01868:	26020001 	addiu	v0,s0,1
bfc0186c:	0222102a 	slt	v0,s1,v0
bfc01870:	1040000e 	beqz	v0,bfc018ac <printbase+0xcc>
bfc01874:	24040030 	li	a0,48
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:25
bfc01878:	02009821 	move	s3,s0
bfc0187c:	0ff005bd 	jal	bfc016f4 <putchar>
bfc01880:	2610ffff 	addiu	s0,s0,-1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:22
bfc01884:	1660fff8 	bnez	s3,bfc01868 <printbase+0x88>
bfc01888:	2652ffff 	addiu	s2,s2,-1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:28
bfc0188c:	8fbf0064 	lw	ra,100(sp)
bfc01890:	00001021 	move	v0,zero
bfc01894:	8fb30060 	lw	s3,96(sp)
bfc01898:	8fb2005c 	lw	s2,92(sp)
bfc0189c:	8fb10058 	lw	s1,88(sp)
bfc018a0:	8fb00054 	lw	s0,84(sp)
bfc018a4:	03e00008 	jr	ra
bfc018a8:	27bd0068 	addiu	sp,sp,104
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:24
bfc018ac:	82440000 	lb	a0,0(s2)
bfc018b0:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:25
bfc018b4:	2882000a 	slti	v0,a0,10
bfc018b8:	14400007 	bnez	v0,bfc018d8 <printbase+0xf8>
bfc018bc:	02009821 	move	s3,s0
bfc018c0:	0bf0061f 	j	bfc0187c <printbase+0x9c>
bfc018c4:	24840057 	addiu	a0,a0,87
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:10
bfc018c8:	0ff005bd 	jal	bfc016f4 <putchar>
bfc018cc:	00038023 	negu	s0,v1
bfc018d0:	0bf00605 	j	bfc01814 <printbase+0x34>
bfc018d4:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:25
bfc018d8:	0bf0061e 	j	bfc01878 <printbase+0x98>
bfc018dc:	24840030 	addiu	a0,a0,48

bfc018e0 <strcmp>:
strcmp():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/strcmp.c:6
bfc018e0:	0bf0063b 	j	bfc018ec <strcmp+0xc>
bfc018e4:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/strcmp.c:8
bfc018e8:	00c02821 	move	a1,a2
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/strcmp.c:7
bfc018ec:	80a30000 	lb	v1,0(a1)
bfc018f0:	80820000 	lb	v0,0(a0)
bfc018f4:	00000000 	nop
bfc018f8:	14620005 	bne	v1,v0,bfc01910 <strcmp+0x30>
bfc018fc:	24a60001 	addiu	a2,a1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/strcmp.c:8
bfc01900:	1460fff9 	bnez	v1,bfc018e8 <strcmp+0x8>
bfc01904:	24840001 	addiu	a0,a0,1
bfc01908:	03e00008 	jr	ra
bfc0190c:	00001021 	move	v0,zero
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/strcmp.c:10
bfc01910:	90830000 	lbu	v1,0(a0)
bfc01914:	90a20000 	lbu	v0,0(a1)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/strcmp.c:11
bfc01918:	03e00008 	jr	ra
bfc0191c:	00621023 	subu	v0,v1,v0

bfc01920 <_get_count>:
_get_count():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:14
bfc01920:	3c19bfb0 	lui	t9,0xbfb0
bfc01924:	8f22e000 	lw	v0,-8192(t9)
bfc01928:	03e00008 	jr	ra
bfc0192c:	00000000 	nop

bfc01930 <get_count>:
get_count():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:19
bfc01930:	3c19bfb0 	lui	t9,0xbfb0
bfc01934:	8f22e000 	lw	v0,-8192(t9)
bfc01938:	03e00008 	jr	ra
bfc0193c:	00000000 	nop

bfc01940 <get_clock>:
get_clock():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:38
bfc01940:	3c19bfb0 	lui	t9,0xbfb0
bfc01944:	8f22e000 	lw	v0,-8192(t9)
bfc01948:	03e00008 	jr	ra
bfc0194c:	00000000 	nop

bfc01950 <get_ns>:
_get_count():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:6
bfc01950:	3c19bfb0 	lui	t9,0xbfb0
bfc01954:	8f22e000 	lw	v0,-8192(t9)
bfc01958:	00000000 	nop
bfc0195c:	000218c0 	sll	v1,v0,0x3
bfc01960:	00021040 	sll	v0,v0,0x1
get_ns():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:46
bfc01964:	03e00008 	jr	ra
bfc01968:	00431021 	addu	v0,v0,v1

bfc0196c <clock_gettime>:
clock_gettime():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:22
bfc0196c:	27bdffe8 	addiu	sp,sp,-24
bfc01970:	afbf0014 	sw	ra,20(sp)
bfc01974:	00a05021 	move	t2,a1
_get_count():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:6
bfc01978:	3c19bfb0 	lui	t9,0xbfb0
bfc0197c:	8f26e000 	lw	a2,-8192(t9)
clock_gettime():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:27
bfc01980:	3c030001 	lui	v1,0x1
bfc01984:	346386a0 	ori	v1,v1,0x86a0
bfc01988:	14600002 	bnez	v1,bfc01994 <clock_gettime+0x28>
bfc0198c:	00c3001b 	divu	zero,a2,v1
bfc01990:	0007000d 	break	0x7
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:26
bfc01994:	24080064 	li	t0,100
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:28
bfc01998:	3c054876 	lui	a1,0x4876
bfc0199c:	34a5e800 	ori	a1,a1,0xe800
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:25
bfc019a0:	000610c0 	sll	v0,a2,0x3
bfc019a4:	00063840 	sll	a3,a2,0x1
bfc019a8:	00e23821 	addu	a3,a3,v0
bfc019ac:	240203e8 	li	v0,1000
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:29
bfc019b0:	3c04bfc0 	lui	a0,0xbfc0
bfc019b4:	24842190 	addiu	a0,a0,8592
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:27
bfc019b8:	00001812 	mflo	v1
bfc019bc:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:26
bfc019c0:	15000002 	bnez	t0,bfc019cc <clock_gettime+0x60>
bfc019c4:	00c8001b 	divu	zero,a2,t0
bfc019c8:	0007000d 	break	0x7
bfc019cc:	00004012 	mflo	t0
bfc019d0:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:28
bfc019d4:	14a00002 	bnez	a1,bfc019e0 <clock_gettime+0x74>
bfc019d8:	00c5001b 	divu	zero,a2,a1
bfc019dc:	0007000d 	break	0x7
bfc019e0:	00003012 	mflo	a2
bfc019e4:	ad460000 	sw	a2,0(t2)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:27
bfc019e8:	14400002 	bnez	v0,bfc019f4 <clock_gettime+0x88>
bfc019ec:	0062001b 	divu	zero,v1,v0
bfc019f0:	0007000d 	break	0x7
bfc019f4:	00004810 	mfhi	t1
bfc019f8:	ad49000c 	sw	t1,12(t2)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:25
bfc019fc:	14400002 	bnez	v0,bfc01a08 <clock_gettime+0x9c>
bfc01a00:	00e2001b 	divu	zero,a3,v0
bfc01a04:	0007000d 	break	0x7
bfc01a08:	00002810 	mfhi	a1
bfc01a0c:	ad450004 	sw	a1,4(t2)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:26
bfc01a10:	14400002 	bnez	v0,bfc01a1c <clock_gettime+0xb0>
bfc01a14:	0102001b 	divu	zero,t0,v0
bfc01a18:	0007000d 	break	0x7
bfc01a1c:	00001810 	mfhi	v1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:29
bfc01a20:	0ff00524 	jal	bfc01490 <printf>
bfc01a24:	ad430008 	sw	v1,8(t2)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:31
bfc01a28:	8fbf0014 	lw	ra,20(sp)
bfc01a2c:	00001021 	move	v0,zero
bfc01a30:	03e00008 	jr	ra
bfc01a34:	27bd0018 	addiu	sp,sp,24
	...

Disassembly of section .data:

bfc01a40 <_fdata-0x77c>:
bfc01a40:	79726864 	0x79726864
bfc01a44:	6e6f7473 	0x6e6f7473
bfc01a48:	65742065 	0x65742065
bfc01a4c:	62207473 	0x62207473
bfc01a50:	6e696765 	0x6e696765
bfc01a54:	0000002e 	0x2e
bfc01a58:	79726864 	0x79726864
bfc01a5c:	6e6f7473 	0x6e6f7473
bfc01a60:	41502065 	0x41502065
bfc01a64:	00215353 	0x215353
bfc01a68:	79726864 	0x79726864
bfc01a6c:	6e6f7473 	0x6e6f7473
bfc01a70:	52452065 	0x52452065
bfc01a74:	21524f52 	addi	s2,t2,20306
bfc01a78:	00002121 	0x2121
bfc01a7c:	79726844 	0x79726844
bfc01a80:	6e6f7473 	0x6e6f7473
bfc01a84:	65422065 	0x65422065
bfc01a88:	6d68636e 	0x6d68636e
bfc01a8c:	2c6b7261 	sltiu	t3,v1,29281
bfc01a90:	72655620 	0x72655620
bfc01a94:	6e6f6973 	0x6e6f6973
bfc01a98:	312e3220 	andi	t6,t1,0x3220
bfc01a9c:	614c2820 	0x614c2820
bfc01aa0:	6175676e 	0x6175676e
bfc01aa4:	203a6567 	addi	k0,at,25959
bfc01aa8:	00002943 	sra	a1,zero,0x5
bfc01aac:	59524844 	0x59524844
bfc01ab0:	4e4f5453 	c3	0x4f5453
bfc01ab4:	52502045 	0x52502045
bfc01ab8:	4152474f 	0x4152474f
bfc01abc:	53202c4d 	0x53202c4d
bfc01ac0:	20454d4f 	addi	a1,v0,19791
bfc01ac4:	49525453 	0x49525453
bfc01ac8:	0000474e 	0x474e
bfc01acc:	59524844 	0x59524844
bfc01ad0:	4e4f5453 	c3	0x4f5453
bfc01ad4:	52502045 	0x52502045
bfc01ad8:	4152474f 	0x4152474f
bfc01adc:	31202c4d 	andi	zero,t1,0x2c4d
bfc01ae0:	20545327 	addi	s4,v0,21287
bfc01ae4:	49525453 	0x49525453
bfc01ae8:	0000474e 	0x474e
bfc01aec:	676f7250 	0x676f7250
bfc01af0:	206d6172 	addi	t5,v1,24946
bfc01af4:	706d6f63 	0x706d6f63
bfc01af8:	64656c69 	0x64656c69
bfc01afc:	74697720 	jalx	b1a5dc80 <data_size+0xb1a5d4f0>
bfc01b00:	72272068 	0x72272068
bfc01b04:	73696765 	0x73696765
bfc01b08:	27726574 	addiu	s2,k1,25972
bfc01b0c:	74746120 	jalx	b1d18480 <data_size+0xb1d17cf0>
bfc01b10:	75626972 	jalx	b589a5c8 <data_size+0xb5899e38>
bfc01b14:	00006574 	0x6574
bfc01b18:	676f7250 	0x676f7250
bfc01b1c:	206d6172 	addi	t5,v1,24946
bfc01b20:	706d6f63 	0x706d6f63
bfc01b24:	64656c69 	0x64656c69
bfc01b28:	74697720 	jalx	b1a5dc80 <data_size+0xb1a5d4f0>
bfc01b2c:	74756f68 	jalx	b1d5bda0 <data_size+0xb1d5b610>
bfc01b30:	65722720 	0x65722720
bfc01b34:	74736967 	jalx	b1cda59c <data_size+0xb1cd9e0c>
bfc01b38:	20277265 	addi	a3,at,29285
bfc01b3c:	72747461 	0x72747461
bfc01b40:	74756269 	jalx	b1d589a4 <data_size+0xb1d58214>
bfc01b44:	00000065 	0x65
bfc01b48:	63657845 	0x63657845
bfc01b4c:	6f697475 	0x6f697475
bfc01b50:	7473206e 	jalx	b1cc81b8 <data_size+0xb1cc7a28>
bfc01b54:	73747261 	0x73747261
bfc01b58:	6425202c 	0x6425202c
bfc01b5c:	6e757220 	0x6e757220
bfc01b60:	68742073 	0x68742073
bfc01b64:	67756f72 	0x67756f72
bfc01b68:	68442068 	0x68442068
bfc01b6c:	74737972 	jalx	b1cde5c8 <data_size+0xb1cdde38>
bfc01b70:	0a656e6f 	j	b995b9bc <data_size+0xb995b22c>
bfc01b74:	00000000 	nop
bfc01b78:	59524844 	0x59524844
bfc01b7c:	4e4f5453 	c3	0x4f5453
bfc01b80:	52502045 	0x52502045
bfc01b84:	4152474f 	0x4152474f
bfc01b88:	32202c4d 	andi	zero,s1,0x2c4d
bfc01b8c:	20444e27 	addi	a0,v0,20007
bfc01b90:	49525453 	0x49525453
bfc01b94:	0000474e 	0x474e
bfc01b98:	59524844 	0x59524844
bfc01b9c:	4e4f5453 	c3	0x4f5453
bfc01ba0:	52502045 	0x52502045
bfc01ba4:	4152474f 	0x4152474f
bfc01ba8:	33202c4d 	andi	zero,t9,0x2c4d
bfc01bac:	20445227 	addi	a0,v0,21031
bfc01bb0:	49525453 	0x49525453
bfc01bb4:	0000474e 	0x474e
bfc01bb8:	63657845 	0x63657845
bfc01bbc:	6f697475 	0x6f697475
bfc01bc0:	6e65206e 	0x6e65206e
bfc01bc4:	00007364 	0x7364
bfc01bc8:	616e6946 	0x616e6946
bfc01bcc:	6176206c 	0x6176206c
bfc01bd0:	7365756c 	0x7365756c
bfc01bd4:	20666f20 	addi	a2,v1,28448
bfc01bd8:	20656874 	addi	a1,v1,26740
bfc01bdc:	69726176 	0x69726176
bfc01be0:	656c6261 	0x656c6261
bfc01be4:	73752073 	0x73752073
bfc01be8:	69206465 	0x69206465
bfc01bec:	6874206e 	0x6874206e
bfc01bf0:	65622065 	0x65622065
bfc01bf4:	6d68636e 	0x6d68636e
bfc01bf8:	3a6b7261 	xori	t3,s3,0x7261
bfc01bfc:	00000000 	nop
bfc01c00:	5f746e49 	0x5f746e49
bfc01c04:	626f6c47 	0x626f6c47
bfc01c08:	2020203a 	addi	zero,at,8250
bfc01c0c:	20202020 	addi	zero,at,8224
bfc01c10:	20202020 	addi	zero,at,8224
bfc01c14:	0a642520 	j	b9909480 <data_size+0xb9908cf0>
bfc01c18:	00000000 	nop
bfc01c1c:	20202020 	addi	zero,at,8224
bfc01c20:	20202020 	addi	zero,at,8224
bfc01c24:	756f6873 	jalx	b5bda1cc <data_size+0xb5bd9a3c>
bfc01c28:	6220646c 	0x6220646c
bfc01c2c:	20203a65 	addi	zero,at,14949
bfc01c30:	0a642520 	j	b9909480 <data_size+0xb9908cf0>
bfc01c34:	00000000 	nop
bfc01c38:	6c6f6f42 	0x6c6f6f42
bfc01c3c:	6f6c475f 	0x6f6c475f
bfc01c40:	20203a62 	addi	zero,at,14946
bfc01c44:	20202020 	addi	zero,at,8224
bfc01c48:	20202020 	addi	zero,at,8224
bfc01c4c:	0a642520 	j	b9909480 <data_size+0xb9908cf0>
bfc01c50:	00000000 	nop
bfc01c54:	315f6843 	andi	ra,t2,0x6843
bfc01c58:	6f6c475f 	0x6f6c475f
bfc01c5c:	20203a62 	addi	zero,at,14946
bfc01c60:	20202020 	addi	zero,at,8224
bfc01c64:	20202020 	addi	zero,at,8224
bfc01c68:	0a632520 	j	b98c9480 <data_size+0xb98c8cf0>
bfc01c6c:	00000000 	nop
bfc01c70:	20202020 	addi	zero,at,8224
bfc01c74:	20202020 	addi	zero,at,8224
bfc01c78:	756f6873 	jalx	b5bda1cc <data_size+0xb5bd9a3c>
bfc01c7c:	6220646c 	0x6220646c
bfc01c80:	20203a65 	addi	zero,at,14949
bfc01c84:	0a632520 	j	b98c9480 <data_size+0xb98c8cf0>
bfc01c88:	00000000 	nop
bfc01c8c:	325f6843 	andi	ra,s2,0x6843
bfc01c90:	6f6c475f 	0x6f6c475f
bfc01c94:	20203a62 	addi	zero,at,14946
bfc01c98:	20202020 	addi	zero,at,8224
bfc01c9c:	20202020 	addi	zero,at,8224
bfc01ca0:	0a632520 	j	b98c9480 <data_size+0xb98c8cf0>
bfc01ca4:	00000000 	nop
bfc01ca8:	5f727241 	0x5f727241
bfc01cac:	6c475f31 	0x6c475f31
bfc01cb0:	385b626f 	xori	k1,v0,0x626f
bfc01cb4:	20203a5d 	addi	zero,at,14941
bfc01cb8:	20202020 	addi	zero,at,8224
bfc01cbc:	0a642520 	j	b9909480 <data_size+0xb9908cf0>
bfc01cc0:	00000000 	nop
bfc01cc4:	5f727241 	0x5f727241
bfc01cc8:	6c475f32 	0x6c475f32
bfc01ccc:	385b626f 	xori	k1,v0,0x626f
bfc01cd0:	5d375b5d 	0x5d375b5d
bfc01cd4:	2020203a 	addi	zero,at,8250
bfc01cd8:	0a642520 	j	b9909480 <data_size+0xb9908cf0>
bfc01cdc:	00000000 	nop
bfc01ce0:	5f727450 	0x5f727450
bfc01ce4:	626f6c47 	0x626f6c47
bfc01ce8:	00003e2d 	0x3e2d
bfc01cec:	74502020 	jalx	b1408080 <data_size+0xb14078f0>
bfc01cf0:	6f435f72 	0x6f435f72
bfc01cf4:	203a706d 	addi	k0,at,28781
bfc01cf8:	20202020 	addi	zero,at,8224
bfc01cfc:	20202020 	addi	zero,at,8224
bfc01d00:	0a642520 	j	b9909480 <data_size+0xb9908cf0>
bfc01d04:	00000000 	nop
bfc01d08:	20202020 	addi	zero,at,8224
bfc01d0c:	20202020 	addi	zero,at,8224
bfc01d10:	756f6873 	jalx	b5bda1cc <data_size+0xb5bd9a3c>
bfc01d14:	6220646c 	0x6220646c
bfc01d18:	20203a65 	addi	zero,at,14949
bfc01d1c:	6d692820 	0x6d692820
bfc01d20:	6d656c70 	0x6d656c70
bfc01d24:	61746e65 	0x61746e65
bfc01d28:	6e6f6974 	0x6e6f6974
bfc01d2c:	7065642d 	0x7065642d
bfc01d30:	65646e65 	0x65646e65
bfc01d34:	0029746e 	0x29746e
bfc01d38:	69442020 	0x69442020
bfc01d3c:	3a726373 	xori	s2,s3,0x6373
bfc01d40:	20202020 	addi	zero,at,8224
bfc01d44:	20202020 	addi	zero,at,8224
bfc01d48:	20202020 	addi	zero,at,8224
bfc01d4c:	0a642520 	j	b9909480 <data_size+0xb9908cf0>
bfc01d50:	00000000 	nop
bfc01d54:	6e452020 	0x6e452020
bfc01d58:	435f6d75 	c0	0x15f6d75
bfc01d5c:	3a706d6f 	xori	s0,s3,0x6d6f
bfc01d60:	20202020 	addi	zero,at,8224
bfc01d64:	20202020 	addi	zero,at,8224
bfc01d68:	0a642520 	j	b9909480 <data_size+0xb9908cf0>
bfc01d6c:	00000000 	nop
bfc01d70:	6e492020 	0x6e492020
bfc01d74:	6f435f74 	0x6f435f74
bfc01d78:	203a706d 	addi	k0,at,28781
bfc01d7c:	20202020 	addi	zero,at,8224
bfc01d80:	20202020 	addi	zero,at,8224
bfc01d84:	0a642520 	j	b9909480 <data_size+0xb9908cf0>
bfc01d88:	00000000 	nop
bfc01d8c:	74532020 	jalx	b14c8080 <data_size+0xb14c78f0>
bfc01d90:	6f435f72 	0x6f435f72
bfc01d94:	203a706d 	addi	k0,at,28781
bfc01d98:	20202020 	addi	zero,at,8224
bfc01d9c:	20202020 	addi	zero,at,8224
bfc01da0:	0a732520 	j	b9cc9480 <data_size+0xb9cc8cf0>
bfc01da4:	00000000 	nop
bfc01da8:	20202020 	addi	zero,at,8224
bfc01dac:	20202020 	addi	zero,at,8224
bfc01db0:	756f6873 	jalx	b5bda1cc <data_size+0xb5bd9a3c>
bfc01db4:	6220646c 	0x6220646c
bfc01db8:	20203a65 	addi	zero,at,14949
bfc01dbc:	52484420 	0x52484420
bfc01dc0:	4f545359 	c3	0x1545359
bfc01dc4:	5020454e 	0x5020454e
bfc01dc8:	52474f52 	0x52474f52
bfc01dcc:	202c4d41 	addi	t4,at,19777
bfc01dd0:	454d4f53 	0x454d4f53
bfc01dd4:	52545320 	0x52545320
bfc01dd8:	00474e49 	0x474e49
bfc01ddc:	7478654e 	jalx	b1e19538 <data_size+0xb1e18da8>
bfc01de0:	7274505f 	0x7274505f
bfc01de4:	6f6c475f 	0x6f6c475f
bfc01de8:	003e2d62 	0x3e2d62
bfc01dec:	20202020 	addi	zero,at,8224
bfc01df0:	20202020 	addi	zero,at,8224
bfc01df4:	756f6873 	jalx	b5bda1cc <data_size+0xb5bd9a3c>
bfc01df8:	6220646c 	0x6220646c
bfc01dfc:	20203a65 	addi	zero,at,14949
bfc01e00:	6d692820 	0x6d692820
bfc01e04:	6d656c70 	0x6d656c70
bfc01e08:	61746e65 	0x61746e65
bfc01e0c:	6e6f6974 	0x6e6f6974
bfc01e10:	7065642d 	0x7065642d
bfc01e14:	65646e65 	0x65646e65
bfc01e18:	2c29746e 	sltiu	t1,at,29806
bfc01e1c:	6d617320 	0x6d617320
bfc01e20:	73612065 	0x73612065
bfc01e24:	6f626120 	0x6f626120
bfc01e28:	00006576 	0x6576
bfc01e2c:	5f746e49 	0x5f746e49
bfc01e30:	6f4c5f31 	0x6f4c5f31
bfc01e34:	20203a63 	addi	zero,at,14947
bfc01e38:	20202020 	addi	zero,at,8224
bfc01e3c:	20202020 	addi	zero,at,8224
bfc01e40:	0a642520 	j	b9909480 <data_size+0xb9908cf0>
bfc01e44:	00000000 	nop
bfc01e48:	5f746e49 	0x5f746e49
bfc01e4c:	6f4c5f32 	0x6f4c5f32
bfc01e50:	20203a63 	addi	zero,at,14947
bfc01e54:	20202020 	addi	zero,at,8224
bfc01e58:	20202020 	addi	zero,at,8224
bfc01e5c:	0a642520 	j	b9909480 <data_size+0xb9908cf0>
bfc01e60:	00000000 	nop
bfc01e64:	5f746e49 	0x5f746e49
bfc01e68:	6f4c5f33 	0x6f4c5f33
bfc01e6c:	20203a63 	addi	zero,at,14947
bfc01e70:	20202020 	addi	zero,at,8224
bfc01e74:	20202020 	addi	zero,at,8224
bfc01e78:	0a642520 	j	b9909480 <data_size+0xb9908cf0>
bfc01e7c:	00000000 	nop
bfc01e80:	6d756e45 	0x6d756e45
bfc01e84:	636f4c5f 	0x636f4c5f
bfc01e88:	2020203a 	addi	zero,at,8250
bfc01e8c:	20202020 	addi	zero,at,8224
bfc01e90:	20202020 	addi	zero,at,8224
bfc01e94:	0a642520 	j	b9909480 <data_size+0xb9908cf0>
bfc01e98:	00000000 	nop
bfc01e9c:	5f727453 	0x5f727453
bfc01ea0:	6f4c5f31 	0x6f4c5f31
bfc01ea4:	20203a63 	addi	zero,at,14947
bfc01ea8:	20202020 	addi	zero,at,8224
bfc01eac:	20202020 	addi	zero,at,8224
bfc01eb0:	0a732520 	j	b9cc9480 <data_size+0xb9cc8cf0>
bfc01eb4:	00000000 	nop
bfc01eb8:	20202020 	addi	zero,at,8224
bfc01ebc:	20202020 	addi	zero,at,8224
bfc01ec0:	756f6873 	jalx	b5bda1cc <data_size+0xb5bd9a3c>
bfc01ec4:	6220646c 	0x6220646c
bfc01ec8:	20203a65 	addi	zero,at,14949
bfc01ecc:	52484420 	0x52484420
bfc01ed0:	4f545359 	c3	0x1545359
bfc01ed4:	5020454e 	0x5020454e
bfc01ed8:	52474f52 	0x52474f52
bfc01edc:	202c4d41 	addi	t4,at,19777
bfc01ee0:	54532731 	0x54532731
bfc01ee4:	52545320 	0x52545320
bfc01ee8:	00474e49 	0x474e49
bfc01eec:	5f727453 	0x5f727453
bfc01ef0:	6f4c5f32 	0x6f4c5f32
bfc01ef4:	20203a63 	addi	zero,at,14947
bfc01ef8:	20202020 	addi	zero,at,8224
bfc01efc:	20202020 	addi	zero,at,8224
bfc01f00:	0a732520 	j	b9cc9480 <data_size+0xb9cc8cf0>
bfc01f04:	00000000 	nop
bfc01f08:	20202020 	addi	zero,at,8224
bfc01f0c:	20202020 	addi	zero,at,8224
bfc01f10:	756f6873 	jalx	b5bda1cc <data_size+0xb5bd9a3c>
bfc01f14:	6220646c 	0x6220646c
bfc01f18:	20203a65 	addi	zero,at,14949
bfc01f1c:	52484420 	0x52484420
bfc01f20:	4f545359 	c3	0x1545359
bfc01f24:	5020454e 	0x5020454e
bfc01f28:	52474f52 	0x52474f52
bfc01f2c:	202c4d41 	addi	t4,at,19777
bfc01f30:	444e2732 	0x444e2732
bfc01f34:	52545320 	0x52545320
bfc01f38:	00474e49 	0x474e49
bfc01f3c:	69676542 	0x69676542
bfc01f40:	736e206e 	0x736e206e
bfc01f44:	6c25203a 	0x6c25203a
bfc01f48:	00000a75 	0xa75
bfc01f4c:	20646e45 	addi	a0,v1,28229
bfc01f50:	203a736e 	addi	k0,at,29550
bfc01f54:	0a756c25 	j	b9d5b094 <data_size+0xb9d5a904>
bfc01f58:	00000000 	nop
bfc01f5c:	61746f54 	0x61746f54
bfc01f60:	736e206c 	0x736e206c
bfc01f64:	6c25203a 	0x6c25203a
bfc01f68:	00000a75 	0xa75
bfc01f6c:	7361654d 	0x7361654d
bfc01f70:	64657275 	0x64657275
bfc01f74:	6d697420 	0x6d697420
bfc01f78:	6f742065 	0x6f742065
bfc01f7c:	6d73206f 	0x6d73206f
bfc01f80:	206c6c61 	addi	t4,v1,27745
bfc01f84:	6f206f74 	0x6f206f74
bfc01f88:	69617462 	0x69617462
bfc01f8c:	656d206e 	0x656d206e
bfc01f90:	6e696e61 	0x6e696e61
bfc01f94:	6c756667 	0x6c756667
bfc01f98:	73657220 	0x73657220
bfc01f9c:	73746c75 	0x73746c75
bfc01fa0:	00000000 	nop
bfc01fa4:	61656c50 	0x61656c50
bfc01fa8:	69206573 	0x69206573
bfc01fac:	6572636e 	0x6572636e
bfc01fb0:	20657361 	addi	a1,v1,29537
bfc01fb4:	626d756e 	0x626d756e
bfc01fb8:	6f207265 	0x6f207265
bfc01fbc:	75722066 	jalx	b5c88198 <data_size+0xb5c87a08>
bfc01fc0:	0000736e 	0x736e
bfc01fc4:	79726844 	0x79726844
bfc01fc8:	6e6f7473 	0x6e6f7473
bfc01fcc:	70207365 	0x70207365
bfc01fd0:	53207265 	0x53207265
bfc01fd4:	6e6f6365 	0x6e6f6365
bfc01fd8:	20203a64 	addi	zero,at,14948
bfc01fdc:	20202020 	addi	zero,at,8224
bfc01fe0:	20202020 	addi	zero,at,8224
bfc01fe4:	20202020 	addi	zero,at,8224
bfc01fe8:	20202020 	addi	zero,at,8224
bfc01fec:	20202020 	addi	zero,at,8224
bfc01ff0:	00000000 	nop
bfc01ff4:	20753125 	addi	s5,v1,12581
bfc01ff8:	0000000a 	0xa
bfc01ffc:	20656854 	addi	a1,v1,26708
bfc02000:	20555043 	addi	s5,v0,20547
bfc02004:	71657246 	0x71657246
bfc02008:	756f7920 	jalx	b5bde480 <data_size+0xb5bddcf0>
bfc0200c:	74657320 	jalx	b195cc80 <data_size+0xb195c4f0>
bfc02010:	20736920 	addi	s3,v1,26912
bfc02014:	4d756c25 	0x4d756c25
bfc02018:	000a7a48 	0xa7a48
bfc0201c:	44206f53 	0x44206f53
bfc02020:	5350494d 	0x5350494d
bfc02024:	5a484d2f 	0x5a484d2f
bfc02028:	25203a20 	addiu	zero,t1,14880
bfc0202c:	312f756c 	andi	t7,t1,0x756c
bfc02030:	0a303030 	j	b8c0c0c0 <data_size+0xb8c0b930>
bfc02034:	00000000 	nop
	...
bfc02040:	bfc01694 	0xbfc01694
bfc02044:	bfc01564 	0xbfc01564
bfc02048:	bfc01564 	0xbfc01564
bfc0204c:	bfc01564 	0xbfc01564
bfc02050:	bfc01564 	0xbfc01564
bfc02054:	bfc01564 	0xbfc01564
bfc02058:	bfc01564 	0xbfc01564
bfc0205c:	bfc01564 	0xbfc01564
bfc02060:	bfc01564 	0xbfc01564
bfc02064:	bfc01564 	0xbfc01564
bfc02068:	bfc01564 	0xbfc01564
bfc0206c:	bfc01588 	0xbfc01588
bfc02070:	bfc01598 	0xbfc01598
bfc02074:	bfc01598 	0xbfc01598
bfc02078:	bfc01598 	0xbfc01598
bfc0207c:	bfc01598 	0xbfc01598
bfc02080:	bfc01598 	0xbfc01598
bfc02084:	bfc01598 	0xbfc01598
bfc02088:	bfc01598 	0xbfc01598
bfc0208c:	bfc01598 	0xbfc01598
bfc02090:	bfc01598 	0xbfc01598
bfc02094:	bfc01564 	0xbfc01564
bfc02098:	bfc01564 	0xbfc01564
bfc0209c:	bfc01564 	0xbfc01564
bfc020a0:	bfc01564 	0xbfc01564
bfc020a4:	bfc01564 	0xbfc01564
bfc020a8:	bfc01564 	0xbfc01564
bfc020ac:	bfc01564 	0xbfc01564
bfc020b0:	bfc01564 	0xbfc01564
bfc020b4:	bfc01564 	0xbfc01564
bfc020b8:	bfc01564 	0xbfc01564
bfc020bc:	bfc01564 	0xbfc01564
bfc020c0:	bfc01564 	0xbfc01564
bfc020c4:	bfc01564 	0xbfc01564
bfc020c8:	bfc01564 	0xbfc01564
bfc020cc:	bfc01564 	0xbfc01564
bfc020d0:	bfc01564 	0xbfc01564
bfc020d4:	bfc01564 	0xbfc01564
bfc020d8:	bfc01564 	0xbfc01564
bfc020dc:	bfc01564 	0xbfc01564
bfc020e0:	bfc01564 	0xbfc01564
bfc020e4:	bfc01564 	0xbfc01564
bfc020e8:	bfc01564 	0xbfc01564
bfc020ec:	bfc01564 	0xbfc01564
bfc020f0:	bfc01564 	0xbfc01564
bfc020f4:	bfc01564 	0xbfc01564
bfc020f8:	bfc01564 	0xbfc01564
bfc020fc:	bfc01564 	0xbfc01564
bfc02100:	bfc01564 	0xbfc01564
bfc02104:	bfc01564 	0xbfc01564
bfc02108:	bfc01564 	0xbfc01564
bfc0210c:	bfc01564 	0xbfc01564
bfc02110:	bfc01564 	0xbfc01564
bfc02114:	bfc01564 	0xbfc01564
bfc02118:	bfc01564 	0xbfc01564
bfc0211c:	bfc01564 	0xbfc01564
bfc02120:	bfc01564 	0xbfc01564
bfc02124:	bfc01564 	0xbfc01564
bfc02128:	bfc01564 	0xbfc01564
bfc0212c:	bfc01564 	0xbfc01564
bfc02130:	bfc01564 	0xbfc01564
bfc02134:	bfc01678 	0xbfc01678
bfc02138:	bfc01664 	0xbfc01664
bfc0213c:	bfc01648 	0xbfc01648
bfc02140:	bfc01564 	0xbfc01564
bfc02144:	bfc01564 	0xbfc01564
bfc02148:	bfc01564 	0xbfc01564
bfc0214c:	bfc01564 	0xbfc01564
bfc02150:	bfc01564 	0xbfc01564
bfc02154:	bfc01564 	0xbfc01564
bfc02158:	bfc01564 	0xbfc01564
bfc0215c:	bfc0162c 	0xbfc0162c
bfc02160:	bfc01564 	0xbfc01564
bfc02164:	bfc01564 	0xbfc01564
bfc02168:	bfc01610 	0xbfc01610
bfc0216c:	bfc015f4 	0xbfc015f4
bfc02170:	bfc01564 	0xbfc01564
bfc02174:	bfc01564 	0xbfc01564
bfc02178:	bfc015e0 	0xbfc015e0
bfc0217c:	bfc01564 	0xbfc01564
bfc02180:	bfc015c4 	0xbfc015c4
bfc02184:	bfc01564 	0xbfc01564
bfc02188:	bfc01564 	0xbfc01564
bfc0218c:	bfc015f4 	0xbfc015f4
bfc02190:	636f6c63 	0x636f6c63
bfc02194:	736e206b 	0x736e206b
bfc02198:	2c64253d 	sltiu	a0,v1,9533
bfc0219c:	3d636573 	0x3d636573
bfc021a0:	000a6425 	0xa6425
bfc021a4:	b8007f00 	swr	zero,32512(zero)
	...

bfc021bc <_fdata>:
_fdata():
bfc021bc:	00000000 	nop

bfc021c0 <__CTOR_LIST__>:
	...

bfc021c8 <__CTOR_END__>:
	...

Disassembly of section .sbss:

bfc021d0 <Reg>:
bfc021d0:	00000000 	nop

bfc021d4 <Microseconds>:
bfc021d4:	00000000 	nop

bfc021d8 <Dhrystones_Per_Second>:
bfc021d8:	00000000 	nop

bfc021dc <User_Time>:
bfc021dc:	00000000 	nop

bfc021e0 <Begin_Time>:
bfc021e0:	00000000 	nop

bfc021e4 <End_Time>:
bfc021e4:	00000000 	nop

bfc021e8 <Next_Ptr_Glob>:
bfc021e8:	00000000 	nop

bfc021ec <Int_Glob>:
bfc021ec:	00000000 	nop

bfc021f0 <Ch_1_Glob>:
	...

bfc021f1 <Ch_2_Glob>:
bfc021f1:	0000      	addiu	s0,sp,0
	...

bfc021f4 <Ptr_Glob>:
bfc021f4:	00000000 	nop

bfc021f8 <Bool_Glob>:
bfc021f8:	00000000 	nop

Disassembly of section .bss:

bfc02200 <Arr_2_Glob>:
	...

bfc04910 <Next_Rec_Glob>:
	...

bfc04940 <Rec_Glob>:
	...

bfc04970 <Arr_1_Glob>:
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	0x1c
   4:	00000002 	srl	zero,zero,0x0
   8:	00040000 	sll	zero,a0,0x0
   c:	00000000 	nop
  10:	bfc00000 	0xbfc00000
  14:	0000038c 	syscall	0xe
	...
  20:	0000001c 	0x1c
  24:	00660002 	0x660002
  28:	00040000 	sll	zero,a0,0x0
  2c:	00000000 	nop
  30:	bfc01490 	0xbfc01490
  34:	00000250 	0x250
	...
  40:	0000001c 	0x1c
  44:	01330002 	0x1330002
  48:	00040000 	sll	zero,a0,0x0
  4c:	00000000 	nop
  50:	bfc016e0 	0xbfc016e0
  54:	00000034 	0x34
	...
  60:	0000001c 	0x1c
  64:	01bf0002 	0x1bf0002
  68:	00040000 	sll	zero,a0,0x0
  6c:	00000000 	nop
  70:	bfc01720 	0xbfc01720
  74:	000000b8 	0xb8
	...
  80:	0000001c 	0x1c
  84:	026e0002 	0x26e0002
  88:	00040000 	sll	zero,a0,0x0
  8c:	00000000 	nop
  90:	bfc017e0 	0xbfc017e0
  94:	00000100 	sll	zero,zero,0x4
	...
  a0:	0000001c 	0x1c
  a4:	03690002 	0x3690002
  a8:	00040000 	sll	zero,a0,0x0
  ac:	00000000 	nop
  b0:	bfc018e0 	0xbfc018e0
  b4:	00000040 	sll	zero,zero,0x1
	...
  c0:	0000001c 	0x1c
  c4:	03f00002 	0x3f00002
  c8:	00040000 	sll	zero,a0,0x0
  cc:	00000000 	nop
  d0:	bfc01920 	0xbfc01920
  d4:	00000118 	0x118
	...

Disassembly of section .debug_pubnames:

00000000 <.debug_pubnames>:
   0:	00000019 	multu	zero,zero
   4:	00660002 	0x660002
   8:	00cd0000 	0xcd0000
   c:	00350000 	0x350000
  10:	72700000 	0x72700000
  14:	66746e69 	0x66746e69
  18:	00000000 	nop
  1c:	00002a00 	sll	a1,zero,0x8
  20:	33000200 	andi	zero,t8,0x200
  24:	8c000001 	lw	zero,1(zero)
  28:	33000000 	andi	zero,t8,0x0
  2c:	74000000 	jalx	0 <data_size-0x790>
  30:	705f7467 	0x705f7467
  34:	68637475 	0x68637475
  38:	60007261 	0x60007261
  3c:	70000000 	0x70000000
  40:	68637475 	0x68637475
  44:	00007261 	0x7261
  48:	25000000 	addiu	zero,t0,0
  4c:	02000000 	0x2000000
  50:	0001bf00 	sll	s7,at,0x1c
  54:	0000af00 	sll	s5,zero,0x1c
  58:	00003300 	sll	a2,zero,0xc
  5c:	74757000 	jalx	1d5c000 <data_size+0x1d5b870>
  60:	69727473 	0x69727473
  64:	8300676e 	lb	zero,26478(t8)
  68:	70000000 	0x70000000
  6c:	00737475 	0x737475
  70:	00000000 	nop
  74:	0000001c 	0x1c
  78:	026e0002 	0x26e0002
  7c:	00fb0000 	0xfb0000
  80:	00330000 	0x330000
  84:	72700000 	0x72700000
  88:	62746e69 	0x62746e69
  8c:	00657361 	0x657361
  90:	00000000 	nop
  94:	00000019 	multu	zero,zero
  98:	03690002 	0x3690002
  9c:	00870000 	0x870000
  a0:	00330000 	0x330000
  a4:	74730000 	jalx	1cc0000 <data_size+0x1cbf870>
  a8:	706d6372 	0x706d6372
  ac:	00000000 	nop
  b0:	00005600 	sll	t2,zero,0x18
  b4:	f0000200 	0xf0000200
  b8:	c5000003 	lwc1	$f0,3(t0)
  bc:	a7000001 	sh	zero,1(t8)
  c0:	5f000000 	0x5f000000
  c4:	5f746567 	0x5f746567
  c8:	6e756f63 	0x6e756f63
  cc:	00c40074 	0xc40074
  d0:	65670000 	0x65670000
  d4:	6f635f74 	0x6f635f74
  d8:	00746e75 	0x746e75
  dc:	000000de 	0xde
  e0:	5f746567 	0x5f746567
  e4:	636f6c63 	0x636f6c63
  e8:	0106006b 	0x106006b
  ec:	65670000 	0x65670000
  f0:	736e5f74 	0x736e5f74
  f4:	00015200 	sll	t2,at,0x8
  f8:	6f6c6300 	0x6f6c6300
  fc:	675f6b63 	0x675f6b63
 100:	69747465 	0x69747465
 104:	0000656d 	0x656d
 108:	Address 0x0000000000000108 is out of bounds.


Disassembly of section .pdr:

00000000 <.pdr>:
   0:	bfc00390 	0xbfc00390
   4:	80000000 	lb	zero,0(zero)
   8:	fffffffc 	0xfffffffc
	...
  14:	00000018 	mult	zero,zero
  18:	0000001d 	0x1d
  1c:	0000001f 	0x1f
  20:	bfc00430 	0xbfc00430
	...
  38:	0000001d 	0x1d
  3c:	0000001f 	0x1f
  40:	bfc00470 	0xbfc00470
	...
  58:	0000001d 	0x1d
  5c:	0000001f 	0x1f
  60:	bfc004a0 	0xbfc004a0
	...
  78:	0000001d 	0x1d
  7c:	0000001f 	0x1f
  80:	bfc004b0 	0xbfc004b0
	...
  98:	0000001d 	0x1d
  9c:	0000001f 	0x1f
  a0:	bfc004e0 	0xbfc004e0
  a4:	80030000 	lb	v1,0(zero)
  a8:	fffffffc 	0xfffffffc
	...
  b4:	00000020 	add	zero,zero,zero
  b8:	0000001d 	0x1d
  bc:	0000001f 	0x1f
  c0:	bfc00660 	0xbfc00660
  c4:	c0ff0000 	lwc0	$31,0(a3)
  c8:	fffffffc 	0xfffffffc
	...
  d4:	00000098 	0x98
  d8:	0000001d 	0x1d
  dc:	0000001f 	0x1f
  e0:	bfc01200 	0xbfc01200
	...
  f8:	0000001d 	0x1d
  fc:	0000001f 	0x1f
 100:	bfc01280 	0xbfc01280
	...
 118:	0000001d 	0x1d
 11c:	0000001f 	0x1f
 120:	bfc01290 	0xbfc01290
	...
 138:	0000001d 	0x1d
 13c:	0000001f 	0x1f
 140:	bfc01320 	0xbfc01320
	...
 158:	0000001d 	0x1d
 15c:	0000001f 	0x1f
 160:	bfc01350 	0xbfc01350
	...
 178:	0000001d 	0x1d
 17c:	0000001f 	0x1f
 180:	bfc01360 	0xbfc01360
 184:	80000000 	lb	zero,0(zero)
 188:	fffffffc 	0xfffffffc
	...
 194:	00000018 	mult	zero,zero
 198:	0000001d 	0x1d
 19c:	0000001f 	0x1f
 1a0:	bfc01490 	0xbfc01490
 1a4:	807f0000 	lb	ra,0(v1)
 1a8:	fffffffc 	0xfffffffc
	...
 1b4:	00000038 	0x38
 1b8:	0000001d 	0x1d
 1bc:	0000001f 	0x1f
 1c0:	bfc016e0 	0xbfc016e0
	...
 1d8:	0000001d 	0x1d
 1dc:	0000001f 	0x1f
 1e0:	bfc016f4 	0xbfc016f4
 1e4:	80000000 	lb	zero,0(zero)
 1e8:	fffffffc 	0xfffffffc
	...
 1f4:	00000018 	mult	zero,zero
 1f8:	0000001d 	0x1d
 1fc:	0000001f 	0x1f
 200:	bfc01720 	0xbfc01720
 204:	80070000 	lb	a3,0(zero)
 208:	fffffffc 	0xfffffffc
	...
 214:	00000020 	add	zero,zero,zero
 218:	0000001d 	0x1d
 21c:	0000001f 	0x1f
 220:	bfc017a8 	0xbfc017a8
 224:	80000000 	lb	zero,0(zero)
 228:	fffffffc 	0xfffffffc
	...
 234:	00000018 	mult	zero,zero
 238:	0000001d 	0x1d
 23c:	0000001f 	0x1f
 240:	bfc017e0 	0xbfc017e0
 244:	800f0000 	lb	t7,0(zero)
 248:	fffffffc 	0xfffffffc
	...
 254:	00000068 	0x68
 258:	0000001d 	0x1d
 25c:	0000001f 	0x1f
 260:	bfc018e0 	0xbfc018e0
	...
 278:	0000001d 	0x1d
 27c:	0000001f 	0x1f
 280:	bfc01920 	0xbfc01920
	...
 298:	0000001d 	0x1d
 29c:	0000001f 	0x1f
 2a0:	bfc01930 	0xbfc01930
	...
 2b8:	0000001d 	0x1d
 2bc:	0000001f 	0x1f
 2c0:	bfc01940 	0xbfc01940
	...
 2d8:	0000001d 	0x1d
 2dc:	0000001f 	0x1f
 2e0:	bfc01950 	0xbfc01950
	...
 2f8:	0000001d 	0x1d
 2fc:	0000001f 	0x1f
 300:	bfc0196c 	0xbfc0196c
 304:	80000000 	lb	zero,0(zero)
 308:	fffffffc 	0xfffffffc
	...
 314:	00000018 	mult	zero,zero
 318:	0000001d 	0x1d
 31c:	0000001f 	0x1f

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	0000005a 	0x5a
   4:	001e0002 	srl	zero,s8,0x0
   8:	01010000 	0x1010000
   c:	000d0efb 	0xd0efb
  10:	01010101 	0x1010101
  14:	01000000 	0x1000000
  18:	00010000 	sll	zero,at,0x0
  1c:	72617473 	0x72617473
  20:	00532e74 	0x532e74
  24:	00000000 	nop
  28:	00020500 	sll	zero,v0,0x14
  2c:	03bfc000 	0x3bfc000
  30:	e508010e 	swc1	$f8,270(t0)
  34:	834b4b83 	lb	t3,19331(k0)
  38:	4b4b4b86 	c2	0x14b4b86
  3c:	4b4b834e 	c2	0x14b834e
  40:	4c834c83 	0x4c834c83
  44:	0184024b 	0x184024b
  48:	834b4b16 	lb	t3,19222(k0)
  4c:	4b4c4b4b 	c2	0x14c4b4b
  50:	024b4b4b 	0x24b4b4b
  54:	4b1904d4 	c2	0x11904d4
  58:	0004024b 	0x4024b
  5c:	00a80101 	0xa80101
  60:	00020000 	sll	zero,v0,0x0
  64:	0000001f 	0x1f
  68:	0efb0101 	jal	bec0404 <data_size+0xbebfc74>
  6c:	0101000d 	break	0x101
  70:	00000101 	0x101
  74:	00000100 	sll	zero,zero,0x4
  78:	72700001 	0x72700001
  7c:	66746e69 	0x66746e69
  80:	0000632e 	0x632e
  84:	00000000 	nop
  88:	14900205 	bne	a0,s0,8a0 <data_size+0x110>
  8c:	0213bfc0 	0x213bfc0
  90:	78031a24 	0x78031a24
  94:	7a03504a 	0x7a03504a
  98:	0389c24a 	0x389c24a
  9c:	03524a78 	0x3524a78
  a0:	034e4a78 	0x34e4a78
  a4:	034a00c2 	0x34a00c2
  a8:	034a7fbe 	0x34a7fbe
  ac:	838200c2 	lb	v0,194(gp)
  b0:	827fba03 	lb	ra,-17917(s3)
  b4:	0800ca03 	j	3280c <data_size+0x3207c>
  b8:	7fb90374 	0x7fb90374
  bc:	86012c02 	lh	at,11266(s0)
  c0:	3c083803 	lui	t0,0x3803
  c4:	89824103 	lwl	v0,16643(t4)
  c8:	3c083003 	lui	t0,0x3003
  cc:	084e03f4 	j	1380fd0 <data_size+0x1380840>
  d0:	823e033c 	lb	s8,828(s1)
  d4:	f3f24f03 	0xf3f24f03
  d8:	8274034b 	lb	s4,843(s3)
  dc:	822303bb 	lb	v1,955(s1)
  e0:	73034bf3 	0x73034bf3
  e4:	034bf382 	0x34bf382
  e8:	4bf38279 	c2	0x1f38279
  ec:	f3827903 	0xf3827903
  f0:	8274034b 	lb	s4,843(s3)
  f4:	821803bb 	lb	t8,955(s0)
  f8:	09034bf3 	j	40d2fcc <data_size+0x40d283c>
  fc:	4b878382 	c2	0x1878382
 100:	08494bf1 	j	1252fc4 <data_size+0x1252834>
 104:	00080275 	0x80275
 108:	003c0101 	0x3c0101
 10c:	00020000 	sll	zero,v0,0x0
 110:	00000020 	add	zero,zero,zero
 114:	0efb0101 	jal	bec0404 <data_size+0xbebfc74>
 118:	0101000d 	break	0x101
 11c:	00000101 	0x101
 120:	00000100 	sll	zero,zero,0x4
 124:	75700001 	jalx	5c00004 <data_size+0x5bff874>
 128:	61686374 	0x61686374
 12c:	00632e72 	0x632e72
 130:	00000000 	nop
 134:	e0020500 	swc0	$2,1280(zero)
 138:	19bfc016 	0x19bfc016
 13c:	ba090313 	swr	t1,787(s0)
 140:	83827003 	lb	v0,28675(gp)
 144:	00100284 	0x100284
 148:	003f0101 	0x3f0101
 14c:	00020000 	sll	zero,v0,0x0
 150:	0000001d 	0x1d
 154:	0efb0101 	jal	bec0404 <data_size+0xbebfc74>
 158:	0101000d 	break	0x101
 15c:	00000101 	0x101
 160:	00000100 	sll	zero,zero,0x4
 164:	75700001 	jalx	5c00004 <data_size+0x5bff874>
 168:	632e7374 	0x632e7374
 16c:	00000000 	nop
 170:	02050000 	0x2050000
 174:	bfc01720 	0xbfc01720
 178:	f43e0813 	0xf43e0813
 17c:	f3f47f83 	0xf3f47f83
 180:	b008f97f 	0xb008f97f
 184:	84838383 	lh	v1,-31869(a0)
 188:	01001002 	0x1001002
 18c:	00005301 	0x5301
 190:	22000200 	addi	zero,s0,512
 194:	01000000 	0x1000000
 198:	0d0efb01 	jal	43bec04 <data_size+0x43be474>
 19c:	01010100 	0x1010100
 1a0:	00000001 	0x1
 1a4:	01000001 	0x1000001
 1a8:	69727000 	0x69727000
 1ac:	6162746e 	0x6162746e
 1b0:	632e6573 	0x632e6573
 1b4:	00000000 	nop
 1b8:	02050000 	0x2050000
 1bc:	bfc017e0 	0xbfc017e0
 1c0:	87740813 	lh	s4,2067(k1)
 1c4:	f0bc4cf7 	0xf0bc4cf7
 1c8:	038ab84c 	syscall	0xe2ae1
 1cc:	0374086c 	0x374086c
 1d0:	b7f38216 	0xb7f38216
 1d4:	83e00888 	lb	zero,2184(ra)
 1d8:	3c087103 	lui	t0,0x7103
 1dc:	02f20f03 	0x2f20f03
 1e0:	01010008 	0x1010008
 1e4:	00000038 	0x38
 1e8:	001f0002 	srl	zero,ra,0x0
 1ec:	01010000 	0x1010000
 1f0:	000d0efb 	0xd0efb
 1f4:	01010101 	0x1010101
 1f8:	01000000 	0x1000000
 1fc:	00010000 	sll	zero,at,0x0
 200:	63727473 	0x63727473
 204:	632e706d 	0x632e706d
 208:	00000000 	nop
 20c:	02050000 	0x2050000
 210:	bfc018e0 	0xbfc018e0
 214:	08498417 	j	126105c <data_size+0x12608cc>
 218:	0283f43d 	0x283f43d
 21c:	01010008 	0x1010008
 220:	00000071 	0x71
 224:	00320002 	0x320002
 228:	01010000 	0x1010000
 22c:	000d0efb 	0xd0efb
 230:	01010101 	0x1010101
 234:	01000000 	0x1000000
 238:	2e010000 	sltiu	at,s0,0
 23c:	6e692f2e 	0x6e692f2e
 240:	64756c63 	0x64756c63
 244:	74000065 	jalx	194 <data_size-0x5fc>
 248:	2e656d69 	sltiu	a1,s3,28009
 24c:	00000063 	0x63
 250:	6d697400 	0x6d697400
 254:	00682e65 	0x682e65
 258:	00000001 	0x1
 25c:	20020500 	addi	v0,zero,1280
 260:	15bfc019 	bne	t5,ra,ffff02c8 <_gp+0x403e6108>
 264:	f5010a03 	0xf5010a03
 268:	f20f0314 	0xf20f0314
 26c:	5d03f516 	0x5d03f516
 270:	08280301 	j	a00c04 <data_size+0xa00474>
 274:	8268033c 	lb	t0,828(s3)
 278:	4a700382 	c2	0x700382
 27c:	08821503 	j	208540c <data_size+0x2084c7c>
 280:	f67f4c3b 	0xf67f4c3b
 284:	3e088180 	0x3e088180
 288:	3a083b08 	xori	t0,s0,0x3b08
 28c:	84f53d08 	lh	s5,15624(a3)
 290:	01001002 	0x1001002
 294:	Address 0x0000000000000294 is out of bounds.


Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	00000062 	0x62
   4:	00000002 	srl	zero,zero,0x0
   8:	01040000 	0x1040000
   c:	00000000 	nop
  10:	bfc00000 	0xbfc00000
  14:	bfc0038c 	0xbfc0038c
  18:	72617473 	0x72617473
  1c:	00532e74 	0x532e74
  20:	64656d2f 	0x64656d2f
  24:	732f6169 	0x732f6169
  28:	6f625f66 	0x6f625f66
  2c:	632f6b6f 	0x632f6b6f
  30:	625f7570 	0x625f7570
  34:	5f6b6f6f 	0x5f6b6f6f
  38:	30323032 	andi	s2,at,0x3032
  3c:	32323430 	andi	s2,s1,0x3430
  40:	62616c2f 	0x62616c2f
  44:	62616c2f 	0x62616c2f
  48:	702f3931 	0x702f3931
  4c:	5f667265 	0x5f667265
  50:	636e7566 	0x636e7566
  54:	554e4700 	0x554e4700
  58:	20534120 	addi	s3,v0,16672
  5c:	38312e32 	xori	s1,at,0x2e32
  60:	0030352e 	0x30352e
  64:	00c98001 	0xc98001
  68:	00020000 	sll	zero,v0,0x0
  6c:	00000014 	0x14
  70:	00180104 	0x180104
  74:	27010000 	addiu	at,t8,0
  78:	30000000 	andi	zero,zero,0x0
  7c:	90000000 	lbu	zero,0(zero)
  80:	e0bfc014 	swc0	$31,-16364(a1)
  84:	5ebfc016 	0x5ebfc016
  88:	02000000 	0x2000000
  8c:	07040304 	0x7040304
  90:	0000000b 	0xb
  94:	06070403 	0x6070403
  98:	04000000 	bltz	zero,9c <data_size-0x6f4>
  9c:	00006901 	0x6901
  a0:	01020100 	0x1020100
  a4:	000000ad 	0xad
  a8:	bfc01490 	0xbfc01490
  ac:	bfc016e0 	0xbfc016e0
  b0:	00000010 	mfhi	zero
  b4:	00000000 	nop
  b8:	000000ad 	0xad
  bc:	746d6605 	jalx	1b59814 <data_size+0x1b59084>
  c0:	b4010100 	0xb4010100
  c4:	1f000000 	bgtz	t8,c8 <data_size-0x6c8>
  c8:	06000000 	bltz	s0,cc <data_size-0x6c4>
  cc:	01006907 	0x1006907
  d0:	0000ad03 	sra	s5,zero,0x14
  d4:	00004800 	sll	t1,zero,0x0
  d8:	00630800 	0x630800
  dc:	00bf0401 	0xbf0401
  e0:	61070000 	0x61070000
  e4:	01006772 	0x1006772
  e8:	0000c605 	0xc605
  ec:	00006600 	sll	t4,zero,0x18
  f0:	70610900 	0x70610900
  f4:	25060100 	addiu	a2,t0,256
  f8:	02000000 	0x2000000
  fc:	7707108d 	jalx	c1c4234 <data_size+0xc1c3aa4>
 100:	ad070100 	sw	a3,256(t0)
 104:	84000000 	lh	zero,0(zero)
 108:	0a000000 	j	8000000 <data_size+0x7fff870>
 10c:	00000000 	nop
 110:	0b004501 	j	c011404 <data_size+0xc010c74>
 114:	6e690504 	0x6e690504
 118:	040c0074 	0x40c0074
 11c:	000000ba 	0xba
 120:	0000bf0d 	break	0x0,0x2fc
 124:	06010300 	bgez	s0,d28 <data_size+0x598>
 128:	00000077 	0x77
 12c:	0025040c 	syscall	0x9410
 130:	88000000 	lwl	zero,0(zero)
 134:	02000000 	0x2000000
 138:	0000bb00 	sll	s7,zero,0xc
 13c:	18010400 	0x18010400
 140:	01000000 	0x1000000
 144:	0000007c 	0x7c
 148:	00000030 	0x30
 14c:	bfc016e0 	0xbfc016e0
 150:	bfc01714 	0xbfc01714
 154:	0000010a 	0x10a
 158:	0b070402 	j	c1c1008 <data_size+0xc1c0878>
 15c:	02000000 	0x2000000
 160:	00060704 	0x60704
 164:	01030000 	0x1030000
 168:	00000070 	0x70
 16c:	16e00801 	bnez	s7,2174 <data_size+0x19e4>
 170:	16f4bfc0 	bne	s7,s4,ffff0074 <_gp+0x403e5eb4>
 174:	0044bfc0 	0x44bfc0
 178:	6d010000 	0x6d010000
 17c:	00000059 	0x59
 180:	01006304 	0x1006304
 184:	00005908 	0x5908
 188:	00540100 	0x540100
 18c:	69050405 	0x69050405
 190:	0600746e 	bltz	s0,1d34c <data_size+0x1cbbc>
 194:	00007401 	0x7401
 198:	01020100 	0x1020100
 19c:	00000059 	0x59
 1a0:	bfc016f4 	0xbfc016f4
 1a4:	bfc01714 	0xbfc01714
 1a8:	00000054 	0x54
 1ac:	00000110 	0x110
 1b0:	01006307 	0x1006307
 1b4:	00005901 	0x5901
 1b8:	00012f00 	sll	a1,at,0x1c
 1bc:	ab000000 	swl	zero,0(t8)
 1c0:	02000000 	0x2000000
 1c4:	00013500 	sll	a2,at,0x14
 1c8:	18010400 	0x18010400
 1cc:	01000000 	0x1000000
 1d0:	00000086 	0x86
 1d4:	00000030 	0x30
 1d8:	bfc01720 	0xbfc01720
 1dc:	bfc017d8 	0xbfc017d8
 1e0:	0000014a 	0x14a
 1e4:	0b070402 	j	c1c1008 <data_size+0xc1c0878>
 1e8:	02000000 	0x2000000
 1ec:	00060704 	0x60704
 1f0:	01030000 	0x1030000
 1f4:	00000092 	0x92
 1f8:	6f010201 	0x6f010201
 1fc:	20000000 	addi	zero,zero,0
 200:	a8bfc017 	swl	ra,-16361(a1)
 204:	7cbfc017 	0x7cbfc017
 208:	42000000 	c0	0x0
 20c:	6f000001 	0x6f000001
 210:	04000000 	bltz	zero,214 <data_size-0x57c>
 214:	01010073 	0x1010073
 218:	00000076 	0x76
 21c:	00000161 	0x161
 220:	01006305 	0x1006305
 224:	00007c03 	sra	t7,zero,0x10
 228:	00018a00 	sll	s1,at,0x8
 22c:	04060000 	0x4060000
 230:	746e6905 	jalx	1b9a414 <data_size+0x1b99c84>
 234:	7c040700 	0x7c040700
 238:	02000000 	0x2000000
 23c:	00770601 	0x770601
 240:	01080000 	0x1080000
 244:	0000008d 	break	0x0,0x2
 248:	6f010f01 	0x6f010f01
 24c:	a8000000 	swl	zero,0(zero)
 250:	d8bfc017 	0xd8bfc017
 254:	98bfc017 	lwr	ra,-16361(a1)
 258:	9d000000 	0x9d000000
 25c:	04000001 	bltz	zero,264 <data_size-0x52c>
 260:	0e010073 	jal	80401cc <data_size+0x803fa3c>
 264:	00000076 	0x76
 268:	000001bc 	0x1bc
 26c:	00f70000 	0xf70000
 270:	00020000 	sll	zero,v0,0x0
 274:	000001bc 	0x1bc
 278:	00180104 	0x180104
 27c:	9c010000 	0x9c010000
 280:	30000000 	andi	zero,zero,0x0
 284:	e0000000 	swc0	$0,0(zero)
 288:	e0bfc017 	swc0	$31,-16361(a1)
 28c:	8dbfc018 	lw	ra,-16360(t5)
 290:	02000001 	0x2000001
 294:	000b0704 	0xb0704
 298:	04020000 	0x4020000
 29c:	00000607 	0x607
 2a0:	bc010300 	0xbc010300
 2a4:	01000000 	0x1000000
 2a8:	00d20102 	0xd20102
 2ac:	17e00000 	bnez	ra,2b0 <data_size-0x4e0>
 2b0:	18e0bfc0 	blez	a3,ffff01b4 <_gp+0x403e5ff4>
 2b4:	00c0bfc0 	0xc0bfc0
 2b8:	01cf0000 	0x1cf0000
 2bc:	00d20000 	0xd20000
 2c0:	76040000 	jalx	8100000 <data_size+0x80ff870>
 2c4:	d9010100 	0xd9010100
 2c8:	ef000000 	swc3	$0,0(t8)
 2cc:	04000001 	bltz	zero,2d4 <data_size-0x4bc>
 2d0:	01010077 	0x1010077
 2d4:	000000d2 	0xd2
 2d8:	0000024f 	0x24f
 2dc:	0000c105 	0xc105
 2e0:	d2010100 	0xd2010100
 2e4:	ba000000 	swr	zero,0(s0)
 2e8:	05000002 	bltz	t0,2f4 <data_size-0x49c>
 2ec:	000000b7 	0xb7
 2f0:	00d20101 	0xd20101
 2f4:	030f0000 	0x30f0000
 2f8:	69060000 	0x69060000
 2fc:	d2030100 	0xd2030100
 300:	38000000 	xori	zero,zero,0x0
 304:	06000003 	bltz	s0,314 <data_size-0x47c>
 308:	0301006a 	0x301006a
 30c:	000000d2 	0xd2
 310:	00000361 	0x361
 314:	01006306 	0x1006306
 318:	0000d204 	0xd204
 31c:	00038a00 	sll	s1,v1,0x8
 320:	75620700 	jalx	5881c00 <data_size+0x5881470>
 324:	05010066 	bgez	t0,4c0 <data_size-0x2d0>
 328:	000000e0 	0xe0
 32c:	7fa89103 	0x7fa89103
 330:	0000a808 	0xa808
 334:	2c060100 	sltiu	a2,zero,256
 338:	a8000000 	swl	zero,0(zero)
 33c:	00000003 	sra	zero,zero,0x0
 340:	69050409 	0x69050409
 344:	0200746e 	0x200746e
 348:	00ae0504 	0xae0504
 34c:	f30a0000 	0xf30a0000
 350:	f0000000 	0xf0000000
 354:	0b000000 	j	c000000 <data_size+0xbfff870>
 358:	000000f0 	0xf0
 35c:	040c003f 	0x40c003f
 360:	06010207 	bgez	s0,b80 <data_size+0x3f0>
 364:	00000077 	0x77
 368:	00008300 	sll	s0,zero,0xc
 36c:	68000200 	0x68000200
 370:	04000002 	bltz	zero,37c <data_size-0x414>
 374:	00001801 	0x1801
 378:	00cd0100 	0xcd0100
 37c:	00300000 	0x300000
 380:	18e00000 	blez	a3,384 <data_size-0x40c>
 384:	1920bfc0 	blez	t1,ffff0288 <_gp+0x403e60c8>
 388:	01e4bfc0 	0x1e4bfc0
 38c:	04020000 	0x4020000
 390:	00000b07 	0xb07
 394:	07040200 	0x7040200
 398:	00000006 	srlv	zero,zero,zero
 39c:	00c60103 	0xc60103
 3a0:	06010000 	bgez	s0,3a4 <data_size-0x3ec>
 3a4:	00006d01 	0x6d01
 3a8:	c018e000 	lwc0	$24,-8192(zero)
 3ac:	c01920bf 	lwc0	$25,8383(zero)
 3b0:	0000f0bf 	0xf0bf
 3b4:	6d6d0100 	0x6d6d0100
 3b8:	04000000 	bltz	zero,3bc <data_size-0x3d4>
 3bc:	01003173 	0x1003173
 3c0:	00007405 	0x7405
 3c4:	05540100 	0x5540100
 3c8:	01003273 	0x1003273
 3cc:	00007405 	0x7405
 3d0:	0003d100 	sll	k0,v1,0x4
 3d4:	04060000 	0x4060000
 3d8:	746e6905 	jalx	1b9a414 <data_size+0x1b99c84>
 3dc:	7a040700 	0x7a040700
 3e0:	08000000 	j	0 <data_size-0x790>
 3e4:	0000007f 	0x7f
 3e8:	77060102 	jalx	c180408 <data_size+0xc17fc78>
 3ec:	00000000 	nop
 3f0:	000001c1 	0x1c1
 3f4:	02dc0002 	0x2dc0002
 3f8:	01040000 	0x1040000
 3fc:	00000018 	mult	zero,zero
 400:	00010201 	0x10201
 404:	00003000 	sll	a2,zero,0x0
 408:	c0192000 	lwc0	$25,8192(zero)
 40c:	c01a38bf 	lwc0	$26,14527(zero)
 410:	000220bf 	0x220bf
 414:	07040200 	0x7040200
 418:	0000000b 	0xb
 41c:	06070402 	0x6070402
 420:	03000000 	0x3000000
 424:	000000ea 	0xea
 428:	002c0302 	0x2c0302
 42c:	04040000 	0x4040000
 430:	746e6905 	jalx	1b9a414 <data_size+0x1b99c84>
 434:	00e10500 	0xe10500
 438:	02100000 	0x2100000
 43c:	00008a1f 	0x8a1f
 440:	01240600 	0x1240600
 444:	20020000 	addi	v0,zero,0
 448:	00000033 	0x33
 44c:	06001002 	bltz	s0,4458 <data_size+0x3cc8>
 450:	0000012b 	0x12b
 454:	00332102 	0x332102
 458:	10020000 	beq	zero,v0,45c <data_size-0x334>
 45c:	011c0604 	0x11c0604
 460:	22020000 	addi	v0,s0,0
 464:	00000033 	0x33
 468:	06081002 	0x6081002
 46c:	000000f3 	0xf3
 470:	00332302 	0x332302
 474:	10020000 	beq	zero,v0,478 <data_size-0x318>
 478:	0107000c 	syscall	0x41c00
 47c:	000000d6 	0xd6
 480:	002c0401 	0x2c0401
 484:	a7000000 	sh	zero,0(t8)
 488:	08000000 	j	0 <data_size-0x790>
 48c:	00000109 	0x109
 490:	002c0501 	0x2c0501
 494:	09000000 	j	4000000 <data_size+0x3fff870>
 498:	0000008a 	0x8a
 49c:	bfc01920 	0xbfc01920
 4a0:	bfc01930 	0xbfc01930
 4a4:	00000110 	0x110
 4a8:	00c46d01 	0xc46d01
 4ac:	9b0a0000 	lwr	t2,0(t8)
 4b0:	00000000 	nop
 4b4:	00d7010b 	0xd7010b
 4b8:	11010000 	beq	t0,at,4bc <data_size-0x2d4>
 4bc:	0000002c 	0x2c
 4c0:	bfc01930 	0xbfc01930
 4c4:	bfc01940 	0xbfc01940
 4c8:	00000120 	0x120
 4cc:	010c6d01 	0x10c6d01
 4d0:	00000112 	0x112
 4d4:	002c2201 	0x2c2201
 4d8:	19400000 	blez	t2,4dc <data_size-0x2b4>
 4dc:	1950bfc0 	0x1950bfc0
 4e0:	0130bfc0 	0x130bfc0
 4e4:	6d010000 	0x6d010000
 4e8:	00000106 	0x106
 4ec:	01006e0d 	break	0x100,0x1b8
 4f0:	00002c23 	0x2c23
 4f4:	010e0000 	0x10e0000
 4f8:	000000fb 	0xfb
 4fc:	2c012901 	sltiu	at,zero,10497
 500:	50000000 	0x50000000
 504:	6cbfc019 	0x6cbfc019
 508:	40bfc019 	0x40bfc019
 50c:	01000001 	0x1000001
 510:	0001526d 	0x1526d
 514:	006e0f00 	0x6e0f00
 518:	002c2a01 	0x2c2a01
 51c:	04050000 	0x4050000
 520:	8a100000 	lwl	s0,0(s0)
 524:	50000000 	0x50000000
 528:	64bfc019 	0x64bfc019
 52c:	01bfc019 	0x1bfc019
 530:	1950112b 	0x1950112b
 534:	1964bfc0 	0x1964bfc0
 538:	9b0abfc0 	lwr	t2,-16448(t8)
 53c:	00000000 	nop
 540:	01120000 	0x1120000
 544:	00000133 	0x133
 548:	2c011601 	sltiu	at,zero,5633
 54c:	6c000000 	0x6c000000
 550:	38bfc019 	xori	ra,a1,0xc019
 554:	50bfc01a 	0x50bfc01a
 558:	18000001 	blez	zero,560 <data_size-0x230>
 55c:	be000004 	0xbe000004
 560:	13000001 	beqz	t8,568 <data_size-0x228>
 564:	006c6573 	0x6c6573
 568:	003e1501 	0x3e1501
 56c:	04370000 	0x4370000
 570:	74130000 	jalx	4c0000 <data_size+0x4bf870>
 574:	0100706d 	0x100706d
 578:	0001be15 	0x1be15
 57c:	00044a00 	sll	t1,a0,0x8
 580:	006e0f00 	0x6e0f00
 584:	002c1701 	0x2c1701
 588:	04680000 	0x4680000
 58c:	8a100000 	lwl	s0,0(s0)
 590:	78000000 	0x78000000
 594:	80bfc019 	lb	ra,-16359(a1)
 598:	01bfc019 	0x1bfc019
 59c:	19781118 	0x19781118
 5a0:	1980bfc0 	blez	t4,ffff04a4 <_gp+0x403e62e4>
 5a4:	9b0abfc0 	lwr	t2,-16448(t8)
 5a8:	00000000 	nop
 5ac:	04140000 	0x4140000
 5b0:	00000045 	0x45
	...

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	10001101 	b	4408 <data_size+0x3c78>
   4:	12011106 	beq	s0,at,4420 <data_size+0x3c90>
   8:	1b080301 	0x1b080301
   c:	13082508 	beq	t8,t0,9430 <data_size+0x8ca0>
  10:	00000005 	0x5
  14:	25011101 	addiu	at,t0,4353
  18:	030b130e 	0x30b130e
  1c:	110e1b0e 	beq	t0,t6,6c58 <data_size+0x64c8>
  20:	10011201 	beq	zero,at,4828 <data_size+0x4098>
  24:	02000006 	srlv	zero,zero,s0
  28:	0b0b000f 	j	c2c003c <data_size+0xc2bf8ac>
  2c:	24030000 	li	v1,0
  30:	3e0b0b00 	0x3e0b0b00
  34:	000e030b 	0xe030b
  38:	012e0400 	0x12e0400
  3c:	0e030c3f 	jal	80c30fc <data_size+0x80c296c>
  40:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec2558>
  44:	13490c27 	beq	k0,t1,30e4 <data_size+0x2954>
  48:	01120111 	0x1120111
  4c:	40064081 	0x40064081
  50:	00130106 	0x130106
  54:	00050500 	sll	zero,a1,0x14
  58:	0b3a0803 	j	ce8200c <data_size+0xce8187c>
  5c:	13490b3b 	beq	k0,t1,2d4c <data_size+0x25bc>
  60:	00000602 	srl	zero,zero,0x18
  64:	00001806 	srlv	v1,zero,zero
  68:	00340700 	0x340700
  6c:	0b3a0803 	j	ce8200c <data_size+0xce8187c>
  70:	13490b3b 	beq	k0,t1,2d60 <data_size+0x25d0>
  74:	00000602 	srl	zero,zero,0x18
  78:	03003408 	0x3003408
  7c:	3b0b3a08 	xori	t3,t8,0x3a08
  80:	0013490b 	0x13490b
  84:	00340900 	0x340900
  88:	0b3a0803 	j	ce8200c <data_size+0xce8187c>
  8c:	13490b3b 	beq	k0,t1,2d7c <data_size+0x25ec>
  90:	00000a02 	srl	at,zero,0x8
  94:	03000a0a 	0x3000a0a
  98:	3b0b3a0e 	xori	t3,t8,0x3a0e
  9c:	0b00000b 	j	c00002c <data_size+0xbfff89c>
  a0:	0b0b0024 	j	c2c0090 <data_size+0xc2bf900>
  a4:	08030b3e 	j	c2cf8 <data_size+0xc2568>
  a8:	0f0c0000 	jal	c300000 <data_size+0xc2ff870>
  ac:	490b0b00 	0x490b0b00
  b0:	0d000013 	jal	400004c <data_size+0x3fff8bc>
  b4:	13490026 	beq	k0,t1,150 <data_size-0x640>
  b8:	01000000 	0x1000000
  bc:	0e250111 	jal	8940444 <data_size+0x893fcb4>
  c0:	0e030b13 	jal	80c2c4c <data_size+0x80c24bc>
  c4:	01110e1b 	0x1110e1b
  c8:	06100112 	bltzal	s0,514 <data_size-0x27c>
  cc:	24020000 	li	v0,0
  d0:	3e0b0b00 	0x3e0b0b00
  d4:	000e030b 	0xe030b
  d8:	012e0300 	0x12e0300
  dc:	0e030c3f 	jal	80c30fc <data_size+0x80c296c>
  e0:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec2558>
  e4:	01120111 	0x1120111
  e8:	40064081 	0x40064081
  ec:	0013010a 	0x13010a
  f0:	00050400 	sll	zero,a1,0x10
  f4:	0b3a0803 	j	ce8200c <data_size+0xce8187c>
  f8:	13490b3b 	beq	k0,t1,2de8 <data_size+0x2658>
  fc:	00000a02 	srl	at,zero,0x8
 100:	0b002405 	j	c009014 <data_size+0xc008884>
 104:	030b3e0b 	0x30b3e0b
 108:	06000008 	bltz	s0,12c <data_size-0x664>
 10c:	0c3f012e 	jal	fc04b8 <data_size+0xfbfd28>
 110:	0b3a0e03 	j	ce8380c <data_size+0xce8307c>
 114:	0c270b3b 	jal	9c2cec <data_size+0x9c255c>
 118:	01111349 	0x1111349
 11c:	40810112 	0x40810112
 120:	00064006 	srlv	t0,a2,zero
 124:	00050700 	sll	zero,a1,0x1c
 128:	0b3a0803 	j	ce8200c <data_size+0xce8187c>
 12c:	13490b3b 	beq	k0,t1,2e1c <data_size+0x268c>
 130:	00000602 	srl	zero,zero,0x18
 134:	01110100 	0x1110100
 138:	0b130e25 	j	c4c3894 <data_size+0xc4c3104>
 13c:	0e1b0e03 	jal	86c380c <data_size+0x86c307c>
 140:	01120111 	0x1120111
 144:	00000610 	0x610
 148:	0b002402 	j	c009008 <data_size+0xc008878>
 14c:	030b3e0b 	0x30b3e0b
 150:	0300000e 	0x300000e
 154:	0c3f012e 	jal	fc04b8 <data_size+0xfbfd28>
 158:	0b3a0e03 	j	ce8380c <data_size+0xce8307c>
 15c:	0c270b3b 	jal	9c2cec <data_size+0x9c255c>
 160:	01111349 	0x1111349
 164:	40810112 	0x40810112
 168:	01064006 	srlv	t0,a2,t0
 16c:	04000013 	bltz	zero,1bc <data_size-0x5d4>
 170:	08030005 	j	c0014 <data_size+0xbf884>
 174:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec2558>
 178:	06021349 	0x6021349
 17c:	34050000 	li	a1,0x0
 180:	3a080300 	xori	t0,s0,0x300
 184:	490b3b0b 	0x490b3b0b
 188:	00060213 	0x60213
 18c:	00240600 	0x240600
 190:	0b3e0b0b 	j	cf82c2c <data_size+0xcf8249c>
 194:	00000803 	sra	at,zero,0x0
 198:	0b000f07 	j	c003c1c <data_size+0xc00348c>
 19c:	0013490b 	0x13490b
 1a0:	012e0800 	0x12e0800
 1a4:	0e030c3f 	jal	80c30fc <data_size+0x80c296c>
 1a8:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec2558>
 1ac:	13490c27 	beq	k0,t1,324c <data_size+0x2abc>
 1b0:	01120111 	0x1120111
 1b4:	40064081 	0x40064081
 1b8:	00000006 	srlv	zero,zero,zero
 1bc:	25011101 	addiu	at,t0,4353
 1c0:	030b130e 	0x30b130e
 1c4:	110e1b0e 	beq	t0,t6,6e00 <data_size+0x6670>
 1c8:	10011201 	beq	zero,at,49d0 <data_size+0x4240>
 1cc:	02000006 	srlv	zero,zero,s0
 1d0:	0b0b0024 	j	c2c0090 <data_size+0xc2bf900>
 1d4:	0e030b3e 	jal	80c2cf8 <data_size+0x80c2568>
 1d8:	2e030000 	sltiu	v1,s0,0
 1dc:	030c3f01 	0x30c3f01
 1e0:	3b0b3a0e 	xori	t3,t8,0x3a0e
 1e4:	490c270b 	0x490c270b
 1e8:	12011113 	beq	s0,at,4638 <data_size+0x3ea8>
 1ec:	06408101 	bltz	s2,fffe05f4 <_gp+0x403d6434>
 1f0:	13010640 	beq	t8,at,1af4 <data_size+0x1364>
 1f4:	05040000 	0x5040000
 1f8:	3a080300 	xori	t0,s0,0x300
 1fc:	490b3b0b 	0x490b3b0b
 200:	00060213 	0x60213
 204:	00050500 	sll	zero,a1,0x14
 208:	0b3a0e03 	j	ce8380c <data_size+0xce8307c>
 20c:	13490b3b 	beq	k0,t1,2efc <data_size+0x276c>
 210:	00000602 	srl	zero,zero,0x18
 214:	03003406 	0x3003406
 218:	3b0b3a08 	xori	t3,t8,0x3a08
 21c:	0213490b 	0x213490b
 220:	07000006 	bltz	t8,23c <data_size-0x554>
 224:	08030034 	j	c00d0 <data_size+0xbf940>
 228:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec2558>
 22c:	0a021349 	j	8084d24 <data_size+0x8084594>
 230:	34080000 	li	t0,0x0
 234:	3a0e0300 	xori	t6,s0,0x300
 238:	490b3b0b 	0x490b3b0b
 23c:	00060213 	0x60213
 240:	00240900 	0x240900
 244:	0b3e0b0b 	j	cf82c2c <data_size+0xcf8249c>
 248:	00000803 	sra	at,zero,0x0
 24c:	4901010a 	bc2t	678 <data_size-0x118>
 250:	00130113 	0x130113
 254:	00210b00 	0x210b00
 258:	0b2f1349 	j	cbc4d24 <data_size+0xcbc4594>
 25c:	240c0000 	li	t4,0
 260:	3e0b0b00 	0x3e0b0b00
 264:	0000000b 	0xb
 268:	25011101 	addiu	at,t0,4353
 26c:	030b130e 	0x30b130e
 270:	110e1b0e 	beq	t0,t6,6eac <data_size+0x671c>
 274:	10011201 	beq	zero,at,4a7c <data_size+0x42ec>
 278:	02000006 	srlv	zero,zero,s0
 27c:	0b0b0024 	j	c2c0090 <data_size+0xc2bf900>
 280:	0e030b3e 	jal	80c2cf8 <data_size+0x80c2568>
 284:	2e030000 	sltiu	v1,s0,0
 288:	030c3f01 	0x30c3f01
 28c:	3b0b3a0e 	xori	t3,t8,0x3a0e
 290:	490c270b 	0x490c270b
 294:	12011113 	beq	s0,at,46e4 <data_size+0x3f54>
 298:	06408101 	bltz	s2,fffe06a0 <_gp+0x403d64e0>
 29c:	13010a40 	beq	t8,at,2ba0 <data_size+0x2410>
 2a0:	05040000 	0x5040000
 2a4:	3a080300 	xori	t0,s0,0x300
 2a8:	490b3b0b 	0x490b3b0b
 2ac:	000a0213 	0xa0213
 2b0:	00050500 	sll	zero,a1,0x14
 2b4:	0b3a0803 	j	ce8200c <data_size+0xce8187c>
 2b8:	13490b3b 	beq	k0,t1,2fa8 <data_size+0x2818>
 2bc:	00000602 	srl	zero,zero,0x18
 2c0:	0b002406 	j	c009018 <data_size+0xc008888>
 2c4:	030b3e0b 	0x30b3e0b
 2c8:	07000008 	bltz	t8,2ec <data_size-0x4a4>
 2cc:	0b0b000f 	j	c2c003c <data_size+0xc2bf8ac>
 2d0:	00001349 	0x1349
 2d4:	49002608 	bc2f	9af8 <data_size+0x9368>
 2d8:	00000013 	mtlo	zero
 2dc:	25011101 	addiu	at,t0,4353
 2e0:	030b130e 	0x30b130e
 2e4:	110e1b0e 	beq	t0,t6,6f20 <data_size+0x6790>
 2e8:	10011201 	beq	zero,at,4af0 <data_size+0x4360>
 2ec:	02000006 	srlv	zero,zero,s0
 2f0:	0b0b0024 	j	c2c0090 <data_size+0xc2bf900>
 2f4:	0e030b3e 	jal	80c2cf8 <data_size+0x80c2568>
 2f8:	16030000 	bne	s0,v1,2fc <data_size-0x494>
 2fc:	3a0e0300 	xori	t6,s0,0x300
 300:	490b3b0b 	0x490b3b0b
 304:	04000013 	bltz	zero,354 <data_size-0x43c>
 308:	0b0b0024 	j	c2c0090 <data_size+0xc2bf900>
 30c:	08030b3e 	j	c2cf8 <data_size+0xc2568>
 310:	13050000 	beq	t8,a1,314 <data_size-0x47c>
 314:	0b0e0301 	j	c380c04 <data_size+0xc380474>
 318:	3b0b3a0b 	xori	t3,t8,0x3a0b
 31c:	0013010b 	0x13010b
 320:	000d0600 	sll	zero,t5,0x18
 324:	0b3a0e03 	j	ce8380c <data_size+0xce8307c>
 328:	13490b3b 	beq	k0,t1,3018 <data_size+0x2888>
 32c:	00000a38 	0xa38
 330:	3f012e07 	0x3f012e07
 334:	3a0e030c 	xori	t6,s0,0x30c
 338:	490b3b0b 	0x490b3b0b
 33c:	010b2013 	0x10b2013
 340:	08000013 	j	4c <data_size-0x744>
 344:	0e030034 	jal	80c00d0 <data_size+0x80bf940>
 348:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec2558>
 34c:	00001349 	0x1349
 350:	31012e09 	andi	at,t0,0x2e09
 354:	12011113 	beq	s0,at,47a4 <data_size+0x4014>
 358:	06408101 	bltz	s2,fffe0760 <_gp+0x403d65a0>
 35c:	13010a40 	beq	t8,at,2c60 <data_size+0x24d0>
 360:	340a0000 	li	t2,0x0
 364:	00133100 	sll	a2,s3,0x4
 368:	002e0b00 	0x2e0b00
 36c:	0e030c3f 	jal	80c30fc <data_size+0x80c296c>
 370:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec2558>
 374:	01111349 	0x1111349
 378:	40810112 	0x40810112
 37c:	000a4006 	srlv	t0,t2,zero
 380:	012e0c00 	0x12e0c00
 384:	0e030c3f 	jal	80c30fc <data_size+0x80c296c>
 388:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec2558>
 38c:	01111349 	0x1111349
 390:	40810112 	0x40810112
 394:	010a4006 	srlv	t0,t2,t0
 398:	0d000013 	jal	400004c <data_size+0x3fff8bc>
 39c:	08030034 	j	c00d0 <data_size+0xbf940>
 3a0:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec2558>
 3a4:	00001349 	0x1349
 3a8:	3f012e0e 	0x3f012e0e
 3ac:	3a0e030c 	xori	t6,s0,0x30c
 3b0:	270b3b0b 	addiu	t3,t8,15115
 3b4:	1113490c 	beq	t0,s3,127e8 <data_size+0x12058>
 3b8:	81011201 	lb	at,4609(t0)
 3bc:	0a400640 	j	9001900 <data_size+0x9001170>
 3c0:	00001301 	0x1301
 3c4:	0300340f 	0x300340f
 3c8:	3b0b3a08 	xori	t3,t8,0x3a08
 3cc:	0213490b 	0x213490b
 3d0:	10000006 	b	3ec <data_size-0x3a4>
 3d4:	1331011d 	beq	t9,s1,84c <data_size+0xbc>
 3d8:	01120111 	0x1120111
 3dc:	0b590b58 	j	d642d60 <data_size+0xd6425d0>
 3e0:	0b110000 	j	c440000 <data_size+0xc43f870>
 3e4:	12011101 	beq	s0,at,47ec <data_size+0x405c>
 3e8:	12000001 	beqz	s0,3f0 <data_size-0x3a0>
 3ec:	0c3f012e 	jal	fc04b8 <data_size+0xfbfd28>
 3f0:	0b3a0e03 	j	ce8380c <data_size+0xce8307c>
 3f4:	0c270b3b 	jal	9c2cec <data_size+0x9c255c>
 3f8:	01111349 	0x1111349
 3fc:	40810112 	0x40810112
 400:	01064006 	srlv	t0,a2,t0
 404:	13000013 	beqz	t8,454 <data_size-0x33c>
 408:	08030005 	j	c0014 <data_size+0xbf884>
 40c:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec2558>
 410:	06021349 	0x6021349
 414:	0f140000 	jal	c500000 <data_size+0xc4ff870>
 418:	490b0b00 	0x490b0b00
 41c:	00000013 	mtlo	zero

Disassembly of section .comment:

00000000 <.comment>:
   0:	43434700 	c0	0x1434700
   4:	4728203a 	c1	0x128203a
   8:	2029554e 	addi	t1,at,21838
   c:	2e332e34 	sltiu	s3,s1,11828
  10:	47000030 	c1	0x1000030
  14:	203a4343 	addi	k0,at,17219
  18:	554e4728 	0x554e4728
  1c:	2e342029 	sltiu	s4,s1,8233
  20:	00302e33 	0x302e33
  24:	43434700 	c0	0x1434700
  28:	4728203a 	c1	0x128203a
  2c:	2029554e 	addi	t1,at,21838
  30:	2e332e34 	sltiu	s3,s1,11828
  34:	47000030 	c1	0x1000030
  38:	203a4343 	addi	k0,at,17219
  3c:	554e4728 	0x554e4728
  40:	2e342029 	sltiu	s4,s1,8233
  44:	00302e33 	0x302e33
  48:	43434700 	c0	0x1434700
  4c:	4728203a 	c1	0x128203a
  50:	2029554e 	addi	t1,at,21838
  54:	2e332e34 	sltiu	s3,s1,11828
  58:	47000030 	c1	0x1000030
  5c:	203a4343 	addi	k0,at,17219
  60:	554e4728 	0x554e4728
  64:	2e342029 	sltiu	s4,s1,8233
  68:	00302e33 	0x302e33
  6c:	43434700 	c0	0x1434700
  70:	4728203a 	c1	0x128203a
  74:	2029554e 	addi	t1,at,21838
  78:	2e332e34 	sltiu	s3,s1,11828
  7c:	47000030 	c1	0x1000030
  80:	203a4343 	addi	k0,at,17219
  84:	554e4728 	0x554e4728
  88:	2e342029 	sltiu	s4,s1,8233
  8c:	00302e33 	0x302e33
  90:	43434700 	c0	0x1434700
  94:	4728203a 	c1	0x128203a
  98:	2029554e 	addi	t1,at,21838
  9c:	2e332e34 	sltiu	s3,s1,11828
  a0:	Address 0x00000000000000a0 is out of bounds.


Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <data_size+0x5b99470>
   8:	00070100 	sll	zero,a3,0x4
   c:	03040000 	0x3040000

Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	syscall
   4:	ffffffff 	0xffffffff
   8:	7c010001 	0x7c010001
   c:	001d0c1f 	0x1d0c1f
  10:	00000020 	add	zero,zero,zero
  14:	00000000 	nop
  18:	bfc01490 	0xbfc01490
  1c:	00000250 	0x250
  20:	60380e44 	0x60380e44
  24:	07910890 	bgezal	gp,2268 <data_size+0x1ad8>
  28:	04940692 	0x4940692
  2c:	02960395 	0x2960395
  30:	0593019f 	0x593019f
  34:	0000000c 	syscall
  38:	ffffffff 	0xffffffff
  3c:	7c010001 	0x7c010001
  40:	001d0c1f 	0x1d0c1f
  44:	0000000c 	syscall
  48:	00000034 	0x34
  4c:	bfc016e0 	0xbfc016e0
  50:	00000014 	0x14
  54:	00000014 	0x14
  58:	00000034 	0x34
  5c:	bfc016f4 	0xbfc016f4
  60:	00000020 	add	zero,zero,zero
  64:	44180e44 	0x44180e44
  68:	0000019f 	0x19f
  6c:	0000000c 	syscall
  70:	ffffffff 	0xffffffff
  74:	7c010001 	0x7c010001
  78:	001d0c1f 	0x1d0c1f
  7c:	00000018 	mult	zero,zero
  80:	0000006c 	0x6c
  84:	bfc01720 	0xbfc01720
  88:	00000088 	0x88
  8c:	50200e44 	0x50200e44
  90:	02920490 	0x2920490
  94:	0391019f 	0x391019f
  98:	00000014 	0x14
  9c:	0000006c 	0x6c
  a0:	bfc017a8 	0xbfc017a8
  a4:	00000030 	0x30
  a8:	44180e44 	0x44180e44
  ac:	0000019f 	0x19f
  b0:	0000000c 	syscall
  b4:	ffffffff 	0xffffffff
  b8:	7c010001 	0x7c010001
  bc:	001d0c1f 	0x1d0c1f
  c0:	0000001c 	0x1c
  c4:	000000b0 	0xb0
  c8:	bfc017e0 	0xbfc017e0
  cc:	00000100 	sll	zero,zero,0x4
  d0:	54680e44 	0x54680e44
  d4:	04910590 	bgezal	a0,1718 <data_size+0xf88>
  d8:	0392019f 	0x392019f
  dc:	00000293 	0x293
  e0:	0000000c 	syscall
  e4:	ffffffff 	0xffffffff
  e8:	7c010001 	0x7c010001
  ec:	001d0c1f 	0x1d0c1f
  f0:	0000000c 	syscall
  f4:	000000e0 	0xe0
  f8:	bfc018e0 	0xbfc018e0
  fc:	00000040 	sll	zero,zero,0x1
 100:	0000000c 	syscall
 104:	ffffffff 	0xffffffff
 108:	7c010001 	0x7c010001
 10c:	001d0c1f 	0x1d0c1f
 110:	0000000c 	syscall
 114:	00000100 	sll	zero,zero,0x4
 118:	bfc01920 	0xbfc01920
 11c:	00000010 	mfhi	zero
 120:	0000000c 	syscall
 124:	00000100 	sll	zero,zero,0x4
 128:	bfc01930 	0xbfc01930
 12c:	00000010 	mfhi	zero
 130:	0000000c 	syscall
 134:	00000100 	sll	zero,zero,0x4
 138:	bfc01940 	0xbfc01940
 13c:	00000010 	mfhi	zero
 140:	0000000c 	syscall
 144:	00000100 	sll	zero,zero,0x4
 148:	bfc01950 	0xbfc01950
 14c:	0000001c 	0x1c
 150:	00000014 	0x14
 154:	00000100 	sll	zero,zero,0x4
 158:	bfc0196c 	0xbfc0196c
 15c:	000000cc 	syscall	0x3
 160:	44180e44 	0x44180e44
 164:	0000019f 	0x19f

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
   0:	00000000 	nop
   4:	00000004 	sllv	zero,zero,zero
   8:	046d0001 	0x46d0001
   c:	50000000 	0x50000000
  10:	02000002 	0x2000002
  14:	00388d00 	0x388d00
	...
  20:	30000000 	andi	zero,zero,0x0
  24:	01000000 	0x1000000
  28:	00305400 	0x305400
  2c:	00a40000 	0xa40000
  30:	00010000 	sll	zero,at,0x0
  34:	0000b863 	0xb863
  38:	00025000 	sll	t2,v0,0x0
  3c:	63000100 	0x63000100
	...
  48:	00000054 	0x54
  4c:	000000ac 	0xac
  50:	b8610001 	swr	at,1(v1)
  54:	50000000 	0x50000000
  58:	01000002 	0x1000002
  5c:	00006100 	sll	t4,zero,0x4
  60:	00000000 	nop
  64:	004c0000 	0x4c0000
  68:	00a80000 	0xa80000
  6c:	00010000 	sll	zero,at,0x0
  70:	0000b862 	0xb862
  74:	00025000 	sll	t2,v0,0x0
  78:	62000100 	0x62000100
	...
  84:	000000c0 	sll	zero,zero,0x3
  88:	000000dc 	0xdc
  8c:	e4550001 	swc1	$f21,1(v0)
  90:	24000000 	li	zero,0
  94:	01000001 	0x1000001
  98:	01345500 	0x1345500
  9c:	01440000 	0x1440000
  a0:	00010000 	sll	zero,at,0x0
  a4:	00015055 	0x15055
  a8:	00015c00 	sll	t3,at,0x10
  ac:	55000100 	0x55000100
  b0:	00000164 	0x164
  b4:	00000174 	0x174
  b8:	80550001 	lb	s5,1(v0)
  bc:	90000001 	lbu	zero,1(zero)
  c0:	01000001 	0x1000001
  c4:	019c5500 	0x19c5500
  c8:	01ac0000 	0x1ac0000
  cc:	00010000 	sll	zero,at,0x0
  d0:	0001b855 	0x1b855
  d4:	0001c800 	sll	t9,at,0x0
  d8:	55000100 	0x55000100
  dc:	000001d4 	0x1d4
  e0:	000001e0 	0x1e0
  e4:	e8550001 	swc2	$21,1(v0)
  e8:	f8000001 	0xf8000001
  ec:	01000001 	0x1000001
  f0:	02045500 	0x2045500
  f4:	020c0000 	0x20c0000
  f8:	00010000 	sll	zero,at,0x0
  fc:	00021455 	0x21455
 100:	00025000 	sll	t2,v0,0x0
 104:	55000100 	0x55000100
	...
 110:	00000014 	0x14
 114:	00000018 	mult	zero,zero
 118:	186d0001 	0x186d0001
 11c:	34000000 	li	zero,0x0
 120:	02000000 	0x2000000
 124:	00188d00 	sll	s1,t8,0x14
 128:	00000000 	nop
 12c:	14000000 	bnez	zero,130 <data_size-0x660>
 130:	24000000 	li	zero,0
 134:	01000000 	0x1000000
 138:	00005400 	sll	t2,zero,0x10
	...
 144:	00040000 	sll	zero,a0,0x0
 148:	00010000 	sll	zero,at,0x0
 14c:	0000046d 	0x46d
 150:	00008800 	sll	s1,zero,0x0
 154:	8d000200 	lw	zero,512(t0)
 158:	00000020 	add	zero,zero,zero
	...
 164:	00002400 	sll	a0,zero,0x10
 168:	54000100 	0x54000100
 16c:	00000024 	and	zero,zero,zero
 170:	0000007c 	0x7c
 174:	7c610001 	0x7c610001
 178:	88000000 	lwl	zero,0(zero)
 17c:	01000000 	0x1000000
 180:	00005400 	sll	t2,zero,0x10
 184:	00000000 	nop
 188:	001c0000 	sll	zero,gp,0x0
 18c:	00800000 	0x800000
 190:	00010000 	sll	zero,at,0x0
 194:	00000060 	0x60
 198:	00000000 	nop
 19c:	00008800 	sll	s1,zero,0x0
 1a0:	00008c00 	sll	s1,zero,0x10
 1a4:	6d000100 	0x6d000100
 1a8:	0000008c 	syscall	0x2
 1ac:	000000b8 	0xb8
 1b0:	188d0002 	0x188d0002
	...
 1bc:	00000088 	0x88
 1c0:	00000098 	0x98
 1c4:	00540001 	0x540001
	...
 1d0:	04000000 	bltz	zero,1d4 <data_size-0x5bc>
 1d4:	01000000 	0x1000000
 1d8:	00046d00 	sll	t5,a0,0x14
 1dc:	01000000 	0x1000000
 1e0:	00030000 	sll	zero,v1,0x0
 1e4:	0000e88d 	break	0x0,0x3a2
	...
 1f0:	28000000 	slti	zero,zero,0
 1f4:	01000000 	0x1000000
 1f8:	00285400 	0x285400
 1fc:	00600000 	0x600000
 200:	00010000 	sll	zero,at,0x0
 204:	00006853 	0x6853
 208:	00006c00 	sll	t5,zero,0x10
 20c:	53000100 	0x53000100
 210:	0000006c 	0x6c
 214:	00000098 	0x98
 218:	ac540001 	sw	s4,1(v0)
 21c:	d4000000 	0xd4000000
 220:	01000000 	0x1000000
 224:	00e85400 	0xe85400
 228:	00e80000 	0xe80000
 22c:	00010000 	sll	zero,at,0x0
 230:	0000e854 	0xe854
 234:	0000f000 	sll	s8,zero,0x0
 238:	53000100 	0x53000100
 23c:	000000f8 	0xf8
 240:	000000f8 	0xf8
 244:	00530001 	0x530001
	...
 250:	28000000 	slti	zero,zero,0
 254:	01000000 	0x1000000
 258:	00285500 	0x285500
 25c:	00980000 	0x980000
 260:	00010000 	sll	zero,at,0x0
 264:	00009863 	0x9863
 268:	0000a400 	sll	s4,zero,0x10
 26c:	55000100 	0x55000100
 270:	000000ac 	0xac
 274:	000000b8 	0xb8
 278:	b8630001 	swr	v1,1(v1)
 27c:	cc000000 	lwc3	$0,0(zero)
 280:	01000000 	0x1000000
 284:	00cc5500 	0xcc5500
 288:	00d40000 	0xd40000
 28c:	00010000 	sll	zero,at,0x0
 290:	0000d463 	0xd463
 294:	0000e800 	sll	sp,zero,0x0
 298:	55000100 	0x55000100
 29c:	000000e8 	0xe8
 2a0:	000000f8 	0xf8
 2a4:	f8630001 	0xf8630001
 2a8:	00000000 	nop
 2ac:	01000001 	0x1000001
 2b0:	00005500 	sll	t2,zero,0x14
	...
 2bc:	00280000 	0x280000
 2c0:	00010000 	sll	zero,at,0x0
 2c4:	00002856 	0x2856
 2c8:	00008800 	sll	s1,zero,0x0
 2cc:	62000100 	0x62000100
 2d0:	00000088 	0x88
 2d4:	000000a4 	0xa4
 2d8:	ac560001 	sw	s6,1(v0)
 2dc:	bc000000 	0xbc000000
 2e0:	01000000 	0x1000000
 2e4:	00bc6200 	0xbc6200
 2e8:	00e80000 	0xe80000
 2ec:	00010000 	sll	zero,at,0x0
 2f0:	0000e856 	0xe856
 2f4:	0000f800 	sll	ra,zero,0x0
 2f8:	62000100 	0x62000100
 2fc:	000000f8 	0xf8
 300:	00000100 	sll	zero,zero,0x4
 304:	00560001 	0x560001
	...
 310:	a4000000 	sh	zero,0(zero)
 314:	01000000 	0x1000000
 318:	00ac5700 	0xac5700
 31c:	00f00000 	0xf00000
 320:	00010000 	sll	zero,at,0x0
 324:	0000f857 	0xf857
 328:	00010000 	sll	zero,at,0x0
 32c:	57000100 	0x57000100
	...
 338:	0000003c 	0x3c
 33c:	000000c0 	sll	zero,zero,0x3
 340:	cc610001 	lwc3	$1,1(v1)
 344:	e8000000 	swc2	$0,0(zero)
 348:	01000000 	0x1000000
 34c:	00f86100 	0xf86100
 350:	01000000 	0x1000000
 354:	00010000 	sll	zero,at,0x0
 358:	00000061 	0x61
 35c:	00000000 	nop
 360:	00006c00 	sll	t5,zero,0x10
 364:	0000a400 	sll	s4,zero,0x10
 368:	53000100 	0x53000100
 36c:	000000ac 	0xac
 370:	000000e8 	0xe8
 374:	f8530001 	0xf8530001
 378:	00000000 	nop
 37c:	01000001 	0x1000001
 380:	00005300 	sll	t2,zero,0xc
 384:	00000000 	nop
 388:	00d40000 	0xd40000
 38c:	00e00000 	0xe00000
 390:	00010000 	sll	zero,at,0x0
 394:	0000f854 	0xf854
 398:	0000f800 	sll	ra,zero,0x0
 39c:	54000100 	0x54000100
	...
 3a8:	00000034 	0x34
 3ac:	00000080 	sll	zero,zero,0x2
 3b0:	ac600001 	sw	zero,1(v1)
 3b4:	c4000000 	lwc1	$f0,0(zero)
 3b8:	01000000 	0x1000000
 3bc:	00e86000 	0xe86000
 3c0:	00f80000 	0xf80000
 3c4:	00010000 	sll	zero,at,0x0
 3c8:	00000060 	0x60
	...
 3d4:	00000800 	sll	at,zero,0x0
 3d8:	55000100 	0x55000100
 3dc:	00000008 	jr	zero
 3e0:	0000000c 	syscall
 3e4:	0c560001 	jal	1580004 <data_size+0x157f874>
 3e8:	18000000 	blez	zero,3ec <data_size-0x3a4>
 3ec:	01000000 	0x1000000
 3f0:	00185500 	sll	t2,t8,0x14
 3f4:	00400000 	0x400000
 3f8:	00010000 	sll	zero,at,0x0
 3fc:	00000056 	0x56
 400:	00000000 	nop
 404:	00003c00 	sll	a3,zero,0x10
 408:	00004400 	sll	t0,zero,0x10
 40c:	52000100 	0x52000100
	...
 418:	0000004c 	syscall	0x1
 41c:	00000050 	0x50
 420:	506d0001 	0x506d0001
 424:	18000000 	blez	zero,428 <data_size-0x368>
 428:	02000001 	0x2000001
 42c:	00188d00 	sll	s1,t8,0x14
 430:	00000000 	nop
 434:	4c000000 	mfc3	zero,$0
 438:	94000000 	lhu	zero,0(zero)
 43c:	01000000 	0x1000000
 440:	00005400 	sll	t2,zero,0x10
 444:	00000000 	nop
 448:	004c0000 	0x4c0000
 44c:	007c0000 	0x7c0000
 450:	00010000 	sll	zero,at,0x0
 454:	00007c55 	0x7c55
 458:	00010800 	sll	at,at,0x0
 45c:	5a000100 	0x5a000100
	...
 468:	00000060 	0x60
 46c:	000000c4 	0xc4
 470:	00560001 	0x560001
 474:	00000000 	nop
 478:	Address 0x0000000000000478 is out of bounds.


Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	69616761 	0x69616761
   4:	6f6c006e 	0x6f6c006e
   8:	7520676e 	jalx	4819db8 <data_size+0x4819628>
   c:	6769736e 	0x6769736e
  10:	2064656e 	addi	a0,v1,25966
  14:	00746e69 	0x746e69
  18:	20554e47 	addi	s5,v0,20039
  1c:	2e342043 	sltiu	s4,s1,8259
  20:	20302e33 	addi	s0,at,11827
  24:	7000672d 	0x7000672d
  28:	746e6972 	jalx	1b9a5c8 <data_size+0x1b99e38>
  2c:	00632e66 	0x632e66
  30:	64656d2f 	0x64656d2f
  34:	732f6169 	0x732f6169
  38:	6f625f66 	0x6f625f66
  3c:	632f6b6f 	0x632f6b6f
  40:	625f7570 	0x625f7570
  44:	5f6b6f6f 	0x5f6b6f6f
  48:	30323032 	andi	s2,at,0x3032
  4c:	32323430 	andi	s2,s1,0x3430
  50:	62616c2f 	0x62616c2f
  54:	62616c2f 	0x62616c2f
  58:	702f3931 	0x702f3931
  5c:	5f667265 	0x5f667265
  60:	636e7566 	0x636e7566
  64:	62696c2f 	0x62696c2f
  68:	69727000 	0x69727000
  6c:	0066746e 	0x66746e
  70:	5f746774 	0x5f746774
  74:	63747570 	0x63747570
  78:	00726168 	0x726168
  7c:	63747570 	0x63747570
  80:	2e726168 	sltiu	s2,s3,24936
  84:	75700063 	jalx	5c0018c <data_size+0x5bff9fc>
  88:	632e7374 	0x632e7374
  8c:	74757000 	jalx	1d5c000 <data_size+0x1d5b870>
  90:	75700073 	jalx	5c001cc <data_size+0x5bffa3c>
  94:	72747374 	0x72747374
  98:	00676e69 	0x676e69
  9c:	6e697270 	0x6e697270
  a0:	73616274 	0x73616274
  a4:	00632e65 	0x632e65
  a8:	756c6176 	jalx	5b185d8 <data_size+0x5b17e48>
  ac:	6f6c0065 	0x6f6c0065
  b0:	6920676e 	0x6920676e
  b4:	7300746e 	0x7300746e
  b8:	006e6769 	0x6e6769
  bc:	6e697270 	0x6e697270
  c0:	73616274 	0x73616274
  c4:	74730065 	jalx	1cc0194 <data_size+0x1cbfa04>
  c8:	706d6372 	0x706d6372
  cc:	72747300 	0x72747300
  d0:	2e706d63 	sltiu	s0,s3,28003
  d4:	675f0063 	0x675f0063
  d8:	635f7465 	0x635f7465
  dc:	746e756f 	jalx	1b9d5bc <data_size+0x1b9ce2c>
  e0:	6d697400 	0x6d697400
  e4:	65707365 	0x65707365
  e8:	635f0063 	0x635f0063
  ec:	6b636f6c 	0x6b636f6c
  f0:	7400745f 	jalx	1d17c <data_size+0x1c9ec>
  f4:	736d5f76 	0x736d5f76
  f8:	67006365 	0x67006365
  fc:	6e5f7465 	0x6e5f7465
 100:	69740073 	0x69740073
 104:	632e656d 	0x632e656d
 108:	6f635f00 	0x6f635f00
 10c:	6176746e 	0x6176746e
 110:	6567006c 	0x6567006c
 114:	6c635f74 	0x6c635f74
 118:	006b636f 	0x6b636f
 11c:	755f7674 	jalx	57dd9d0 <data_size+0x57dd240>
 120:	00636573 	0x636573
 124:	735f7674 	0x735f7674
 128:	74006365 	jalx	18d94 <data_size+0x18604>
 12c:	736e5f76 	0x736e5f76
 130:	63006365 	0x63006365
 134:	6b636f6c 	0x6b636f6c
 138:	7465675f 	jalx	1959d7c <data_size+0x19595ec>
 13c:	656d6974 	0x656d6974
	...

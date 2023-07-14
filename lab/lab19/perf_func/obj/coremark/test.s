
obj/coremark/main.elf:     file format elf32-tradlittlemips
obj/coremark/main.elf


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
bfc00030:	3c1dbfc1 	lui	sp,0xbfc1
bfc00034:	27bdeb8c 	addiu	sp,sp,-5236
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/start.S:20
bfc00038:	3c1cbfc1 	lui	gp,0xbfc1
bfc0003c:	279c2bc0 	addiu	gp,gp,11200
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
bfc00390:	27bdffd0 	addiu	sp,sp,-48
bfc00394:	afb00024 	sw	s0,36(sp)
bfc00398:	3c10bfaf 	lui	s0,0xbfaf
bfc0039c:	36068004 	ori	a2,s0,0x8004
bfc003a0:	24051234 	li	a1,4660
bfc003a4:	3c04bfc1 	lui	a0,0xbfc1
bfc003a8:	acc50000 	sw	a1,0(a2)
bfc003ac:	2484a1f0 	addiu	a0,a0,-24080
bfc003b0:	afb10028 	sw	s1,40(sp)
bfc003b4:	afbf002c 	sw	ra,44(sp)
bfc003b8:	0ff027e6 	jal	bfc09f98 <puts>
bfc003bc:	24110001 	li	s1,1
bfc003c0:	24020007 	li	v0,7
bfc003c4:	240307d0 	li	v1,2000
bfc003c8:	00002021 	move	a0,zero
bfc003cc:	00002821 	move	a1,zero
bfc003d0:	24060066 	li	a2,102
bfc003d4:	24070001 	li	a3,1
bfc003d8:	afa20010 	sw	v0,16(sp)
bfc003dc:	afa30018 	sw	v1,24(sp)
bfc003e0:	0ff00180 	jal	bfc00600 <core_mark>
bfc003e4:	afb10014 	sw	s1,20(sp)
bfc003e8:	10400011 	beqz	v0,bfc00430 <shell+0xa0>
bfc003ec:	3c18bfc1 	lui	t8,0xbfc1
bfc003f0:	0ff027e6 	jal	bfc09f98 <puts>
bfc003f4:	2704a218 	addiu	a0,t8,-24040
bfc003f8:	8fbf002c 	lw	ra,44(sp)
bfc003fc:	360cf000 	ori	t4,s0,0xf000
bfc00400:	360ff008 	ori	t7,s0,0xf008
bfc00404:	360ef004 	ori	t6,s0,0xf004
bfc00408:	240d0002 	li	t5,2
bfc0040c:	adf10000 	sw	s1,0(t7)
bfc00410:	8fb00024 	lw	s0,36(sp)
bfc00414:	adcd0000 	sw	t5,0(t6)
bfc00418:	8fb10028 	lw	s1,40(sp)
bfc0041c:	ad800000 	sw	zero,0(t4)
bfc00420:	03e00008 	jr	ra
bfc00424:	27bd0030 	addiu	sp,sp,48
	...
bfc00430:	3c0bbfc1 	lui	t3,0xbfc1
bfc00434:	0ff027e6 	jal	bfc09f98 <puts>
bfc00438:	2564a208 	addiu	a0,t3,-24056
bfc0043c:	8fbf002c 	lw	ra,44(sp)
bfc00440:	3608f000 	ori	t0,s0,0xf000
bfc00444:	360af008 	ori	t2,s0,0xf008
bfc00448:	3609f004 	ori	t1,s0,0xf004
bfc0044c:	3407ffff 	li	a3,0xffff
bfc00450:	ad510000 	sw	s1,0(t2)
bfc00454:	8fb00024 	lw	s0,36(sp)
bfc00458:	ad310000 	sw	s1,0(t1)
bfc0045c:	8fb10028 	lw	s1,40(sp)
bfc00460:	ad070000 	sw	a3,0(t0)
bfc00464:	03e00008 	jr	ra
bfc00468:	27bd0030 	addiu	sp,sp,48
bfc0046c:	00000000 	nop

bfc00470 <iterate>:
iterate():
bfc00470:	27bdffd8 	addiu	sp,sp,-40
bfc00474:	afb30020 	sw	s3,32(sp)
bfc00478:	8c93001c 	lw	s3,28(a0)
bfc0047c:	afb00014 	sw	s0,20(sp)
bfc00480:	afbf0024 	sw	ra,36(sp)
bfc00484:	afb2001c 	sw	s2,28(sp)
bfc00488:	afb10018 	sw	s1,24(sp)
bfc0048c:	00808021 	move	s0,a0
bfc00490:	a4800038 	sh	zero,56(a0)
bfc00494:	a480003a 	sh	zero,58(a0)
bfc00498:	a480003c 	sh	zero,60(a0)
bfc0049c:	1260004d 	beqz	s3,bfc005d4 <iterate+0x164>
bfc004a0:	a480003e 	sh	zero,62(a0)
bfc004a4:	24050001 	li	a1,1
bfc004a8:	2662ffff 	addiu	v0,s3,-1
bfc004ac:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc004b0:	30520001 	andi	s2,v0,0x1
bfc004b4:	96050038 	lhu	a1,56(s0)
bfc004b8:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc004bc:	00402021 	move	a0,v0
bfc004c0:	a6020038 	sh	v0,56(s0)
bfc004c4:	2405ffff 	li	a1,-1
bfc004c8:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc004cc:	02002021 	move	a0,s0
bfc004d0:	96050038 	lhu	a1,56(s0)
bfc004d4:	24110001 	li	s1,1
bfc004d8:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc004dc:	00402021 	move	a0,v0
bfc004e0:	0233182b 	sltu	v1,s1,s3
bfc004e4:	a602003a 	sh	v0,58(s0)
bfc004e8:	1060003a 	beqz	v1,bfc005d4 <iterate+0x164>
bfc004ec:	a6020038 	sh	v0,56(s0)
bfc004f0:	12400013 	beqz	s2,bfc00540 <iterate+0xd0>
bfc004f4:	02002021 	move	a0,s0
bfc004f8:	24050001 	li	a1,1
bfc004fc:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc00500:	02002021 	move	a0,s0
bfc00504:	96050038 	lhu	a1,56(s0)
bfc00508:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc0050c:	00402021 	move	a0,v0
bfc00510:	a6020038 	sh	v0,56(s0)
bfc00514:	2405ffff 	li	a1,-1
bfc00518:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc0051c:	02002021 	move	a0,s0
bfc00520:	96050038 	lhu	a1,56(s0)
bfc00524:	00402021 	move	a0,v0
bfc00528:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc0052c:	26310001 	addiu	s1,s1,1
bfc00530:	0233202b 	sltu	a0,s1,s3
bfc00534:	10800027 	beqz	a0,bfc005d4 <iterate+0x164>
bfc00538:	a6020038 	sh	v0,56(s0)
bfc0053c:	02002021 	move	a0,s0
bfc00540:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc00544:	24050001 	li	a1,1
bfc00548:	96050038 	lhu	a1,56(s0)
bfc0054c:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc00550:	00402021 	move	a0,v0
bfc00554:	a6020038 	sh	v0,56(s0)
bfc00558:	02002021 	move	a0,s0
bfc0055c:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc00560:	2405ffff 	li	a1,-1
bfc00564:	96050038 	lhu	a1,56(s0)
bfc00568:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc0056c:	00402021 	move	a0,v0
bfc00570:	26320001 	addiu	s2,s1,1
bfc00574:	02002021 	move	a0,s0
bfc00578:	24050001 	li	a1,1
bfc0057c:	16200002 	bnez	s1,bfc00588 <iterate+0x118>
bfc00580:	a6020038 	sh	v0,56(s0)
bfc00584:	a602003a 	sh	v0,58(s0)
bfc00588:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc0058c:	00000000 	nop
bfc00590:	96050038 	lhu	a1,56(s0)
bfc00594:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc00598:	00402021 	move	a0,v0
bfc0059c:	a6020038 	sh	v0,56(s0)
bfc005a0:	02002021 	move	a0,s0
bfc005a4:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc005a8:	2405ffff 	li	a1,-1
bfc005ac:	96050038 	lhu	a1,56(s0)
bfc005b0:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc005b4:	00402021 	move	a0,v0
bfc005b8:	16400002 	bnez	s2,bfc005c4 <iterate+0x154>
bfc005bc:	a6020038 	sh	v0,56(s0)
bfc005c0:	a602003a 	sh	v0,58(s0)
bfc005c4:	26510001 	addiu	s1,s2,1
bfc005c8:	0233282b 	sltu	a1,s1,s3
bfc005cc:	14a0ffdb 	bnez	a1,bfc0053c <iterate+0xcc>
bfc005d0:	00000000 	nop
bfc005d4:	8fbf0024 	lw	ra,36(sp)
bfc005d8:	00001021 	move	v0,zero
bfc005dc:	8fb30020 	lw	s3,32(sp)
bfc005e0:	8fb2001c 	lw	s2,28(sp)
bfc005e4:	8fb10018 	lw	s1,24(sp)
bfc005e8:	8fb00014 	lw	s0,20(sp)
bfc005ec:	03e00008 	jr	ra
bfc005f0:	27bd0028 	addiu	sp,sp,40
	...

bfc00600 <core_mark>:
core_mark():
bfc00600:	27bdf798 	addiu	sp,sp,-2152
bfc00604:	afb40850 	sw	s4,2128(sp)
bfc00608:	afb3084c 	sw	s3,2124(sp)
bfc0060c:	00c0a021 	move	s4,a2
bfc00610:	00a09821 	move	s3,a1
bfc00614:	afb20848 	sw	s2,2120(sp)
bfc00618:	afb00840 	sw	s0,2112(sp)
bfc0061c:	00809021 	move	s2,a0
bfc00620:	8fb00878 	lw	s0,2168(sp)
bfc00624:	8fa2087c 	lw	v0,2172(sp)
bfc00628:	8fa30880 	lw	v1,2176(sp)
bfc0062c:	3c04bfc1 	lui	a0,0xbfc1
bfc00630:	afb10844 	sw	s1,2116(sp)
bfc00634:	2484a22c 	addiu	a0,a0,-24020
bfc00638:	00e08821 	move	s1,a3
bfc0063c:	02402821 	move	a1,s2
bfc00640:	02603021 	move	a2,s3
bfc00644:	02803821 	move	a3,s4
bfc00648:	afbf0864 	sw	ra,2148(sp)
bfc0064c:	afbe0860 	sw	s8,2144(sp)
bfc00650:	afb7085c 	sw	s7,2140(sp)
bfc00654:	afb60858 	sw	s6,2136(sp)
bfc00658:	afb50854 	sw	s5,2132(sp)
bfc0065c:	afa20018 	sw	v0,24(sp)
bfc00660:	afa3001c 	sw	v1,28(sp)
bfc00664:	afb10010 	sw	s1,16(sp)
bfc00668:	0ff02720 	jal	bfc09c80 <printf>
bfc0066c:	afb00014 	sw	s0,20(sp)
bfc00670:	a7b20020 	sh	s2,32(sp)
bfc00674:	a7b30022 	sh	s3,34(sp)
bfc00678:	a7b40024 	sh	s4,36(sp)
bfc0067c:	16000002 	bnez	s0,bfc00688 <core_mark+0x88>
bfc00680:	afb1003c 	sw	s1,60(sp)
bfc00684:	24100007 	li	s0,7
bfc00688:	8fa30020 	lw	v1,32(sp)
bfc0068c:	00000000 	nop
bfc00690:	14600006 	bnez	v1,bfc006ac <core_mark+0xac>
bfc00694:	24070001 	li	a3,1
bfc00698:	87a50024 	lh	a1,36(sp)
bfc0069c:	00000000 	nop
bfc006a0:	10a00323 	beqz	a1,bfc01330 <core_mark+0xd30>
bfc006a4:	24060066 	li	a2,102
bfc006a8:	24070001 	li	a3,1
bfc006ac:	10670326 	beq	v1,a3,bfc01348 <core_mark+0xd48>
bfc006b0:	00000000 	nop
bfc006b4:	32080001 	andi	t0,s0,0x1
bfc006b8:	87a60020 	lh	a2,32(sp)
bfc006bc:	0008182b 	sltu	v1,zero,t0
bfc006c0:	27a90064 	addiu	t1,sp,100
bfc006c4:	246b0001 	addiu	t3,v1,1
bfc006c8:	32070002 	andi	a3,s0,0x2
bfc006cc:	afa90028 	sw	t1,40(sp)
bfc006d0:	a7a60020 	sh	a2,32(sp)
bfc006d4:	a7a00060 	sh	zero,96(sp)
bfc006d8:	afb00040 	sw	s0,64(sp)
bfc006dc:	3162ffff 	andi	v0,t3,0xffff
bfc006e0:	14e00002 	bnez	a3,bfc006ec <core_mark+0xec>
bfc006e4:	02002821 	move	a1,s0
bfc006e8:	00601021 	move	v0,v1
bfc006ec:	32100004 	andi	s0,s0,0x4
bfc006f0:	12000002 	beqz	s0,bfc006fc <core_mark+0xfc>
bfc006f4:	24430001 	addiu	v1,v0,1
bfc006f8:	00601021 	move	v0,v1
bfc006fc:	304dffff 	andi	t5,v0,0xffff
bfc00700:	240c07d0 	li	t4,2000
bfc00704:	15a00002 	bnez	t5,bfc00710 <core_mark+0x110>
bfc00708:	018d001b 	divu	zero,t4,t5
bfc0070c:	0007000d 	break	0x7
bfc00710:	00002012 	mflo	a0
bfc00714:	15000292 	bnez	t0,bfc01160 <core_mark+0xb60>
bfc00718:	afa40038 	sw	a0,56(sp)
bfc0071c:	00001821 	move	v1,zero
bfc00720:	10e00006 	beqz	a3,bfc0073c <core_mark+0x13c>
bfc00724:	00640018 	mult	v1,a0
bfc00728:	24750001 	addiu	s5,v1,1
bfc0072c:	32a3ffff 	andi	v1,s5,0xffff
bfc00730:	00007812 	mflo	t7
bfc00734:	012f7021 	addu	t6,t1,t7
bfc00738:	afae0030 	sw	t6,48(sp)
bfc0073c:	12000004 	beqz	s0,bfc00750 <core_mark+0x150>
bfc00740:	00640018 	mult	v1,a0
bfc00744:	0000b012 	mflo	s6
bfc00748:	01368021 	addu	s0,t1,s6
bfc0074c:	afb00034 	sw	s0,52(sp)
bfc00750:	1500006f 	bnez	t0,bfc00910 <core_mark+0x310>
bfc00754:	00000000 	nop
bfc00758:	14e00075 	bnez	a3,bfc00930 <core_mark+0x330>
bfc0075c:	00000000 	nop
bfc00760:	30be0004 	andi	s8,a1,0x4
bfc00764:	17c0007f 	bnez	s8,bfc00964 <core_mark+0x364>
bfc00768:	00000000 	nop
bfc0076c:	8fbf003c 	lw	ra,60(sp)
bfc00770:	00000000 	nop
bfc00774:	17e00085 	bnez	ra,bfc0098c <core_mark+0x38c>
bfc00778:	3c0cbfc1 	lui	t4,0xbfc1
bfc0077c:	24020001 	li	v0,1
bfc00780:	27b20020 	addiu	s2,sp,32
bfc00784:	000298c0 	sll	s3,v0,0x3
bfc00788:	0002a040 	sll	s4,v0,0x1
bfc0078c:	02938821 	addu	s1,s4,s3
bfc00790:	0ff0271c 	jal	bfc09c70 <start_time>
bfc00794:	afb1003c 	sw	s1,60(sp)
bfc00798:	8fb3003c 	lw	s3,60(sp)
bfc0079c:	a7a00058 	sh	zero,88(sp)
bfc007a0:	a7a0005a 	sh	zero,90(sp)
bfc007a4:	a7a0005c 	sh	zero,92(sp)
bfc007a8:	1260004d 	beqz	s3,bfc008e0 <core_mark+0x2e0>
bfc007ac:	a7a0005e 	sh	zero,94(sp)
bfc007b0:	24050001 	li	a1,1
bfc007b4:	2662ffff 	addiu	v0,s3,-1
bfc007b8:	02402021 	move	a0,s2
bfc007bc:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc007c0:	30510001 	andi	s1,v0,0x1
bfc007c4:	97a50058 	lhu	a1,88(sp)
bfc007c8:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc007cc:	00402021 	move	a0,v0
bfc007d0:	2405ffff 	li	a1,-1
bfc007d4:	02402021 	move	a0,s2
bfc007d8:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc007dc:	a7a20058 	sh	v0,88(sp)
bfc007e0:	97a50058 	lhu	a1,88(sp)
bfc007e4:	24100001 	li	s0,1
bfc007e8:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc007ec:	00402021 	move	a0,v0
bfc007f0:	0213182b 	sltu	v1,s0,s3
bfc007f4:	a7a2005a 	sh	v0,90(sp)
bfc007f8:	10600039 	beqz	v1,bfc008e0 <core_mark+0x2e0>
bfc007fc:	a7a20058 	sh	v0,88(sp)
bfc00800:	12200011 	beqz	s1,bfc00848 <core_mark+0x248>
bfc00804:	24050001 	li	a1,1
bfc00808:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc0080c:	02402021 	move	a0,s2
bfc00810:	97a50058 	lhu	a1,88(sp)
bfc00814:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc00818:	00402021 	move	a0,v0
bfc0081c:	2405ffff 	li	a1,-1
bfc00820:	02402021 	move	a0,s2
bfc00824:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc00828:	a7a20058 	sh	v0,88(sp)
bfc0082c:	97a50058 	lhu	a1,88(sp)
bfc00830:	26100001 	addiu	s0,s0,1
bfc00834:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc00838:	00402021 	move	a0,v0
bfc0083c:	0213882b 	sltu	s1,s0,s3
bfc00840:	12200027 	beqz	s1,bfc008e0 <core_mark+0x2e0>
bfc00844:	a7a20058 	sh	v0,88(sp)
bfc00848:	02402021 	move	a0,s2
bfc0084c:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc00850:	24050001 	li	a1,1
bfc00854:	97a50058 	lhu	a1,88(sp)
bfc00858:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc0085c:	00402021 	move	a0,v0
bfc00860:	02402021 	move	a0,s2
bfc00864:	2405ffff 	li	a1,-1
bfc00868:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc0086c:	a7a20058 	sh	v0,88(sp)
bfc00870:	97a50058 	lhu	a1,88(sp)
bfc00874:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc00878:	00402021 	move	a0,v0
bfc0087c:	26110001 	addiu	s1,s0,1
bfc00880:	02402021 	move	a0,s2
bfc00884:	24050001 	li	a1,1
bfc00888:	16000002 	bnez	s0,bfc00894 <core_mark+0x294>
bfc0088c:	a7a20058 	sh	v0,88(sp)
bfc00890:	a7a2005a 	sh	v0,90(sp)
bfc00894:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc00898:	00000000 	nop
bfc0089c:	97a50058 	lhu	a1,88(sp)
bfc008a0:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc008a4:	00402021 	move	a0,v0
bfc008a8:	02402021 	move	a0,s2
bfc008ac:	2405ffff 	li	a1,-1
bfc008b0:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc008b4:	a7a20058 	sh	v0,88(sp)
bfc008b8:	97a50058 	lhu	a1,88(sp)
bfc008bc:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc008c0:	00402021 	move	a0,v0
bfc008c4:	16200002 	bnez	s1,bfc008d0 <core_mark+0x2d0>
bfc008c8:	a7a20058 	sh	v0,88(sp)
bfc008cc:	a7a2005a 	sh	v0,90(sp)
bfc008d0:	26300001 	addiu	s0,s1,1
bfc008d4:	0213c02b 	sltu	t8,s0,s3
bfc008d8:	1700ffdc 	bnez	t8,bfc0084c <core_mark+0x24c>
bfc008dc:	02402021 	move	a0,s2
bfc008e0:	0ff02718 	jal	bfc09c60 <stop_time>
bfc008e4:	00000000 	nop
bfc008e8:	0ff026f0 	jal	bfc09bc0 <get_time>
bfc008ec:	00000000 	nop
bfc008f0:	0ff02708 	jal	bfc09c20 <time_in_secs>
bfc008f4:	00402021 	move	a0,v0
bfc008f8:	1440021d 	bnez	v0,bfc01170 <core_mark+0xb70>
bfc008fc:	2407000a 	li	a3,10
bfc00900:	8fa2003c 	lw	v0,60(sp)
bfc00904:	0bf001e2 	j	bfc00788 <core_mark+0x188>
bfc00908:	000298c0 	sll	s3,v0,0x3
bfc0090c:	00000000 	nop
bfc00910:	8fa5002c 	lw	a1,44(sp)
bfc00914:	0ff02208 	jal	bfc08820 <core_list_init>
bfc00918:	00000000 	nop
bfc0091c:	8fa50040 	lw	a1,64(sp)
bfc00920:	00000000 	nop
bfc00924:	30a70002 	andi	a3,a1,0x2
bfc00928:	10e0ff8d 	beqz	a3,bfc00760 <core_mark+0x160>
bfc0092c:	afa20044 	sw	v0,68(sp)
bfc00930:	87b90022 	lh	t9,34(sp)
bfc00934:	87b80020 	lh	t8,32(sp)
bfc00938:	0019bc00 	sll	s7,t9,0x10
bfc0093c:	8fa50030 	lw	a1,48(sp)
bfc00940:	8fa40038 	lw	a0,56(sp)
bfc00944:	02f83025 	or	a2,s7,t8
bfc00948:	0ff00548 	jal	bfc01520 <core_init_matrix>
bfc0094c:	27a70048 	addiu	a3,sp,72
bfc00950:	8fa50040 	lw	a1,64(sp)
bfc00954:	00000000 	nop
bfc00958:	30be0004 	andi	s8,a1,0x4
bfc0095c:	13c0ff83 	beqz	s8,bfc0076c <core_mark+0x16c>
bfc00960:	00000000 	nop
bfc00964:	8fa40038 	lw	a0,56(sp)
bfc00968:	87a50020 	lh	a1,32(sp)
bfc0096c:	8fa60034 	lw	a2,52(sp)
bfc00970:	0ff01ba0 	jal	bfc06e80 <core_init_state>
bfc00974:	00000000 	nop
bfc00978:	8fbf003c 	lw	ra,60(sp)
bfc0097c:	00000000 	nop
bfc00980:	13e0ff7f 	beqz	ra,bfc00780 <core_mark+0x180>
bfc00984:	24020001 	li	v0,1
bfc00988:	3c0cbfc1 	lui	t4,0xbfc1
bfc0098c:	240b0001 	li	t3,1
bfc00990:	2584a258 	addiu	a0,t4,-23976
bfc00994:	0ff027e6 	jal	bfc09f98 <puts>
bfc00998:	af8b8010 	sw	t3,-32752(gp)
bfc0099c:	3c0abfaf 	lui	t2,0xbfaf
bfc009a0:	3549fff8 	ori	t1,t2,0xfff8
bfc009a4:	8d280000 	lw	t0,0(t1)
bfc009a8:	00000000 	nop
bfc009ac:	150001dc 	bnez	t0,bfc01120 <core_mark+0xb20>
bfc009b0:	3c0dbfc1 	lui	t5,0xbfc1
bfc009b4:	0ff02840 	jal	bfc0a100 <get_ns>
bfc009b8:	0000a821 	move	s5,zero
bfc009bc:	af828020 	sw	v0,-32736(gp)
bfc009c0:	24140001 	li	s4,1
bfc009c4:	8fb3003c 	lw	s3,60(sp)
bfc009c8:	a7a00058 	sh	zero,88(sp)
bfc009cc:	a7a0005a 	sh	zero,90(sp)
bfc009d0:	a7a0005c 	sh	zero,92(sp)
bfc009d4:	1260004e 	beqz	s3,bfc00b10 <core_mark+0x510>
bfc009d8:	a7a0005e 	sh	zero,94(sp)
bfc009dc:	27b10020 	addiu	s1,sp,32
bfc009e0:	266fffff 	addiu	t7,s3,-1
bfc009e4:	24050001 	li	a1,1
bfc009e8:	02202021 	move	a0,s1
bfc009ec:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc009f0:	31f20001 	andi	s2,t7,0x1
bfc009f4:	97a50058 	lhu	a1,88(sp)
bfc009f8:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc009fc:	00402021 	move	a0,v0
bfc00a00:	2405ffff 	li	a1,-1
bfc00a04:	02202021 	move	a0,s1
bfc00a08:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc00a0c:	a7a20058 	sh	v0,88(sp)
bfc00a10:	97a50058 	lhu	a1,88(sp)
bfc00a14:	24100001 	li	s0,1
bfc00a18:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc00a1c:	00402021 	move	a0,v0
bfc00a20:	0213702b 	sltu	t6,s0,s3
bfc00a24:	a7a2005a 	sh	v0,90(sp)
bfc00a28:	11c00039 	beqz	t6,bfc00b10 <core_mark+0x510>
bfc00a2c:	a7a20058 	sh	v0,88(sp)
bfc00a30:	12400011 	beqz	s2,bfc00a78 <core_mark+0x478>
bfc00a34:	24050001 	li	a1,1
bfc00a38:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc00a3c:	02202021 	move	a0,s1
bfc00a40:	97a50058 	lhu	a1,88(sp)
bfc00a44:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc00a48:	00402021 	move	a0,v0
bfc00a4c:	2405ffff 	li	a1,-1
bfc00a50:	02202021 	move	a0,s1
bfc00a54:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc00a58:	a7a20058 	sh	v0,88(sp)
bfc00a5c:	97a50058 	lhu	a1,88(sp)
bfc00a60:	26100001 	addiu	s0,s0,1
bfc00a64:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc00a68:	00402021 	move	a0,v0
bfc00a6c:	0213302b 	sltu	a2,s0,s3
bfc00a70:	10c00027 	beqz	a2,bfc00b10 <core_mark+0x510>
bfc00a74:	a7a20058 	sh	v0,88(sp)
bfc00a78:	02202021 	move	a0,s1
bfc00a7c:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc00a80:	24050001 	li	a1,1
bfc00a84:	97a50058 	lhu	a1,88(sp)
bfc00a88:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc00a8c:	00402021 	move	a0,v0
bfc00a90:	02202021 	move	a0,s1
bfc00a94:	2405ffff 	li	a1,-1
bfc00a98:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc00a9c:	a7a20058 	sh	v0,88(sp)
bfc00aa0:	97a50058 	lhu	a1,88(sp)
bfc00aa4:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc00aa8:	00402021 	move	a0,v0
bfc00aac:	26120001 	addiu	s2,s0,1
bfc00ab0:	02202021 	move	a0,s1
bfc00ab4:	24050001 	li	a1,1
bfc00ab8:	16000002 	bnez	s0,bfc00ac4 <core_mark+0x4c4>
bfc00abc:	a7a20058 	sh	v0,88(sp)
bfc00ac0:	a7a2005a 	sh	v0,90(sp)
bfc00ac4:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc00ac8:	00000000 	nop
bfc00acc:	97a50058 	lhu	a1,88(sp)
bfc00ad0:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc00ad4:	00402021 	move	a0,v0
bfc00ad8:	02202021 	move	a0,s1
bfc00adc:	2405ffff 	li	a1,-1
bfc00ae0:	0ff02444 	jal	bfc09110 <core_bench_list>
bfc00ae4:	a7a20058 	sh	v0,88(sp)
bfc00ae8:	97a50058 	lhu	a1,88(sp)
bfc00aec:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc00af0:	00402021 	move	a0,v0
bfc00af4:	16400002 	bnez	s2,bfc00b00 <core_mark+0x500>
bfc00af8:	a7a20058 	sh	v0,88(sp)
bfc00afc:	a7a2005a 	sh	v0,90(sp)
bfc00b00:	26500001 	addiu	s0,s2,1
bfc00b04:	0213f82b 	sltu	ra,s0,s3
bfc00b08:	17e0ffdc 	bnez	ra,bfc00a7c <core_mark+0x47c>
bfc00b0c:	02202021 	move	a0,s1
bfc00b10:	3c17bfaf 	lui	s7,0xbfaf
bfc00b14:	36f6fff8 	ori	s6,s7,0xfff8
bfc00b18:	8ed00000 	lw	s0,0(s6)
bfc00b1c:	00000000 	nop
bfc00b20:	16000187 	bnez	s0,bfc01140 <core_mark+0xb40>
bfc00b24:	00000000 	nop
bfc00b28:	0ff02840 	jal	bfc0a100 <get_ns>
bfc00b2c:	00000000 	nop
bfc00b30:	af828014 	sw	v0,-32748(gp)
bfc00b34:	8f898020 	lw	t1,-32736(gp)
bfc00b38:	00000000 	nop
bfc00b3c:	00495023 	subu	t2,v0,t1
bfc00b40:	af8a8018 	sw	t2,-32744(gp)
bfc00b44:	3c19bfc1 	lui	t9,0xbfc1
bfc00b48:	0ff027e6 	jal	bfc09f98 <puts>
bfc00b4c:	2724a274 	addiu	a0,t9,-23948
bfc00b50:	87a40020 	lh	a0,32(sp)
bfc00b54:	0ff017d8 	jal	bfc05f60 <crc16>
bfc00b58:	00002821 	move	a1,zero
bfc00b5c:	87a40022 	lh	a0,34(sp)
bfc00b60:	0ff017d8 	jal	bfc05f60 <crc16>
bfc00b64:	00402821 	move	a1,v0
bfc00b68:	87a40024 	lh	a0,36(sp)
bfc00b6c:	0ff017d8 	jal	bfc05f60 <crc16>
bfc00b70:	00402821 	move	a1,v0
bfc00b74:	87a40038 	lh	a0,56(sp)
bfc00b78:	0ff017d8 	jal	bfc05f60 <crc16>
bfc00b7c:	00402821 	move	a1,v0
bfc00b80:	24187b05 	li	t8,31493
bfc00b84:	1058025a 	beq	v0,t8,bfc014f0 <core_mark+0xef0>
bfc00b88:	0040b021 	move	s6,v0
bfc00b8c:	2c5e7b06 	sltiu	s8,v0,31494
bfc00b90:	17c00183 	bnez	s8,bfc011a0 <core_mark+0xba0>
bfc00b94:	241f18f2 	li	ra,6386
bfc00b98:	34148a02 	li	s4,0x8a02
bfc00b9c:	1054024d 	beq	v0,s4,bfc014d4 <core_mark+0xed4>
bfc00ba0:	3413e9f5 	li	s3,0xe9f5
bfc00ba4:	105301f2 	beq	v0,s3,bfc01370 <core_mark+0xd70>
bfc00ba8:	3c04bfc1 	lui	a0,0xbfc1
bfc00bac:	3410ffff 	li	s0,0xffff
bfc00bb0:	0ff016b8 	jal	bfc05ae0 <check_data_types>
bfc00bb4:	00000000 	nop
bfc00bb8:	0202a021 	addu	s4,s0,v0
bfc00bbc:	00148c00 	sll	s1,s4,0x10
bfc00bc0:	00119c03 	sra	s3,s1,0x10
bfc00bc4:	3c19bfb0 	lui	t9,0xbfb0
bfc00bc8:	af208ffc 	sw	zero,-28676(t9)
bfc00bcc:	af208ffc 	sw	zero,-28676(t9)
bfc00bd0:	af20fff8 	sw	zero,-8(t9)
bfc00bd4:	af208ffc 	sw	zero,-28676(t9)
bfc00bd8:	af208ffc 	sw	zero,-28676(t9)
bfc00bdc:	8f208ffc 	lw	zero,-28676(t9)
bfc00be0:	8f39fff8 	lw	t9,-8(t9)
bfc00be4:	3c04bfaf 	lui	a0,0xbfaf
bfc00be8:	349efff8 	ori	s8,a0,0xfff8
bfc00bec:	8fd70000 	lw	s7,0(s8)
bfc00bf0:	00000000 	nop
bfc00bf4:	16e00226 	bnez	s7,bfc01490 <core_mark+0xe90>
bfc00bf8:	3c02bfc1 	lui	v0,0xbfc1
bfc00bfc:	8f8f8018 	lw	t7,-32744(gp)
bfc00c00:	3498f010 	ori	t8,a0,0xf010
bfc00c04:	af0f0000 	sw	t7,0(t8)
bfc00c08:	3c1fbfc1 	lui	ra,0xbfc1
bfc00c0c:	8fa50038 	lw	a1,56(sp)
bfc00c10:	27e4a3fc 	addiu	a0,ra,-23556
bfc00c14:	0ff02720 	jal	bfc09c80 <printf>
bfc00c18:	241e03e8 	li	s8,1000
bfc00c1c:	3c08bfc1 	lui	t0,0xbfc1
bfc00c20:	8f858018 	lw	a1,-32744(gp)
bfc00c24:	0ff02720 	jal	bfc09c80 <printf>
bfc00c28:	2504a414 	addiu	a0,t0,-23532
bfc00c2c:	8f8e8018 	lw	t6,-32744(gp)
bfc00c30:	17c00002 	bnez	s8,bfc00c3c <core_mark+0x63c>
bfc00c34:	01de001b 	divu	zero,t6,s8
bfc00c38:	0007000d 	break	0x7
bfc00c3c:	8fab003c 	lw	t3,60(sp)
bfc00c40:	8f8c8010 	lw	t4,-32752(gp)
bfc00c44:	3c073b9a 	lui	a3,0x3b9a
bfc00c48:	34e9ca00 	ori	t1,a3,0xca00
bfc00c4c:	3c0dbfc1 	lui	t5,0xbfc1
bfc00c50:	00008812 	mflo	s1
	...
bfc00c5c:	016c0018 	mult	t3,t4
bfc00c60:	00005012 	mflo	t2
	...
bfc00c6c:	01490018 	mult	t2,t1
bfc00c70:	0000a012 	mflo	s4
bfc00c74:	00000000 	nop
bfc00c78:	16200002 	bnez	s1,bfc00c84 <core_mark+0x684>
bfc00c7c:	0291001b 	divu	zero,s4,s1
bfc00c80:	0007000d 	break	0x7
bfc00c84:	00002812 	mflo	a1
bfc00c88:	0ff02720 	jal	bfc09c80 <printf>
bfc00c8c:	25a4a424 	addiu	a0,t5,-23516
bfc00c90:	8f978018 	lw	s7,-32744(gp)
bfc00c94:	8fb5003c 	lw	s5,60(sp)
bfc00c98:	17c00002 	bnez	s8,bfc00ca4 <core_mark+0x6a4>
bfc00c9c:	02fe001b 	divu	zero,s7,s8
bfc00ca0:	0007000d 	break	0x7
bfc00ca4:	3c18bfc1 	lui	t8,0xbfc1
bfc00ca8:	00153200 	sll	a2,s5,0x8
bfc00cac:	001528c0 	sll	a1,s5,0x3
bfc00cb0:	00c52023 	subu	a0,a2,a1
bfc00cb4:	00049180 	sll	s2,a0,0x6
bfc00cb8:	02448023 	subu	s0,s2,a0
bfc00cbc:	02151021 	addu	v0,s0,s5
bfc00cc0:	00021880 	sll	v1,v0,0x2
bfc00cc4:	0043c821 	addu	t9,v0,v1
bfc00cc8:	00194200 	sll	t0,t9,0x8
bfc00ccc:	2704a440 	addiu	a0,t8,-23488
bfc00cd0:	24050032 	li	a1,50
bfc00cd4:	00007812 	mflo	t7
bfc00cd8:	00000000 	nop
bfc00cdc:	15e00002 	bnez	t7,bfc00ce8 <core_mark+0x6e8>
bfc00ce0:	010f001b 	divu	zero,t0,t7
bfc00ce4:	0007000d 	break	0x7
bfc00ce8:	00007012 	mflo	t6
bfc00cec:	0ff02720 	jal	bfc09c80 <printf>
bfc00cf0:	af8e801c 	sw	t6,-32740(gp)
bfc00cf4:	3c0dbfc1 	lui	t5,0xbfc1
bfc00cf8:	8f85801c 	lw	a1,-32740(gp)
bfc00cfc:	0ff02720 	jal	bfc09c80 <printf>
bfc00d00:	25a4a460 	addiu	a0,t5,-23456
bfc00d04:	3c0cbfc1 	lui	t4,0xbfc1
bfc00d08:	0ff027e6 	jal	bfc09f98 <puts>
bfc00d0c:	2584a47c 	addiu	a0,t4,-23428
bfc00d10:	3c0bbfc1 	lui	t3,0xbfc1
bfc00d14:	0ff027e6 	jal	bfc09f98 <puts>
bfc00d18:	2564a4d8 	addiu	a0,t3,-23336
bfc00d1c:	3c07bfc1 	lui	a3,0xbfc1
bfc00d20:	0ff027e6 	jal	bfc09f98 <puts>
bfc00d24:	24e4a51c 	addiu	a0,a3,-23268
bfc00d28:	8fa5003c 	lw	a1,60(sp)
bfc00d2c:	3c0abfc1 	lui	t2,0xbfc1
bfc00d30:	8f868018 	lw	a2,-32744(gp)
bfc00d34:	0ff02720 	jal	bfc09c80 <printf>
bfc00d38:	2544a558 	addiu	a0,t2,-23208
bfc00d3c:	3c09bfc1 	lui	t1,0xbfc1
bfc00d40:	2524a584 	addiu	a0,t1,-23164
bfc00d44:	0ff02720 	jal	bfc09c80 <printf>
bfc00d48:	00002821 	move	a1,zero
bfc00d4c:	8fbe003c 	lw	s8,60(sp)
bfc00d50:	8f918010 	lw	s1,-32752(gp)
bfc00d54:	3c17bfc1 	lui	s7,0xbfc1
bfc00d58:	023e0018 	mult	s1,s8
bfc00d5c:	26e4a5b4 	addiu	a0,s7,-23116
bfc00d60:	3c12bfc1 	lui	s2,0xbfc1
bfc00d64:	3c15bfc1 	lui	s5,0xbfc1
bfc00d68:	00002812 	mflo	a1
bfc00d6c:	0ff02720 	jal	bfc09c80 <printf>
bfc00d70:	3c10bfc1 	lui	s0,0xbfc1
bfc00d74:	3c06bfc1 	lui	a2,0xbfc1
bfc00d78:	3c05bfc1 	lui	a1,0xbfc1
bfc00d7c:	24a4a5cc 	addiu	a0,a1,-23092
bfc00d80:	0ff02720 	jal	bfc09c80 <printf>
bfc00d84:	24c5a5e4 	addiu	a1,a2,-23068
bfc00d88:	3c04bfc1 	lui	a0,0xbfc1
bfc00d8c:	2484a5f0 	addiu	a0,a0,-23056
bfc00d90:	0ff02720 	jal	bfc09c80 <printf>
bfc00d94:	2645a608 	addiu	a1,s2,-23032
bfc00d98:	26a4a6b8 	addiu	a0,s5,-22856
bfc00d9c:	0ff02720 	jal	bfc09c80 <printf>
bfc00da0:	2605a6d0 	addiu	a1,s0,-22832
bfc00da4:	3c03bfc1 	lui	v1,0xbfc1
bfc00da8:	2464a720 	addiu	a0,v1,-22752
bfc00dac:	0ff02720 	jal	bfc09c80 <printf>
bfc00db0:	02c02821 	move	a1,s6
bfc00db4:	8fa30040 	lw	v1,64(sp)
bfc00db8:	00000000 	nop
bfc00dbc:	30760001 	andi	s6,v1,0x1
bfc00dc0:	16c0016f 	bnez	s6,bfc01380 <core_mark+0xd80>
bfc00dc4:	00000000 	nop
bfc00dc8:	8f868010 	lw	a2,-32752(gp)
bfc00dcc:	306f0002 	andi	t7,v1,0x2
bfc00dd0:	11e00041 	beqz	t7,bfc00ed8 <core_mark+0x8d8>
bfc00dd4:	30700004 	andi	s0,v1,0x4
bfc00dd8:	10c0003e 	beqz	a2,bfc00ed4 <core_mark+0x8d4>
bfc00ddc:	00008021 	move	s0,zero
bfc00de0:	3c18bfc1 	lui	t8,0xbfc1
bfc00de4:	2712a758 	addiu	s2,t8,-22696
bfc00de8:	27b10020 	addiu	s1,sp,32
bfc00dec:	00102880 	sll	a1,s0,0x2
bfc00df0:	0010b980 	sll	s7,s0,0x6
bfc00df4:	00b73021 	addu	a2,a1,s7
bfc00df8:	02262021 	addu	a0,s1,a2
bfc00dfc:	9486003c 	lhu	a2,60(a0)
bfc00e00:	02002821 	move	a1,s0
bfc00e04:	02402021 	move	a0,s2
bfc00e08:	0ff02720 	jal	bfc09c80 <printf>
bfc00e0c:	26150001 	addiu	s5,s0,1
bfc00e10:	32b0ffff 	andi	s0,s5,0xffff
bfc00e14:	8f868010 	lw	a2,-32752(gp)
bfc00e18:	00101980 	sll	v1,s0,0x6
bfc00e1c:	0010b080 	sll	s6,s0,0x2
bfc00e20:	02c31021 	addu	v0,s6,v1
bfc00e24:	0206c82b 	sltu	t9,s0,a2
bfc00e28:	02402021 	move	a0,s2
bfc00e2c:	02221821 	addu	v1,s1,v0
bfc00e30:	13200026 	beqz	t9,bfc00ecc <core_mark+0x8cc>
bfc00e34:	02002821 	move	a1,s0
bfc00e38:	9466003c 	lhu	a2,60(v1)
bfc00e3c:	0ff02720 	jal	bfc09c80 <printf>
bfc00e40:	00000000 	nop
bfc00e44:	26180001 	addiu	t8,s0,1
bfc00e48:	3310ffff 	andi	s0,t8,0xffff
bfc00e4c:	8f868010 	lw	a2,-32752(gp)
bfc00e50:	00104080 	sll	t0,s0,0x2
bfc00e54:	00107980 	sll	t7,s0,0x6
bfc00e58:	010f7021 	addu	t6,t0,t7
bfc00e5c:	0206682b 	sltu	t5,s0,a2
bfc00e60:	02402021 	move	a0,s2
bfc00e64:	022e1821 	addu	v1,s1,t6
bfc00e68:	11a00018 	beqz	t5,bfc00ecc <core_mark+0x8cc>
bfc00e6c:	02002821 	move	a1,s0
bfc00e70:	9466003c 	lhu	a2,60(v1)
bfc00e74:	0ff02720 	jal	bfc09c80 <printf>
bfc00e78:	00000000 	nop
bfc00e7c:	26050001 	addiu	a1,s0,1
bfc00e80:	30b0ffff 	andi	s0,a1,0xffff
bfc00e84:	8f868010 	lw	a2,-32752(gp)
bfc00e88:	0010b080 	sll	s6,s0,0x2
bfc00e8c:	0010a980 	sll	s5,s0,0x6
bfc00e90:	02d51021 	addu	v0,s6,s5
bfc00e94:	0206c82b 	sltu	t9,s0,a2
bfc00e98:	02402021 	move	a0,s2
bfc00e9c:	02221821 	addu	v1,s1,v0
bfc00ea0:	1320000a 	beqz	t9,bfc00ecc <core_mark+0x8cc>
bfc00ea4:	02002821 	move	a1,s0
bfc00ea8:	9466003c 	lhu	a2,60(v1)
bfc00eac:	0ff02720 	jal	bfc09c80 <printf>
bfc00eb0:	00000000 	nop
bfc00eb4:	26030001 	addiu	v1,s0,1
bfc00eb8:	8f868010 	lw	a2,-32752(gp)
bfc00ebc:	3070ffff 	andi	s0,v1,0xffff
bfc00ec0:	0206b82b 	sltu	s7,s0,a2
bfc00ec4:	16e0ffc9 	bnez	s7,bfc00dec <core_mark+0x7ec>
bfc00ec8:	00000000 	nop
bfc00ecc:	8fa30040 	lw	v1,64(sp)
bfc00ed0:	00000000 	nop
bfc00ed4:	30700004 	andi	s0,v1,0x4
bfc00ed8:	1200003e 	beqz	s0,bfc00fd4 <core_mark+0x9d4>
bfc00edc:	00000000 	nop
bfc00ee0:	10c00079 	beqz	a2,bfc010c8 <core_mark+0xac8>
bfc00ee4:	00000000 	nop
bfc00ee8:	3c1ebfc1 	lui	s8,0xbfc1
bfc00eec:	27d2a774 	addiu	s2,s8,-22668
bfc00ef0:	00008021 	move	s0,zero
bfc00ef4:	27b10020 	addiu	s1,sp,32
bfc00ef8:	00107080 	sll	t6,s0,0x2
bfc00efc:	00104180 	sll	t0,s0,0x6
bfc00f00:	01c86821 	addu	t5,t6,t0
bfc00f04:	022d6021 	addu	t4,s1,t5
bfc00f08:	9586003e 	lhu	a2,62(t4)
bfc00f0c:	02002821 	move	a1,s0
bfc00f10:	0ff02720 	jal	bfc09c80 <printf>
bfc00f14:	02402021 	move	a0,s2
bfc00f18:	260b0001 	addiu	t3,s0,1
bfc00f1c:	3170ffff 	andi	s0,t3,0xffff
bfc00f20:	8f868010 	lw	a2,-32752(gp)
bfc00f24:	00105080 	sll	t2,s0,0x2
bfc00f28:	00103980 	sll	a3,s0,0x6
bfc00f2c:	01474821 	addu	t1,t2,a3
bfc00f30:	0206a02b 	sltu	s4,s0,a2
bfc00f34:	02402021 	move	a0,s2
bfc00f38:	02291821 	addu	v1,s1,t1
bfc00f3c:	12800025 	beqz	s4,bfc00fd4 <core_mark+0x9d4>
bfc00f40:	02002821 	move	a1,s0
bfc00f44:	9466003e 	lhu	a2,62(v1)
bfc00f48:	0ff02720 	jal	bfc09c80 <printf>
bfc00f4c:	261e0001 	addiu	s8,s0,1
bfc00f50:	33d0ffff 	andi	s0,s8,0xffff
bfc00f54:	8f868010 	lw	a2,-32752(gp)
bfc00f58:	00101980 	sll	v1,s0,0x6
bfc00f5c:	0010b880 	sll	s7,s0,0x2
bfc00f60:	02e32821 	addu	a1,s7,v1
bfc00f64:	0206a82b 	sltu	s5,s0,a2
bfc00f68:	02251821 	addu	v1,s1,a1
bfc00f6c:	02402021 	move	a0,s2
bfc00f70:	12a00018 	beqz	s5,bfc00fd4 <core_mark+0x9d4>
bfc00f74:	02002821 	move	a1,s0
bfc00f78:	9466003e 	lhu	a2,62(v1)
bfc00f7c:	0ff02720 	jal	bfc09c80 <printf>
bfc00f80:	00000000 	nop
bfc00f84:	260b0001 	addiu	t3,s0,1
bfc00f88:	3170ffff 	andi	s0,t3,0xffff
bfc00f8c:	8f868010 	lw	a2,-32752(gp)
bfc00f90:	00105080 	sll	t2,s0,0x2
bfc00f94:	00103980 	sll	a3,s0,0x6
bfc00f98:	01474821 	addu	t1,t2,a3
bfc00f9c:	0206a02b 	sltu	s4,s0,a2
bfc00fa0:	02402021 	move	a0,s2
bfc00fa4:	02291821 	addu	v1,s1,t1
bfc00fa8:	1280000a 	beqz	s4,bfc00fd4 <core_mark+0x9d4>
bfc00fac:	02002821 	move	a1,s0
bfc00fb0:	9466003e 	lhu	a2,62(v1)
bfc00fb4:	0ff02720 	jal	bfc09c80 <printf>
bfc00fb8:	00000000 	nop
bfc00fbc:	260c0001 	addiu	t4,s0,1
bfc00fc0:	8f868010 	lw	a2,-32752(gp)
bfc00fc4:	3190ffff 	andi	s0,t4,0xffff
bfc00fc8:	0206202b 	sltu	a0,s0,a2
bfc00fcc:	1480ffca 	bnez	a0,bfc00ef8 <core_mark+0x8f8>
bfc00fd0:	00000000 	nop
bfc00fd4:	10c0003c 	beqz	a2,bfc010c8 <core_mark+0xac8>
bfc00fd8:	00000000 	nop
bfc00fdc:	3c11bfc1 	lui	s1,0xbfc1
bfc00fe0:	2632a790 	addiu	s2,s1,-22640
bfc00fe4:	00008021 	move	s0,zero
bfc00fe8:	27b10020 	addiu	s1,sp,32
bfc00fec:	00102080 	sll	a0,s0,0x2
bfc00ff0:	00103180 	sll	a2,s0,0x6
bfc00ff4:	0086a821 	addu	s5,a0,a2
bfc00ff8:	0235f821 	addu	ra,s1,s5
bfc00ffc:	97e60038 	lhu	a2,56(ra)
bfc01000:	02002821 	move	a1,s0
bfc01004:	0ff02720 	jal	bfc09c80 <printf>
bfc01008:	02402021 	move	a0,s2
bfc0100c:	26030001 	addiu	v1,s0,1
bfc01010:	3070ffff 	andi	s0,v1,0xffff
bfc01014:	8f988010 	lw	t8,-32752(gp)
bfc01018:	00101080 	sll	v0,s0,0x2
bfc0101c:	0010b180 	sll	s6,s0,0x6
bfc01020:	0056c821 	addu	t9,v0,s6
bfc01024:	0218782b 	sltu	t7,s0,t8
bfc01028:	02402021 	move	a0,s2
bfc0102c:	02391821 	addu	v1,s1,t9
bfc01030:	11e00025 	beqz	t7,bfc010c8 <core_mark+0xac8>
bfc01034:	02002821 	move	a1,s0
bfc01038:	94660038 	lhu	a2,56(v1)
bfc0103c:	0ff02720 	jal	bfc09c80 <printf>
bfc01040:	00000000 	nop
bfc01044:	260b0001 	addiu	t3,s0,1
bfc01048:	3170ffff 	andi	s0,t3,0xffff
bfc0104c:	8f948010 	lw	s4,-32752(gp)
bfc01050:	00105080 	sll	t2,s0,0x2
bfc01054:	00103980 	sll	a3,s0,0x6
bfc01058:	01474821 	addu	t1,t2,a3
bfc0105c:	0214f02b 	sltu	s8,s0,s4
bfc01060:	02402021 	move	a0,s2
bfc01064:	02291821 	addu	v1,s1,t1
bfc01068:	13c00017 	beqz	s8,bfc010c8 <core_mark+0xac8>
bfc0106c:	02002821 	move	a1,s0
bfc01070:	94660038 	lhu	a2,56(v1)
bfc01074:	0ff02720 	jal	bfc09c80 <printf>
bfc01078:	00000000 	nop
bfc0107c:	26180001 	addiu	t8,s0,1
bfc01080:	3310ffff 	andi	s0,t8,0xffff
bfc01084:	8f8d8010 	lw	t5,-32752(gp)
bfc01088:	00104080 	sll	t0,s0,0x2
bfc0108c:	00107980 	sll	t7,s0,0x6
bfc01090:	010f7021 	addu	t6,t0,t7
bfc01094:	020d602b 	sltu	t4,s0,t5
bfc01098:	02402021 	move	a0,s2
bfc0109c:	022e1821 	addu	v1,s1,t6
bfc010a0:	11800009 	beqz	t4,bfc010c8 <core_mark+0xac8>
bfc010a4:	02002821 	move	a1,s0
bfc010a8:	94660038 	lhu	a2,56(v1)
bfc010ac:	0ff02720 	jal	bfc09c80 <printf>
bfc010b0:	26160001 	addiu	s6,s0,1
bfc010b4:	8f828010 	lw	v0,-32752(gp)
bfc010b8:	32d0ffff 	andi	s0,s6,0xffff
bfc010bc:	0202c82b 	sltu	t9,s0,v0
bfc010c0:	1720ffca 	bnez	t9,bfc00fec <core_mark+0x9ec>
bfc010c4:	00000000 	nop
bfc010c8:	126000f9 	beqz	s3,bfc014b0 <core_mark+0xeb0>
bfc010cc:	3c12bfc1 	lui	s2,0xbfc1
bfc010d0:	1a6000fb 	blez	s3,bfc014c0 <core_mark+0xec0>
bfc010d4:	3c05bfc1 	lui	a1,0xbfc1
bfc010d8:	0ff027e6 	jal	bfc09f98 <puts>
bfc010dc:	24a4a7f8 	addiu	a0,a1,-22536
bfc010e0:	0ff02714 	jal	bfc09c50 <portable_fini>
bfc010e4:	27a40062 	addiu	a0,sp,98
bfc010e8:	8fbf0864 	lw	ra,2148(sp)
bfc010ec:	02601021 	move	v0,s3
bfc010f0:	8fbe0860 	lw	s8,2144(sp)
bfc010f4:	8fb7085c 	lw	s7,2140(sp)
bfc010f8:	8fb60858 	lw	s6,2136(sp)
bfc010fc:	8fb50854 	lw	s5,2132(sp)
bfc01100:	8fb40850 	lw	s4,2128(sp)
bfc01104:	8fb3084c 	lw	s3,2124(sp)
bfc01108:	8fb20848 	lw	s2,2120(sp)
bfc0110c:	8fb10844 	lw	s1,2116(sp)
bfc01110:	8fb00840 	lw	s0,2112(sp)
bfc01114:	03e00008 	jr	ra
bfc01118:	27bd0868 	addiu	sp,sp,2152
bfc0111c:	00000000 	nop
bfc01120:	0ff027e6 	jal	bfc09f98 <puts>
bfc01124:	25a4a264 	addiu	a0,t5,-23964
bfc01128:	24150001 	li	s5,1
bfc0112c:	0bf00271 	j	bfc009c4 <core_mark+0x3c4>
bfc01130:	24140002 	li	s4,2
	...
bfc01140:	3c15bfc1 	lui	s5,0xbfc1
bfc01144:	0ff027e6 	jal	bfc09f98 <puts>
bfc01148:	26a4a264 	addiu	a0,s5,-23964
bfc0114c:	0bf002d1 	j	bfc00b44 <core_mark+0x544>
bfc01150:	0280a821 	move	s5,s4
	...
bfc01160:	afa9002c 	sw	t1,44(sp)
bfc01164:	0bf001c8 	j	bfc00720 <core_mark+0x120>
bfc01168:	24030001 	li	v1,1
bfc0116c:	00000000 	nop
bfc01170:	14400002 	bnez	v0,bfc0117c <core_mark+0xb7c>
bfc01174:	00e2001b 	divu	zero,a3,v0
bfc01178:	0007000d 	break	0x7
bfc0117c:	8fa4003c 	lw	a0,60(sp)
bfc01180:	00003012 	mflo	a2
bfc01184:	24c50001 	addiu	a1,a2,1
bfc01188:	00000000 	nop
bfc0118c:	00850018 	mult	a0,a1
bfc01190:	00009012 	mflo	s2
bfc01194:	0bf00262 	j	bfc00988 <core_mark+0x388>
bfc01198:	afb2003c 	sw	s2,60(sp)
bfc0119c:	00000000 	nop
bfc011a0:	105f00d8 	beq	v0,ra,bfc01504 <core_mark+0xf04>
bfc011a4:	24114eaf 	li	s1,20143
bfc011a8:	1451fe81 	bne	v0,s1,bfc00bb0 <core_mark+0x5b0>
bfc011ac:	3410ffff 	li	s0,0xffff
bfc011b0:	3c12bfc1 	lui	s2,0xbfc1
bfc011b4:	0ff027e6 	jal	bfc09f98 <puts>
bfc011b8:	2644a2e0 	addiu	a0,s2,-23840
bfc011bc:	24050002 	li	a1,2
bfc011c0:	8f868010 	lw	a2,-32752(gp)
bfc011c4:	00000000 	nop
bfc011c8:	10c00054 	beqz	a2,bfc0131c <core_mark+0xd1c>
bfc011cc:	3c0ebfc1 	lui	t6,0xbfc1
bfc011d0:	00054040 	sll	t0,a1,0x1
bfc011d4:	25cda8a8 	addiu	t5,t6,-22360
bfc011d8:	3c0bbfc1 	lui	t3,0xbfc1
bfc011dc:	3c09bfc1 	lui	t1,0xbfc1
bfc011e0:	010d6021 	addu	t4,t0,t5
bfc011e4:	256aa890 	addiu	t2,t3,-22384
bfc011e8:	2527a89c 	addiu	a3,t1,-22372
bfc011ec:	afac0838 	sw	t4,2104(sp)
bfc011f0:	010ab821 	addu	s7,t0,t2
bfc011f4:	0107f021 	addu	s8,t0,a3
bfc011f8:	00008821 	move	s1,zero
bfc011fc:	27b40020 	addiu	s4,sp,32
bfc01200:	00119880 	sll	s3,s1,0x2
bfc01204:	00119180 	sll	s2,s1,0x6
bfc01208:	0272c021 	addu	t8,s3,s2
bfc0120c:	02988021 	addu	s0,s4,t8
bfc01210:	8e080020 	lw	t0,32(s0)
bfc01214:	00000000 	nop
bfc01218:	310f0001 	andi	t7,t0,0x1
bfc0121c:	11e0000f 	beqz	t7,bfc0125c <core_mark+0xc5c>
bfc01220:	a6000040 	sh	zero,64(s0)
bfc01224:	961f003a 	lhu	ra,58(s0)
bfc01228:	96f90000 	lhu	t9,0(s7)
bfc0122c:	3c03bfc1 	lui	v1,0xbfc1
bfc01230:	02202821 	move	a1,s1
bfc01234:	2464a368 	addiu	a0,v1,-23704
bfc01238:	03e03021 	move	a2,ra
bfc0123c:	13f90007 	beq	ra,t9,bfc0125c <core_mark+0xc5c>
bfc01240:	03203821 	move	a3,t9
bfc01244:	0ff02720 	jal	bfc09c80 <printf>
bfc01248:	00000000 	nop
bfc0124c:	96040040 	lhu	a0,64(s0)
bfc01250:	8e080020 	lw	t0,32(s0)
bfc01254:	24820001 	addiu	v0,a0,1
bfc01258:	a6020040 	sh	v0,64(s0)
bfc0125c:	02723021 	addu	a2,s3,s2
bfc01260:	31050002 	andi	a1,t0,0x2
bfc01264:	10a0000f 	beqz	a1,bfc012a4 <core_mark+0xca4>
bfc01268:	02868021 	addu	s0,s4,a2
bfc0126c:	960a003c 	lhu	t2,60(s0)
bfc01270:	97c90000 	lhu	t1,0(s8)
bfc01274:	3c07bfc1 	lui	a3,0xbfc1
bfc01278:	24e4a398 	addiu	a0,a3,-23656
bfc0127c:	02202821 	move	a1,s1
bfc01280:	01403021 	move	a2,t2
bfc01284:	11490007 	beq	t2,t1,bfc012a4 <core_mark+0xca4>
bfc01288:	01203821 	move	a3,t1
bfc0128c:	0ff02720 	jal	bfc09c80 <printf>
bfc01290:	00000000 	nop
bfc01294:	960c0040 	lhu	t4,64(s0)
bfc01298:	8e080020 	lw	t0,32(s0)
bfc0129c:	258b0001 	addiu	t3,t4,1
bfc012a0:	a60b0040 	sh	t3,64(s0)
bfc012a4:	02727021 	addu	t6,s3,s2
bfc012a8:	310d0004 	andi	t5,t0,0x4
bfc012ac:	11a00010 	beqz	t5,bfc012f0 <core_mark+0xcf0>
bfc012b0:	028e8021 	addu	s0,s4,t6
bfc012b4:	8fb80838 	lw	t8,2104(sp)
bfc012b8:	960f003e 	lhu	t7,62(s0)
bfc012bc:	97080000 	lhu	t0,0(t8)
bfc012c0:	3c19bfc1 	lui	t9,0xbfc1
bfc012c4:	02202821 	move	a1,s1
bfc012c8:	2724a3cc 	addiu	a0,t9,-23604
bfc012cc:	01e03021 	move	a2,t7
bfc012d0:	11e80007 	beq	t7,t0,bfc012f0 <core_mark+0xcf0>
bfc012d4:	01003821 	move	a3,t0
bfc012d8:	0ff02720 	jal	bfc09c80 <printf>
bfc012dc:	00000000 	nop
bfc012e0:	96020040 	lhu	v0,64(s0)
bfc012e4:	00000000 	nop
bfc012e8:	24430001 	addiu	v1,v0,1
bfc012ec:	a6030040 	sh	v1,64(s0)
bfc012f0:	02723021 	addu	a2,s3,s2
bfc012f4:	02862821 	addu	a1,s4,a2
bfc012f8:	94bf0040 	lhu	ra,64(a1)
bfc012fc:	26240001 	addiu	a0,s1,1
bfc01300:	8f928010 	lw	s2,-32752(gp)
bfc01304:	3091ffff 	andi	s1,a0,0xffff
bfc01308:	02bf9821 	addu	s3,s5,ra
bfc0130c:	0013ac00 	sll	s5,s3,0x10
bfc01310:	0232802b 	sltu	s0,s1,s2
bfc01314:	1600ffba 	bnez	s0,bfc01200 <core_mark+0xc00>
bfc01318:	0015ac03 	sra	s5,s5,0x10
bfc0131c:	0bf002ec 	j	bfc00bb0 <core_mark+0x5b0>
bfc01320:	32b0ffff 	andi	s0,s5,0xffff
	...
bfc01330:	a7a00020 	sh	zero,32(sp)
bfc01334:	a7a00022 	sh	zero,34(sp)
bfc01338:	8fa30020 	lw	v1,32(sp)
bfc0133c:	24070001 	li	a3,1
bfc01340:	1467fcdc 	bne	v1,a3,bfc006b4 <core_mark+0xb4>
bfc01344:	a7a60024 	sh	a2,36(sp)
bfc01348:	87a80024 	lh	t0,36(sp)
bfc0134c:	00000000 	nop
bfc01350:	1500fcd9 	bnez	t0,bfc006b8 <core_mark+0xb8>
bfc01354:	32080001 	andi	t0,s0,0x1
bfc01358:	24093415 	li	t1,13333
bfc0135c:	240a0066 	li	t2,102
bfc01360:	a7a90022 	sh	t1,34(sp)
bfc01364:	a7aa0024 	sh	t2,36(sp)
bfc01368:	0bf001ae 	j	bfc006b8 <core_mark+0xb8>
bfc0136c:	a7a90020 	sh	t1,32(sp)
bfc01370:	0ff027e6 	jal	bfc09f98 <puts>
bfc01374:	2484a310 	addiu	a0,a0,-23792
bfc01378:	0bf00470 	j	bfc011c0 <core_mark+0xbc0>
bfc0137c:	24050003 	li	a1,3
bfc01380:	8f868010 	lw	a2,-32752(gp)
bfc01384:	00000000 	nop
bfc01388:	10c0fe90 	beqz	a2,bfc00dcc <core_mark+0x7cc>
bfc0138c:	3c14bfc1 	lui	s4,0xbfc1
bfc01390:	2692a73c 	addiu	s2,s4,-22724
bfc01394:	00008021 	move	s0,zero
bfc01398:	27b10020 	addiu	s1,sp,32
bfc0139c:	00104080 	sll	t0,s0,0x2
bfc013a0:	0010f980 	sll	ra,s0,0x6
bfc013a4:	011f7021 	addu	t6,t0,ra
bfc013a8:	022e6821 	addu	t5,s1,t6
bfc013ac:	95a6003a 	lhu	a2,58(t5)
bfc013b0:	02002821 	move	a1,s0
bfc013b4:	0ff02720 	jal	bfc09c80 <printf>
bfc013b8:	02402021 	move	a0,s2
bfc013bc:	260c0001 	addiu	t4,s0,1
bfc013c0:	3190ffff 	andi	s0,t4,0xffff
bfc013c4:	8f868010 	lw	a2,-32752(gp)
bfc013c8:	00103880 	sll	a3,s0,0x2
bfc013cc:	00105980 	sll	t3,s0,0x6
bfc013d0:	00eb5021 	addu	t2,a3,t3
bfc013d4:	0206482b 	sltu	t1,s0,a2
bfc013d8:	02402021 	move	a0,s2
bfc013dc:	022a1821 	addu	v1,s1,t2
bfc013e0:	11200026 	beqz	t1,bfc0147c <core_mark+0xe7c>
bfc013e4:	02002821 	move	a1,s0
bfc013e8:	9466003a 	lhu	a2,58(v1)
bfc013ec:	0ff02720 	jal	bfc09c80 <printf>
bfc013f0:	00000000 	nop
bfc013f4:	26070001 	addiu	a3,s0,1
bfc013f8:	30f0ffff 	andi	s0,a3,0xffff
bfc013fc:	8f868010 	lw	a2,-32752(gp)
bfc01400:	00104880 	sll	t1,s0,0x2
bfc01404:	00105180 	sll	t2,s0,0x6
bfc01408:	012aa021 	addu	s4,t1,t2
bfc0140c:	0206f02b 	sltu	s8,s0,a2
bfc01410:	02402021 	move	a0,s2
bfc01414:	02341821 	addu	v1,s1,s4
bfc01418:	13c00018 	beqz	s8,bfc0147c <core_mark+0xe7c>
bfc0141c:	02002821 	move	a1,s0
bfc01420:	9466003a 	lhu	a2,58(v1)
bfc01424:	0ff02720 	jal	bfc09c80 <printf>
bfc01428:	00000000 	nop
bfc0142c:	26080001 	addiu	t0,s0,1
bfc01430:	3110ffff 	andi	s0,t0,0xffff
bfc01434:	8f868010 	lw	a2,-32752(gp)
bfc01438:	00106880 	sll	t5,s0,0x2
bfc0143c:	00107180 	sll	t6,s0,0x6
bfc01440:	01ae6021 	addu	t4,t5,t6
bfc01444:	0206582b 	sltu	t3,s0,a2
bfc01448:	02402021 	move	a0,s2
bfc0144c:	022c1821 	addu	v1,s1,t4
bfc01450:	1160000a 	beqz	t3,bfc0147c <core_mark+0xe7c>
bfc01454:	02002821 	move	a1,s0
bfc01458:	9466003a 	lhu	a2,58(v1)
bfc0145c:	0ff02720 	jal	bfc09c80 <printf>
bfc01460:	00000000 	nop
bfc01464:	260f0001 	addiu	t7,s0,1
bfc01468:	8f868010 	lw	a2,-32752(gp)
bfc0146c:	31f0ffff 	andi	s0,t7,0xffff
bfc01470:	0206202b 	sltu	a0,s0,a2
bfc01474:	1480ffca 	bnez	a0,bfc013a0 <core_mark+0xda0>
bfc01478:	00104080 	sll	t0,s0,0x2
bfc0147c:	8fa30040 	lw	v1,64(sp)
bfc01480:	0bf00374 	j	bfc00dd0 <core_mark+0x7d0>
bfc01484:	306f0002 	andi	t7,v1,0x2
	...
bfc01490:	0ff027e6 	jal	bfc09f98 <puts>
bfc01494:	2444a59c 	addiu	a0,v0,-23140
bfc01498:	26790001 	addiu	t9,s3,1
bfc0149c:	00199c00 	sll	s3,t9,0x10
bfc014a0:	0bf00353 	j	bfc00d4c <core_mark+0x74c>
bfc014a4:	00139c03 	sra	s3,s3,0x10
	...
bfc014b0:	0ff027e6 	jal	bfc09f98 <puts>
bfc014b4:	2644a7ac 	addiu	a0,s2,-22612
bfc014b8:	0bf00438 	j	bfc010e0 <core_mark+0xae0>
bfc014bc:	00000000 	nop
bfc014c0:	3c17bfc1 	lui	s7,0xbfc1
bfc014c4:	0ff027e6 	jal	bfc09f98 <puts>
bfc014c8:	26e4a808 	addiu	a0,s7,-22520
bfc014cc:	0bf00438 	j	bfc010e0 <core_mark+0xae0>
bfc014d0:	00000000 	nop
bfc014d4:	3c03bfc1 	lui	v1,0xbfc1
bfc014d8:	0ff027e6 	jal	bfc09f98 <puts>
bfc014dc:	2464a288 	addiu	a0,v1,-23928
bfc014e0:	0bf00470 	j	bfc011c0 <core_mark+0xbc0>
bfc014e4:	00002821 	move	a1,zero
	...
bfc014f0:	3c02bfc1 	lui	v0,0xbfc1
bfc014f4:	0ff027e6 	jal	bfc09f98 <puts>
bfc014f8:	2444a2b4 	addiu	a0,v0,-23884
bfc014fc:	0bf00470 	j	bfc011c0 <core_mark+0xbc0>
bfc01500:	24050001 	li	a1,1
bfc01504:	3c05bfc1 	lui	a1,0xbfc1
bfc01508:	0ff027e6 	jal	bfc09f98 <puts>
bfc0150c:	24a4a33c 	addiu	a0,a1,-23748
bfc01510:	0bf00470 	j	bfc011c0 <core_mark+0xbc0>
bfc01514:	24050004 	li	a1,4
	...

bfc01520 <core_init_matrix>:
core_init_matrix():
bfc01520:	27bdffe8 	addiu	sp,sp,-24
bfc01524:	afb50014 	sw	s5,20(sp)
bfc01528:	afb40010 	sw	s4,16(sp)
bfc0152c:	afb3000c 	sw	s3,12(sp)
bfc01530:	afb20008 	sw	s2,8(sp)
bfc01534:	afb10004 	sw	s1,4(sp)
bfc01538:	afb00000 	sw	s0,0(sp)
bfc0153c:	00c06821 	move	t5,a2
bfc01540:	14c00002 	bnez	a2,bfc0154c <core_init_matrix+0x2c>
bfc01544:	00e0a821 	move	s5,a3
bfc01548:	240d0001 	li	t5,1
bfc0154c:	108000e3 	beqz	a0,bfc018dc <core_init_matrix+0x3bc>
bfc01550:	00004821 	move	t1,zero
bfc01554:	25260001 	addiu	a2,t1,1
bfc01558:	00c60018 	mult	a2,a2
bfc0155c:	24cf0007 	addiu	t7,a2,7
bfc01560:	24ca0003 	addiu	t2,a2,3
bfc01564:	24cb0004 	addiu	t3,a2,4
bfc01568:	24cc0005 	addiu	t4,a2,5
bfc0156c:	00003812 	mflo	a3
bfc01570:	000718c0 	sll	v1,a3,0x3
bfc01574:	0064102b 	sltu	v0,v1,a0
bfc01578:	10400039 	beqz	v0,bfc01660 <core_init_matrix+0x140>
bfc0157c:	24ce0006 	addiu	t6,a2,6
bfc01580:	24c80001 	addiu	t0,a2,1
bfc01584:	01080018 	mult	t0,t0
bfc01588:	00009012 	mflo	s2
bfc0158c:	001288c0 	sll	s1,s2,0x3
bfc01590:	0224802b 	sltu	s0,s1,a0
bfc01594:	12000032 	beqz	s0,bfc01660 <core_init_matrix+0x140>
bfc01598:	00c04821 	move	t1,a2
bfc0159c:	25190001 	addiu	t9,t0,1
bfc015a0:	03390018 	mult	t9,t9
bfc015a4:	00009812 	mflo	s3
bfc015a8:	001390c0 	sll	s2,s3,0x3
bfc015ac:	0244882b 	sltu	s1,s2,a0
bfc015b0:	1220002b 	beqz	s1,bfc01660 <core_init_matrix+0x140>
bfc015b4:	01004821 	move	t1,t0
bfc015b8:	014a0018 	mult	t2,t2
bfc015bc:	00003812 	mflo	a3
bfc015c0:	0007c0c0 	sll	t8,a3,0x3
bfc015c4:	0304a02b 	sltu	s4,t8,a0
bfc015c8:	12800025 	beqz	s4,bfc01660 <core_init_matrix+0x140>
bfc015cc:	24c90002 	addiu	t1,a2,2
bfc015d0:	016b0018 	mult	t3,t3
bfc015d4:	01404821 	move	t1,t2
bfc015d8:	00001812 	mflo	v1
bfc015dc:	000380c0 	sll	s0,v1,0x3
bfc015e0:	0204502b 	sltu	t2,s0,a0
bfc015e4:	1140001e 	beqz	t2,bfc01660 <core_init_matrix+0x140>
bfc015e8:	018c0018 	mult	t4,t4
bfc015ec:	01604821 	move	t1,t3
bfc015f0:	00003012 	mflo	a2
bfc015f4:	000610c0 	sll	v0,a2,0x3
bfc015f8:	0044582b 	sltu	t3,v0,a0
bfc015fc:	11600018 	beqz	t3,bfc01660 <core_init_matrix+0x140>
bfc01600:	01ce0018 	mult	t6,t6
bfc01604:	01804821 	move	t1,t4
bfc01608:	00008812 	mflo	s1
bfc0160c:	001140c0 	sll	t0,s1,0x3
bfc01610:	0104602b 	sltu	t4,t0,a0
bfc01614:	11800012 	beqz	t4,bfc01660 <core_init_matrix+0x140>
bfc01618:	01ef0018 	mult	t7,t7
bfc0161c:	01c04821 	move	t1,t6
bfc01620:	00009812 	mflo	s3
bfc01624:	001390c0 	sll	s2,s3,0x3
bfc01628:	0244702b 	sltu	t6,s2,a0
bfc0162c:	11c0000c 	beqz	t6,bfc01660 <core_init_matrix+0x140>
bfc01630:	25e60001 	addiu	a2,t7,1
bfc01634:	01e04821 	move	t1,t7
bfc01638:	00c60018 	mult	a2,a2
bfc0163c:	24cf0007 	addiu	t7,a2,7
bfc01640:	24ca0003 	addiu	t2,a2,3
bfc01644:	24cb0004 	addiu	t3,a2,4
bfc01648:	24cc0005 	addiu	t4,a2,5
bfc0164c:	00003812 	mflo	a3
bfc01650:	000718c0 	sll	v1,a3,0x3
bfc01654:	0064102b 	sltu	v0,v1,a0
bfc01658:	1440ffc9 	bnez	v0,bfc01580 <core_init_matrix+0x60>
bfc0165c:	24ce0006 	addiu	t6,a2,6
bfc01660:	01290018 	mult	t1,t1
bfc01664:	24a8ffff 	addiu	t0,a1,-1
bfc01668:	2404fffc 	li	a0,-4
bfc0166c:	01042824 	and	a1,t0,a0
bfc01670:	24b10004 	addiu	s1,a1,4
bfc01674:	00003012 	mflo	a2
bfc01678:	0006a040 	sll	s4,a2,0x1
bfc0167c:	1120009f 	beqz	t1,bfc018fc <core_init_matrix+0x3dc>
bfc01680:	02349021 	addu	s2,s1,s4
bfc01684:	0120c021 	move	t8,t1
bfc01688:	3c108000 	lui	s0,0x8000
bfc0168c:	3619ffff 	ori	t9,s0,0xffff
bfc01690:	00189840 	sll	s3,t8,0x1
bfc01694:	24080001 	li	t0,1
bfc01698:	00003821 	move	a3,zero
bfc0169c:	00002821 	move	a1,zero
bfc016a0:	3c10ffff 	lui	s0,0xffff
bfc016a4:	01a80018 	mult	t5,t0
bfc016a8:	270affff 	addiu	t2,t8,-1
bfc016ac:	314f0001 	andi	t7,t2,0x1
bfc016b0:	02457021 	addu	t6,s2,a1
bfc016b4:	00004812 	mflo	t1
bfc016b8:	01393024 	and	a2,t1,t9
bfc016bc:	04c00080 	bltz	a2,bfc018c0 <core_init_matrix+0x3a0>
bfc016c0:	02255021 	addu	t2,s1,a1
bfc016c4:	310bffff 	andi	t3,t0,0xffff
bfc016c8:	01666021 	addu	t4,t3,a2
bfc016cc:	3183ffff 	andi	v1,t4,0xffff
bfc016d0:	006b1021 	addu	v0,v1,t3
bfc016d4:	24090001 	li	t1,1
bfc016d8:	304d00ff 	andi	t5,v0,0xff
bfc016dc:	0138202b 	sltu	a0,t1,t8
bfc016e0:	a5c30000 	sh	v1,0(t6)
bfc016e4:	25080001 	addiu	t0,t0,1
bfc016e8:	a54d0000 	sh	t5,0(t2)
bfc016ec:	25cc0002 	addiu	t4,t6,2
bfc016f0:	00c06821 	move	t5,a2
bfc016f4:	1080005b 	beqz	a0,bfc01864 <core_init_matrix+0x344>
bfc016f8:	254b0002 	addiu	t3,t2,2
bfc016fc:	11e00032 	beqz	t7,bfc017c8 <core_init_matrix+0x2a8>
bfc01700:	01a80018 	mult	t5,t0
bfc01704:	00c80018 	mult	a2,t0
bfc01708:	00007812 	mflo	t7
bfc0170c:	01f93024 	and	a2,t7,t9
bfc01710:	04c0006f 	bltz	a2,bfc018d0 <core_init_matrix+0x3b0>
bfc01714:	24cdffff 	addiu	t5,a2,-1
bfc01718:	3104ffff 	andi	a0,t0,0xffff
bfc0171c:	00c06821 	move	t5,a2
bfc01720:	00863021 	addu	a2,a0,a2
bfc01724:	30c3ffff 	andi	v1,a2,0xffff
bfc01728:	00647821 	addu	t7,v1,a0
bfc0172c:	25290001 	addiu	t1,t1,1
bfc01730:	31e200ff 	andi	v0,t7,0xff
bfc01734:	0138302b 	sltu	a2,t1,t8
bfc01738:	a5c30002 	sh	v1,2(t6)
bfc0173c:	25080001 	addiu	t0,t0,1
bfc01740:	a5420002 	sh	v0,2(t2)
bfc01744:	258c0002 	addiu	t4,t4,2
bfc01748:	14c0001e 	bnez	a2,bfc017c4 <core_init_matrix+0x2a4>
bfc0174c:	256b0002 	addiu	t3,t3,2
bfc01750:	0bf0061a 	j	bfc01868 <core_init_matrix+0x348>
bfc01754:	24e70001 	addiu	a3,a3,1
	...
bfc01760:	004a0018 	mult	v0,t2
bfc01764:	01021821 	addu	v1,t0,v0
bfc01768:	306dffff 	andi	t5,v1,0xffff
bfc0176c:	01a81021 	addu	v0,t5,t0
bfc01770:	304600ff 	andi	a2,v0,0xff
bfc01774:	a58d0000 	sh	t5,0(t4)
bfc01778:	a5660000 	sh	a2,0(t3)
bfc0177c:	00002012 	mflo	a0
bfc01780:	00993024 	and	a2,a0,t9
bfc01784:	04c00027 	bltz	a2,bfc01824 <core_init_matrix+0x304>
bfc01788:	24cbffff 	addiu	t3,a2,-1
bfc0178c:	00c06821 	move	t5,a2
bfc01790:	3146ffff 	andi	a2,t2,0xffff
bfc01794:	00cd4021 	addu	t0,a2,t5
bfc01798:	3103ffff 	andi	v1,t0,0xffff
bfc0179c:	00661021 	addu	v0,v1,a2
bfc017a0:	25290001 	addiu	t1,t1,1
bfc017a4:	304c00ff 	andi	t4,v0,0xff
bfc017a8:	0138202b 	sltu	a0,t1,t8
bfc017ac:	a5c30000 	sh	v1,0(t6)
bfc017b0:	25480001 	addiu	t0,t2,1
bfc017b4:	a5ec0000 	sh	t4,0(t7)
bfc017b8:	25eb0002 	addiu	t3,t7,2
bfc017bc:	10800029 	beqz	a0,bfc01864 <core_init_matrix+0x344>
bfc017c0:	25cc0002 	addiu	t4,t6,2
bfc017c4:	01a80018 	mult	t5,t0
bfc017c8:	250a0001 	addiu	t2,t0,1
bfc017cc:	258e0002 	addiu	t6,t4,2
bfc017d0:	3108ffff 	andi	t0,t0,0xffff
bfc017d4:	256f0002 	addiu	t7,t3,2
bfc017d8:	00006812 	mflo	t5
bfc017dc:	01b91024 	and	v0,t5,t9
bfc017e0:	0441ffdf 	bgez	v0,bfc01760 <core_init_matrix+0x240>
bfc017e4:	25290001 	addiu	t1,t1,1
bfc017e8:	2443ffff 	addiu	v1,v0,-1
bfc017ec:	00701025 	or	v0,v1,s0
bfc017f0:	24420001 	addiu	v0,v0,1
bfc017f4:	004a0018 	mult	v0,t2
bfc017f8:	01021821 	addu	v1,t0,v0
bfc017fc:	306dffff 	andi	t5,v1,0xffff
bfc01800:	01a81021 	addu	v0,t5,t0
bfc01804:	304600ff 	andi	a2,v0,0xff
bfc01808:	a58d0000 	sh	t5,0(t4)
bfc0180c:	a5660000 	sh	a2,0(t3)
bfc01810:	00002012 	mflo	a0
bfc01814:	00993024 	and	a2,a0,t9
bfc01818:	04c1ffdd 	bgez	a2,bfc01790 <core_init_matrix+0x270>
bfc0181c:	00c06821 	move	t5,a2
bfc01820:	24cbffff 	addiu	t3,a2,-1
bfc01824:	01704025 	or	t0,t3,s0
bfc01828:	25060001 	addiu	a2,t0,1
bfc0182c:	00c06821 	move	t5,a2
bfc01830:	3146ffff 	andi	a2,t2,0xffff
bfc01834:	00cd4021 	addu	t0,a2,t5
bfc01838:	3103ffff 	andi	v1,t0,0xffff
bfc0183c:	00661021 	addu	v0,v1,a2
bfc01840:	25290001 	addiu	t1,t1,1
bfc01844:	304c00ff 	andi	t4,v0,0xff
bfc01848:	0138202b 	sltu	a0,t1,t8
bfc0184c:	a5c30000 	sh	v1,0(t6)
bfc01850:	25480001 	addiu	t0,t2,1
bfc01854:	a5ec0000 	sh	t4,0(t7)
bfc01858:	25eb0002 	addiu	t3,t7,2
bfc0185c:	1480ffd9 	bnez	a0,bfc017c4 <core_init_matrix+0x2a4>
bfc01860:	25cc0002 	addiu	t4,t6,2
bfc01864:	24e70001 	addiu	a3,a3,1
bfc01868:	00f8582b 	sltu	t3,a3,t8
bfc0186c:	1560ff8d 	bnez	t3,bfc016a4 <core_init_matrix+0x184>
bfc01870:	00b32821 	addu	a1,a1,s3
bfc01874:	2699ffff 	addiu	t9,s4,-1
bfc01878:	02597821 	addu	t7,s2,t9
bfc0187c:	2413fffc 	li	s3,-4
bfc01880:	01f37024 	and	t6,t7,s3
bfc01884:	25cc0004 	addiu	t4,t6,4
bfc01888:	aeb10004 	sw	s1,4(s5)
bfc0188c:	aeb20008 	sw	s2,8(s5)
bfc01890:	aeac000c 	sw	t4,12(s5)
bfc01894:	aeb80000 	sw	t8,0(s5)
bfc01898:	03001021 	move	v0,t8
bfc0189c:	8fb50014 	lw	s5,20(sp)
bfc018a0:	8fb40010 	lw	s4,16(sp)
bfc018a4:	8fb3000c 	lw	s3,12(sp)
bfc018a8:	8fb20008 	lw	s2,8(sp)
bfc018ac:	8fb10004 	lw	s1,4(sp)
bfc018b0:	8fb00000 	lw	s0,0(sp)
bfc018b4:	03e00008 	jr	ra
bfc018b8:	27bd0018 	addiu	sp,sp,24
bfc018bc:	00000000 	nop
bfc018c0:	24c4ffff 	addiu	a0,a2,-1
bfc018c4:	00904825 	or	t1,a0,s0
bfc018c8:	0bf005b1 	j	bfc016c4 <core_init_matrix+0x1a4>
bfc018cc:	25260001 	addiu	a2,t1,1
bfc018d0:	01b02025 	or	a0,t5,s0
bfc018d4:	0bf005c6 	j	bfc01718 <core_init_matrix+0x1f8>
bfc018d8:	24860001 	addiu	a2,a0,1
bfc018dc:	24b8ffff 	addiu	t8,a1,-1
bfc018e0:	2407fffc 	li	a3,-4
bfc018e4:	0307a024 	and	s4,t8,a3
bfc018e8:	26920006 	addiu	s2,s4,6
bfc018ec:	26910004 	addiu	s1,s4,4
bfc018f0:	2418ffff 	li	t8,-1
bfc018f4:	0bf005a2 	j	bfc01688 <core_init_matrix+0x168>
bfc018f8:	24140002 	li	s4,2
bfc018fc:	0bf0061d 	j	bfc01874 <core_init_matrix+0x354>
bfc01900:	0000c021 	move	t8,zero
	...

bfc01910 <matrix_sum>:
matrix_sum():
bfc01910:	00063400 	sll	a2,a2,0x10
bfc01914:	00807021 	move	t6,a0
bfc01918:	108000c7 	beqz	a0,bfc01c38 <matrix_sum+0x328>
bfc0191c:	00063403 	sra	a2,a2,0x10
bfc01920:	0004c080 	sll	t8,a0,0x2
bfc01924:	00004021 	move	t0,zero
bfc01928:	00001821 	move	v1,zero
bfc0192c:	00004821 	move	t1,zero
bfc01930:	00007821 	move	t7,zero
bfc01934:	8cac0000 	lw	t4,0(a1)
bfc01938:	3122ffff 	andi	v0,t1,0xffff
bfc0193c:	010c5021 	addu	t2,t0,t4
bfc01940:	006c402a 	slt	t0,v1,t4
bfc01944:	00485821 	addu	t3,v0,t0
bfc01948:	2447000a 	addiu	a3,v0,10
bfc0194c:	25cdffff 	addiu	t5,t6,-1
bfc01950:	0007cc00 	sll	t9,a3,0x10
bfc01954:	000b4c00 	sll	t1,t3,0x10
bfc01958:	00ca402a 	slt	t0,a2,t2
bfc0195c:	31a40003 	andi	a0,t5,0x3
bfc01960:	00193c03 	sra	a3,t9,0x10
bfc01964:	150000a6 	bnez	t0,bfc01c00 <matrix_sum+0x2f0>
bfc01968:	00091403 	sra	v0,t1,0x10
bfc0196c:	00404821 	move	t1,v0
bfc01970:	15000002 	bnez	t0,bfc0197c <matrix_sum+0x6c>
bfc01974:	00004021 	move	t0,zero
bfc01978:	01404021 	move	t0,t2
bfc0197c:	240b0001 	li	t3,1
bfc01980:	016ec82b 	sltu	t9,t3,t6
bfc01984:	24aa0004 	addiu	t2,a1,4
bfc01988:	13200087 	beqz	t9,bfc01ba8 <matrix_sum+0x298>
bfc0198c:	01801821 	move	v1,t4
bfc01990:	1080003f 	beqz	a0,bfc01a90 <matrix_sum+0x180>
bfc01994:	00000000 	nop
bfc01998:	108b0028 	beq	a0,t3,bfc01a3c <matrix_sum+0x12c>
bfc0199c:	24070002 	li	a3,2
bfc019a0:	10870013 	beq	a0,a3,bfc019f0 <matrix_sum+0xe0>
bfc019a4:	3139ffff 	andi	t9,t1,0xffff
bfc019a8:	8d440000 	lw	a0,0(t2)
bfc019ac:	00000000 	nop
bfc019b0:	01046821 	addu	t5,t0,a0
bfc019b4:	0184402a 	slt	t0,t4,a0
bfc019b8:	03281821 	addu	v1,t9,t0
bfc019bc:	2722000a 	addiu	v0,t9,10
bfc019c0:	00024c00 	sll	t1,v0,0x10
bfc019c4:	00036400 	sll	t4,v1,0x10
bfc019c8:	00cd402a 	slt	t0,a2,t5
bfc019cc:	00093c03 	sra	a3,t1,0x10
bfc019d0:	1500008f 	bnez	t0,bfc01c10 <matrix_sum+0x300>
bfc019d4:	000c1403 	sra	v0,t4,0x10
bfc019d8:	1500008f 	bnez	t0,bfc01c18 <matrix_sum+0x308>
bfc019dc:	00404821 	move	t1,v0
bfc019e0:	01a04021 	move	t0,t5
bfc019e4:	256b0001 	addiu	t3,t3,1
bfc019e8:	254a0004 	addiu	t2,t2,4
bfc019ec:	00801821 	move	v1,a0
bfc019f0:	8d440000 	lw	a0,0(t2)
bfc019f4:	3122ffff 	andi	v0,t1,0xffff
bfc019f8:	0064c82a 	slt	t9,v1,a0
bfc019fc:	00591821 	addu	v1,v0,t9
bfc01a00:	2449000a 	addiu	t1,v0,10
bfc01a04:	01046021 	addu	t4,t0,a0
bfc01a08:	00093c00 	sll	a3,t1,0x10
bfc01a0c:	00036c00 	sll	t5,v1,0x10
bfc01a10:	00cc402a 	slt	t0,a2,t4
bfc01a14:	00073c03 	sra	a3,a3,0x10
bfc01a18:	15000085 	bnez	t0,bfc01c30 <matrix_sum+0x320>
bfc01a1c:	000d1403 	sra	v0,t5,0x10
bfc01a20:	00404821 	move	t1,v0
bfc01a24:	15000002 	bnez	t0,bfc01a30 <matrix_sum+0x120>
bfc01a28:	00004021 	move	t0,zero
bfc01a2c:	01804021 	move	t0,t4
bfc01a30:	256b0001 	addiu	t3,t3,1
bfc01a34:	254a0004 	addiu	t2,t2,4
bfc01a38:	00801821 	move	v1,a0
bfc01a3c:	8d440000 	lw	a0,0(t2)
bfc01a40:	3122ffff 	andi	v0,t1,0xffff
bfc01a44:	01046021 	addu	t4,t0,a0
bfc01a48:	0064402a 	slt	t0,v1,a0
bfc01a4c:	00481821 	addu	v1,v0,t0
bfc01a50:	2449000a 	addiu	t1,v0,10
bfc01a54:	00093c00 	sll	a3,t1,0x10
bfc01a58:	00036c00 	sll	t5,v1,0x10
bfc01a5c:	00cc402a 	slt	t0,a2,t4
bfc01a60:	00073c03 	sra	a3,a3,0x10
bfc01a64:	1500006e 	bnez	t0,bfc01c20 <matrix_sum+0x310>
bfc01a68:	000d1403 	sra	v0,t5,0x10
bfc01a6c:	00404821 	move	t1,v0
bfc01a70:	15000002 	bnez	t0,bfc01a7c <matrix_sum+0x16c>
bfc01a74:	00004021 	move	t0,zero
bfc01a78:	01804021 	move	t0,t4
bfc01a7c:	256b0001 	addiu	t3,t3,1
bfc01a80:	016e602b 	sltu	t4,t3,t6
bfc01a84:	254a0004 	addiu	t2,t2,4
bfc01a88:	11800047 	beqz	t4,bfc01ba8 <matrix_sum+0x298>
bfc01a8c:	00801821 	move	v1,a0
bfc01a90:	8d440000 	lw	a0,0(t2)
bfc01a94:	312dffff 	andi	t5,t1,0xffff
bfc01a98:	01044821 	addu	t1,t0,a0
bfc01a9c:	0064402a 	slt	t0,v1,a0
bfc01aa0:	01a81821 	addu	v1,t5,t0
bfc01aa4:	25ac000a 	addiu	t4,t5,10
bfc01aa8:	000c3c00 	sll	a3,t4,0x10
bfc01aac:	00031400 	sll	v0,v1,0x10
bfc01ab0:	00c9402a 	slt	t0,a2,t1
bfc01ab4:	00073c03 	sra	a3,a3,0x10
bfc01ab8:	11000002 	beqz	t0,bfc01ac4 <matrix_sum+0x1b4>
bfc01abc:	00021403 	sra	v0,v0,0x10
bfc01ac0:	00e01021 	move	v0,a3
bfc01ac4:	11000002 	beqz	t0,bfc01ad0 <matrix_sum+0x1c0>
bfc01ac8:	01203821 	move	a3,t1
bfc01acc:	00003821 	move	a3,zero
bfc01ad0:	8d480004 	lw	t0,4(t2)
bfc01ad4:	304cffff 	andi	t4,v0,0xffff
bfc01ad8:	0088682a 	slt	t5,a0,t0
bfc01adc:	2582000a 	addiu	v0,t4,10
bfc01ae0:	00e84821 	addu	t1,a3,t0
bfc01ae4:	018d1821 	addu	v1,t4,t5
bfc01ae8:	00023c00 	sll	a3,v0,0x10
bfc01aec:	0003cc00 	sll	t9,v1,0x10
bfc01af0:	00c9202a 	slt	a0,a2,t1
bfc01af4:	256b0001 	addiu	t3,t3,1
bfc01af8:	00073c03 	sra	a3,a3,0x10
bfc01afc:	00191403 	sra	v0,t9,0x10
bfc01b00:	10800002 	beqz	a0,bfc01b0c <matrix_sum+0x1fc>
bfc01b04:	254c0004 	addiu	t4,t2,4
bfc01b08:	00e01021 	move	v0,a3
bfc01b0c:	14800002 	bnez	a0,bfc01b18 <matrix_sum+0x208>
bfc01b10:	00003821 	move	a3,zero
bfc01b14:	01203821 	move	a3,t1
bfc01b18:	8d840004 	lw	a0,4(t4)
bfc01b1c:	3042ffff 	andi	v0,v0,0xffff
bfc01b20:	0104182a 	slt	v1,t0,a0
bfc01b24:	00e44821 	addu	t1,a3,a0
bfc01b28:	0043c821 	addu	t9,v0,v1
bfc01b2c:	2447000a 	addiu	a3,v0,10
bfc01b30:	00076c00 	sll	t5,a3,0x10
bfc01b34:	00195400 	sll	t2,t9,0x10
bfc01b38:	00c9402a 	slt	t0,a2,t1
bfc01b3c:	000d3c03 	sra	a3,t5,0x10
bfc01b40:	11000002 	beqz	t0,bfc01b4c <matrix_sum+0x23c>
bfc01b44:	000a1403 	sra	v0,t2,0x10
bfc01b48:	00e01021 	move	v0,a3
bfc01b4c:	1500001c 	bnez	t0,bfc01bc0 <matrix_sum+0x2b0>
bfc01b50:	00004021 	move	t0,zero
bfc01b54:	8d870008 	lw	a3,8(t4)
bfc01b58:	01204021 	move	t0,t1
bfc01b5c:	3042ffff 	andi	v0,v0,0xffff
bfc01b60:	01075021 	addu	t2,t0,a3
bfc01b64:	0087402a 	slt	t0,a0,a3
bfc01b68:	0048c821 	addu	t9,v0,t0
bfc01b6c:	244d000a 	addiu	t5,v0,10
bfc01b70:	000d2400 	sll	a0,t5,0x10
bfc01b74:	00194c00 	sll	t1,t9,0x10
bfc01b78:	00ca402a 	slt	t0,a2,t2
bfc01b7c:	00042403 	sra	a0,a0,0x10
bfc01b80:	1500001b 	bnez	t0,bfc01bf0 <matrix_sum+0x2e0>
bfc01b84:	00091403 	sra	v0,t1,0x10
bfc01b88:	1500001b 	bnez	t0,bfc01bf8 <matrix_sum+0x2e8>
bfc01b8c:	00404821 	move	t1,v0
bfc01b90:	01404021 	move	t0,t2
bfc01b94:	256b0003 	addiu	t3,t3,3
bfc01b98:	016ec82b 	sltu	t9,t3,t6
bfc01b9c:	258a000c 	addiu	t2,t4,12
bfc01ba0:	1720ffbb 	bnez	t9,bfc01a90 <matrix_sum+0x180>
bfc01ba4:	00e01821 	move	v1,a3
bfc01ba8:	25ef0001 	addiu	t7,t7,1
bfc01bac:	01ee202b 	sltu	a0,t7,t6
bfc01bb0:	1480ff60 	bnez	a0,bfc01934 <matrix_sum+0x24>
bfc01bb4:	00b82821 	addu	a1,a1,t8
bfc01bb8:	03e00008 	jr	ra
bfc01bbc:	01201021 	move	v0,t1
bfc01bc0:	8d870008 	lw	a3,8(t4)
bfc01bc4:	3042ffff 	andi	v0,v0,0xffff
bfc01bc8:	01075021 	addu	t2,t0,a3
bfc01bcc:	0087402a 	slt	t0,a0,a3
bfc01bd0:	0048c821 	addu	t9,v0,t0
bfc01bd4:	244d000a 	addiu	t5,v0,10
bfc01bd8:	000d2400 	sll	a0,t5,0x10
bfc01bdc:	00194c00 	sll	t1,t9,0x10
bfc01be0:	00ca402a 	slt	t0,a2,t2
bfc01be4:	00042403 	sra	a0,a0,0x10
bfc01be8:	1100ffe7 	beqz	t0,bfc01b88 <matrix_sum+0x278>
bfc01bec:	00091403 	sra	v0,t1,0x10
bfc01bf0:	1100ffe7 	beqz	t0,bfc01b90 <matrix_sum+0x280>
bfc01bf4:	00804821 	move	t1,a0
bfc01bf8:	0bf006e5 	j	bfc01b94 <matrix_sum+0x284>
bfc01bfc:	00004021 	move	t0,zero
bfc01c00:	0bf0065c 	j	bfc01970 <matrix_sum+0x60>
bfc01c04:	00e04821 	move	t1,a3
	...
bfc01c10:	1100ff73 	beqz	t0,bfc019e0 <matrix_sum+0xd0>
bfc01c14:	00e04821 	move	t1,a3
bfc01c18:	0bf00679 	j	bfc019e4 <matrix_sum+0xd4>
bfc01c1c:	00004021 	move	t0,zero
bfc01c20:	0bf0069c 	j	bfc01a70 <matrix_sum+0x160>
bfc01c24:	00e04821 	move	t1,a3
	...
bfc01c30:	0bf00689 	j	bfc01a24 <matrix_sum+0x114>
bfc01c34:	00e04821 	move	t1,a3
bfc01c38:	00004821 	move	t1,zero
bfc01c3c:	03e00008 	jr	ra
bfc01c40:	01201021 	move	v0,t1
	...

bfc01c50 <matrix_mul_const>:
matrix_mul_const():
bfc01c50:	27bdfff0 	addiu	sp,sp,-16
bfc01c54:	00077400 	sll	t6,a3,0x10
bfc01c58:	afb2000c 	sw	s2,12(sp)
bfc01c5c:	afb10008 	sw	s1,8(sp)
bfc01c60:	afb00004 	sw	s0,4(sp)
bfc01c64:	0080c821 	move	t9,a0
bfc01c68:	10800083 	beqz	a0,bfc01e78 <matrix_mul_const+0x228>
bfc01c6c:	000e7403 	sra	t6,t6,0x10
bfc01c70:	00a0c021 	move	t8,a1
bfc01c74:	00c07821 	move	t7,a2
bfc01c78:	00049080 	sll	s2,a0,0x2
bfc01c7c:	00048840 	sll	s1,a0,0x1
bfc01c80:	00008021 	move	s0,zero
bfc01c84:	85e70000 	lh	a3,0(t7)
bfc01c88:	240d0001 	li	t5,1
bfc01c8c:	01c70018 	mult	t6,a3
bfc01c90:	272cffff 	addiu	t4,t9,-1
bfc01c94:	01b9482b 	sltu	t1,t5,t9
bfc01c98:	31830007 	andi	v1,t4,0x7
bfc01c9c:	25eb0002 	addiu	t3,t7,2
bfc01ca0:	270c0004 	addiu	t4,t8,4
bfc01ca4:	00004012 	mflo	t0
bfc01ca8:	1120006e 	beqz	t1,bfc01e64 <matrix_mul_const+0x214>
bfc01cac:	af080000 	sw	t0,0(t8)
bfc01cb0:	10600040 	beqz	v1,bfc01db4 <matrix_mul_const+0x164>
bfc01cb4:	00000000 	nop
bfc01cb8:	106d0035 	beq	v1,t5,bfc01d90 <matrix_mul_const+0x140>
bfc01cbc:	24060002 	li	a2,2
bfc01cc0:	1066002c 	beq	v1,a2,bfc01d74 <matrix_mul_const+0x124>
bfc01cc4:	24050003 	li	a1,3
bfc01cc8:	10650023 	beq	v1,a1,bfc01d58 <matrix_mul_const+0x108>
bfc01ccc:	24040004 	li	a0,4
bfc01cd0:	1064001a 	beq	v1,a0,bfc01d3c <matrix_mul_const+0xec>
bfc01cd4:	24020005 	li	v0,5
bfc01cd8:	10620011 	beq	v1,v0,bfc01d20 <matrix_mul_const+0xd0>
bfc01cdc:	240a0006 	li	t2,6
bfc01ce0:	106a0008 	beq	v1,t2,bfc01d04 <matrix_mul_const+0xb4>
bfc01ce4:	00000000 	nop
bfc01ce8:	85690000 	lh	t1,0(t3)
bfc01cec:	240d0002 	li	t5,2
bfc01cf0:	01c90018 	mult	t6,t1
bfc01cf4:	25eb0004 	addiu	t3,t7,4
bfc01cf8:	00001812 	mflo	v1
bfc01cfc:	ad830000 	sw	v1,0(t4)
bfc01d00:	270c0008 	addiu	t4,t8,8
bfc01d04:	85670000 	lh	a3,0(t3)
bfc01d08:	25ad0001 	addiu	t5,t5,1
bfc01d0c:	01c70018 	mult	t6,a3
bfc01d10:	256b0002 	addiu	t3,t3,2
bfc01d14:	00004012 	mflo	t0
bfc01d18:	ad880000 	sw	t0,0(t4)
bfc01d1c:	258c0004 	addiu	t4,t4,4
bfc01d20:	85650000 	lh	a1,0(t3)
bfc01d24:	25ad0001 	addiu	t5,t5,1
bfc01d28:	01c50018 	mult	t6,a1
bfc01d2c:	256b0002 	addiu	t3,t3,2
bfc01d30:	00003012 	mflo	a2
bfc01d34:	ad860000 	sw	a2,0(t4)
bfc01d38:	258c0004 	addiu	t4,t4,4
bfc01d3c:	85620000 	lh	v0,0(t3)
bfc01d40:	25ad0001 	addiu	t5,t5,1
bfc01d44:	01c20018 	mult	t6,v0
bfc01d48:	256b0002 	addiu	t3,t3,2
bfc01d4c:	00002012 	mflo	a0
bfc01d50:	ad840000 	sw	a0,0(t4)
bfc01d54:	258c0004 	addiu	t4,t4,4
bfc01d58:	85630000 	lh	v1,0(t3)
bfc01d5c:	25ad0001 	addiu	t5,t5,1
bfc01d60:	01c30018 	mult	t6,v1
bfc01d64:	256b0002 	addiu	t3,t3,2
bfc01d68:	00005012 	mflo	t2
bfc01d6c:	ad8a0000 	sw	t2,0(t4)
bfc01d70:	258c0004 	addiu	t4,t4,4
bfc01d74:	85680000 	lh	t0,0(t3)
bfc01d78:	25ad0001 	addiu	t5,t5,1
bfc01d7c:	01c80018 	mult	t6,t0
bfc01d80:	256b0002 	addiu	t3,t3,2
bfc01d84:	00004812 	mflo	t1
bfc01d88:	ad890000 	sw	t1,0(t4)
bfc01d8c:	258c0004 	addiu	t4,t4,4
bfc01d90:	85650000 	lh	a1,0(t3)
bfc01d94:	25ad0001 	addiu	t5,t5,1
bfc01d98:	01c50018 	mult	t6,a1
bfc01d9c:	01b9382b 	sltu	a3,t5,t9
bfc01da0:	256b0002 	addiu	t3,t3,2
bfc01da4:	00003012 	mflo	a2
bfc01da8:	ad860000 	sw	a2,0(t4)
bfc01dac:	10e0002d 	beqz	a3,bfc01e64 <matrix_mul_const+0x214>
bfc01db0:	258c0004 	addiu	t4,t4,4
bfc01db4:	856a0000 	lh	t2,0(t3)
bfc01db8:	85630002 	lh	v1,2(t3)
bfc01dbc:	01ca0018 	mult	t6,t2
bfc01dc0:	85640004 	lh	a0,4(t3)
bfc01dc4:	85650006 	lh	a1,6(t3)
bfc01dc8:	85660008 	lh	a2,8(t3)
bfc01dcc:	8567000a 	lh	a3,10(t3)
bfc01dd0:	8568000c 	lh	t0,12(t3)
bfc01dd4:	8569000e 	lh	t1,14(t3)
bfc01dd8:	25ad0008 	addiu	t5,t5,8
bfc01ddc:	01b9502b 	sltu	t2,t5,t9
bfc01de0:	256b0010 	addiu	t3,t3,16
bfc01de4:	00001012 	mflo	v0
bfc01de8:	ad820000 	sw	v0,0(t4)
bfc01dec:	00000000 	nop
bfc01df0:	01c30018 	mult	t6,v1
bfc01df4:	00001812 	mflo	v1
bfc01df8:	ad830004 	sw	v1,4(t4)
bfc01dfc:	00000000 	nop
bfc01e00:	01c40018 	mult	t6,a0
bfc01e04:	00002012 	mflo	a0
bfc01e08:	ad840008 	sw	a0,8(t4)
bfc01e0c:	00000000 	nop
bfc01e10:	01c50018 	mult	t6,a1
bfc01e14:	00002812 	mflo	a1
bfc01e18:	ad85000c 	sw	a1,12(t4)
bfc01e1c:	00000000 	nop
bfc01e20:	01c60018 	mult	t6,a2
bfc01e24:	00003012 	mflo	a2
bfc01e28:	ad860010 	sw	a2,16(t4)
bfc01e2c:	00000000 	nop
bfc01e30:	01c70018 	mult	t6,a3
bfc01e34:	00003812 	mflo	a3
bfc01e38:	ad870014 	sw	a3,20(t4)
bfc01e3c:	00000000 	nop
bfc01e40:	01c80018 	mult	t6,t0
bfc01e44:	00004012 	mflo	t0
bfc01e48:	ad880018 	sw	t0,24(t4)
bfc01e4c:	00000000 	nop
bfc01e50:	01c90018 	mult	t6,t1
bfc01e54:	00004812 	mflo	t1
bfc01e58:	ad89001c 	sw	t1,28(t4)
bfc01e5c:	1540ffd5 	bnez	t2,bfc01db4 <matrix_mul_const+0x164>
bfc01e60:	258c0020 	addiu	t4,t4,32
bfc01e64:	26100001 	addiu	s0,s0,1
bfc01e68:	0219582b 	sltu	t3,s0,t9
bfc01e6c:	0312c021 	addu	t8,t8,s2
bfc01e70:	1560ff84 	bnez	t3,bfc01c84 <matrix_mul_const+0x34>
bfc01e74:	01f17821 	addu	t7,t7,s1
bfc01e78:	8fb2000c 	lw	s2,12(sp)
bfc01e7c:	8fb10008 	lw	s1,8(sp)
bfc01e80:	8fb00004 	lw	s0,4(sp)
bfc01e84:	03e00008 	jr	ra
bfc01e88:	27bd0010 	addiu	sp,sp,16
bfc01e8c:	00000000 	nop

bfc01e90 <matrix_add_const>:
matrix_add_const():
bfc01e90:	00061400 	sll	v0,a2,0x10
bfc01e94:	00807821 	move	t7,a0
bfc01e98:	10800061 	beqz	a0,bfc02020 <matrix_add_const+0x190>
bfc01e9c:	00021403 	sra	v0,v0,0x10
bfc01ea0:	304dffff 	andi	t5,v0,0xffff
bfc01ea4:	00a07021 	move	t6,a1
bfc01ea8:	0004c840 	sll	t9,a0,0x1
bfc01eac:	0000c021 	move	t8,zero
bfc01eb0:	95c80000 	lhu	t0,0(t6)
bfc01eb4:	240c0001 	li	t4,1
bfc01eb8:	01a81021 	addu	v0,t5,t0
bfc01ebc:	25e9ffff 	addiu	t1,t7,-1
bfc01ec0:	018f502b 	sltu	t2,t4,t7
bfc01ec4:	a5c20000 	sh	v0,0(t6)
bfc01ec8:	31230007 	andi	v1,t1,0x7
bfc01ecc:	11400050 	beqz	t2,bfc02010 <matrix_add_const+0x180>
bfc01ed0:	25cb0002 	addiu	t3,t6,2
bfc01ed4:	10600032 	beqz	v1,bfc01fa0 <matrix_add_const+0x110>
bfc01ed8:	00000000 	nop
bfc01edc:	106c0029 	beq	v1,t4,bfc01f84 <matrix_add_const+0xf4>
bfc01ee0:	24070002 	li	a3,2
bfc01ee4:	10670022 	beq	v1,a3,bfc01f70 <matrix_add_const+0xe0>
bfc01ee8:	24060003 	li	a2,3
bfc01eec:	1066001b 	beq	v1,a2,bfc01f5c <matrix_add_const+0xcc>
bfc01ef0:	24050004 	li	a1,4
bfc01ef4:	10650014 	beq	v1,a1,bfc01f48 <matrix_add_const+0xb8>
bfc01ef8:	24040005 	li	a0,5
bfc01efc:	1064000d 	beq	v1,a0,bfc01f34 <matrix_add_const+0xa4>
bfc01f00:	240a0006 	li	t2,6
bfc01f04:	106a0006 	beq	v1,t2,bfc01f20 <matrix_add_const+0x90>
bfc01f08:	00000000 	nop
bfc01f0c:	95690000 	lhu	t1,0(t3)
bfc01f10:	240c0002 	li	t4,2
bfc01f14:	01a91821 	addu	v1,t5,t1
bfc01f18:	a5630000 	sh	v1,0(t3)
bfc01f1c:	25cb0004 	addiu	t3,t6,4
bfc01f20:	95680000 	lhu	t0,0(t3)
bfc01f24:	258c0001 	addiu	t4,t4,1
bfc01f28:	01a81021 	addu	v0,t5,t0
bfc01f2c:	a5620000 	sh	v0,0(t3)
bfc01f30:	256b0002 	addiu	t3,t3,2
bfc01f34:	95660000 	lhu	a2,0(t3)
bfc01f38:	258c0001 	addiu	t4,t4,1
bfc01f3c:	01a63821 	addu	a3,t5,a2
bfc01f40:	a5670000 	sh	a3,0(t3)
bfc01f44:	256b0002 	addiu	t3,t3,2
bfc01f48:	95640000 	lhu	a0,0(t3)
bfc01f4c:	258c0001 	addiu	t4,t4,1
bfc01f50:	01a42821 	addu	a1,t5,a0
bfc01f54:	a5650000 	sh	a1,0(t3)
bfc01f58:	256b0002 	addiu	t3,t3,2
bfc01f5c:	95630000 	lhu	v1,0(t3)
bfc01f60:	258c0001 	addiu	t4,t4,1
bfc01f64:	01a35021 	addu	t2,t5,v1
bfc01f68:	a56a0000 	sh	t2,0(t3)
bfc01f6c:	256b0002 	addiu	t3,t3,2
bfc01f70:	95620000 	lhu	v0,0(t3)
bfc01f74:	258c0001 	addiu	t4,t4,1
bfc01f78:	01a24821 	addu	t1,t5,v0
bfc01f7c:	a5690000 	sh	t1,0(t3)
bfc01f80:	256b0002 	addiu	t3,t3,2
bfc01f84:	95660000 	lhu	a2,0(t3)
bfc01f88:	258c0001 	addiu	t4,t4,1
bfc01f8c:	01a63821 	addu	a3,t5,a2
bfc01f90:	018f402b 	sltu	t0,t4,t7
bfc01f94:	a5670000 	sh	a3,0(t3)
bfc01f98:	1100001d 	beqz	t0,bfc02010 <matrix_add_const+0x180>
bfc01f9c:	256b0002 	addiu	t3,t3,2
bfc01fa0:	95630000 	lhu	v1,0(t3)
bfc01fa4:	95640002 	lhu	a0,2(t3)
bfc01fa8:	95650004 	lhu	a1,4(t3)
bfc01fac:	95660006 	lhu	a2,6(t3)
bfc01fb0:	95670008 	lhu	a3,8(t3)
bfc01fb4:	9568000a 	lhu	t0,10(t3)
bfc01fb8:	9569000c 	lhu	t1,12(t3)
bfc01fbc:	956a000e 	lhu	t2,14(t3)
bfc01fc0:	258c0008 	addiu	t4,t4,8
bfc01fc4:	01a31021 	addu	v0,t5,v1
bfc01fc8:	01a41821 	addu	v1,t5,a0
bfc01fcc:	01a52021 	addu	a0,t5,a1
bfc01fd0:	01a62821 	addu	a1,t5,a2
bfc01fd4:	01a73021 	addu	a2,t5,a3
bfc01fd8:	01a83821 	addu	a3,t5,t0
bfc01fdc:	01a94021 	addu	t0,t5,t1
bfc01fe0:	01aa4821 	addu	t1,t5,t2
bfc01fe4:	018f502b 	sltu	t2,t4,t7
bfc01fe8:	a5620000 	sh	v0,0(t3)
bfc01fec:	a5630002 	sh	v1,2(t3)
bfc01ff0:	a5640004 	sh	a0,4(t3)
bfc01ff4:	a5650006 	sh	a1,6(t3)
bfc01ff8:	a5660008 	sh	a2,8(t3)
bfc01ffc:	a567000a 	sh	a3,10(t3)
bfc02000:	a568000c 	sh	t0,12(t3)
bfc02004:	a569000e 	sh	t1,14(t3)
bfc02008:	1540ffe5 	bnez	t2,bfc01fa0 <matrix_add_const+0x110>
bfc0200c:	256b0010 	addiu	t3,t3,16
bfc02010:	27180001 	addiu	t8,t8,1
bfc02014:	030f582b 	sltu	t3,t8,t7
bfc02018:	1560ffa5 	bnez	t3,bfc01eb0 <matrix_add_const+0x20>
bfc0201c:	01d97021 	addu	t6,t6,t9
bfc02020:	03e00008 	jr	ra
bfc02024:	00000000 	nop
	...

bfc02030 <matrix_mul_vect>:
matrix_mul_vect():
bfc02030:	27bdffd8 	addiu	sp,sp,-40
bfc02034:	afb70020 	sw	s7,32(sp)
bfc02038:	afb40014 	sw	s4,20(sp)
bfc0203c:	afbe0024 	sw	s8,36(sp)
bfc02040:	afb6001c 	sw	s6,28(sp)
bfc02044:	afb50018 	sw	s5,24(sp)
bfc02048:	afb30010 	sw	s3,16(sp)
bfc0204c:	afb2000c 	sw	s2,12(sp)
bfc02050:	afb10008 	sw	s1,8(sp)
bfc02054:	afb00004 	sw	s0,4(sp)
bfc02058:	0080a021 	move	s4,a0
bfc0205c:	10800093 	beqz	a0,bfc022ac <matrix_mul_vect+0x27c>
bfc02060:	00e0b821 	move	s7,a3
bfc02064:	00a0b021 	move	s6,a1
bfc02068:	00c09821 	move	s3,a2
bfc0206c:	0004f040 	sll	s8,a0,0x1
bfc02070:	0000a821 	move	s5,zero
bfc02074:	86e40000 	lh	a0,0(s7)
bfc02078:	86620000 	lh	v0,0(s3)
bfc0207c:	24110001 	li	s1,1
bfc02080:	00820018 	mult	a0,v0
bfc02084:	2683ffff 	addiu	v1,s4,-1
bfc02088:	0234282b 	sltu	a1,s1,s4
bfc0208c:	30630007 	andi	v1,v1,0x7
bfc02090:	26780002 	addiu	t8,s3,2
bfc02094:	00009012 	mflo	s2
bfc02098:	10a0007e 	beqz	a1,bfc02294 <matrix_mul_vect+0x264>
bfc0209c:	26f90002 	addiu	t9,s7,2
bfc020a0:	10600047 	beqz	v1,bfc021c0 <matrix_mul_vect+0x190>
bfc020a4:	00000000 	nop
bfc020a8:	1071003b 	beq	v1,s1,bfc02198 <matrix_mul_vect+0x168>
bfc020ac:	24100002 	li	s0,2
bfc020b0:	10700031 	beq	v1,s0,bfc02178 <matrix_mul_vect+0x148>
bfc020b4:	24070003 	li	a3,3
bfc020b8:	10670027 	beq	v1,a3,bfc02158 <matrix_mul_vect+0x128>
bfc020bc:	240f0004 	li	t7,4
bfc020c0:	106f001d 	beq	v1,t7,bfc02138 <matrix_mul_vect+0x108>
bfc020c4:	24060005 	li	a2,5
bfc020c8:	10660013 	beq	v1,a2,bfc02118 <matrix_mul_vect+0xe8>
bfc020cc:	240e0006 	li	t6,6
bfc020d0:	106e0009 	beq	v1,t6,bfc020f8 <matrix_mul_vect+0xc8>
bfc020d4:	00000000 	nop
bfc020d8:	87190000 	lh	t9,0(t8)
bfc020dc:	86f80002 	lh	t8,2(s7)
bfc020e0:	24110002 	li	s1,2
bfc020e4:	03190018 	mult	t8,t9
bfc020e8:	26780004 	addiu	t8,s3,4
bfc020ec:	26f90004 	addiu	t9,s7,4
bfc020f0:	00002812 	mflo	a1
bfc020f4:	02459021 	addu	s2,s2,a1
bfc020f8:	87290000 	lh	t1,0(t9)
bfc020fc:	87040000 	lh	a0,0(t8)
bfc02100:	26310001 	addiu	s1,s1,1
bfc02104:	01240018 	mult	t1,a0
bfc02108:	27180002 	addiu	t8,t8,2
bfc0210c:	27390002 	addiu	t9,t9,2
bfc02110:	00006812 	mflo	t5
bfc02114:	024d9021 	addu	s2,s2,t5
bfc02118:	87220000 	lh	v0,0(t9)
bfc0211c:	870b0000 	lh	t3,0(t8)
bfc02120:	26310001 	addiu	s1,s1,1
bfc02124:	004b0018 	mult	v0,t3
bfc02128:	27180002 	addiu	t8,t8,2
bfc0212c:	27390002 	addiu	t9,t9,2
bfc02130:	00006012 	mflo	t4
bfc02134:	024c9021 	addu	s2,s2,t4
bfc02138:	87280000 	lh	t0,0(t9)
bfc0213c:	87030000 	lh	v1,0(t8)
bfc02140:	26310001 	addiu	s1,s1,1
bfc02144:	01030018 	mult	t0,v1
bfc02148:	27180002 	addiu	t8,t8,2
bfc0214c:	27390002 	addiu	t9,t9,2
bfc02150:	00005012 	mflo	t2
bfc02154:	024a9021 	addu	s2,s2,t2
bfc02158:	87270000 	lh	a3,0(t9)
bfc0215c:	870f0000 	lh	t7,0(t8)
bfc02160:	26310001 	addiu	s1,s1,1
bfc02164:	00ef0018 	mult	a3,t7
bfc02168:	27180002 	addiu	t8,t8,2
bfc0216c:	27390002 	addiu	t9,t9,2
bfc02170:	00008012 	mflo	s0
bfc02174:	02509021 	addu	s2,s2,s0
bfc02178:	872e0000 	lh	t6,0(t9)
bfc0217c:	87050000 	lh	a1,0(t8)
bfc02180:	26310001 	addiu	s1,s1,1
bfc02184:	01c50018 	mult	t6,a1
bfc02188:	27180002 	addiu	t8,t8,2
bfc0218c:	27390002 	addiu	t9,t9,2
bfc02190:	00003012 	mflo	a2
bfc02194:	02469021 	addu	s2,s2,a2
bfc02198:	87240000 	lh	a0,0(t9)
bfc0219c:	870c0000 	lh	t4,0(t8)
bfc021a0:	26310001 	addiu	s1,s1,1
bfc021a4:	008c0018 	mult	a0,t4
bfc021a8:	0234682b 	sltu	t5,s1,s4
bfc021ac:	27180002 	addiu	t8,t8,2
bfc021b0:	27390002 	addiu	t9,t9,2
bfc021b4:	00004812 	mflo	t1
bfc021b8:	11a00036 	beqz	t5,bfc02294 <matrix_mul_vect+0x264>
bfc021bc:	02499021 	addu	s2,s2,t1
bfc021c0:	87280000 	lh	t0,0(t9)
bfc021c4:	87030000 	lh	v1,0(t8)
bfc021c8:	872b0002 	lh	t3,2(t9)
bfc021cc:	01030018 	mult	t0,v1
bfc021d0:	870a0002 	lh	t2,2(t8)
bfc021d4:	87240004 	lh	a0,4(t9)
bfc021d8:	870c0004 	lh	t4,4(t8)
bfc021dc:	87250006 	lh	a1,6(t9)
bfc021e0:	870d0006 	lh	t5,6(t8)
bfc021e4:	87260008 	lh	a2,8(t9)
bfc021e8:	870e0008 	lh	t6,8(t8)
bfc021ec:	8727000a 	lh	a3,10(t9)
bfc021f0:	870f000a 	lh	t7,10(t8)
bfc021f4:	8728000c 	lh	t0,12(t9)
bfc021f8:	8710000c 	lh	s0,12(t8)
bfc021fc:	8723000e 	lh	v1,14(t9)
bfc02200:	00001012 	mflo	v0
bfc02204:	26310008 	addiu	s1,s1,8
bfc02208:	02421021 	addu	v0,s2,v0
bfc0220c:	27390010 	addiu	t9,t9,16
bfc02210:	016a0018 	mult	t3,t2
bfc02214:	870b000e 	lh	t3,14(t8)
bfc02218:	0234502b 	sltu	t2,s1,s4
bfc0221c:	27180010 	addiu	t8,t8,16
bfc02220:	00004812 	mflo	t1
	...
bfc0222c:	008c0018 	mult	a0,t4
bfc02230:	00496021 	addu	t4,v0,t1
bfc02234:	00002012 	mflo	a0
bfc02238:	01841021 	addu	v0,t4,a0
bfc0223c:	00000000 	nop
bfc02240:	00ad0018 	mult	a1,t5
bfc02244:	00002812 	mflo	a1
	...
bfc02250:	00ce0018 	mult	a2,t6
bfc02254:	00457021 	addu	t6,v0,a1
bfc02258:	00009012 	mflo	s2
bfc0225c:	01d26021 	addu	t4,t6,s2
bfc02260:	00000000 	nop
bfc02264:	00ef0018 	mult	a3,t7
bfc02268:	00006812 	mflo	t5
bfc0226c:	018d4821 	addu	t1,t4,t5
bfc02270:	00000000 	nop
bfc02274:	01100018 	mult	t0,s0
bfc02278:	00004012 	mflo	t0
bfc0227c:	01283021 	addu	a2,t1,t0
bfc02280:	00000000 	nop
bfc02284:	006b0018 	mult	v1,t3
bfc02288:	00003812 	mflo	a3
bfc0228c:	1540ffcc 	bnez	t2,bfc021c0 <matrix_mul_vect+0x190>
bfc02290:	00c79021 	addu	s2,a2,a3
bfc02294:	26b50001 	addiu	s5,s5,1
bfc02298:	02b4882b 	sltu	s1,s5,s4
bfc0229c:	aed20000 	sw	s2,0(s6)
bfc022a0:	027e9821 	addu	s3,s3,s8
bfc022a4:	1620ff73 	bnez	s1,bfc02074 <matrix_mul_vect+0x44>
bfc022a8:	26d60004 	addiu	s6,s6,4
bfc022ac:	8fbe0024 	lw	s8,36(sp)
bfc022b0:	8fb70020 	lw	s7,32(sp)
bfc022b4:	8fb6001c 	lw	s6,28(sp)
bfc022b8:	8fb50018 	lw	s5,24(sp)
bfc022bc:	8fb40014 	lw	s4,20(sp)
bfc022c0:	8fb30010 	lw	s3,16(sp)
bfc022c4:	8fb2000c 	lw	s2,12(sp)
bfc022c8:	8fb10008 	lw	s1,8(sp)
bfc022cc:	8fb00004 	lw	s0,4(sp)
bfc022d0:	03e00008 	jr	ra
bfc022d4:	27bd0028 	addiu	sp,sp,40
	...

bfc022e0 <matrix_mul_matrix>:
matrix_mul_matrix():
bfc022e0:	27bdffc8 	addiu	sp,sp,-56
bfc022e4:	afb50028 	sw	s5,40(sp)
bfc022e8:	afbe0034 	sw	s8,52(sp)
bfc022ec:	afb70030 	sw	s7,48(sp)
bfc022f0:	afb6002c 	sw	s6,44(sp)
bfc022f4:	afb40024 	sw	s4,36(sp)
bfc022f8:	afb30020 	sw	s3,32(sp)
bfc022fc:	afb2001c 	sw	s2,28(sp)
bfc02300:	afb10018 	sw	s1,24(sp)
bfc02304:	afb00014 	sw	s0,20(sp)
bfc02308:	0080a821 	move	s5,a0
bfc0230c:	108000a8 	beqz	a0,bfc025b0 <matrix_mul_matrix+0x2d0>
bfc02310:	afa70044 	sw	a3,68(sp)
bfc02314:	00041080 	sll	v0,a0,0x2
bfc02318:	00c0f021 	move	s8,a2
bfc0231c:	afa50004 	sw	a1,4(sp)
bfc02320:	00049840 	sll	s3,a0,0x1
bfc02324:	afa20000 	sw	v0,0(sp)
bfc02328:	afa00008 	sw	zero,8(sp)
bfc0232c:	8fb40044 	lw	s4,68(sp)
bfc02330:	8fb70004 	lw	s7,4(sp)
bfc02334:	0000b021 	move	s6,zero
bfc02338:	86840000 	lh	a0,0(s4)
bfc0233c:	87c60000 	lh	a2,0(s8)
bfc02340:	24190001 	li	t9,1
bfc02344:	00860018 	mult	a0,a2
bfc02348:	26a3ffff 	addiu	v1,s5,-1
bfc0234c:	0335282b 	sltu	a1,t9,s5
bfc02350:	30630007 	andi	v1,v1,0x7
bfc02354:	27d80002 	addiu	t8,s8,2
bfc02358:	00009012 	mflo	s2
bfc0235c:	10a00084 	beqz	a1,bfc02570 <matrix_mul_matrix+0x290>
bfc02360:	02935021 	addu	t2,s4,s3
bfc02364:	10600047 	beqz	v1,bfc02484 <matrix_mul_matrix+0x1a4>
bfc02368:	00000000 	nop
bfc0236c:	1079003b 	beq	v1,t9,bfc0245c <matrix_mul_matrix+0x17c>
bfc02370:	240b0002 	li	t3,2
bfc02374:	106b0031 	beq	v1,t3,bfc0243c <matrix_mul_matrix+0x15c>
bfc02378:	24090003 	li	t1,3
bfc0237c:	10690027 	beq	v1,t1,bfc0241c <matrix_mul_matrix+0x13c>
bfc02380:	24110004 	li	s1,4
bfc02384:	1071001d 	beq	v1,s1,bfc023fc <matrix_mul_matrix+0x11c>
bfc02388:	24020005 	li	v0,5
bfc0238c:	10620013 	beq	v1,v0,bfc023dc <matrix_mul_matrix+0xfc>
bfc02390:	24050006 	li	a1,6
bfc02394:	10650009 	beq	v1,a1,bfc023bc <matrix_mul_matrix+0xdc>
bfc02398:	00000000 	nop
bfc0239c:	870c0000 	lh	t4,0(t8)
bfc023a0:	854d0000 	lh	t5,0(t2)
bfc023a4:	24190002 	li	t9,2
bfc023a8:	01ac0018 	mult	t5,t4
bfc023ac:	01535021 	addu	t2,t2,s3
bfc023b0:	27d80004 	addiu	t8,s8,4
bfc023b4:	00001812 	mflo	v1
bfc023b8:	02439021 	addu	s2,s2,v1
bfc023bc:	85460000 	lh	a2,0(t2)
bfc023c0:	870e0000 	lh	t6,0(t8)
bfc023c4:	27390001 	addiu	t9,t9,1
bfc023c8:	00ce0018 	mult	a2,t6
bfc023cc:	27180002 	addiu	t8,t8,2
bfc023d0:	01535021 	addu	t2,t2,s3
bfc023d4:	00002012 	mflo	a0
bfc023d8:	02449021 	addu	s2,s2,a0
bfc023dc:	854f0000 	lh	t7,0(t2)
bfc023e0:	87080000 	lh	t0,0(t8)
bfc023e4:	27390001 	addiu	t9,t9,1
bfc023e8:	01e80018 	mult	t7,t0
bfc023ec:	27180002 	addiu	t8,t8,2
bfc023f0:	01535021 	addu	t2,t2,s3
bfc023f4:	00003812 	mflo	a3
bfc023f8:	02479021 	addu	s2,s2,a3
bfc023fc:	854b0000 	lh	t3,0(t2)
bfc02400:	87090000 	lh	t1,0(t8)
bfc02404:	27390001 	addiu	t9,t9,1
bfc02408:	01690018 	mult	t3,t1
bfc0240c:	27180002 	addiu	t8,t8,2
bfc02410:	01535021 	addu	t2,t2,s3
bfc02414:	00008012 	mflo	s0
bfc02418:	02509021 	addu	s2,s2,s0
bfc0241c:	85420000 	lh	v0,0(t2)
bfc02420:	87050000 	lh	a1,0(t8)
bfc02424:	27390001 	addiu	t9,t9,1
bfc02428:	00450018 	mult	v0,a1
bfc0242c:	27180002 	addiu	t8,t8,2
bfc02430:	01535021 	addu	t2,t2,s3
bfc02434:	00008812 	mflo	s1
bfc02438:	02519021 	addu	s2,s2,s1
bfc0243c:	854d0000 	lh	t5,0(t2)
bfc02440:	870c0000 	lh	t4,0(t8)
bfc02444:	27390001 	addiu	t9,t9,1
bfc02448:	01ac0018 	mult	t5,t4
bfc0244c:	27180002 	addiu	t8,t8,2
bfc02450:	01535021 	addu	t2,t2,s3
bfc02454:	00001812 	mflo	v1
bfc02458:	02439021 	addu	s2,s2,v1
bfc0245c:	854e0000 	lh	t6,0(t2)
bfc02460:	87070000 	lh	a3,0(t8)
bfc02464:	27390001 	addiu	t9,t9,1
bfc02468:	01c70018 	mult	t6,a3
bfc0246c:	0335202b 	sltu	a0,t9,s5
bfc02470:	27180002 	addiu	t8,t8,2
bfc02474:	01535021 	addu	t2,t2,s3
bfc02478:	00003012 	mflo	a2
bfc0247c:	1080003c 	beqz	a0,bfc02570 <matrix_mul_matrix+0x290>
bfc02480:	02469021 	addu	s2,s2,a2
bfc02484:	854f0000 	lh	t7,0(t2)
bfc02488:	87080000 	lh	t0,0(t8)
bfc0248c:	01533821 	addu	a3,t2,s3
bfc02490:	01e80018 	mult	t7,t0
bfc02494:	870d0002 	lh	t5,2(t8)
bfc02498:	84ec0000 	lh	t4,0(a3)
bfc0249c:	00f37021 	addu	t6,a3,s3
bfc024a0:	87110004 	lh	s1,4(t8)
bfc024a4:	85c90000 	lh	t1,0(t6)
bfc024a8:	01d33021 	addu	a2,t6,s3
bfc024ac:	87100006 	lh	s0,6(t8)
bfc024b0:	84c80000 	lh	t0,0(a2)
bfc024b4:	00d32021 	addu	a0,a2,s3
bfc024b8:	870f0008 	lh	t7,8(t8)
bfc024bc:	84870000 	lh	a3,0(a0)
bfc024c0:	00932821 	addu	a1,a0,s3
bfc024c4:	00001012 	mflo	v0
bfc024c8:	870e000a 	lh	t6,10(t8)
bfc024cc:	84a60000 	lh	a2,0(a1)
bfc024d0:	00b31821 	addu	v1,a1,s3
bfc024d4:	018d0018 	mult	t4,t5
bfc024d8:	84640000 	lh	a0,0(v1)
bfc024dc:	870c000c 	lh	t4,12(t8)
bfc024e0:	00735021 	addu	t2,v1,s3
bfc024e4:	870d000e 	lh	t5,14(t8)
bfc024e8:	85430000 	lh	v1,0(t2)
bfc024ec:	02421021 	addu	v0,s2,v0
bfc024f0:	27390008 	addiu	t9,t9,8
bfc024f4:	0335282b 	sltu	a1,t9,s5
bfc024f8:	27180010 	addiu	t8,t8,16
bfc024fc:	01535021 	addu	t2,t2,s3
bfc02500:	00005812 	mflo	t3
bfc02504:	004b1021 	addu	v0,v0,t3
bfc02508:	00000000 	nop
bfc0250c:	01310018 	mult	t1,s1
bfc02510:	00004812 	mflo	t1
bfc02514:	00499021 	addu	s2,v0,t1
bfc02518:	00000000 	nop
bfc0251c:	01100018 	mult	t0,s0
bfc02520:	00004012 	mflo	t0
bfc02524:	02488021 	addu	s0,s2,t0
bfc02528:	00000000 	nop
bfc0252c:	00ef0018 	mult	a3,t7
bfc02530:	00008812 	mflo	s1
	...
bfc0253c:	00ce0018 	mult	a2,t6
bfc02540:	02117021 	addu	t6,s0,s1
bfc02544:	00007812 	mflo	t7
bfc02548:	01cf4821 	addu	t1,t6,t7
bfc0254c:	00000000 	nop
bfc02550:	008c0018 	mult	a0,t4
bfc02554:	00005812 	mflo	t3
bfc02558:	012b3821 	addu	a3,t1,t3
bfc0255c:	00000000 	nop
bfc02560:	006d0018 	mult	v1,t5
bfc02564:	00004012 	mflo	t0
bfc02568:	14a0ffc6 	bnez	a1,bfc02484 <matrix_mul_matrix+0x1a4>
bfc0256c:	00e89021 	addu	s2,a3,t0
bfc02570:	26d60001 	addiu	s6,s6,1
bfc02574:	02d5c02b 	sltu	t8,s6,s5
bfc02578:	aef20000 	sw	s2,0(s7)
bfc0257c:	26940002 	addiu	s4,s4,2
bfc02580:	1700ff6d 	bnez	t8,bfc02338 <matrix_mul_matrix+0x58>
bfc02584:	26f70004 	addiu	s7,s7,4
bfc02588:	8fb00008 	lw	s0,8(sp)
bfc0258c:	8fb70004 	lw	s7,4(sp)
bfc02590:	8fb90000 	lw	t9,0(sp)
bfc02594:	26120001 	addiu	s2,s0,1
bfc02598:	02f9b021 	addu	s6,s7,t9
bfc0259c:	0255a02b 	sltu	s4,s2,s5
bfc025a0:	afb20008 	sw	s2,8(sp)
bfc025a4:	03d3f021 	addu	s8,s8,s3
bfc025a8:	1680ff60 	bnez	s4,bfc0232c <matrix_mul_matrix+0x4c>
bfc025ac:	afb60004 	sw	s6,4(sp)
bfc025b0:	8fbe0034 	lw	s8,52(sp)
bfc025b4:	8fb70030 	lw	s7,48(sp)
bfc025b8:	8fb6002c 	lw	s6,44(sp)
bfc025bc:	8fb50028 	lw	s5,40(sp)
bfc025c0:	8fb40024 	lw	s4,36(sp)
bfc025c4:	8fb30020 	lw	s3,32(sp)
bfc025c8:	8fb2001c 	lw	s2,28(sp)
bfc025cc:	8fb10018 	lw	s1,24(sp)
bfc025d0:	8fb00014 	lw	s0,20(sp)
bfc025d4:	03e00008 	jr	ra
bfc025d8:	27bd0038 	addiu	sp,sp,56
bfc025dc:	00000000 	nop

bfc025e0 <matrix_mul_matrix_bitextract>:
matrix_mul_matrix_bitextract():
bfc025e0:	27bdffd8 	addiu	sp,sp,-40
bfc025e4:	afbe0024 	sw	s8,36(sp)
bfc025e8:	afb00004 	sw	s0,4(sp)
bfc025ec:	afb70020 	sw	s7,32(sp)
bfc025f0:	afb6001c 	sw	s6,28(sp)
bfc025f4:	afb50018 	sw	s5,24(sp)
bfc025f8:	afb40014 	sw	s4,20(sp)
bfc025fc:	afb30010 	sw	s3,16(sp)
bfc02600:	afb2000c 	sw	s2,12(sp)
bfc02604:	afb10008 	sw	s1,8(sp)
bfc02608:	00808021 	move	s0,a0
bfc0260c:	1080008e 	beqz	a0,bfc02848 <matrix_mul_matrix_bitextract+0x268>
bfc02610:	00e0f021 	move	s8,a3
bfc02614:	00c0a021 	move	s4,a2
bfc02618:	00a0a821 	move	s5,a1
bfc0261c:	0004c840 	sll	t9,a0,0x1
bfc02620:	0004b880 	sll	s7,a0,0x2
bfc02624:	0000b021 	move	s6,zero
bfc02628:	03c08821 	move	s1,s8
bfc0262c:	02a09021 	move	s2,s5
bfc02630:	00009821 	move	s3,zero
bfc02634:	86290000 	lh	t1,0(s1)
bfc02638:	868a0000 	lh	t2,0(s4)
bfc0263c:	240f0001 	li	t7,1
bfc02640:	012a0018 	mult	t1,t2
bfc02644:	2604ffff 	addiu	a0,s0,-1
bfc02648:	01f0282b 	sltu	a1,t7,s0
bfc0264c:	30840003 	andi	a0,a0,0x3
bfc02650:	268d0002 	addiu	t5,s4,2
bfc02654:	00004012 	mflo	t0
bfc02658:	00083083 	sra	a2,t0,0x2
bfc0265c:	00083943 	sra	a3,t0,0x5
bfc02660:	30e2007f 	andi	v0,a3,0x7f
bfc02664:	30c3000f 	andi	v1,a2,0xf
bfc02668:	00430018 	mult	v0,v1
bfc0266c:	0000c012 	mflo	t8
bfc02670:	10a0006a 	beqz	a1,bfc0281c <matrix_mul_matrix_bitextract+0x23c>
bfc02674:	02397021 	addu	t6,s1,t9
bfc02678:	10800031 	beqz	a0,bfc02740 <matrix_mul_matrix_bitextract+0x160>
bfc0267c:	00000000 	nop
bfc02680:	108f001f 	beq	a0,t7,bfc02700 <matrix_mul_matrix_bitextract+0x120>
bfc02684:	24030002 	li	v1,2
bfc02688:	1083000f 	beq	a0,v1,bfc026c8 <matrix_mul_matrix_bitextract+0xe8>
bfc0268c:	00000000 	nop
bfc02690:	85a70000 	lh	a3,0(t5)
bfc02694:	85cc0000 	lh	t4,0(t6)
bfc02698:	240f0002 	li	t7,2
bfc0269c:	01870018 	mult	t4,a3
bfc026a0:	01d97021 	addu	t6,t6,t9
bfc026a4:	268d0004 	addiu	t5,s4,4
bfc026a8:	00004812 	mflo	t1
bfc026ac:	00091083 	sra	v0,t1,0x2
bfc026b0:	00092943 	sra	a1,t1,0x5
bfc026b4:	30a8007f 	andi	t0,a1,0x7f
bfc026b8:	304a000f 	andi	t2,v0,0xf
bfc026bc:	010a0018 	mult	t0,t2
bfc026c0:	00002012 	mflo	a0
bfc026c4:	0304c021 	addu	t8,t8,a0
bfc026c8:	85c20000 	lh	v0,0(t6)
bfc026cc:	85a50000 	lh	a1,0(t5)
bfc026d0:	25ef0001 	addiu	t7,t7,1
bfc026d4:	00450018 	mult	v0,a1
bfc026d8:	25ad0002 	addiu	t5,t5,2
bfc026dc:	01d97021 	addu	t6,t6,t9
bfc026e0:	00004012 	mflo	t0
bfc026e4:	00082083 	sra	a0,t0,0x2
bfc026e8:	00085143 	sra	t2,t0,0x5
bfc026ec:	314b007f 	andi	t3,t2,0x7f
bfc026f0:	3083000f 	andi	v1,a0,0xf
bfc026f4:	01630018 	mult	t3,v1
bfc026f8:	00003012 	mflo	a2
bfc026fc:	0306c021 	addu	t8,t8,a2
bfc02700:	85ca0000 	lh	t2,0(t6)
bfc02704:	85a80000 	lh	t0,0(t5)
bfc02708:	25ef0001 	addiu	t7,t7,1
bfc0270c:	01480018 	mult	t2,t0
bfc02710:	01f0482b 	sltu	t1,t7,s0
bfc02714:	25ad0002 	addiu	t5,t5,2
bfc02718:	01d97021 	addu	t6,t6,t9
bfc0271c:	00002012 	mflo	a0
bfc02720:	00045883 	sra	t3,a0,0x2
bfc02724:	00041943 	sra	v1,a0,0x5
bfc02728:	306c007f 	andi	t4,v1,0x7f
bfc0272c:	3166000f 	andi	a2,t3,0xf
bfc02730:	01860018 	mult	t4,a2
bfc02734:	00003812 	mflo	a3
bfc02738:	11200038 	beqz	t1,bfc0281c <matrix_mul_matrix_bitextract+0x23c>
bfc0273c:	0307c021 	addu	t8,t8,a3
bfc02740:	85c60000 	lh	a2,0(t6)
bfc02744:	85ab0000 	lh	t3,0(t5)
bfc02748:	01d96021 	addu	t4,t6,t9
bfc0274c:	00cb0018 	mult	a2,t3
bfc02750:	85a90002 	lh	t1,2(t5)
bfc02754:	85850000 	lh	a1,0(t4)
bfc02758:	01997021 	addu	t6,t4,t9
bfc0275c:	85aa0004 	lh	t2,4(t5)
bfc02760:	85c40000 	lh	a0,0(t6)
bfc02764:	01d93821 	addu	a3,t6,t9
bfc02768:	85ab0006 	lh	t3,6(t5)
bfc0276c:	84e60000 	lh	a2,0(a3)
bfc02770:	00f97021 	addu	t6,a3,t9
bfc02774:	25ef0004 	addiu	t7,t7,4
bfc02778:	01f0602b 	sltu	t4,t7,s0
bfc0277c:	25ad0008 	addiu	t5,t5,8
bfc02780:	00001012 	mflo	v0
bfc02784:	00024083 	sra	t0,v0,0x2
bfc02788:	00021143 	sra	v0,v0,0x5
bfc0278c:	00a90018 	mult	a1,t1
bfc02790:	3042007f 	andi	v0,v0,0x7f
bfc02794:	3108000f 	andi	t0,t0,0xf
bfc02798:	00001812 	mflo	v1
bfc0279c:	00034883 	sra	t1,v1,0x2
bfc027a0:	00032943 	sra	a1,v1,0x5
bfc027a4:	008a0018 	mult	a0,t2
bfc027a8:	30a5007f 	andi	a1,a1,0x7f
bfc027ac:	3129000f 	andi	t1,t1,0xf
bfc027b0:	00005012 	mflo	t2
bfc027b4:	000a3883 	sra	a3,t2,0x2
bfc027b8:	000a2143 	sra	a0,t2,0x5
bfc027bc:	00cb0018 	mult	a2,t3
bfc027c0:	30ea000f 	andi	t2,a3,0xf
bfc027c4:	3084007f 	andi	a0,a0,0x7f
bfc027c8:	00001812 	mflo	v1
bfc027cc:	00033083 	sra	a2,v1,0x2
bfc027d0:	00031943 	sra	v1,v1,0x5
bfc027d4:	00480018 	mult	v0,t0
bfc027d8:	3063007f 	andi	v1,v1,0x7f
bfc027dc:	30c6000f 	andi	a2,a2,0xf
bfc027e0:	00005812 	mflo	t3
bfc027e4:	030b1021 	addu	v0,t8,t3
bfc027e8:	00000000 	nop
bfc027ec:	00a90018 	mult	a1,t1
bfc027f0:	00004012 	mflo	t0
bfc027f4:	0048c021 	addu	t8,v0,t0
bfc027f8:	00000000 	nop
bfc027fc:	008a0018 	mult	a0,t2
bfc02800:	00003812 	mflo	a3
bfc02804:	03075821 	addu	t3,t8,a3
bfc02808:	00000000 	nop
bfc0280c:	00660018 	mult	v1,a2
bfc02810:	00002812 	mflo	a1
bfc02814:	1580ffca 	bnez	t4,bfc02740 <matrix_mul_matrix_bitextract+0x160>
bfc02818:	0165c021 	addu	t8,t3,a1
bfc0281c:	26730001 	addiu	s3,s3,1
bfc02820:	0270682b 	sltu	t5,s3,s0
bfc02824:	ae580000 	sw	t8,0(s2)
bfc02828:	26310002 	addiu	s1,s1,2
bfc0282c:	15a0ff81 	bnez	t5,bfc02634 <matrix_mul_matrix_bitextract+0x54>
bfc02830:	26520004 	addiu	s2,s2,4
bfc02834:	26d60001 	addiu	s6,s6,1
bfc02838:	02d0782b 	sltu	t7,s6,s0
bfc0283c:	0299a021 	addu	s4,s4,t9
bfc02840:	15e0ff79 	bnez	t7,bfc02628 <matrix_mul_matrix_bitextract+0x48>
bfc02844:	02b7a821 	addu	s5,s5,s7
bfc02848:	8fbe0024 	lw	s8,36(sp)
bfc0284c:	8fb70020 	lw	s7,32(sp)
bfc02850:	8fb6001c 	lw	s6,28(sp)
bfc02854:	8fb50018 	lw	s5,24(sp)
bfc02858:	8fb40014 	lw	s4,20(sp)
bfc0285c:	8fb30010 	lw	s3,16(sp)
bfc02860:	8fb2000c 	lw	s2,12(sp)
bfc02864:	8fb10008 	lw	s1,8(sp)
bfc02868:	8fb00004 	lw	s0,4(sp)
bfc0286c:	03e00008 	jr	ra
bfc02870:	27bd0028 	addiu	sp,sp,40
	...

bfc02880 <matrix_test>:
matrix_test():
bfc02880:	27bdffa0 	addiu	sp,sp,-96
bfc02884:	87a20070 	lh	v0,112(sp)
bfc02888:	afb40048 	sw	s4,72(sp)
bfc0288c:	afbf005c 	sw	ra,92(sp)
bfc02890:	afbe0058 	sw	s8,88(sp)
bfc02894:	afb70054 	sw	s7,84(sp)
bfc02898:	afb60050 	sw	s6,80(sp)
bfc0289c:	afb5004c 	sw	s5,76(sp)
bfc028a0:	afb30044 	sw	s3,68(sp)
bfc028a4:	afb20040 	sw	s2,64(sp)
bfc028a8:	afb1003c 	sw	s1,60(sp)
bfc028ac:	afb00038 	sw	s0,56(sp)
bfc028b0:	0080a021 	move	s4,a0
bfc028b4:	afa50028 	sw	a1,40(sp)
bfc028b8:	afa6002c 	sw	a2,44(sp)
bfc028bc:	afa70030 	sw	a3,48(sp)
bfc028c0:	108005ad 	beqz	a0,bfc03f78 <matrix_test+0x16f8>
bfc028c4:	afa20034 	sw	v0,52(sp)
bfc028c8:	304dffff 	andi	t5,v0,0xffff
bfc028cc:	00049040 	sll	s2,a0,0x1
bfc028d0:	afa60014 	sw	a2,20(sp)
bfc028d4:	00c07021 	move	t6,a2
bfc028d8:	00007821 	move	t7,zero
bfc028dc:	95c90000 	lhu	t1,0(t6)
bfc028e0:	240c0001 	li	t4,1
bfc028e4:	01a95021 	addu	t2,t5,t1
bfc028e8:	269fffff 	addiu	ra,s4,-1
bfc028ec:	0194f02b 	sltu	s8,t4,s4
bfc028f0:	a5ca0000 	sh	t2,0(t6)
bfc028f4:	33e30007 	andi	v1,ra,0x7
bfc028f8:	13c00050 	beqz	s8,bfc02a3c <matrix_test+0x1bc>
bfc028fc:	25cb0002 	addiu	t3,t6,2
bfc02900:	10600032 	beqz	v1,bfc029cc <matrix_test+0x14c>
bfc02904:	00000000 	nop
bfc02908:	106c0029 	beq	v1,t4,bfc029b0 <matrix_test+0x130>
bfc0290c:	24100002 	li	s0,2
bfc02910:	10700022 	beq	v1,s0,bfc0299c <matrix_test+0x11c>
bfc02914:	24170003 	li	s7,3
bfc02918:	1077001b 	beq	v1,s7,bfc02988 <matrix_test+0x108>
bfc0291c:	24080004 	li	t0,4
bfc02920:	10680014 	beq	v1,t0,bfc02974 <matrix_test+0xf4>
bfc02924:	24150005 	li	s5,5
bfc02928:	1075000d 	beq	v1,s5,bfc02960 <matrix_test+0xe0>
bfc0292c:	24160006 	li	s6,6
bfc02930:	10760006 	beq	v1,s6,bfc0294c <matrix_test+0xcc>
bfc02934:	00000000 	nop
bfc02938:	95730000 	lhu	s3,0(t3)
bfc0293c:	240c0002 	li	t4,2
bfc02940:	01b31821 	addu	v1,t5,s3
bfc02944:	a5630000 	sh	v1,0(t3)
bfc02948:	25cb0004 	addiu	t3,t6,4
bfc0294c:	95710000 	lhu	s1,0(t3)
bfc02950:	258c0001 	addiu	t4,t4,1
bfc02954:	01b1c821 	addu	t9,t5,s1
bfc02958:	a5790000 	sh	t9,0(t3)
bfc0295c:	256b0002 	addiu	t3,t3,2
bfc02960:	95620000 	lhu	v0,0(t3)
bfc02964:	258c0001 	addiu	t4,t4,1
bfc02968:	01a2c021 	addu	t8,t5,v0
bfc0296c:	a5780000 	sh	t8,0(t3)
bfc02970:	256b0002 	addiu	t3,t3,2
bfc02974:	95690000 	lhu	t1,0(t3)
bfc02978:	258c0001 	addiu	t4,t4,1
bfc0297c:	01a9f021 	addu	s8,t5,t1
bfc02980:	a57e0000 	sh	s8,0(t3)
bfc02984:	256b0002 	addiu	t3,t3,2
bfc02988:	95670000 	lhu	a3,0(t3)
bfc0298c:	258c0001 	addiu	t4,t4,1
bfc02990:	01a72821 	addu	a1,t5,a3
bfc02994:	a5650000 	sh	a1,0(t3)
bfc02998:	256b0002 	addiu	t3,t3,2
bfc0299c:	956a0000 	lhu	t2,0(t3)
bfc029a0:	258c0001 	addiu	t4,t4,1
bfc029a4:	01aa3021 	addu	a2,t5,t2
bfc029a8:	a5660000 	sh	a2,0(t3)
bfc029ac:	256b0002 	addiu	t3,t3,2
bfc029b0:	95700000 	lhu	s0,0(t3)
bfc029b4:	258c0001 	addiu	t4,t4,1
bfc029b8:	01b0f821 	addu	ra,t5,s0
bfc029bc:	0194202b 	sltu	a0,t4,s4
bfc029c0:	a57f0000 	sh	ra,0(t3)
bfc029c4:	1080001d 	beqz	a0,bfc02a3c <matrix_test+0x1bc>
bfc029c8:	256b0002 	addiu	t3,t3,2
bfc029cc:	95790000 	lhu	t9,0(t3)
bfc029d0:	95780002 	lhu	t8,2(t3)
bfc029d4:	95770004 	lhu	s7,4(t3)
bfc029d8:	95760006 	lhu	s6,6(t3)
bfc029dc:	95750008 	lhu	s5,8(t3)
bfc029e0:	9573000a 	lhu	s3,10(t3)
bfc029e4:	9571000c 	lhu	s1,12(t3)
bfc029e8:	9570000e 	lhu	s0,14(t3)
bfc029ec:	258c0008 	addiu	t4,t4,8
bfc029f0:	01b91021 	addu	v0,t5,t9
bfc029f4:	01b81821 	addu	v1,t5,t8
bfc029f8:	01b72021 	addu	a0,t5,s7
bfc029fc:	01b62821 	addu	a1,t5,s6
bfc02a00:	01b53021 	addu	a2,t5,s5
bfc02a04:	01b33821 	addu	a3,t5,s3
bfc02a08:	01b14021 	addu	t0,t5,s1
bfc02a0c:	01b04821 	addu	t1,t5,s0
bfc02a10:	0194502b 	sltu	t2,t4,s4
bfc02a14:	a5620000 	sh	v0,0(t3)
bfc02a18:	a5630002 	sh	v1,2(t3)
bfc02a1c:	a5640004 	sh	a0,4(t3)
bfc02a20:	a5650006 	sh	a1,6(t3)
bfc02a24:	a5660008 	sh	a2,8(t3)
bfc02a28:	a567000a 	sh	a3,10(t3)
bfc02a2c:	a568000c 	sh	t0,12(t3)
bfc02a30:	a569000e 	sh	t1,14(t3)
bfc02a34:	1540ffe5 	bnez	t2,bfc029cc <matrix_test+0x14c>
bfc02a38:	256b0010 	addiu	t3,t3,16
bfc02a3c:	25ef0001 	addiu	t7,t7,1
bfc02a40:	01f4582b 	sltu	t3,t7,s4
bfc02a44:	1560ffa5 	bnez	t3,bfc028dc <matrix_test+0x5c>
bfc02a48:	01d27021 	addu	t6,t6,s2
bfc02a4c:	8fac0028 	lw	t4,40(sp)
bfc02a50:	00146880 	sll	t5,s4,0x2
bfc02a54:	8faf002c 	lw	t7,44(sp)
bfc02a58:	afad001c 	sw	t5,28(sp)
bfc02a5c:	afac0020 	sw	t4,32(sp)
bfc02a60:	01807021 	move	t6,t4
bfc02a64:	00008021 	move	s0,zero
bfc02a68:	85f10000 	lh	s1,0(t7)
bfc02a6c:	8fa50034 	lw	a1,52(sp)
bfc02a70:	240d0001 	li	t5,1
bfc02a74:	00b10018 	mult	a1,s1
bfc02a78:	2695ffff 	addiu	s5,s4,-1
bfc02a7c:	01b4382b 	sltu	a3,t5,s4
bfc02a80:	32a30007 	andi	v1,s5,0x7
bfc02a84:	25eb0002 	addiu	t3,t7,2
bfc02a88:	25cc0004 	addiu	t4,t6,4
bfc02a8c:	00004012 	mflo	t0
bfc02a90:	10e00077 	beqz	a3,bfc02c70 <matrix_test+0x3f0>
bfc02a94:	adc80000 	sw	t0,0(t6)
bfc02a98:	10600047 	beqz	v1,bfc02bb8 <matrix_test+0x338>
bfc02a9c:	00000000 	nop
bfc02aa0:	106d003b 	beq	v1,t5,bfc02b90 <matrix_test+0x310>
bfc02aa4:	241e0002 	li	s8,2
bfc02aa8:	107e0031 	beq	v1,s8,bfc02b70 <matrix_test+0x2f0>
bfc02aac:	24090003 	li	t1,3
bfc02ab0:	10690027 	beq	v1,t1,bfc02b50 <matrix_test+0x2d0>
bfc02ab4:	24050004 	li	a1,4
bfc02ab8:	1065001d 	beq	v1,a1,bfc02b30 <matrix_test+0x2b0>
bfc02abc:	24070005 	li	a3,5
bfc02ac0:	10670013 	beq	v1,a3,bfc02b10 <matrix_test+0x290>
bfc02ac4:	24060006 	li	a2,6
bfc02ac8:	10660009 	beq	v1,a2,bfc02af0 <matrix_test+0x270>
bfc02acc:	00000000 	nop
bfc02ad0:	85640000 	lh	a0,0(t3)
bfc02ad4:	8fab0034 	lw	t3,52(sp)
bfc02ad8:	240d0002 	li	t5,2
bfc02adc:	01640018 	mult	t3,a0
bfc02ae0:	25eb0004 	addiu	t3,t7,4
bfc02ae4:	00005012 	mflo	t2
bfc02ae8:	ad8a0000 	sw	t2,0(t4)
bfc02aec:	25cc0008 	addiu	t4,t6,8
bfc02af0:	85770000 	lh	s7,0(t3)
bfc02af4:	8fa30034 	lw	v1,52(sp)
bfc02af8:	25ad0001 	addiu	t5,t5,1
bfc02afc:	00770018 	mult	v1,s7
bfc02b00:	256b0002 	addiu	t3,t3,2
bfc02b04:	0000f812 	mflo	ra
bfc02b08:	ad9f0000 	sw	ra,0(t4)
bfc02b0c:	258c0004 	addiu	t4,t4,4
bfc02b10:	85750000 	lh	s5,0(t3)
bfc02b14:	8fb60034 	lw	s6,52(sp)
bfc02b18:	25ad0001 	addiu	t5,t5,1
bfc02b1c:	02d50018 	mult	s6,s5
bfc02b20:	256b0002 	addiu	t3,t3,2
bfc02b24:	00004012 	mflo	t0
bfc02b28:	ad880000 	sw	t0,0(t4)
bfc02b2c:	258c0004 	addiu	t4,t4,4
bfc02b30:	85790000 	lh	t9,0(t3)
bfc02b34:	8fb10034 	lw	s1,52(sp)
bfc02b38:	25ad0001 	addiu	t5,t5,1
bfc02b3c:	02390018 	mult	s1,t9
bfc02b40:	256b0002 	addiu	t3,t3,2
bfc02b44:	00009812 	mflo	s3
bfc02b48:	ad930000 	sw	s3,0(t4)
bfc02b4c:	258c0004 	addiu	t4,t4,4
bfc02b50:	85620000 	lh	v0,0(t3)
bfc02b54:	8fbe0034 	lw	s8,52(sp)
bfc02b58:	25ad0001 	addiu	t5,t5,1
bfc02b5c:	03c20018 	mult	s8,v0
bfc02b60:	256b0002 	addiu	t3,t3,2
bfc02b64:	0000c012 	mflo	t8
bfc02b68:	ad980000 	sw	t8,0(t4)
bfc02b6c:	258c0004 	addiu	t4,t4,4
bfc02b70:	85650000 	lh	a1,0(t3)
bfc02b74:	8fa70034 	lw	a3,52(sp)
bfc02b78:	25ad0001 	addiu	t5,t5,1
bfc02b7c:	00e50018 	mult	a3,a1
bfc02b80:	256b0002 	addiu	t3,t3,2
bfc02b84:	00004812 	mflo	t1
bfc02b88:	ad890000 	sw	t1,0(t4)
bfc02b8c:	258c0004 	addiu	t4,t4,4
bfc02b90:	85640000 	lh	a0,0(t3)
bfc02b94:	8fbf0034 	lw	ra,52(sp)
bfc02b98:	25ad0001 	addiu	t5,t5,1
bfc02b9c:	03e40018 	mult	ra,a0
bfc02ba0:	01b4302b 	sltu	a2,t5,s4
bfc02ba4:	256b0002 	addiu	t3,t3,2
bfc02ba8:	00005012 	mflo	t2
bfc02bac:	ad8a0000 	sw	t2,0(t4)
bfc02bb0:	10c0002f 	beqz	a2,bfc02c70 <matrix_test+0x3f0>
bfc02bb4:	258c0004 	addiu	t4,t4,4
bfc02bb8:	85690000 	lh	t1,0(t3)
bfc02bbc:	8fb30034 	lw	s3,52(sp)
bfc02bc0:	8fb10034 	lw	s1,52(sp)
bfc02bc4:	02690018 	mult	s3,t1
bfc02bc8:	856a0002 	lh	t2,2(t3)
bfc02bcc:	857f0004 	lh	ra,4(t3)
bfc02bd0:	85790006 	lh	t9,6(t3)
bfc02bd4:	85780008 	lh	t8,8(t3)
bfc02bd8:	8577000a 	lh	s7,10(t3)
bfc02bdc:	8576000c 	lh	s6,12(t3)
bfc02be0:	8575000e 	lh	s5,14(t3)
bfc02be4:	25ad0008 	addiu	t5,t5,8
bfc02be8:	01b4982b 	sltu	s3,t5,s4
bfc02bec:	256b0010 	addiu	t3,t3,16
bfc02bf0:	00001012 	mflo	v0
bfc02bf4:	ad820000 	sw	v0,0(t4)
bfc02bf8:	00000000 	nop
bfc02bfc:	022a0018 	mult	s1,t2
bfc02c00:	0000f012 	mflo	s8
bfc02c04:	ad9e0004 	sw	s8,4(t4)
bfc02c08:	00000000 	nop
bfc02c0c:	023f0018 	mult	s1,ra
bfc02c10:	00002012 	mflo	a0
bfc02c14:	ad840008 	sw	a0,8(t4)
bfc02c18:	00000000 	nop
bfc02c1c:	02390018 	mult	s1,t9
bfc02c20:	00001812 	mflo	v1
bfc02c24:	ad83000c 	sw	v1,12(t4)
bfc02c28:	00000000 	nop
bfc02c2c:	02380018 	mult	s1,t8
bfc02c30:	00003012 	mflo	a2
bfc02c34:	ad860010 	sw	a2,16(t4)
bfc02c38:	00000000 	nop
bfc02c3c:	02370018 	mult	s1,s7
bfc02c40:	00002812 	mflo	a1
bfc02c44:	ad850014 	sw	a1,20(t4)
bfc02c48:	00000000 	nop
bfc02c4c:	02360018 	mult	s1,s6
bfc02c50:	00004012 	mflo	t0
bfc02c54:	ad880018 	sw	t0,24(t4)
bfc02c58:	00000000 	nop
bfc02c5c:	02350018 	mult	s1,s5
bfc02c60:	00003812 	mflo	a3
bfc02c64:	ad87001c 	sw	a3,28(t4)
bfc02c68:	1660ffd3 	bnez	s3,bfc02bb8 <matrix_test+0x338>
bfc02c6c:	258c0020 	addiu	t4,t4,32
bfc02c70:	26100001 	addiu	s0,s0,1
bfc02c74:	8fac001c 	lw	t4,28(sp)
bfc02c78:	0214582b 	sltu	t3,s0,s4
bfc02c7c:	01cc7021 	addu	t6,t6,t4
bfc02c80:	1560ff79 	bnez	t3,bfc02a68 <matrix_test+0x1e8>
bfc02c84:	01f27821 	addu	t7,t7,s2
bfc02c88:	8faf0034 	lw	t7,52(sp)
bfc02c8c:	240ef000 	li	t6,-4096
bfc02c90:	8fab0028 	lw	t3,40(sp)
bfc02c94:	01eef025 	or	s8,t7,t6
bfc02c98:	00003021 	move	a2,zero
bfc02c9c:	00001821 	move	v1,zero
bfc02ca0:	00002021 	move	a0,zero
bfc02ca4:	00006021 	move	t4,zero
bfc02ca8:	2687ffff 	addiu	a3,s4,-1
bfc02cac:	30ea0003 	andi	t2,a3,0x3
bfc02cb0:	01604021 	move	t0,t3
bfc02cb4:	1140003f 	beqz	t2,bfc02db4 <matrix_test+0x534>
bfc02cb8:	00004821 	move	t1,zero
bfc02cbc:	8d670000 	lw	a3,0(t3)
bfc02cc0:	3093ffff 	andi	s3,a0,0xffff
bfc02cc4:	0067c82a 	slt	t9,v1,a3
bfc02cc8:	00c73021 	addu	a2,a2,a3
bfc02ccc:	0279b821 	addu	s7,s3,t9
bfc02cd0:	2676000a 	addiu	s6,s3,10
bfc02cd4:	0016ac00 	sll	s5,s6,0x10
bfc02cd8:	0017fc00 	sll	ra,s7,0x10
bfc02cdc:	03c6282a 	slt	a1,s8,a2
bfc02ce0:	00151403 	sra	v0,s5,0x10
bfc02ce4:	10a00002 	beqz	a1,bfc02cf0 <matrix_test+0x470>
bfc02ce8:	001f2403 	sra	a0,ra,0x10
bfc02cec:	00402021 	move	a0,v0
bfc02cf0:	10a00002 	beqz	a1,bfc02cfc <matrix_test+0x47c>
bfc02cf4:	24090001 	li	t1,1
bfc02cf8:	00003021 	move	a2,zero
bfc02cfc:	0134882b 	sltu	s1,t1,s4
bfc02d00:	1220007b 	beqz	s1,bfc02ef0 <matrix_test+0x670>
bfc02d04:	25680004 	addiu	t0,t3,4
bfc02d08:	1149002a 	beq	t2,t1,bfc02db4 <matrix_test+0x534>
bfc02d0c:	00e01821 	move	v1,a3
bfc02d10:	24180002 	li	t8,2
bfc02d14:	11580014 	beq	t2,t8,bfc02d68 <matrix_test+0x4e8>
bfc02d18:	308fffff 	andi	t7,a0,0xffff
bfc02d1c:	8d050000 	lw	a1,0(t0)
bfc02d20:	00000000 	nop
bfc02d24:	00c55021 	addu	t2,a2,a1
bfc02d28:	00e5302a 	slt	a2,a3,a1
bfc02d2c:	01e68021 	addu	s0,t7,a2
bfc02d30:	25e7000a 	addiu	a3,t7,10
bfc02d34:	00071400 	sll	v0,a3,0x10
bfc02d38:	00107400 	sll	t6,s0,0x10
bfc02d3c:	03ca302a 	slt	a2,s8,t2
bfc02d40:	00021403 	sra	v0,v0,0x10
bfc02d44:	10c00002 	beqz	a2,bfc02d50 <matrix_test+0x4d0>
bfc02d48:	000e2403 	sra	a0,t6,0x10
bfc02d4c:	00402021 	move	a0,v0
bfc02d50:	14c00002 	bnez	a2,bfc02d5c <matrix_test+0x4dc>
bfc02d54:	00003021 	move	a2,zero
bfc02d58:	01403021 	move	a2,t2
bfc02d5c:	25290001 	addiu	t1,t1,1
bfc02d60:	25080004 	addiu	t0,t0,4
bfc02d64:	00a01821 	move	v1,a1
bfc02d68:	8d050000 	lw	a1,0(t0)
bfc02d6c:	3097ffff 	andi	s7,a0,0xffff
bfc02d70:	0065182a 	slt	v1,v1,a1
bfc02d74:	00c53821 	addu	a3,a2,a1
bfc02d78:	02e36821 	addu	t5,s7,v1
bfc02d7c:	26ff000a 	addiu	ra,s7,10
bfc02d80:	001f2400 	sll	a0,ra,0x10
bfc02d84:	000d5400 	sll	t2,t5,0x10
bfc02d88:	03c7302a 	slt	a2,s8,a3
bfc02d8c:	00041403 	sra	v0,a0,0x10
bfc02d90:	10c00002 	beqz	a2,bfc02d9c <matrix_test+0x51c>
bfc02d94:	000a2403 	sra	a0,t2,0x10
bfc02d98:	00402021 	move	a0,v0
bfc02d9c:	14c00002 	bnez	a2,bfc02da8 <matrix_test+0x528>
bfc02da0:	00003021 	move	a2,zero
bfc02da4:	00e03021 	move	a2,a3
bfc02da8:	25290001 	addiu	t1,t1,1
bfc02dac:	25080004 	addiu	t0,t0,4
bfc02db0:	00a01821 	move	v1,a1
bfc02db4:	8d070000 	lw	a3,0(t0)
bfc02db8:	3082ffff 	andi	v0,a0,0xffff
bfc02dbc:	0067502a 	slt	t2,v1,a3
bfc02dc0:	004a1821 	addu	v1,v0,t2
bfc02dc4:	245f000a 	addiu	ra,v0,10
bfc02dc8:	00c73021 	addu	a2,a2,a3
bfc02dcc:	001fcc00 	sll	t9,ra,0x10
bfc02dd0:	00032400 	sll	a0,v1,0x10
bfc02dd4:	03c6282a 	slt	a1,s8,a2
bfc02dd8:	00191403 	sra	v0,t9,0x10
bfc02ddc:	10a00002 	beqz	a1,bfc02de8 <matrix_test+0x568>
bfc02de0:	00042403 	sra	a0,a0,0x10
bfc02de4:	00402021 	move	a0,v0
bfc02de8:	10a00002 	beqz	a1,bfc02df4 <matrix_test+0x574>
bfc02dec:	00000000 	nop
bfc02df0:	00003021 	move	a2,zero
bfc02df4:	25290001 	addiu	t1,t1,1
bfc02df8:	0134982b 	sltu	s3,t1,s4
bfc02dfc:	1260003c 	beqz	s3,bfc02ef0 <matrix_test+0x670>
bfc02e00:	250a0004 	addiu	t2,t0,4
bfc02e04:	8d050004 	lw	a1,4(t0)
bfc02e08:	3098ffff 	andi	t8,a0,0xffff
bfc02e0c:	00c54021 	addu	t0,a2,a1
bfc02e10:	00e5302a 	slt	a2,a3,a1
bfc02e14:	03066821 	addu	t5,t8,a2
bfc02e18:	2717000a 	addiu	s7,t8,10
bfc02e1c:	0017b400 	sll	s6,s7,0x10
bfc02e20:	000d8400 	sll	s0,t5,0x10
bfc02e24:	03c8302a 	slt	a2,s8,t0
bfc02e28:	00162403 	sra	a0,s6,0x10
bfc02e2c:	10c00002 	beqz	a2,bfc02e38 <matrix_test+0x5b8>
bfc02e30:	00101403 	sra	v0,s0,0x10
bfc02e34:	00801021 	move	v0,a0
bfc02e38:	14c00002 	bnez	a2,bfc02e44 <matrix_test+0x5c4>
bfc02e3c:	00003821 	move	a3,zero
bfc02e40:	01003821 	move	a3,t0
bfc02e44:	8d460004 	lw	a2,4(t2)
bfc02e48:	3059ffff 	andi	t9,v0,0xffff
bfc02e4c:	00a6882a 	slt	s1,a1,a2
bfc02e50:	00e63821 	addu	a3,a3,a2
bfc02e54:	0331a821 	addu	s5,t9,s1
bfc02e58:	2733000a 	addiu	s3,t9,10
bfc02e5c:	0013b400 	sll	s6,s3,0x10
bfc02e60:	00154400 	sll	t0,s5,0x10
bfc02e64:	03c7282a 	slt	a1,s8,a3
bfc02e68:	00162403 	sra	a0,s6,0x10
bfc02e6c:	10a00002 	beqz	a1,bfc02e78 <matrix_test+0x5f8>
bfc02e70:	00081403 	sra	v0,t0,0x10
bfc02e74:	00801021 	move	v0,a0
bfc02e78:	10a00002 	beqz	a1,bfc02e84 <matrix_test+0x604>
bfc02e7c:	00000000 	nop
bfc02e80:	00003821 	move	a3,zero
bfc02e84:	8d450008 	lw	a1,8(t2)
bfc02e88:	304fffff 	andi	t7,v0,0xffff
bfc02e8c:	00c5682a 	slt	t5,a2,a1
bfc02e90:	25e2000a 	addiu	v0,t7,10
bfc02e94:	00e53821 	addu	a3,a3,a1
bfc02e98:	01ed7021 	addu	t6,t7,t5
bfc02e9c:	00028400 	sll	s0,v0,0x10
bfc02ea0:	000ec400 	sll	t8,t6,0x10
bfc02ea4:	03c7302a 	slt	a2,s8,a3
bfc02ea8:	00101403 	sra	v0,s0,0x10
bfc02eac:	10c00002 	beqz	a2,bfc02eb8 <matrix_test+0x638>
bfc02eb0:	00182403 	sra	a0,t8,0x10
bfc02eb4:	00402021 	move	a0,v0
bfc02eb8:	14c00009 	bnez	a2,bfc02ee0 <matrix_test+0x660>
bfc02ebc:	00000000 	nop
bfc02ec0:	00e03021 	move	a2,a3
bfc02ec4:	25290003 	addiu	t1,t1,3
bfc02ec8:	2548000c 	addiu	t0,t2,12
bfc02ecc:	0bf00b6d 	j	bfc02db4 <matrix_test+0x534>
bfc02ed0:	00a01821 	move	v1,a1
	...
bfc02ee0:	0bf00bb1 	j	bfc02ec4 <matrix_test+0x644>
bfc02ee4:	00003021 	move	a2,zero
	...
bfc02ef0:	258c0001 	addiu	t4,t4,1
bfc02ef4:	8fa8001c 	lw	t0,28(sp)
bfc02ef8:	0194482b 	sltu	t1,t4,s4
bfc02efc:	11200003 	beqz	t1,bfc02f0c <matrix_test+0x68c>
bfc02f00:	01685821 	addu	t3,t3,t0
bfc02f04:	0bf00b2a 	j	bfc02ca8 <matrix_test+0x428>
bfc02f08:	00e01821 	move	v1,a3
bfc02f0c:	0ff017d8 	jal	bfc05f60 <crc16>
bfc02f10:	00002821 	move	a1,zero
bfc02f14:	8fb60028 	lw	s6,40(sp)
bfc02f18:	8fb5002c 	lw	s5,44(sp)
bfc02f1c:	0040f821 	move	ra,v0
bfc02f20:	0000b821 	move	s7,zero
bfc02f24:	8faf0030 	lw	t7,48(sp)
bfc02f28:	86a50000 	lh	a1,0(s5)
bfc02f2c:	85ee0000 	lh	t6,0(t7)
bfc02f30:	24130001 	li	s3,1
bfc02f34:	01c50018 	mult	t6,a1
bfc02f38:	8fac0030 	lw	t4,48(sp)
bfc02f3c:	2691ffff 	addiu	s1,s4,-1
bfc02f40:	0274582b 	sltu	t3,s3,s4
bfc02f44:	32230007 	andi	v1,s1,0x7
bfc02f48:	25980002 	addiu	t8,t4,2
bfc02f4c:	0000c812 	mflo	t9
bfc02f50:	1160007f 	beqz	t3,bfc03150 <matrix_test+0x8d0>
bfc02f54:	26b10002 	addiu	s1,s5,2
bfc02f58:	10600048 	beqz	v1,bfc0307c <matrix_test+0x7fc>
bfc02f5c:	00000000 	nop
bfc02f60:	1073003c 	beq	v1,s3,bfc03054 <matrix_test+0x7d4>
bfc02f64:	240b0002 	li	t3,2
bfc02f68:	106b0032 	beq	v1,t3,bfc03034 <matrix_test+0x7b4>
bfc02f6c:	24090003 	li	t1,3
bfc02f70:	10690028 	beq	v1,t1,bfc03014 <matrix_test+0x794>
bfc02f74:	24050004 	li	a1,4
bfc02f78:	1065001e 	beq	v1,a1,bfc02ff4 <matrix_test+0x774>
bfc02f7c:	240c0005 	li	t4,5
bfc02f80:	106c0014 	beq	v1,t4,bfc02fd4 <matrix_test+0x754>
bfc02f84:	24070006 	li	a3,6
bfc02f88:	1067000a 	beq	v1,a3,bfc02fb4 <matrix_test+0x734>
bfc02f8c:	00000000 	nop
bfc02f90:	8faa0030 	lw	t2,48(sp)
bfc02f94:	86380000 	lh	t8,0(s1)
bfc02f98:	85480002 	lh	t0,2(t2)
bfc02f9c:	24130002 	li	s3,2
bfc02fa0:	01180018 	mult	t0,t8
bfc02fa4:	26b10004 	addiu	s1,s5,4
bfc02fa8:	25580004 	addiu	t8,t2,4
bfc02fac:	00003012 	mflo	a2
bfc02fb0:	0326c821 	addu	t9,t9,a2
bfc02fb4:	870d0000 	lh	t5,0(t8)
bfc02fb8:	86240000 	lh	a0,0(s1)
bfc02fbc:	26730001 	addiu	s3,s3,1
bfc02fc0:	01a40018 	mult	t5,a0
bfc02fc4:	26310002 	addiu	s1,s1,2
bfc02fc8:	27180002 	addiu	t8,t8,2
bfc02fcc:	00007812 	mflo	t7
bfc02fd0:	032fc821 	addu	t9,t9,t7
bfc02fd4:	87020000 	lh	v0,0(t8)
bfc02fd8:	862e0000 	lh	t6,0(s1)
bfc02fdc:	26730001 	addiu	s3,s3,1
bfc02fe0:	004e0018 	mult	v0,t6
bfc02fe4:	26310002 	addiu	s1,s1,2
bfc02fe8:	27180002 	addiu	t8,t8,2
bfc02fec:	00001812 	mflo	v1
bfc02ff0:	0323c821 	addu	t9,t9,v1
bfc02ff4:	870b0000 	lh	t3,0(t8)
bfc02ff8:	86290000 	lh	t1,0(s1)
bfc02ffc:	26730001 	addiu	s3,s3,1
bfc03000:	01690018 	mult	t3,t1
bfc03004:	26310002 	addiu	s1,s1,2
bfc03008:	27180002 	addiu	t8,t8,2
bfc0300c:	00008012 	mflo	s0
bfc03010:	0330c821 	addu	t9,t9,s0
bfc03014:	870c0000 	lh	t4,0(t8)
bfc03018:	86270000 	lh	a3,0(s1)
bfc0301c:	26730001 	addiu	s3,s3,1
bfc03020:	01870018 	mult	t4,a3
bfc03024:	26310002 	addiu	s1,s1,2
bfc03028:	27180002 	addiu	t8,t8,2
bfc0302c:	00002812 	mflo	a1
bfc03030:	0325c821 	addu	t9,t9,a1
bfc03034:	870a0000 	lh	t2,0(t8)
bfc03038:	86280000 	lh	t0,0(s1)
bfc0303c:	26730001 	addiu	s3,s3,1
bfc03040:	01480018 	mult	t2,t0
bfc03044:	26310002 	addiu	s1,s1,2
bfc03048:	27180002 	addiu	t8,t8,2
bfc0304c:	00003012 	mflo	a2
bfc03050:	0326c821 	addu	t9,t9,a2
bfc03054:	87040000 	lh	a0,0(t8)
bfc03058:	86230000 	lh	v1,0(s1)
bfc0305c:	26730001 	addiu	s3,s3,1
bfc03060:	00830018 	mult	a0,v1
bfc03064:	0274782b 	sltu	t7,s3,s4
bfc03068:	26310002 	addiu	s1,s1,2
bfc0306c:	27180002 	addiu	t8,t8,2
bfc03070:	00006812 	mflo	t5
bfc03074:	11e00036 	beqz	t7,bfc03150 <matrix_test+0x8d0>
bfc03078:	032dc821 	addu	t9,t9,t5
bfc0307c:	87080000 	lh	t0,0(t8)
bfc03080:	86230000 	lh	v1,0(s1)
bfc03084:	87100002 	lh	s0,2(t8)
bfc03088:	01030018 	mult	t0,v1
bfc0308c:	862a0002 	lh	t2,2(s1)
bfc03090:	87040004 	lh	a0,4(t8)
bfc03094:	862b0004 	lh	t3,4(s1)
bfc03098:	87050006 	lh	a1,6(t8)
bfc0309c:	862c0006 	lh	t4,6(s1)
bfc030a0:	87060008 	lh	a2,8(t8)
bfc030a4:	862d0008 	lh	t5,8(s1)
bfc030a8:	8707000a 	lh	a3,10(t8)
bfc030ac:	862e000a 	lh	t6,10(s1)
bfc030b0:	8708000c 	lh	t0,12(t8)
bfc030b4:	862f000c 	lh	t7,12(s1)
bfc030b8:	8703000e 	lh	v1,14(t8)
bfc030bc:	00001012 	mflo	v0
bfc030c0:	26730008 	addiu	s3,s3,8
bfc030c4:	03221021 	addu	v0,t9,v0
bfc030c8:	27180010 	addiu	t8,t8,16
bfc030cc:	020a0018 	mult	s0,t2
bfc030d0:	8630000e 	lh	s0,14(s1)
bfc030d4:	0274502b 	sltu	t2,s3,s4
bfc030d8:	26310010 	addiu	s1,s1,16
bfc030dc:	00004812 	mflo	t1
bfc030e0:	0049c821 	addu	t9,v0,t1
bfc030e4:	00000000 	nop
bfc030e8:	008b0018 	mult	a0,t3
bfc030ec:	00002012 	mflo	a0
	...
bfc030f8:	00ac0018 	mult	a1,t4
bfc030fc:	03246021 	addu	t4,t9,a0
bfc03100:	00002812 	mflo	a1
bfc03104:	01851021 	addu	v0,t4,a1
bfc03108:	00000000 	nop
bfc0310c:	00cd0018 	mult	a2,t5
bfc03110:	00005812 	mflo	t3
bfc03114:	004bc821 	addu	t9,v0,t3
bfc03118:	00000000 	nop
bfc0311c:	00ee0018 	mult	a3,t6
bfc03120:	00004812 	mflo	t1
bfc03124:	03293021 	addu	a2,t9,t1
bfc03128:	00000000 	nop
bfc0312c:	010f0018 	mult	t0,t7
bfc03130:	00002012 	mflo	a0
	...
bfc0313c:	00700018 	mult	v1,s0
bfc03140:	00c48021 	addu	s0,a2,a0
bfc03144:	00006812 	mflo	t5
bfc03148:	1540ffcc 	bnez	t2,bfc0307c <matrix_test+0x7fc>
bfc0314c:	020dc821 	addu	t9,s0,t5
bfc03150:	26f70001 	addiu	s7,s7,1
bfc03154:	02f4c02b 	sltu	t8,s7,s4
bfc03158:	aed90000 	sw	t9,0(s6)
bfc0315c:	02b2a821 	addu	s5,s5,s2
bfc03160:	1700ff70 	bnez	t8,bfc02f24 <matrix_test+0x6a4>
bfc03164:	26d60004 	addiu	s6,s6,4
bfc03168:	8fab0028 	lw	t3,40(sp)
bfc0316c:	00003021 	move	a2,zero
bfc03170:	00001821 	move	v1,zero
bfc03174:	00002021 	move	a0,zero
bfc03178:	00006021 	move	t4,zero
bfc0317c:	2687ffff 	addiu	a3,s4,-1
bfc03180:	30ea0003 	andi	t2,a3,0x3
bfc03184:	01604021 	move	t0,t3
bfc03188:	1140003f 	beqz	t2,bfc03288 <matrix_test+0xa08>
bfc0318c:	00004821 	move	t1,zero
bfc03190:	8d670000 	lw	a3,0(t3)
bfc03194:	3099ffff 	andi	t9,a0,0xffff
bfc03198:	0067c02a 	slt	t8,v1,a3
bfc0319c:	00c73021 	addu	a2,a2,a3
bfc031a0:	0338a821 	addu	s5,t9,t8
bfc031a4:	2733000a 	addiu	s3,t9,10
bfc031a8:	0013b400 	sll	s6,s3,0x10
bfc031ac:	0015bc00 	sll	s7,s5,0x10
bfc031b0:	03c6282a 	slt	a1,s8,a2
bfc031b4:	00161403 	sra	v0,s6,0x10
bfc031b8:	10a00002 	beqz	a1,bfc031c4 <matrix_test+0x944>
bfc031bc:	00172403 	sra	a0,s7,0x10
bfc031c0:	00402021 	move	a0,v0
bfc031c4:	10a00002 	beqz	a1,bfc031d0 <matrix_test+0x950>
bfc031c8:	24090001 	li	t1,1
bfc031cc:	00003021 	move	a2,zero
bfc031d0:	0134782b 	sltu	t7,t1,s4
bfc031d4:	11e0007a 	beqz	t7,bfc033c0 <matrix_test+0xb40>
bfc031d8:	25680004 	addiu	t0,t3,4
bfc031dc:	1149002a 	beq	t2,t1,bfc03288 <matrix_test+0xa08>
bfc031e0:	00e01821 	move	v1,a3
bfc031e4:	240d0002 	li	t5,2
bfc031e8:	114d0014 	beq	t2,t5,bfc0323c <matrix_test+0x9bc>
bfc031ec:	308effff 	andi	t6,a0,0xffff
bfc031f0:	8d050000 	lw	a1,0(t0)
bfc031f4:	00000000 	nop
bfc031f8:	00c55021 	addu	t2,a2,a1
bfc031fc:	00e5302a 	slt	a2,a3,a1
bfc03200:	01c61821 	addu	v1,t6,a2
bfc03204:	25c2000a 	addiu	v0,t6,10
bfc03208:	00022400 	sll	a0,v0,0x10
bfc0320c:	00033c00 	sll	a3,v1,0x10
bfc03210:	03ca302a 	slt	a2,s8,t2
bfc03214:	00041403 	sra	v0,a0,0x10
bfc03218:	10c00002 	beqz	a2,bfc03224 <matrix_test+0x9a4>
bfc0321c:	00072403 	sra	a0,a3,0x10
bfc03220:	00402021 	move	a0,v0
bfc03224:	14c00002 	bnez	a2,bfc03230 <matrix_test+0x9b0>
bfc03228:	00003021 	move	a2,zero
bfc0322c:	01403021 	move	a2,t2
bfc03230:	25290001 	addiu	t1,t1,1
bfc03234:	25080004 	addiu	t0,t0,4
bfc03238:	00a01821 	move	v1,a1
bfc0323c:	8d050000 	lw	a1,0(t0)
bfc03240:	3095ffff 	andi	s5,a0,0xffff
bfc03244:	0065b02a 	slt	s6,v1,a1
bfc03248:	00c53821 	addu	a3,a2,a1
bfc0324c:	02b68021 	addu	s0,s5,s6
bfc03250:	26b7000a 	addiu	s7,s5,10
bfc03254:	00178c00 	sll	s1,s7,0x10
bfc03258:	00105400 	sll	t2,s0,0x10
bfc0325c:	03c7302a 	slt	a2,s8,a3
bfc03260:	00111403 	sra	v0,s1,0x10
bfc03264:	10c00002 	beqz	a2,bfc03270 <matrix_test+0x9f0>
bfc03268:	000a2403 	sra	a0,t2,0x10
bfc0326c:	00402021 	move	a0,v0
bfc03270:	14c00002 	bnez	a2,bfc0327c <matrix_test+0x9fc>
bfc03274:	00003021 	move	a2,zero
bfc03278:	00e03021 	move	a2,a3
bfc0327c:	25290001 	addiu	t1,t1,1
bfc03280:	25080004 	addiu	t0,t0,4
bfc03284:	00a01821 	move	v1,a1
bfc03288:	8d070000 	lw	a3,0(t0)
bfc0328c:	3085ffff 	andi	a1,a0,0xffff
bfc03290:	0067102a 	slt	v0,v1,a3
bfc03294:	00a26821 	addu	t5,a1,v0
bfc03298:	24a4000a 	addiu	a0,a1,10
bfc0329c:	00c73021 	addu	a2,a2,a3
bfc032a0:	0004cc00 	sll	t9,a0,0x10
bfc032a4:	000d7400 	sll	t6,t5,0x10
bfc032a8:	03c6282a 	slt	a1,s8,a2
bfc032ac:	00191403 	sra	v0,t9,0x10
bfc032b0:	10a00002 	beqz	a1,bfc032bc <matrix_test+0xa3c>
bfc032b4:	000e2403 	sra	a0,t6,0x10
bfc032b8:	00402021 	move	a0,v0
bfc032bc:	10a00002 	beqz	a1,bfc032c8 <matrix_test+0xa48>
bfc032c0:	00000000 	nop
bfc032c4:	00003021 	move	a2,zero
bfc032c8:	25290001 	addiu	t1,t1,1
bfc032cc:	0134802b 	sltu	s0,t1,s4
bfc032d0:	1200003b 	beqz	s0,bfc033c0 <matrix_test+0xb40>
bfc032d4:	250a0004 	addiu	t2,t0,4
bfc032d8:	8d050004 	lw	a1,4(t0)
bfc032dc:	3091ffff 	andi	s1,a0,0xffff
bfc032e0:	00e5782a 	slt	t7,a3,a1
bfc032e4:	00c54021 	addu	t0,a2,a1
bfc032e8:	022fb021 	addu	s6,s1,t7
bfc032ec:	2633000a 	addiu	s3,s1,10
bfc032f0:	0013bc00 	sll	s7,s3,0x10
bfc032f4:	0016ac00 	sll	s5,s6,0x10
bfc032f8:	03c8302a 	slt	a2,s8,t0
bfc032fc:	00172403 	sra	a0,s7,0x10
bfc03300:	10c00002 	beqz	a2,bfc0330c <matrix_test+0xa8c>
bfc03304:	00151403 	sra	v0,s5,0x10
bfc03308:	00801021 	move	v0,a0
bfc0330c:	14c00002 	bnez	a2,bfc03318 <matrix_test+0xa98>
bfc03310:	00003821 	move	a3,zero
bfc03314:	01003821 	move	a3,t0
bfc03318:	8d460004 	lw	a2,4(t2)
bfc0331c:	304fffff 	andi	t7,v0,0xffff
bfc03320:	00a6682a 	slt	t5,a1,a2
bfc03324:	00e63821 	addu	a3,a3,a2
bfc03328:	01ed9821 	addu	s3,t7,t5
bfc0332c:	25f8000a 	addiu	t8,t7,10
bfc03330:	0018cc00 	sll	t9,t8,0x10
bfc03334:	00134400 	sll	t0,s3,0x10
bfc03338:	03c7282a 	slt	a1,s8,a3
bfc0333c:	00192403 	sra	a0,t9,0x10
bfc03340:	10a00002 	beqz	a1,bfc0334c <matrix_test+0xacc>
bfc03344:	00081403 	sra	v0,t0,0x10
bfc03348:	00801021 	move	v0,a0
bfc0334c:	10a00002 	beqz	a1,bfc03358 <matrix_test+0xad8>
bfc03350:	00000000 	nop
bfc03354:	00003821 	move	a3,zero
bfc03358:	8d450008 	lw	a1,8(t2)
bfc0335c:	3050ffff 	andi	s0,v0,0xffff
bfc03360:	00c5882a 	slt	s1,a2,a1
bfc03364:	00e53821 	addu	a3,a3,a1
bfc03368:	02111821 	addu	v1,s0,s1
bfc0336c:	260e000a 	addiu	t6,s0,10
bfc03370:	000e1400 	sll	v0,t6,0x10
bfc03374:	00032400 	sll	a0,v1,0x10
bfc03378:	03c7302a 	slt	a2,s8,a3
bfc0337c:	00021403 	sra	v0,v0,0x10
bfc03380:	10c00002 	beqz	a2,bfc0338c <matrix_test+0xb0c>
bfc03384:	00042403 	sra	a0,a0,0x10
bfc03388:	00402021 	move	a0,v0
bfc0338c:	14c00008 	bnez	a2,bfc033b0 <matrix_test+0xb30>
bfc03390:	00000000 	nop
bfc03394:	00e03021 	move	a2,a3
bfc03398:	25290003 	addiu	t1,t1,3
bfc0339c:	2548000c 	addiu	t0,t2,12
bfc033a0:	0bf00ca2 	j	bfc03288 <matrix_test+0xa08>
bfc033a4:	00a01821 	move	v1,a1
	...
bfc033b0:	0bf00ce6 	j	bfc03398 <matrix_test+0xb18>
bfc033b4:	00003021 	move	a2,zero
	...
bfc033c0:	258c0001 	addiu	t4,t4,1
bfc033c4:	8faa001c 	lw	t2,28(sp)
bfc033c8:	0194482b 	sltu	t1,t4,s4
bfc033cc:	11200003 	beqz	t1,bfc033dc <matrix_test+0xb5c>
bfc033d0:	016a5821 	addu	t3,t3,t2
bfc033d4:	0bf00c5f 	j	bfc0317c <matrix_test+0x8fc>
bfc033d8:	00e01821 	move	v1,a3
bfc033dc:	03e02821 	move	a1,ra
bfc033e0:	0ff017d8 	jal	bfc05f60 <crc16>
bfc033e4:	00000000 	nop
bfc033e8:	8fa60028 	lw	a2,40(sp)
bfc033ec:	8fb7002c 	lw	s7,44(sp)
bfc033f0:	afa20018 	sw	v0,24(sp)
bfc033f4:	afa60010 	sw	a2,16(sp)
bfc033f8:	afa00024 	sw	zero,36(sp)
bfc033fc:	8fb60010 	lw	s6,16(sp)
bfc03400:	8fb30030 	lw	s3,48(sp)
bfc03404:	0000a821 	move	s5,zero
bfc03408:	86ff0000 	lh	ra,0(s7)
bfc0340c:	86680000 	lh	t0,0(s3)
bfc03410:	24190001 	li	t9,1
bfc03414:	011f0018 	mult	t0,ra
bfc03418:	268bffff 	addiu	t3,s4,-1
bfc0341c:	0334602b 	sltu	t4,t9,s4
bfc03420:	31630007 	andi	v1,t3,0x7
bfc03424:	26f80002 	addiu	t8,s7,2
bfc03428:	0000f812 	mflo	ra
bfc0342c:	11800084 	beqz	t4,bfc03640 <matrix_test+0xdc0>
bfc03430:	02725021 	addu	t2,s3,s2
bfc03434:	10600047 	beqz	v1,bfc03554 <matrix_test+0xcd4>
bfc03438:	00000000 	nop
bfc0343c:	1079003b 	beq	v1,t9,bfc0352c <matrix_test+0xcac>
bfc03440:	240b0002 	li	t3,2
bfc03444:	106b0031 	beq	v1,t3,bfc0350c <matrix_test+0xc8c>
bfc03448:	24090003 	li	t1,3
bfc0344c:	10690027 	beq	v1,t1,bfc034ec <matrix_test+0xc6c>
bfc03450:	24050004 	li	a1,4
bfc03454:	1065001d 	beq	v1,a1,bfc034cc <matrix_test+0xc4c>
bfc03458:	240c0005 	li	t4,5
bfc0345c:	106c0013 	beq	v1,t4,bfc034ac <matrix_test+0xc2c>
bfc03460:	24070006 	li	a3,6
bfc03464:	10670009 	beq	v1,a3,bfc0348c <matrix_test+0xc0c>
bfc03468:	00000000 	nop
bfc0346c:	87020000 	lh	v0,0(t8)
bfc03470:	85440000 	lh	a0,0(t2)
bfc03474:	24190002 	li	t9,2
bfc03478:	00820018 	mult	a0,v0
bfc0347c:	01525021 	addu	t2,t2,s2
bfc03480:	26f80004 	addiu	t8,s7,4
bfc03484:	00003012 	mflo	a2
bfc03488:	03e6f821 	addu	ra,ra,a2
bfc0348c:	854e0000 	lh	t6,0(t2)
bfc03490:	87100000 	lh	s0,0(t8)
bfc03494:	27390001 	addiu	t9,t9,1
bfc03498:	01d00018 	mult	t6,s0
bfc0349c:	27180002 	addiu	t8,t8,2
bfc034a0:	01525021 	addu	t2,t2,s2
bfc034a4:	00004012 	mflo	t0
bfc034a8:	03e8f821 	addu	ra,ra,t0
bfc034ac:	854f0000 	lh	t7,0(t2)
bfc034b0:	870d0000 	lh	t5,0(t8)
bfc034b4:	27390001 	addiu	t9,t9,1
bfc034b8:	01ed0018 	mult	t7,t5
bfc034bc:	27180002 	addiu	t8,t8,2
bfc034c0:	01525021 	addu	t2,t2,s2
bfc034c4:	00008812 	mflo	s1
bfc034c8:	03f1f821 	addu	ra,ra,s1
bfc034cc:	854b0000 	lh	t3,0(t2)
bfc034d0:	87090000 	lh	t1,0(t8)
bfc034d4:	27390001 	addiu	t9,t9,1
bfc034d8:	01690018 	mult	t3,t1
bfc034dc:	27180002 	addiu	t8,t8,2
bfc034e0:	01525021 	addu	t2,t2,s2
bfc034e4:	00001812 	mflo	v1
bfc034e8:	03e3f821 	addu	ra,ra,v1
bfc034ec:	854c0000 	lh	t4,0(t2)
bfc034f0:	87070000 	lh	a3,0(t8)
bfc034f4:	27390001 	addiu	t9,t9,1
bfc034f8:	01870018 	mult	t4,a3
bfc034fc:	27180002 	addiu	t8,t8,2
bfc03500:	01525021 	addu	t2,t2,s2
bfc03504:	00002812 	mflo	a1
bfc03508:	03e5f821 	addu	ra,ra,a1
bfc0350c:	85440000 	lh	a0,0(t2)
bfc03510:	87020000 	lh	v0,0(t8)
bfc03514:	27390001 	addiu	t9,t9,1
bfc03518:	00820018 	mult	a0,v0
bfc0351c:	27180002 	addiu	t8,t8,2
bfc03520:	01525021 	addu	t2,t2,s2
bfc03524:	00003012 	mflo	a2
bfc03528:	03e6f821 	addu	ra,ra,a2
bfc0352c:	85500000 	lh	s0,0(t2)
bfc03530:	87110000 	lh	s1,0(t8)
bfc03534:	27390001 	addiu	t9,t9,1
bfc03538:	02110018 	mult	s0,s1
bfc0353c:	0334402b 	sltu	t0,t9,s4
bfc03540:	27180002 	addiu	t8,t8,2
bfc03544:	01525021 	addu	t2,t2,s2
bfc03548:	00007012 	mflo	t6
bfc0354c:	1100003c 	beqz	t0,bfc03640 <matrix_test+0xdc0>
bfc03550:	03eef821 	addu	ra,ra,t6
bfc03554:	854f0000 	lh	t7,0(t2)
bfc03558:	87080000 	lh	t0,0(t8)
bfc0355c:	01523821 	addu	a3,t2,s2
bfc03560:	01e80018 	mult	t7,t0
bfc03564:	870d0002 	lh	t5,2(t8)
bfc03568:	84ec0000 	lh	t4,0(a3)
bfc0356c:	00f27021 	addu	t6,a3,s2
bfc03570:	87110004 	lh	s1,4(t8)
bfc03574:	85c90000 	lh	t1,0(t6)
bfc03578:	01d23021 	addu	a2,t6,s2
bfc0357c:	87100006 	lh	s0,6(t8)
bfc03580:	84c80000 	lh	t0,0(a2)
bfc03584:	00d22021 	addu	a0,a2,s2
bfc03588:	870f0008 	lh	t7,8(t8)
bfc0358c:	84870000 	lh	a3,0(a0)
bfc03590:	00922821 	addu	a1,a0,s2
bfc03594:	00001012 	mflo	v0
bfc03598:	870e000a 	lh	t6,10(t8)
bfc0359c:	03e21021 	addu	v0,ra,v0
bfc035a0:	84a60000 	lh	a2,0(a1)
bfc035a4:	018d0018 	mult	t4,t5
bfc035a8:	00b21821 	addu	v1,a1,s2
bfc035ac:	870c000c 	lh	t4,12(t8)
bfc035b0:	84640000 	lh	a0,0(v1)
bfc035b4:	00725021 	addu	t2,v1,s2
bfc035b8:	85430000 	lh	v1,0(t2)
bfc035bc:	870d000e 	lh	t5,14(t8)
bfc035c0:	27390008 	addiu	t9,t9,8
bfc035c4:	0334282b 	sltu	a1,t9,s4
bfc035c8:	27180010 	addiu	t8,t8,16
bfc035cc:	01525021 	addu	t2,t2,s2
bfc035d0:	00005812 	mflo	t3
	...
bfc035dc:	01310018 	mult	t1,s1
bfc035e0:	004b8821 	addu	s1,v0,t3
bfc035e4:	00004812 	mflo	t1
bfc035e8:	02295821 	addu	t3,s1,t1
bfc035ec:	00000000 	nop
bfc035f0:	01100018 	mult	t0,s0
bfc035f4:	0000f812 	mflo	ra
bfc035f8:	017f4821 	addu	t1,t3,ra
bfc035fc:	00000000 	nop
bfc03600:	00ef0018 	mult	a3,t7
bfc03604:	00003812 	mflo	a3
bfc03608:	01271021 	addu	v0,t1,a3
bfc0360c:	00000000 	nop
bfc03610:	00ce0018 	mult	a2,t6
bfc03614:	00008012 	mflo	s0
bfc03618:	00507821 	addu	t7,v0,s0
bfc0361c:	00000000 	nop
bfc03620:	008c0018 	mult	a0,t4
bfc03624:	00007012 	mflo	t6
bfc03628:	01ee8821 	addu	s1,t7,t6
bfc0362c:	00000000 	nop
bfc03630:	006d0018 	mult	v1,t5
bfc03634:	00001812 	mflo	v1
bfc03638:	14a0ffc6 	bnez	a1,bfc03554 <matrix_test+0xcd4>
bfc0363c:	0223f821 	addu	ra,s1,v1
bfc03640:	26b50001 	addiu	s5,s5,1
bfc03644:	02b4c02b 	sltu	t8,s5,s4
bfc03648:	aedf0000 	sw	ra,0(s6)
bfc0364c:	26730002 	addiu	s3,s3,2
bfc03650:	1700ff6d 	bnez	t8,bfc03408 <matrix_test+0xb88>
bfc03654:	26d60004 	addiu	s6,s6,4
bfc03658:	8fb00024 	lw	s0,36(sp)
bfc0365c:	8fb30010 	lw	s3,16(sp)
bfc03660:	8fb9001c 	lw	t9,28(sp)
bfc03664:	261f0001 	addiu	ra,s0,1
bfc03668:	0279b021 	addu	s6,s3,t9
bfc0366c:	03f4a82b 	sltu	s5,ra,s4
bfc03670:	afbf0024 	sw	ra,36(sp)
bfc03674:	02f2b821 	addu	s7,s7,s2
bfc03678:	16a0ff60 	bnez	s5,bfc033fc <matrix_test+0xb7c>
bfc0367c:	afb60010 	sw	s6,16(sp)
bfc03680:	8fab0028 	lw	t3,40(sp)
bfc03684:	00003021 	move	a2,zero
bfc03688:	00001821 	move	v1,zero
bfc0368c:	00002021 	move	a0,zero
bfc03690:	00006021 	move	t4,zero
bfc03694:	2687ffff 	addiu	a3,s4,-1
bfc03698:	30ea0003 	andi	t2,a3,0x3
bfc0369c:	01604021 	move	t0,t3
bfc036a0:	1140003f 	beqz	t2,bfc037a0 <matrix_test+0xf20>
bfc036a4:	00004821 	move	t1,zero
bfc036a8:	8d670000 	lw	a3,0(t3)
bfc036ac:	3090ffff 	andi	s0,a0,0xffff
bfc036b0:	0067982a 	slt	s3,v1,a3
bfc036b4:	00c73021 	addu	a2,a2,a3
bfc036b8:	0213a821 	addu	s5,s0,s3
bfc036bc:	2616000a 	addiu	s6,s0,10
bfc036c0:	00167400 	sll	t6,s6,0x10
bfc036c4:	0015bc00 	sll	s7,s5,0x10
bfc036c8:	03c6282a 	slt	a1,s8,a2
bfc036cc:	000e1403 	sra	v0,t6,0x10
bfc036d0:	10a00002 	beqz	a1,bfc036dc <matrix_test+0xe5c>
bfc036d4:	00172403 	sra	a0,s7,0x10
bfc036d8:	00402021 	move	a0,v0
bfc036dc:	10a00002 	beqz	a1,bfc036e8 <matrix_test+0xe68>
bfc036e0:	24090001 	li	t1,1
bfc036e4:	00003021 	move	a2,zero
bfc036e8:	0134c82b 	sltu	t9,t1,s4
bfc036ec:	13200078 	beqz	t9,bfc038d0 <matrix_test+0x1050>
bfc036f0:	25680004 	addiu	t0,t3,4
bfc036f4:	1149002a 	beq	t2,t1,bfc037a0 <matrix_test+0xf20>
bfc036f8:	00e01821 	move	v1,a3
bfc036fc:	24110002 	li	s1,2
bfc03700:	11510014 	beq	t2,s1,bfc03754 <matrix_test+0xed4>
bfc03704:	309fffff 	andi	ra,a0,0xffff
bfc03708:	8d050000 	lw	a1,0(t0)
bfc0370c:	00000000 	nop
bfc03710:	00c55021 	addu	t2,a2,a1
bfc03714:	00e5302a 	slt	a2,a3,a1
bfc03718:	03e67821 	addu	t7,ra,a2
bfc0371c:	27e7000a 	addiu	a3,ra,10
bfc03720:	00076c00 	sll	t5,a3,0x10
bfc03724:	000fc400 	sll	t8,t7,0x10
bfc03728:	03ca302a 	slt	a2,s8,t2
bfc0372c:	000d1403 	sra	v0,t5,0x10
bfc03730:	10c00002 	beqz	a2,bfc0373c <matrix_test+0xebc>
bfc03734:	00182403 	sra	a0,t8,0x10
bfc03738:	00402021 	move	a0,v0
bfc0373c:	14c00002 	bnez	a2,bfc03748 <matrix_test+0xec8>
bfc03740:	00003021 	move	a2,zero
bfc03744:	01403021 	move	a2,t2
bfc03748:	25290001 	addiu	t1,t1,1
bfc0374c:	25080004 	addiu	t0,t0,4
bfc03750:	00a01821 	move	v1,a1
bfc03754:	8d050000 	lw	a1,0(t0)
bfc03758:	3097ffff 	andi	s7,a0,0xffff
bfc0375c:	0065a82a 	slt	s5,v1,a1
bfc03760:	26e2000a 	addiu	v0,s7,10
bfc03764:	00c53821 	addu	a3,a2,a1
bfc03768:	02f51821 	addu	v1,s7,s5
bfc0376c:	00022400 	sll	a0,v0,0x10
bfc03770:	00035400 	sll	t2,v1,0x10
bfc03774:	03c7302a 	slt	a2,s8,a3
bfc03778:	00041403 	sra	v0,a0,0x10
bfc0377c:	10c00002 	beqz	a2,bfc03788 <matrix_test+0xf08>
bfc03780:	000a2403 	sra	a0,t2,0x10
bfc03784:	00402021 	move	a0,v0
bfc03788:	14c00002 	bnez	a2,bfc03794 <matrix_test+0xf14>
bfc0378c:	00003021 	move	a2,zero
bfc03790:	00e03021 	move	a2,a3
bfc03794:	25290001 	addiu	t1,t1,1
bfc03798:	25080004 	addiu	t0,t0,4
bfc0379c:	00a01821 	move	v1,a1
bfc037a0:	8d070000 	lw	a3,0(t0)
bfc037a4:	3085ffff 	andi	a1,a0,0xffff
bfc037a8:	0067a82a 	slt	s5,v1,a3
bfc037ac:	00b52021 	addu	a0,a1,s5
bfc037b0:	24b8000a 	addiu	t8,a1,10
bfc037b4:	00c73021 	addu	a2,a2,a3
bfc037b8:	00187c00 	sll	t7,t8,0x10
bfc037bc:	00045400 	sll	t2,a0,0x10
bfc037c0:	03c6282a 	slt	a1,s8,a2
bfc037c4:	000f1403 	sra	v0,t7,0x10
bfc037c8:	10a00002 	beqz	a1,bfc037d4 <matrix_test+0xf54>
bfc037cc:	000a2403 	sra	a0,t2,0x10
bfc037d0:	00402021 	move	a0,v0
bfc037d4:	10a00002 	beqz	a1,bfc037e0 <matrix_test+0xf60>
bfc037d8:	00000000 	nop
bfc037dc:	00003021 	move	a2,zero
bfc037e0:	25290001 	addiu	t1,t1,1
bfc037e4:	0134b02b 	sltu	s6,t1,s4
bfc037e8:	12c00039 	beqz	s6,bfc038d0 <matrix_test+0x1050>
bfc037ec:	250a0004 	addiu	t2,t0,4
bfc037f0:	8d050004 	lw	a1,4(t0)
bfc037f4:	308effff 	andi	t6,a0,0xffff
bfc037f8:	00e5182a 	slt	v1,a3,a1
bfc037fc:	25c2000a 	addiu	v0,t6,10
bfc03800:	00c54021 	addu	t0,a2,a1
bfc03804:	01c38821 	addu	s1,t6,v1
bfc03808:	00026c00 	sll	t5,v0,0x10
bfc0380c:	0011bc00 	sll	s7,s1,0x10
bfc03810:	03c8302a 	slt	a2,s8,t0
bfc03814:	000d2403 	sra	a0,t5,0x10
bfc03818:	10c00002 	beqz	a2,bfc03824 <matrix_test+0xfa4>
bfc0381c:	00171403 	sra	v0,s7,0x10
bfc03820:	00801021 	move	v0,a0
bfc03824:	14c00002 	bnez	a2,bfc03830 <matrix_test+0xfb0>
bfc03828:	00003821 	move	a3,zero
bfc0382c:	01003821 	move	a3,t0
bfc03830:	8d460004 	lw	a2,4(t2)
bfc03834:	3053ffff 	andi	s3,v0,0xffff
bfc03838:	00a6c82a 	slt	t9,a1,a2
bfc0383c:	00e63821 	addu	a3,a3,a2
bfc03840:	02797021 	addu	t6,s3,t9
bfc03844:	2670000a 	addiu	s0,s3,10
bfc03848:	0010b400 	sll	s6,s0,0x10
bfc0384c:	000e4400 	sll	t0,t6,0x10
bfc03850:	03c7282a 	slt	a1,s8,a3
bfc03854:	00162403 	sra	a0,s6,0x10
bfc03858:	10a00002 	beqz	a1,bfc03864 <matrix_test+0xfe4>
bfc0385c:	00081403 	sra	v0,t0,0x10
bfc03860:	00801021 	move	v0,a0
bfc03864:	10a00002 	beqz	a1,bfc03870 <matrix_test+0xff0>
bfc03868:	00000000 	nop
bfc0386c:	00003821 	move	a3,zero
bfc03870:	8d450008 	lw	a1,8(t2)
bfc03874:	305fffff 	andi	ra,v0,0xffff
bfc03878:	00c5182a 	slt	v1,a2,a1
bfc0387c:	00e53821 	addu	a3,a3,a1
bfc03880:	03e3c021 	addu	t8,ra,v1
bfc03884:	27ed000a 	addiu	t5,ra,10
bfc03888:	000d7c00 	sll	t7,t5,0x10
bfc0388c:	00188c00 	sll	s1,t8,0x10
bfc03890:	03c7302a 	slt	a2,s8,a3
bfc03894:	000f1403 	sra	v0,t7,0x10
bfc03898:	10c00002 	beqz	a2,bfc038a4 <matrix_test+0x1024>
bfc0389c:	00112403 	sra	a0,s1,0x10
bfc038a0:	00402021 	move	a0,v0
bfc038a4:	14c00006 	bnez	a2,bfc038c0 <matrix_test+0x1040>
bfc038a8:	00000000 	nop
bfc038ac:	00e03021 	move	a2,a3
bfc038b0:	25290003 	addiu	t1,t1,3
bfc038b4:	2548000c 	addiu	t0,t2,12
bfc038b8:	0bf00de8 	j	bfc037a0 <matrix_test+0xf20>
bfc038bc:	00a01821 	move	v1,a1
bfc038c0:	0bf00e2c 	j	bfc038b0 <matrix_test+0x1030>
bfc038c4:	00003021 	move	a2,zero
	...
bfc038d0:	258c0001 	addiu	t4,t4,1
bfc038d4:	8fa8001c 	lw	t0,28(sp)
bfc038d8:	0194482b 	sltu	t1,t4,s4
bfc038dc:	11200003 	beqz	t1,bfc038ec <matrix_test+0x106c>
bfc038e0:	01685821 	addu	t3,t3,t0
bfc038e4:	0bf00da5 	j	bfc03694 <matrix_test+0xe14>
bfc038e8:	00e01821 	move	v1,a3
bfc038ec:	8fa50018 	lw	a1,24(sp)
bfc038f0:	0ff017d8 	jal	bfc05f60 <crc16>
bfc038f4:	0000b021 	move	s6,zero
bfc038f8:	8fb8002c 	lw	t8,44(sp)
bfc038fc:	8fb50028 	lw	s5,40(sp)
bfc03900:	0040b821 	move	s7,v0
bfc03904:	8fb10030 	lw	s1,48(sp)
bfc03908:	02a09821 	move	s3,s5
bfc0390c:	0000c821 	move	t9,zero
bfc03910:	862e0000 	lh	t6,0(s1)
bfc03914:	87030000 	lh	v1,0(t8)
bfc03918:	240f0001 	li	t7,1
bfc0391c:	01c30018 	mult	t6,v1
bfc03920:	268dffff 	addiu	t5,s4,-1
bfc03924:	01f4582b 	sltu	t3,t7,s4
bfc03928:	31a40003 	andi	a0,t5,0x3
bfc0392c:	02327021 	addu	t6,s1,s2
bfc03930:	00001012 	mflo	v0
bfc03934:	00028143 	sra	s0,v0,0x5
bfc03938:	0002f883 	sra	ra,v0,0x2
bfc0393c:	320c007f 	andi	t4,s0,0x7f
bfc03940:	33e6000f 	andi	a2,ra,0xf
bfc03944:	01860018 	mult	t4,a2
bfc03948:	00008012 	mflo	s0
bfc0394c:	1160006a 	beqz	t3,bfc03af8 <matrix_test+0x1278>
bfc03950:	270d0002 	addiu	t5,t8,2
bfc03954:	10800031 	beqz	a0,bfc03a1c <matrix_test+0x119c>
bfc03958:	00000000 	nop
bfc0395c:	108f001f 	beq	a0,t7,bfc039dc <matrix_test+0x115c>
bfc03960:	240b0002 	li	t3,2
bfc03964:	108b000f 	beq	a0,t3,bfc039a4 <matrix_test+0x1124>
bfc03968:	00000000 	nop
bfc0396c:	85af0000 	lh	t7,0(t5)
bfc03970:	85cd0000 	lh	t5,0(t6)
bfc03974:	01d27021 	addu	t6,t6,s2
bfc03978:	01af0018 	mult	t5,t7
bfc0397c:	240f0002 	li	t7,2
bfc03980:	270d0004 	addiu	t5,t8,4
bfc03984:	00004012 	mflo	t0
bfc03988:	00085083 	sra	t2,t0,0x2
bfc0398c:	00083143 	sra	a2,t0,0x5
bfc03990:	30c7007f 	andi	a3,a2,0x7f
bfc03994:	3145000f 	andi	a1,t2,0xf
bfc03998:	00e50018 	mult	a3,a1
bfc0399c:	00004812 	mflo	t1
bfc039a0:	02098021 	addu	s0,s0,t1
bfc039a4:	85c90000 	lh	t1,0(t6)
bfc039a8:	85a50000 	lh	a1,0(t5)
bfc039ac:	25ef0001 	addiu	t7,t7,1
bfc039b0:	01250018 	mult	t1,a1
bfc039b4:	25ad0002 	addiu	t5,t5,2
bfc039b8:	01d27021 	addu	t6,t6,s2
bfc039bc:	00005812 	mflo	t3
bfc039c0:	000b2083 	sra	a0,t3,0x2
bfc039c4:	000b1143 	sra	v0,t3,0x5
bfc039c8:	305f007f 	andi	ra,v0,0x7f
bfc039cc:	3083000f 	andi	v1,a0,0xf
bfc039d0:	03e30018 	mult	ra,v1
bfc039d4:	00006012 	mflo	t4
bfc039d8:	020c8021 	addu	s0,s0,t4
bfc039dc:	85c40000 	lh	a0,0(t6)
bfc039e0:	85a20000 	lh	v0,0(t5)
bfc039e4:	25ef0001 	addiu	t7,t7,1
bfc039e8:	00820018 	mult	a0,v0
bfc039ec:	01f4382b 	sltu	a3,t7,s4
bfc039f0:	25ad0002 	addiu	t5,t5,2
bfc039f4:	01d27021 	addu	t6,t6,s2
bfc039f8:	00001812 	mflo	v1
bfc039fc:	00036083 	sra	t4,v1,0x2
bfc03a00:	0003f943 	sra	ra,v1,0x5
bfc03a04:	33e6007f 	andi	a2,ra,0x7f
bfc03a08:	3188000f 	andi	t0,t4,0xf
bfc03a0c:	00c80018 	mult	a2,t0
bfc03a10:	00005012 	mflo	t2
bfc03a14:	10e00038 	beqz	a3,bfc03af8 <matrix_test+0x1278>
bfc03a18:	020a8021 	addu	s0,s0,t2
bfc03a1c:	85c60000 	lh	a2,0(t6)
bfc03a20:	85a30000 	lh	v1,0(t5)
bfc03a24:	01d26021 	addu	t4,t6,s2
bfc03a28:	00c30018 	mult	a2,v1
bfc03a2c:	85a90002 	lh	t1,2(t5)
bfc03a30:	85850000 	lh	a1,0(t4)
bfc03a34:	01927021 	addu	t6,t4,s2
bfc03a38:	85aa0004 	lh	t2,4(t5)
bfc03a3c:	85c40000 	lh	a0,0(t6)
bfc03a40:	01d23821 	addu	a3,t6,s2
bfc03a44:	85a30006 	lh	v1,6(t5)
bfc03a48:	84e60000 	lh	a2,0(a3)
bfc03a4c:	00f27021 	addu	t6,a3,s2
bfc03a50:	25ef0004 	addiu	t7,t7,4
bfc03a54:	01f4602b 	sltu	t4,t7,s4
bfc03a58:	25ad0008 	addiu	t5,t5,8
bfc03a5c:	0000f812 	mflo	ra
bfc03a60:	001f4083 	sra	t0,ra,0x2
bfc03a64:	001f1143 	sra	v0,ra,0x5
bfc03a68:	00a90018 	mult	a1,t1
bfc03a6c:	305f007f 	andi	ra,v0,0x7f
bfc03a70:	3108000f 	andi	t0,t0,0xf
bfc03a74:	00005812 	mflo	t3
bfc03a78:	000b4883 	sra	t1,t3,0x2
bfc03a7c:	000b2943 	sra	a1,t3,0x5
bfc03a80:	008a0018 	mult	a0,t2
bfc03a84:	30a5007f 	andi	a1,a1,0x7f
bfc03a88:	3129000f 	andi	t1,t1,0xf
bfc03a8c:	00003812 	mflo	a3
bfc03a90:	00075083 	sra	t2,a3,0x2
bfc03a94:	00072143 	sra	a0,a3,0x5
bfc03a98:	00c30018 	mult	a2,v1
bfc03a9c:	3084007f 	andi	a0,a0,0x7f
bfc03aa0:	3147000f 	andi	a3,t2,0xf
bfc03aa4:	00005812 	mflo	t3
bfc03aa8:	000b1943 	sra	v1,t3,0x5
bfc03aac:	000b3083 	sra	a2,t3,0x2
bfc03ab0:	03e80018 	mult	ra,t0
bfc03ab4:	30cb000f 	andi	t3,a2,0xf
bfc03ab8:	3068007f 	andi	t0,v1,0x7f
bfc03abc:	00001012 	mflo	v0
bfc03ac0:	0202f821 	addu	ra,s0,v0
bfc03ac4:	00000000 	nop
bfc03ac8:	00a90018 	mult	a1,t1
bfc03acc:	00005012 	mflo	t2
bfc03ad0:	03ea4821 	addu	t1,ra,t2
bfc03ad4:	00000000 	nop
bfc03ad8:	00870018 	mult	a0,a3
bfc03adc:	00002012 	mflo	a0
bfc03ae0:	01245021 	addu	t2,t1,a0
bfc03ae4:	00000000 	nop
bfc03ae8:	010b0018 	mult	t0,t3
bfc03aec:	00002812 	mflo	a1
bfc03af0:	1580ffca 	bnez	t4,bfc03a1c <matrix_test+0x119c>
bfc03af4:	01458021 	addu	s0,t2,a1
bfc03af8:	27390001 	addiu	t9,t9,1
bfc03afc:	0334782b 	sltu	t7,t9,s4
bfc03b00:	ae700000 	sw	s0,0(s3)
bfc03b04:	26310002 	addiu	s1,s1,2
bfc03b08:	15e0ff81 	bnez	t7,bfc03910 <matrix_test+0x1090>
bfc03b0c:	26730004 	addiu	s3,s3,4
bfc03b10:	26d60001 	addiu	s6,s6,1
bfc03b14:	8fb9001c 	lw	t9,28(sp)
bfc03b18:	02d4982b 	sltu	s3,s6,s4
bfc03b1c:	0312c021 	addu	t8,t8,s2
bfc03b20:	1660ff78 	bnez	s3,bfc03904 <matrix_test+0x1084>
bfc03b24:	02b9a821 	addu	s5,s5,t9
bfc03b28:	00003021 	move	a2,zero
bfc03b2c:	00001821 	move	v1,zero
bfc03b30:	00002021 	move	a0,zero
bfc03b34:	00005821 	move	t3,zero
bfc03b38:	2687ffff 	addiu	a3,s4,-1
bfc03b3c:	30ea0003 	andi	t2,a3,0x3
bfc03b40:	8fa80020 	lw	t0,32(sp)
bfc03b44:	11400040 	beqz	t2,bfc03c48 <matrix_test+0x13c8>
bfc03b48:	00004821 	move	t1,zero
bfc03b4c:	8d070000 	lw	a3,0(t0)
bfc03b50:	3096ffff 	andi	s6,a0,0xffff
bfc03b54:	0067802a 	slt	s0,v1,a3
bfc03b58:	00c73021 	addu	a2,a2,a3
bfc03b5c:	02d07021 	addu	t6,s6,s0
bfc03b60:	26cc000a 	addiu	t4,s6,10
bfc03b64:	000c7c00 	sll	t7,t4,0x10
bfc03b68:	000e6c00 	sll	t5,t6,0x10
bfc03b6c:	03c6282a 	slt	a1,s8,a2
bfc03b70:	000f1403 	sra	v0,t7,0x10
bfc03b74:	10a00002 	beqz	a1,bfc03b80 <matrix_test+0x1300>
bfc03b78:	000d2403 	sra	a0,t5,0x10
bfc03b7c:	00402021 	move	a0,v0
bfc03b80:	10a00002 	beqz	a1,bfc03b8c <matrix_test+0x130c>
bfc03b84:	24090001 	li	t1,1
bfc03b88:	00003021 	move	a2,zero
bfc03b8c:	8fa30020 	lw	v1,32(sp)
bfc03b90:	0134282b 	sltu	a1,t1,s4
bfc03b94:	10a0007b 	beqz	a1,bfc03d84 <matrix_test+0x1504>
bfc03b98:	24680004 	addiu	t0,v1,4
bfc03b9c:	1149002a 	beq	t2,t1,bfc03c48 <matrix_test+0x13c8>
bfc03ba0:	00e01821 	move	v1,a3
bfc03ba4:	24020002 	li	v0,2
bfc03ba8:	11420014 	beq	t2,v0,bfc03bfc <matrix_test+0x137c>
bfc03bac:	3091ffff 	andi	s1,a0,0xffff
bfc03bb0:	8d050000 	lw	a1,0(t0)
bfc03bb4:	00000000 	nop
bfc03bb8:	00e5c02a 	slt	t8,a3,a1
bfc03bbc:	02382021 	addu	a0,s1,t8
bfc03bc0:	00c55021 	addu	t2,a2,a1
bfc03bc4:	2639000a 	addiu	t9,s1,10
bfc03bc8:	00199c00 	sll	s3,t9,0x10
bfc03bcc:	00043c00 	sll	a3,a0,0x10
bfc03bd0:	03ca302a 	slt	a2,s8,t2
bfc03bd4:	00131403 	sra	v0,s3,0x10
bfc03bd8:	10c00002 	beqz	a2,bfc03be4 <matrix_test+0x1364>
bfc03bdc:	00072403 	sra	a0,a3,0x10
bfc03be0:	00402021 	move	a0,v0
bfc03be4:	14c00002 	bnez	a2,bfc03bf0 <matrix_test+0x1370>
bfc03be8:	00003021 	move	a2,zero
bfc03bec:	01403021 	move	a2,t2
bfc03bf0:	25290001 	addiu	t1,t1,1
bfc03bf4:	25080004 	addiu	t0,t0,4
bfc03bf8:	00a01821 	move	v1,a1
bfc03bfc:	8d050000 	lw	a1,0(t0)
bfc03c00:	308fffff 	andi	t7,a0,0xffff
bfc03c04:	00c53821 	addu	a3,a2,a1
bfc03c08:	0065302a 	slt	a2,v1,a1
bfc03c0c:	01e6a821 	addu	s5,t7,a2
bfc03c10:	25ee000a 	addiu	t6,t7,10
bfc03c14:	000e6c00 	sll	t5,t6,0x10
bfc03c18:	00155400 	sll	t2,s5,0x10
bfc03c1c:	03c7302a 	slt	a2,s8,a3
bfc03c20:	000d1403 	sra	v0,t5,0x10
bfc03c24:	10c00002 	beqz	a2,bfc03c30 <matrix_test+0x13b0>
bfc03c28:	000a2403 	sra	a0,t2,0x10
bfc03c2c:	00402021 	move	a0,v0
bfc03c30:	14c00002 	bnez	a2,bfc03c3c <matrix_test+0x13bc>
bfc03c34:	00003021 	move	a2,zero
bfc03c38:	00e03021 	move	a2,a3
bfc03c3c:	25290001 	addiu	t1,t1,1
bfc03c40:	25080004 	addiu	t0,t0,4
bfc03c44:	00a01821 	move	v1,a1
bfc03c48:	8d070000 	lw	a3,0(t0)
bfc03c4c:	3085ffff 	andi	a1,a0,0xffff
bfc03c50:	0067702a 	slt	t6,v1,a3
bfc03c54:	00ae5021 	addu	t2,a1,t6
bfc03c58:	24bf000a 	addiu	ra,a1,10
bfc03c5c:	00c73021 	addu	a2,a2,a3
bfc03c60:	001f1400 	sll	v0,ra,0x10
bfc03c64:	000a2400 	sll	a0,t2,0x10
bfc03c68:	03c6282a 	slt	a1,s8,a2
bfc03c6c:	00021403 	sra	v0,v0,0x10
bfc03c70:	10a00002 	beqz	a1,bfc03c7c <matrix_test+0x13fc>
bfc03c74:	00042403 	sra	a0,a0,0x10
bfc03c78:	00402021 	move	a0,v0
bfc03c7c:	10a00002 	beqz	a1,bfc03c88 <matrix_test+0x1408>
bfc03c80:	00000000 	nop
bfc03c84:	00003021 	move	a2,zero
bfc03c88:	25290001 	addiu	t1,t1,1
bfc03c8c:	0134602b 	sltu	t4,t1,s4
bfc03c90:	1180003b 	beqz	t4,bfc03d80 <matrix_test+0x1500>
bfc03c94:	250a0004 	addiu	t2,t0,4
bfc03c98:	8d050004 	lw	a1,4(t0)
bfc03c9c:	3090ffff 	andi	s0,a0,0xffff
bfc03ca0:	00e5682a 	slt	t5,a3,a1
bfc03ca4:	00c54021 	addu	t0,a2,a1
bfc03ca8:	020dc021 	addu	t8,s0,t5
bfc03cac:	2616000a 	addiu	s6,s0,10
bfc03cb0:	0016ac00 	sll	s5,s6,0x10
bfc03cb4:	00188c00 	sll	s1,t8,0x10
bfc03cb8:	03c8302a 	slt	a2,s8,t0
bfc03cbc:	00152403 	sra	a0,s5,0x10
bfc03cc0:	10c00002 	beqz	a2,bfc03ccc <matrix_test+0x144c>
bfc03cc4:	00111403 	sra	v0,s1,0x10
bfc03cc8:	00801021 	move	v0,a0
bfc03ccc:	14c00002 	bnez	a2,bfc03cd8 <matrix_test+0x1458>
bfc03cd0:	00003821 	move	a3,zero
bfc03cd4:	01003821 	move	a3,t0
bfc03cd8:	8d460004 	lw	a2,4(t2)
bfc03cdc:	305fffff 	andi	ra,v0,0xffff
bfc03ce0:	00a6182a 	slt	v1,a1,a2
bfc03ce4:	00e63821 	addu	a3,a3,a2
bfc03ce8:	03e36021 	addu	t4,ra,v1
bfc03cec:	27f0000a 	addiu	s0,ra,10
bfc03cf0:	0010b400 	sll	s6,s0,0x10
bfc03cf4:	000c4400 	sll	t0,t4,0x10
bfc03cf8:	03c7282a 	slt	a1,s8,a3
bfc03cfc:	00162403 	sra	a0,s6,0x10
bfc03d00:	10a00002 	beqz	a1,bfc03d0c <matrix_test+0x148c>
bfc03d04:	00081403 	sra	v0,t0,0x10
bfc03d08:	00801021 	move	v0,a0
bfc03d0c:	10a00002 	beqz	a1,bfc03d18 <matrix_test+0x1498>
bfc03d10:	00000000 	nop
bfc03d14:	00003821 	move	a3,zero
bfc03d18:	8d450008 	lw	a1,8(t2)
bfc03d1c:	3051ffff 	andi	s1,v0,0xffff
bfc03d20:	00c5c02a 	slt	t8,a2,a1
bfc03d24:	00e53821 	addu	a3,a3,a1
bfc03d28:	02389821 	addu	s3,s1,t8
bfc03d2c:	2639000a 	addiu	t9,s1,10
bfc03d30:	00191400 	sll	v0,t9,0x10
bfc03d34:	00132400 	sll	a0,s3,0x10
bfc03d38:	03c7302a 	slt	a2,s8,a3
bfc03d3c:	00021403 	sra	v0,v0,0x10
bfc03d40:	10c00002 	beqz	a2,bfc03d4c <matrix_test+0x14cc>
bfc03d44:	00042403 	sra	a0,a0,0x10
bfc03d48:	00402021 	move	a0,v0
bfc03d4c:	14c00008 	bnez	a2,bfc03d70 <matrix_test+0x14f0>
bfc03d50:	00000000 	nop
bfc03d54:	00e03021 	move	a2,a3
bfc03d58:	25290003 	addiu	t1,t1,3
bfc03d5c:	2548000c 	addiu	t0,t2,12
bfc03d60:	0bf00f12 	j	bfc03c48 <matrix_test+0x13c8>
bfc03d64:	00a01821 	move	v1,a1
	...
bfc03d70:	0bf00f56 	j	bfc03d58 <matrix_test+0x14d8>
bfc03d74:	00003021 	move	a2,zero
	...
bfc03d80:	8fa30020 	lw	v1,32(sp)
bfc03d84:	8faf001c 	lw	t7,28(sp)
bfc03d88:	256b0001 	addiu	t3,t3,1
bfc03d8c:	006f4821 	addu	t1,v1,t7
bfc03d90:	0174402b 	sltu	t0,t3,s4
bfc03d94:	11000003 	beqz	t0,bfc03da4 <matrix_test+0x1524>
bfc03d98:	afa90020 	sw	t1,32(sp)
bfc03d9c:	0bf00ece 	j	bfc03b38 <matrix_test+0x12b8>
bfc03da0:	00e01821 	move	v1,a3
bfc03da4:	0ff017d8 	jal	bfc05f60 <crc16>
bfc03da8:	02e02821 	move	a1,s7
bfc03dac:	8fb70034 	lw	s7,52(sp)
bfc03db0:	00407821 	move	t7,v0
bfc03db4:	0017f023 	negu	s8,s7
bfc03db8:	33cdffff 	andi	t5,s8,0xffff
bfc03dbc:	00007021 	move	t6,zero
bfc03dc0:	8fb30014 	lw	s3,20(sp)
bfc03dc4:	240c0001 	li	t4,1
bfc03dc8:	96780000 	lhu	t8,0(s3)
bfc03dcc:	2699ffff 	addiu	t9,s4,-1
bfc03dd0:	01b88821 	addu	s1,t5,t8
bfc03dd4:	0194b82b 	sltu	s7,t4,s4
bfc03dd8:	a6710000 	sh	s1,0(s3)
bfc03ddc:	33230007 	andi	v1,t9,0x7
bfc03de0:	12e00051 	beqz	s7,bfc03f28 <matrix_test+0x16a8>
bfc03de4:	266b0002 	addiu	t3,s3,2
bfc03de8:	10600033 	beqz	v1,bfc03eb8 <matrix_test+0x1638>
bfc03dec:	00000000 	nop
bfc03df0:	106c002a 	beq	v1,t4,bfc03e9c <matrix_test+0x161c>
bfc03df4:	24060002 	li	a2,2
bfc03df8:	10660023 	beq	v1,a2,bfc03e88 <matrix_test+0x1608>
bfc03dfc:	24150003 	li	s5,3
bfc03e00:	1075001c 	beq	v1,s5,bfc03e74 <matrix_test+0x15f4>
bfc03e04:	24160004 	li	s6,4
bfc03e08:	10760015 	beq	v1,s6,bfc03e60 <matrix_test+0x15e0>
bfc03e0c:	24100005 	li	s0,5
bfc03e10:	1070000e 	beq	v1,s0,bfc03e4c <matrix_test+0x15cc>
bfc03e14:	240a0006 	li	t2,6
bfc03e18:	106a0007 	beq	v1,t2,bfc03e38 <matrix_test+0x15b8>
bfc03e1c:	00000000 	nop
bfc03e20:	95690000 	lhu	t1,0(t3)
bfc03e24:	8fbf0014 	lw	ra,20(sp)
bfc03e28:	01a94021 	addu	t0,t5,t1
bfc03e2c:	a5680000 	sh	t0,0(t3)
bfc03e30:	240c0002 	li	t4,2
bfc03e34:	27eb0004 	addiu	t3,ra,4
bfc03e38:	95650000 	lhu	a1,0(t3)
bfc03e3c:	258c0001 	addiu	t4,t4,1
bfc03e40:	01a53821 	addu	a3,t5,a1
bfc03e44:	a5670000 	sh	a3,0(t3)
bfc03e48:	256b0002 	addiu	t3,t3,2
bfc03e4c:	95630000 	lhu	v1,0(t3)
bfc03e50:	258c0001 	addiu	t4,t4,1
bfc03e54:	01a32021 	addu	a0,t5,v1
bfc03e58:	a5640000 	sh	a0,0(t3)
bfc03e5c:	256b0002 	addiu	t3,t3,2
bfc03e60:	957e0000 	lhu	s8,0(t3)
bfc03e64:	258c0001 	addiu	t4,t4,1
bfc03e68:	01be1021 	addu	v0,t5,s8
bfc03e6c:	a5620000 	sh	v0,0(t3)
bfc03e70:	256b0002 	addiu	t3,t3,2
bfc03e74:	95730000 	lhu	s3,0(t3)
bfc03e78:	258c0001 	addiu	t4,t4,1
bfc03e7c:	01b3b821 	addu	s7,t5,s3
bfc03e80:	a5770000 	sh	s7,0(t3)
bfc03e84:	256b0002 	addiu	t3,t3,2
bfc03e88:	95710000 	lhu	s1,0(t3)
bfc03e8c:	258c0001 	addiu	t4,t4,1
bfc03e90:	01b1c821 	addu	t9,t5,s1
bfc03e94:	a5790000 	sh	t9,0(t3)
bfc03e98:	256b0002 	addiu	t3,t3,2
bfc03e9c:	95750000 	lhu	s5,0(t3)
bfc03ea0:	258c0001 	addiu	t4,t4,1
bfc03ea4:	01b53021 	addu	a2,t5,s5
bfc03ea8:	0194c02b 	sltu	t8,t4,s4
bfc03eac:	a5660000 	sh	a2,0(t3)
bfc03eb0:	1300001d 	beqz	t8,bfc03f28 <matrix_test+0x16a8>
bfc03eb4:	256b0002 	addiu	t3,t3,2
bfc03eb8:	95620000 	lhu	v0,0(t3)
bfc03ebc:	95630002 	lhu	v1,2(t3)
bfc03ec0:	95640004 	lhu	a0,4(t3)
bfc03ec4:	95650006 	lhu	a1,6(t3)
bfc03ec8:	95670008 	lhu	a3,8(t3)
bfc03ecc:	9569000a 	lhu	t1,10(t3)
bfc03ed0:	9568000c 	lhu	t0,12(t3)
bfc03ed4:	957f000e 	lhu	ra,14(t3)
bfc03ed8:	258c0008 	addiu	t4,t4,8
bfc03edc:	01a25021 	addu	t2,t5,v0
bfc03ee0:	01a38021 	addu	s0,t5,v1
bfc03ee4:	01a4b021 	addu	s6,t5,a0
bfc03ee8:	01a5a821 	addu	s5,t5,a1
bfc03eec:	01a73021 	addu	a2,t5,a3
bfc03ef0:	01a9c021 	addu	t8,t5,t1
bfc03ef4:	01a88821 	addu	s1,t5,t0
bfc03ef8:	01bfc821 	addu	t9,t5,ra
bfc03efc:	0194982b 	sltu	s3,t4,s4
bfc03f00:	a56a0000 	sh	t2,0(t3)
bfc03f04:	a5700002 	sh	s0,2(t3)
bfc03f08:	a5760004 	sh	s6,4(t3)
bfc03f0c:	a5750006 	sh	s5,6(t3)
bfc03f10:	a5660008 	sh	a2,8(t3)
bfc03f14:	a578000a 	sh	t8,10(t3)
bfc03f18:	a571000c 	sh	s1,12(t3)
bfc03f1c:	a579000e 	sh	t9,14(t3)
bfc03f20:	1660ffe5 	bnez	s3,bfc03eb8 <matrix_test+0x1638>
bfc03f24:	256b0010 	addiu	t3,t3,16
bfc03f28:	8fbe0014 	lw	s8,20(sp)
bfc03f2c:	25ce0001 	addiu	t6,t6,1
bfc03f30:	03d26021 	addu	t4,s8,s2
bfc03f34:	01d4582b 	sltu	t3,t6,s4
bfc03f38:	1560ffa1 	bnez	t3,bfc03dc0 <matrix_test+0x1540>
bfc03f3c:	afac0014 	sw	t4,20(sp)
bfc03f40:	8fbf005c 	lw	ra,92(sp)
bfc03f44:	000f9400 	sll	s2,t7,0x10
bfc03f48:	00121403 	sra	v0,s2,0x10
bfc03f4c:	8fbe0058 	lw	s8,88(sp)
bfc03f50:	8fb70054 	lw	s7,84(sp)
bfc03f54:	8fb60050 	lw	s6,80(sp)
bfc03f58:	8fb5004c 	lw	s5,76(sp)
bfc03f5c:	8fb40048 	lw	s4,72(sp)
bfc03f60:	8fb30044 	lw	s3,68(sp)
bfc03f64:	8fb20040 	lw	s2,64(sp)
bfc03f68:	8fb1003c 	lw	s1,60(sp)
bfc03f6c:	8fb00038 	lw	s0,56(sp)
bfc03f70:	03e00008 	jr	ra
bfc03f74:	27bd0060 	addiu	sp,sp,96
bfc03f78:	0ff017d8 	jal	bfc05f60 <crc16>
bfc03f7c:	00002821 	move	a1,zero
bfc03f80:	00402821 	move	a1,v0
bfc03f84:	0ff017d8 	jal	bfc05f60 <crc16>
bfc03f88:	00002021 	move	a0,zero
bfc03f8c:	00402821 	move	a1,v0
bfc03f90:	0ff017d8 	jal	bfc05f60 <crc16>
bfc03f94:	00002021 	move	a0,zero
bfc03f98:	00402821 	move	a1,v0
bfc03f9c:	8fbf005c 	lw	ra,92(sp)
bfc03fa0:	8fbe0058 	lw	s8,88(sp)
bfc03fa4:	8fb70054 	lw	s7,84(sp)
bfc03fa8:	8fb60050 	lw	s6,80(sp)
bfc03fac:	8fb5004c 	lw	s5,76(sp)
bfc03fb0:	8fb40048 	lw	s4,72(sp)
bfc03fb4:	8fb30044 	lw	s3,68(sp)
bfc03fb8:	8fb20040 	lw	s2,64(sp)
bfc03fbc:	8fb1003c 	lw	s1,60(sp)
bfc03fc0:	8fb00038 	lw	s0,56(sp)
bfc03fc4:	00002021 	move	a0,zero
bfc03fc8:	0bf017d8 	j	bfc05f60 <crc16>
bfc03fcc:	27bd0060 	addiu	sp,sp,96

bfc03fd0 <core_bench_matrix>:
core_bench_matrix():
bfc03fd0:	27bdff98 	addiu	sp,sp,-104
bfc03fd4:	8c820008 	lw	v0,8(a0)
bfc03fd8:	8c83000c 	lw	v1,12(a0)
bfc03fdc:	afb40050 	sw	s4,80(sp)
bfc03fe0:	00052c00 	sll	a1,a1,0x10
bfc03fe4:	8c940000 	lw	s4,0(a0)
bfc03fe8:	8c840004 	lw	a0,4(a0)
bfc03fec:	00052c03 	sra	a1,a1,0x10
bfc03ff0:	30c6ffff 	andi	a2,a2,0xffff
bfc03ff4:	afbf0064 	sw	ra,100(sp)
bfc03ff8:	afbe0060 	sw	s8,96(sp)
bfc03ffc:	afb7005c 	sw	s7,92(sp)
bfc04000:	afb60058 	sw	s6,88(sp)
bfc04004:	afb50054 	sw	s5,84(sp)
bfc04008:	afb3004c 	sw	s3,76(sp)
bfc0400c:	afb20048 	sw	s2,72(sp)
bfc04010:	afb10044 	sw	s1,68(sp)
bfc04014:	afb00040 	sw	s0,64(sp)
bfc04018:	afa50034 	sw	a1,52(sp)
bfc0401c:	afa60038 	sw	a2,56(sp)
bfc04020:	afa20028 	sw	v0,40(sp)
bfc04024:	afa30030 	sw	v1,48(sp)
bfc04028:	128005a8 	beqz	s4,bfc056cc <core_bench_matrix+0x16fc>
bfc0402c:	afa4002c 	sw	a0,44(sp)
bfc04030:	30adffff 	andi	t5,a1,0xffff
bfc04034:	00149040 	sll	s2,s4,0x1
bfc04038:	afa40010 	sw	a0,16(sp)
bfc0403c:	00807021 	move	t6,a0
bfc04040:	00007821 	move	t7,zero
bfc04044:	95c90000 	lhu	t1,0(t6)
bfc04048:	240c0001 	li	t4,1
bfc0404c:	01a95021 	addu	t2,t5,t1
bfc04050:	2685ffff 	addiu	a1,s4,-1
bfc04054:	0194302b 	sltu	a2,t4,s4
bfc04058:	a5ca0000 	sh	t2,0(t6)
bfc0405c:	30a30007 	andi	v1,a1,0x7
bfc04060:	10c00050 	beqz	a2,bfc041a4 <core_bench_matrix+0x1d4>
bfc04064:	25cb0002 	addiu	t3,t6,2
bfc04068:	10600032 	beqz	v1,bfc04134 <core_bench_matrix+0x164>
bfc0406c:	00000000 	nop
bfc04070:	106c0029 	beq	v1,t4,bfc04118 <core_bench_matrix+0x148>
bfc04074:	24100002 	li	s0,2
bfc04078:	10700022 	beq	v1,s0,bfc04104 <core_bench_matrix+0x134>
bfc0407c:	24170003 	li	s7,3
bfc04080:	1077001b 	beq	v1,s7,bfc040f0 <core_bench_matrix+0x120>
bfc04084:	24080004 	li	t0,4
bfc04088:	10680014 	beq	v1,t0,bfc040dc <core_bench_matrix+0x10c>
bfc0408c:	24130005 	li	s3,5
bfc04090:	1073000d 	beq	v1,s3,bfc040c8 <core_bench_matrix+0xf8>
bfc04094:	24190006 	li	t9,6
bfc04098:	10790006 	beq	v1,t9,bfc040b4 <core_bench_matrix+0xe4>
bfc0409c:	00000000 	nop
bfc040a0:	95750000 	lhu	s5,0(t3)
bfc040a4:	240c0002 	li	t4,2
bfc040a8:	01b51821 	addu	v1,t5,s5
bfc040ac:	a5630000 	sh	v1,0(t3)
bfc040b0:	25cb0004 	addiu	t3,t6,4
bfc040b4:	95710000 	lhu	s1,0(t3)
bfc040b8:	258c0001 	addiu	t4,t4,1
bfc040bc:	01b1b021 	addu	s6,t5,s1
bfc040c0:	a5760000 	sh	s6,0(t3)
bfc040c4:	256b0002 	addiu	t3,t3,2
bfc040c8:	95620000 	lhu	v0,0(t3)
bfc040cc:	258c0001 	addiu	t4,t4,1
bfc040d0:	01a2c021 	addu	t8,t5,v0
bfc040d4:	a5780000 	sh	t8,0(t3)
bfc040d8:	256b0002 	addiu	t3,t3,2
bfc040dc:	95690000 	lhu	t1,0(t3)
bfc040e0:	258c0001 	addiu	t4,t4,1
bfc040e4:	01a9f021 	addu	s8,t5,t1
bfc040e8:	a57e0000 	sh	s8,0(t3)
bfc040ec:	256b0002 	addiu	t3,t3,2
bfc040f0:	95670000 	lhu	a3,0(t3)
bfc040f4:	258c0001 	addiu	t4,t4,1
bfc040f8:	01a72821 	addu	a1,t5,a3
bfc040fc:	a5650000 	sh	a1,0(t3)
bfc04100:	256b0002 	addiu	t3,t3,2
bfc04104:	956a0000 	lhu	t2,0(t3)
bfc04108:	258c0001 	addiu	t4,t4,1
bfc0410c:	01aa3021 	addu	a2,t5,t2
bfc04110:	a5660000 	sh	a2,0(t3)
bfc04114:	256b0002 	addiu	t3,t3,2
bfc04118:	95700000 	lhu	s0,0(t3)
bfc0411c:	258c0001 	addiu	t4,t4,1
bfc04120:	01b0f821 	addu	ra,t5,s0
bfc04124:	0194202b 	sltu	a0,t4,s4
bfc04128:	a57f0000 	sh	ra,0(t3)
bfc0412c:	1080001d 	beqz	a0,bfc041a4 <core_bench_matrix+0x1d4>
bfc04130:	256b0002 	addiu	t3,t3,2
bfc04134:	95620000 	lhu	v0,0(t3)
bfc04138:	95630002 	lhu	v1,2(t3)
bfc0413c:	957f0004 	lhu	ra,4(t3)
bfc04140:	957e0006 	lhu	s8,6(t3)
bfc04144:	95790008 	lhu	t9,8(t3)
bfc04148:	9578000a 	lhu	t8,10(t3)
bfc0414c:	9577000c 	lhu	s7,12(t3)
bfc04150:	9576000e 	lhu	s6,14(t3)
bfc04154:	258c0008 	addiu	t4,t4,8
bfc04158:	01a2a821 	addu	s5,t5,v0
bfc0415c:	01a39821 	addu	s3,t5,v1
bfc04160:	01bf2021 	addu	a0,t5,ra
bfc04164:	01be8821 	addu	s1,t5,s8
bfc04168:	01b98021 	addu	s0,t5,t9
bfc0416c:	01b83821 	addu	a3,t5,t8
bfc04170:	01b74021 	addu	t0,t5,s7
bfc04174:	01b64821 	addu	t1,t5,s6
bfc04178:	0194502b 	sltu	t2,t4,s4
bfc0417c:	a5750000 	sh	s5,0(t3)
bfc04180:	a5730002 	sh	s3,2(t3)
bfc04184:	a5640004 	sh	a0,4(t3)
bfc04188:	a5710006 	sh	s1,6(t3)
bfc0418c:	a5700008 	sh	s0,8(t3)
bfc04190:	a567000a 	sh	a3,10(t3)
bfc04194:	a568000c 	sh	t0,12(t3)
bfc04198:	a569000e 	sh	t1,14(t3)
bfc0419c:	1540ffe5 	bnez	t2,bfc04134 <core_bench_matrix+0x164>
bfc041a0:	256b0010 	addiu	t3,t3,16
bfc041a4:	25ef0001 	addiu	t7,t7,1
bfc041a8:	01f4582b 	sltu	t3,t7,s4
bfc041ac:	1560ffa5 	bnez	t3,bfc04044 <core_bench_matrix+0x74>
bfc041b0:	01d27021 	addu	t6,t6,s2
bfc041b4:	8fac0030 	lw	t4,48(sp)
bfc041b8:	00146880 	sll	t5,s4,0x2
bfc041bc:	8faf002c 	lw	t7,44(sp)
bfc041c0:	afad001c 	sw	t5,28(sp)
bfc041c4:	afac0020 	sw	t4,32(sp)
bfc041c8:	01807021 	move	t6,t4
bfc041cc:	00008021 	move	s0,zero
bfc041d0:	85f10000 	lh	s1,0(t7)
bfc041d4:	8fa40034 	lw	a0,52(sp)
bfc041d8:	240d0001 	li	t5,1
bfc041dc:	00910018 	mult	a0,s1
bfc041e0:	2695ffff 	addiu	s5,s4,-1
bfc041e4:	01b4382b 	sltu	a3,t5,s4
bfc041e8:	32a30007 	andi	v1,s5,0x7
bfc041ec:	25eb0002 	addiu	t3,t7,2
bfc041f0:	25cc0004 	addiu	t4,t6,4
bfc041f4:	00004012 	mflo	t0
bfc041f8:	10e00077 	beqz	a3,bfc043d8 <core_bench_matrix+0x408>
bfc041fc:	adc80000 	sw	t0,0(t6)
bfc04200:	10600047 	beqz	v1,bfc04320 <core_bench_matrix+0x350>
bfc04204:	00000000 	nop
bfc04208:	106d003b 	beq	v1,t5,bfc042f8 <core_bench_matrix+0x328>
bfc0420c:	241e0002 	li	s8,2
bfc04210:	107e0031 	beq	v1,s8,bfc042d8 <core_bench_matrix+0x308>
bfc04214:	24090003 	li	t1,3
bfc04218:	10690027 	beq	v1,t1,bfc042b8 <core_bench_matrix+0x2e8>
bfc0421c:	24050004 	li	a1,4
bfc04220:	1065001d 	beq	v1,a1,bfc04298 <core_bench_matrix+0x2c8>
bfc04224:	24070005 	li	a3,5
bfc04228:	10670013 	beq	v1,a3,bfc04278 <core_bench_matrix+0x2a8>
bfc0422c:	24060006 	li	a2,6
bfc04230:	10660009 	beq	v1,a2,bfc04258 <core_bench_matrix+0x288>
bfc04234:	00000000 	nop
bfc04238:	85640000 	lh	a0,0(t3)
bfc0423c:	8fab0034 	lw	t3,52(sp)
bfc04240:	240d0002 	li	t5,2
bfc04244:	01640018 	mult	t3,a0
bfc04248:	25eb0004 	addiu	t3,t7,4
bfc0424c:	00005012 	mflo	t2
bfc04250:	ad8a0000 	sw	t2,0(t4)
bfc04254:	25cc0008 	addiu	t4,t6,8
bfc04258:	85770000 	lh	s7,0(t3)
bfc0425c:	8fa30034 	lw	v1,52(sp)
bfc04260:	25ad0001 	addiu	t5,t5,1
bfc04264:	00770018 	mult	v1,s7
bfc04268:	256b0002 	addiu	t3,t3,2
bfc0426c:	0000f812 	mflo	ra
bfc04270:	ad9f0000 	sw	ra,0(t4)
bfc04274:	258c0004 	addiu	t4,t4,4
bfc04278:	85730000 	lh	s3,0(t3)
bfc0427c:	8fb90034 	lw	t9,52(sp)
bfc04280:	25ad0001 	addiu	t5,t5,1
bfc04284:	03330018 	mult	t9,s3
bfc04288:	256b0002 	addiu	t3,t3,2
bfc0428c:	00004012 	mflo	t0
bfc04290:	ad880000 	sw	t0,0(t4)
bfc04294:	258c0004 	addiu	t4,t4,4
bfc04298:	85760000 	lh	s6,0(t3)
bfc0429c:	8fb10034 	lw	s1,52(sp)
bfc042a0:	25ad0001 	addiu	t5,t5,1
bfc042a4:	02360018 	mult	s1,s6
bfc042a8:	256b0002 	addiu	t3,t3,2
bfc042ac:	0000a812 	mflo	s5
bfc042b0:	ad950000 	sw	s5,0(t4)
bfc042b4:	258c0004 	addiu	t4,t4,4
bfc042b8:	85620000 	lh	v0,0(t3)
bfc042bc:	8fbe0034 	lw	s8,52(sp)
bfc042c0:	25ad0001 	addiu	t5,t5,1
bfc042c4:	03c20018 	mult	s8,v0
bfc042c8:	256b0002 	addiu	t3,t3,2
bfc042cc:	0000c012 	mflo	t8
bfc042d0:	ad980000 	sw	t8,0(t4)
bfc042d4:	258c0004 	addiu	t4,t4,4
bfc042d8:	85650000 	lh	a1,0(t3)
bfc042dc:	8fa70034 	lw	a3,52(sp)
bfc042e0:	25ad0001 	addiu	t5,t5,1
bfc042e4:	00e50018 	mult	a3,a1
bfc042e8:	256b0002 	addiu	t3,t3,2
bfc042ec:	00004812 	mflo	t1
bfc042f0:	ad890000 	sw	t1,0(t4)
bfc042f4:	258c0004 	addiu	t4,t4,4
bfc042f8:	85640000 	lh	a0,0(t3)
bfc042fc:	8fbf0034 	lw	ra,52(sp)
bfc04300:	25ad0001 	addiu	t5,t5,1
bfc04304:	03e40018 	mult	ra,a0
bfc04308:	01b4302b 	sltu	a2,t5,s4
bfc0430c:	256b0002 	addiu	t3,t3,2
bfc04310:	00005012 	mflo	t2
bfc04314:	ad8a0000 	sw	t2,0(t4)
bfc04318:	10c0002f 	beqz	a2,bfc043d8 <core_bench_matrix+0x408>
bfc0431c:	258c0004 	addiu	t4,t4,4
bfc04320:	85730000 	lh	s3,0(t3)
bfc04324:	8fa50034 	lw	a1,52(sp)
bfc04328:	8fb10034 	lw	s1,52(sp)
bfc0432c:	00b30018 	mult	a1,s3
bfc04330:	85690002 	lh	t1,2(t3)
bfc04334:	856a0004 	lh	t2,4(t3)
bfc04338:	85660006 	lh	a2,6(t3)
bfc0433c:	857e0008 	lh	s8,8(t3)
bfc04340:	8578000a 	lh	t8,10(t3)
bfc04344:	8576000c 	lh	s6,12(t3)
bfc04348:	8575000e 	lh	s5,14(t3)
bfc0434c:	25ad0008 	addiu	t5,t5,8
bfc04350:	01b4982b 	sltu	s3,t5,s4
bfc04354:	256b0010 	addiu	t3,t3,16
bfc04358:	00001012 	mflo	v0
bfc0435c:	ad820000 	sw	v0,0(t4)
bfc04360:	00000000 	nop
bfc04364:	02290018 	mult	s1,t1
bfc04368:	00001812 	mflo	v1
bfc0436c:	ad830004 	sw	v1,4(t4)
bfc04370:	00000000 	nop
bfc04374:	022a0018 	mult	s1,t2
bfc04378:	0000f812 	mflo	ra
bfc0437c:	ad9f0008 	sw	ra,8(t4)
bfc04380:	00000000 	nop
bfc04384:	02260018 	mult	s1,a2
bfc04388:	0000c812 	mflo	t9
bfc0438c:	ad99000c 	sw	t9,12(t4)
bfc04390:	00000000 	nop
bfc04394:	023e0018 	mult	s1,s8
bfc04398:	0000b812 	mflo	s7
bfc0439c:	ad970010 	sw	s7,16(t4)
bfc043a0:	00000000 	nop
bfc043a4:	02380018 	mult	s1,t8
bfc043a8:	00002012 	mflo	a0
bfc043ac:	ad840014 	sw	a0,20(t4)
bfc043b0:	00000000 	nop
bfc043b4:	02360018 	mult	s1,s6
bfc043b8:	00004012 	mflo	t0
bfc043bc:	ad880018 	sw	t0,24(t4)
bfc043c0:	00000000 	nop
bfc043c4:	02350018 	mult	s1,s5
bfc043c8:	00003812 	mflo	a3
bfc043cc:	ad87001c 	sw	a3,28(t4)
bfc043d0:	1660ffd3 	bnez	s3,bfc04320 <core_bench_matrix+0x350>
bfc043d4:	258c0020 	addiu	t4,t4,32
bfc043d8:	26100001 	addiu	s0,s0,1
bfc043dc:	8fac001c 	lw	t4,28(sp)
bfc043e0:	0214582b 	sltu	t3,s0,s4
bfc043e4:	01cc7021 	addu	t6,t6,t4
bfc043e8:	1560ff79 	bnez	t3,bfc041d0 <core_bench_matrix+0x200>
bfc043ec:	01f27821 	addu	t7,t7,s2
bfc043f0:	8faf0034 	lw	t7,52(sp)
bfc043f4:	240ef000 	li	t6,-4096
bfc043f8:	8fab0030 	lw	t3,48(sp)
bfc043fc:	01eef025 	or	s8,t7,t6
bfc04400:	00003021 	move	a2,zero
bfc04404:	00001821 	move	v1,zero
bfc04408:	00002021 	move	a0,zero
bfc0440c:	00006021 	move	t4,zero
bfc04410:	2687ffff 	addiu	a3,s4,-1
bfc04414:	30ea0003 	andi	t2,a3,0x3
bfc04418:	01604021 	move	t0,t3
bfc0441c:	1140003f 	beqz	t2,bfc0451c <core_bench_matrix+0x54c>
bfc04420:	00004821 	move	t1,zero
bfc04424:	8d670000 	lw	a3,0(t3)
bfc04428:	3095ffff 	andi	s5,a0,0xffff
bfc0442c:	0067b02a 	slt	s6,v1,a3
bfc04430:	00c73021 	addu	a2,a2,a3
bfc04434:	02b6b821 	addu	s7,s5,s6
bfc04438:	26b9000a 	addiu	t9,s5,10
bfc0443c:	00199c00 	sll	s3,t9,0x10
bfc04440:	0017fc00 	sll	ra,s7,0x10
bfc04444:	03c6282a 	slt	a1,s8,a2
bfc04448:	00131403 	sra	v0,s3,0x10
bfc0444c:	10a00002 	beqz	a1,bfc04458 <core_bench_matrix+0x488>
bfc04450:	001f2403 	sra	a0,ra,0x10
bfc04454:	00402021 	move	a0,v0
bfc04458:	10a00002 	beqz	a1,bfc04464 <core_bench_matrix+0x494>
bfc0445c:	24090001 	li	t1,1
bfc04460:	00003021 	move	a2,zero
bfc04464:	0134882b 	sltu	s1,t1,s4
bfc04468:	12200079 	beqz	s1,bfc04650 <core_bench_matrix+0x680>
bfc0446c:	25680004 	addiu	t0,t3,4
bfc04470:	1149002a 	beq	t2,t1,bfc0451c <core_bench_matrix+0x54c>
bfc04474:	00e01821 	move	v1,a3
bfc04478:	24180002 	li	t8,2
bfc0447c:	11580014 	beq	t2,t8,bfc044d0 <core_bench_matrix+0x500>
bfc04480:	308fffff 	andi	t7,a0,0xffff
bfc04484:	8d050000 	lw	a1,0(t0)
bfc04488:	00000000 	nop
bfc0448c:	00c55021 	addu	t2,a2,a1
bfc04490:	00e5302a 	slt	a2,a3,a1
bfc04494:	01e68021 	addu	s0,t7,a2
bfc04498:	25e7000a 	addiu	a3,t7,10
bfc0449c:	00071400 	sll	v0,a3,0x10
bfc044a0:	00107400 	sll	t6,s0,0x10
bfc044a4:	03ca302a 	slt	a2,s8,t2
bfc044a8:	00021403 	sra	v0,v0,0x10
bfc044ac:	10c00002 	beqz	a2,bfc044b8 <core_bench_matrix+0x4e8>
bfc044b0:	000e2403 	sra	a0,t6,0x10
bfc044b4:	00402021 	move	a0,v0
bfc044b8:	14c00002 	bnez	a2,bfc044c4 <core_bench_matrix+0x4f4>
bfc044bc:	00003021 	move	a2,zero
bfc044c0:	01403021 	move	a2,t2
bfc044c4:	25290001 	addiu	t1,t1,1
bfc044c8:	25080004 	addiu	t0,t0,4
bfc044cc:	00a01821 	move	v1,a1
bfc044d0:	8d050000 	lw	a1,0(t0)
bfc044d4:	3097ffff 	andi	s7,a0,0xffff
bfc044d8:	0065182a 	slt	v1,v1,a1
bfc044dc:	00c53821 	addu	a3,a2,a1
bfc044e0:	02e36821 	addu	t5,s7,v1
bfc044e4:	26ff000a 	addiu	ra,s7,10
bfc044e8:	001f2400 	sll	a0,ra,0x10
bfc044ec:	000d5400 	sll	t2,t5,0x10
bfc044f0:	03c7302a 	slt	a2,s8,a3
bfc044f4:	00041403 	sra	v0,a0,0x10
bfc044f8:	10c00002 	beqz	a2,bfc04504 <core_bench_matrix+0x534>
bfc044fc:	000a2403 	sra	a0,t2,0x10
bfc04500:	00402021 	move	a0,v0
bfc04504:	14c00002 	bnez	a2,bfc04510 <core_bench_matrix+0x540>
bfc04508:	00003021 	move	a2,zero
bfc0450c:	00e03021 	move	a2,a3
bfc04510:	25290001 	addiu	t1,t1,1
bfc04514:	25080004 	addiu	t0,t0,4
bfc04518:	00a01821 	move	v1,a1
bfc0451c:	8d070000 	lw	a3,0(t0)
bfc04520:	3093ffff 	andi	s3,a0,0xffff
bfc04524:	0067282a 	slt	a1,v1,a3
bfc04528:	02651821 	addu	v1,s3,a1
bfc0452c:	2662000a 	addiu	v0,s3,10
bfc04530:	00c73021 	addu	a2,a2,a3
bfc04534:	00025400 	sll	t2,v0,0x10
bfc04538:	0003fc00 	sll	ra,v1,0x10
bfc0453c:	03c6282a 	slt	a1,s8,a2
bfc04540:	000a1403 	sra	v0,t2,0x10
bfc04544:	10a00002 	beqz	a1,bfc04550 <core_bench_matrix+0x580>
bfc04548:	001f2403 	sra	a0,ra,0x10
bfc0454c:	00402021 	move	a0,v0
bfc04550:	10a00002 	beqz	a1,bfc0455c <core_bench_matrix+0x58c>
bfc04554:	00000000 	nop
bfc04558:	00003021 	move	a2,zero
bfc0455c:	25290001 	addiu	t1,t1,1
bfc04560:	0134a82b 	sltu	s5,t1,s4
bfc04564:	12a0003a 	beqz	s5,bfc04650 <core_bench_matrix+0x680>
bfc04568:	250a0004 	addiu	t2,t0,4
bfc0456c:	8d050004 	lw	a1,4(t0)
bfc04570:	3098ffff 	andi	t8,a0,0xffff
bfc04574:	00e5c82a 	slt	t9,a3,a1
bfc04578:	00c54021 	addu	t0,a2,a1
bfc0457c:	03196821 	addu	t5,t8,t9
bfc04580:	2717000a 	addiu	s7,t8,10
bfc04584:	0017b400 	sll	s6,s7,0x10
bfc04588:	000d8400 	sll	s0,t5,0x10
bfc0458c:	03c8302a 	slt	a2,s8,t0
bfc04590:	00162403 	sra	a0,s6,0x10
bfc04594:	10c00002 	beqz	a2,bfc045a0 <core_bench_matrix+0x5d0>
bfc04598:	00101403 	sra	v0,s0,0x10
bfc0459c:	00801021 	move	v0,a0
bfc045a0:	14c00002 	bnez	a2,bfc045ac <core_bench_matrix+0x5dc>
bfc045a4:	00003821 	move	a3,zero
bfc045a8:	01003821 	move	a3,t0
bfc045ac:	8d460004 	lw	a2,4(t2)
bfc045b0:	3056ffff 	andi	s6,v0,0xffff
bfc045b4:	00a6882a 	slt	s1,a1,a2
bfc045b8:	00e63821 	addu	a3,a3,a2
bfc045bc:	02d19821 	addu	s3,s6,s1
bfc045c0:	26d5000a 	addiu	s5,s6,10
bfc045c4:	0015cc00 	sll	t9,s5,0x10
bfc045c8:	00134400 	sll	t0,s3,0x10
bfc045cc:	03c7282a 	slt	a1,s8,a3
bfc045d0:	00192403 	sra	a0,t9,0x10
bfc045d4:	10a00002 	beqz	a1,bfc045e0 <core_bench_matrix+0x610>
bfc045d8:	00081403 	sra	v0,t0,0x10
bfc045dc:	00801021 	move	v0,a0
bfc045e0:	10a00002 	beqz	a1,bfc045ec <core_bench_matrix+0x61c>
bfc045e4:	00000000 	nop
bfc045e8:	00003821 	move	a3,zero
bfc045ec:	8d450008 	lw	a1,8(t2)
bfc045f0:	304fffff 	andi	t7,v0,0xffff
bfc045f4:	00c5682a 	slt	t5,a2,a1
bfc045f8:	25e2000a 	addiu	v0,t7,10
bfc045fc:	00e53821 	addu	a3,a3,a1
bfc04600:	01ed7021 	addu	t6,t7,t5
bfc04604:	00028400 	sll	s0,v0,0x10
bfc04608:	000ec400 	sll	t8,t6,0x10
bfc0460c:	03c7302a 	slt	a2,s8,a3
bfc04610:	00101403 	sra	v0,s0,0x10
bfc04614:	10c00002 	beqz	a2,bfc04620 <core_bench_matrix+0x650>
bfc04618:	00182403 	sra	a0,t8,0x10
bfc0461c:	00402021 	move	a0,v0
bfc04620:	14c00007 	bnez	a2,bfc04640 <core_bench_matrix+0x670>
bfc04624:	00000000 	nop
bfc04628:	00e03021 	move	a2,a3
bfc0462c:	25290003 	addiu	t1,t1,3
bfc04630:	2548000c 	addiu	t0,t2,12
bfc04634:	0bf01147 	j	bfc0451c <core_bench_matrix+0x54c>
bfc04638:	00a01821 	move	v1,a1
bfc0463c:	00000000 	nop
bfc04640:	0bf0118b 	j	bfc0462c <core_bench_matrix+0x65c>
bfc04644:	00003021 	move	a2,zero
	...
bfc04650:	258c0001 	addiu	t4,t4,1
bfc04654:	8fa8001c 	lw	t0,28(sp)
bfc04658:	0194482b 	sltu	t1,t4,s4
bfc0465c:	11200003 	beqz	t1,bfc0466c <core_bench_matrix+0x69c>
bfc04660:	01685821 	addu	t3,t3,t0
bfc04664:	0bf01104 	j	bfc04410 <core_bench_matrix+0x440>
bfc04668:	00e01821 	move	v1,a3
bfc0466c:	0ff017d8 	jal	bfc05f60 <crc16>
bfc04670:	00002821 	move	a1,zero
bfc04674:	8fb60030 	lw	s6,48(sp)
bfc04678:	8fb5002c 	lw	s5,44(sp)
bfc0467c:	0040f821 	move	ra,v0
bfc04680:	0000b821 	move	s7,zero
bfc04684:	8fae0028 	lw	t6,40(sp)
bfc04688:	86b10000 	lh	s1,0(s5)
bfc0468c:	85c40000 	lh	a0,0(t6)
bfc04690:	24130001 	li	s3,1
bfc04694:	00910018 	mult	a0,s1
bfc04698:	8fab0028 	lw	t3,40(sp)
bfc0469c:	268cffff 	addiu	t4,s4,-1
bfc046a0:	0274302b 	sltu	a2,s3,s4
bfc046a4:	31830007 	andi	v1,t4,0x7
bfc046a8:	26b10002 	addiu	s1,s5,2
bfc046ac:	0000c812 	mflo	t9
bfc046b0:	10c0007d 	beqz	a2,bfc048a8 <core_bench_matrix+0x8d8>
bfc046b4:	25780002 	addiu	t8,t3,2
bfc046b8:	10600048 	beqz	v1,bfc047dc <core_bench_matrix+0x80c>
bfc046bc:	00000000 	nop
bfc046c0:	1073003c 	beq	v1,s3,bfc047b4 <core_bench_matrix+0x7e4>
bfc046c4:	240b0002 	li	t3,2
bfc046c8:	106b0032 	beq	v1,t3,bfc04794 <core_bench_matrix+0x7c4>
bfc046cc:	24090003 	li	t1,3
bfc046d0:	10690028 	beq	v1,t1,bfc04774 <core_bench_matrix+0x7a4>
bfc046d4:	24050004 	li	a1,4
bfc046d8:	1065001e 	beq	v1,a1,bfc04754 <core_bench_matrix+0x784>
bfc046dc:	240c0005 	li	t4,5
bfc046e0:	106c0014 	beq	v1,t4,bfc04734 <core_bench_matrix+0x764>
bfc046e4:	24070006 	li	a3,6
bfc046e8:	1067000a 	beq	v1,a3,bfc04714 <core_bench_matrix+0x744>
bfc046ec:	00000000 	nop
bfc046f0:	8faa0028 	lw	t2,40(sp)
bfc046f4:	86280000 	lh	t0,0(s1)
bfc046f8:	85580002 	lh	t8,2(t2)
bfc046fc:	24130002 	li	s3,2
bfc04700:	03080018 	mult	t8,t0
bfc04704:	26b10004 	addiu	s1,s5,4
bfc04708:	25580004 	addiu	t8,t2,4
bfc0470c:	00003012 	mflo	a2
bfc04710:	0326c821 	addu	t9,t9,a2
bfc04714:	870d0000 	lh	t5,0(t8)
bfc04718:	86240000 	lh	a0,0(s1)
bfc0471c:	26730001 	addiu	s3,s3,1
bfc04720:	01a40018 	mult	t5,a0
bfc04724:	26310002 	addiu	s1,s1,2
bfc04728:	27180002 	addiu	t8,t8,2
bfc0472c:	00007812 	mflo	t7
bfc04730:	032fc821 	addu	t9,t9,t7
bfc04734:	87020000 	lh	v0,0(t8)
bfc04738:	862e0000 	lh	t6,0(s1)
bfc0473c:	26730001 	addiu	s3,s3,1
bfc04740:	004e0018 	mult	v0,t6
bfc04744:	26310002 	addiu	s1,s1,2
bfc04748:	27180002 	addiu	t8,t8,2
bfc0474c:	00001812 	mflo	v1
bfc04750:	0323c821 	addu	t9,t9,v1
bfc04754:	870b0000 	lh	t3,0(t8)
bfc04758:	86290000 	lh	t1,0(s1)
bfc0475c:	26730001 	addiu	s3,s3,1
bfc04760:	01690018 	mult	t3,t1
bfc04764:	26310002 	addiu	s1,s1,2
bfc04768:	27180002 	addiu	t8,t8,2
bfc0476c:	00008012 	mflo	s0
bfc04770:	0330c821 	addu	t9,t9,s0
bfc04774:	870c0000 	lh	t4,0(t8)
bfc04778:	86270000 	lh	a3,0(s1)
bfc0477c:	26730001 	addiu	s3,s3,1
bfc04780:	01870018 	mult	t4,a3
bfc04784:	26310002 	addiu	s1,s1,2
bfc04788:	27180002 	addiu	t8,t8,2
bfc0478c:	00002812 	mflo	a1
bfc04790:	0325c821 	addu	t9,t9,a1
bfc04794:	870a0000 	lh	t2,0(t8)
bfc04798:	86280000 	lh	t0,0(s1)
bfc0479c:	26730001 	addiu	s3,s3,1
bfc047a0:	01480018 	mult	t2,t0
bfc047a4:	26310002 	addiu	s1,s1,2
bfc047a8:	27180002 	addiu	t8,t8,2
bfc047ac:	00003012 	mflo	a2
bfc047b0:	0326c821 	addu	t9,t9,a2
bfc047b4:	87040000 	lh	a0,0(t8)
bfc047b8:	86230000 	lh	v1,0(s1)
bfc047bc:	26730001 	addiu	s3,s3,1
bfc047c0:	00830018 	mult	a0,v1
bfc047c4:	0274782b 	sltu	t7,s3,s4
bfc047c8:	26310002 	addiu	s1,s1,2
bfc047cc:	27180002 	addiu	t8,t8,2
bfc047d0:	00006812 	mflo	t5
bfc047d4:	11e00034 	beqz	t7,bfc048a8 <core_bench_matrix+0x8d8>
bfc047d8:	032dc821 	addu	t9,t9,t5
bfc047dc:	87080000 	lh	t0,0(t8)
bfc047e0:	86230000 	lh	v1,0(s1)
bfc047e4:	87100002 	lh	s0,2(t8)
bfc047e8:	01030018 	mult	t0,v1
bfc047ec:	862a0002 	lh	t2,2(s1)
bfc047f0:	87040004 	lh	a0,4(t8)
bfc047f4:	862b0004 	lh	t3,4(s1)
bfc047f8:	87050006 	lh	a1,6(t8)
bfc047fc:	862c0006 	lh	t4,6(s1)
bfc04800:	87060008 	lh	a2,8(t8)
bfc04804:	862d0008 	lh	t5,8(s1)
bfc04808:	8707000a 	lh	a3,10(t8)
bfc0480c:	862e000a 	lh	t6,10(s1)
bfc04810:	862f000c 	lh	t7,12(s1)
bfc04814:	8708000c 	lh	t0,12(t8)
bfc04818:	8703000e 	lh	v1,14(t8)
bfc0481c:	00001012 	mflo	v0
bfc04820:	26730008 	addiu	s3,s3,8
bfc04824:	03221021 	addu	v0,t9,v0
bfc04828:	27180010 	addiu	t8,t8,16
bfc0482c:	020a0018 	mult	s0,t2
bfc04830:	8630000e 	lh	s0,14(s1)
bfc04834:	0274502b 	sltu	t2,s3,s4
bfc04838:	26310010 	addiu	s1,s1,16
bfc0483c:	00004812 	mflo	t1
bfc04840:	0049c821 	addu	t9,v0,t1
bfc04844:	00000000 	nop
bfc04848:	008b0018 	mult	a0,t3
bfc0484c:	00002012 	mflo	a0
bfc04850:	03245821 	addu	t3,t9,a0
bfc04854:	00000000 	nop
bfc04858:	00ac0018 	mult	a1,t4
bfc0485c:	00006012 	mflo	t4
bfc04860:	016c4821 	addu	t1,t3,t4
bfc04864:	00000000 	nop
bfc04868:	00cd0018 	mult	a2,t5
bfc0486c:	00003012 	mflo	a2
bfc04870:	01261021 	addu	v0,t1,a2
bfc04874:	00000000 	nop
bfc04878:	00ee0018 	mult	a3,t6
bfc0487c:	00002812 	mflo	a1
bfc04880:	00456821 	addu	t5,v0,a1
bfc04884:	00000000 	nop
bfc04888:	010f0018 	mult	t0,t7
bfc0488c:	0000c812 	mflo	t9
bfc04890:	01b97821 	addu	t7,t5,t9
bfc04894:	00000000 	nop
bfc04898:	00700018 	mult	v1,s0
bfc0489c:	00008012 	mflo	s0
bfc048a0:	1540ffce 	bnez	t2,bfc047dc <core_bench_matrix+0x80c>
bfc048a4:	01f0c821 	addu	t9,t7,s0
bfc048a8:	26f70001 	addiu	s7,s7,1
bfc048ac:	02f4c02b 	sltu	t8,s7,s4
bfc048b0:	aed90000 	sw	t9,0(s6)
bfc048b4:	02b2a821 	addu	s5,s5,s2
bfc048b8:	1700ff72 	bnez	t8,bfc04684 <core_bench_matrix+0x6b4>
bfc048bc:	26d60004 	addiu	s6,s6,4
bfc048c0:	8fab0030 	lw	t3,48(sp)
bfc048c4:	00003021 	move	a2,zero
bfc048c8:	00001821 	move	v1,zero
bfc048cc:	00002021 	move	a0,zero
bfc048d0:	00006021 	move	t4,zero
bfc048d4:	2687ffff 	addiu	a3,s4,-1
bfc048d8:	30ea0003 	andi	t2,a3,0x3
bfc048dc:	01604021 	move	t0,t3
bfc048e0:	1140003f 	beqz	t2,bfc049e0 <core_bench_matrix+0xa10>
bfc048e4:	00004821 	move	t1,zero
bfc048e8:	8d670000 	lw	a3,0(t3)
bfc048ec:	3095ffff 	andi	s5,a0,0xffff
bfc048f0:	0067b02a 	slt	s6,v1,a3
bfc048f4:	00c73021 	addu	a2,a2,a3
bfc048f8:	02b6c021 	addu	t8,s5,s6
bfc048fc:	26b9000a 	addiu	t9,s5,10
bfc04900:	00199c00 	sll	s3,t9,0x10
bfc04904:	0018bc00 	sll	s7,t8,0x10
bfc04908:	03c6282a 	slt	a1,s8,a2
bfc0490c:	00131403 	sra	v0,s3,0x10
bfc04910:	10a00002 	beqz	a1,bfc0491c <core_bench_matrix+0x94c>
bfc04914:	00172403 	sra	a0,s7,0x10
bfc04918:	00402021 	move	a0,v0
bfc0491c:	10a00002 	beqz	a1,bfc04928 <core_bench_matrix+0x958>
bfc04920:	24090001 	li	t1,1
bfc04924:	00003021 	move	a2,zero
bfc04928:	0134782b 	sltu	t7,t1,s4
bfc0492c:	11e00078 	beqz	t7,bfc04b10 <core_bench_matrix+0xb40>
bfc04930:	25680004 	addiu	t0,t3,4
bfc04934:	1149002a 	beq	t2,t1,bfc049e0 <core_bench_matrix+0xa10>
bfc04938:	00e01821 	move	v1,a3
bfc0493c:	240d0002 	li	t5,2
bfc04940:	114d0014 	beq	t2,t5,bfc04994 <core_bench_matrix+0x9c4>
bfc04944:	308effff 	andi	t6,a0,0xffff
bfc04948:	8d050000 	lw	a1,0(t0)
bfc0494c:	00000000 	nop
bfc04950:	00c55021 	addu	t2,a2,a1
bfc04954:	00e5302a 	slt	a2,a3,a1
bfc04958:	01c61821 	addu	v1,t6,a2
bfc0495c:	25c2000a 	addiu	v0,t6,10
bfc04960:	00022400 	sll	a0,v0,0x10
bfc04964:	00033c00 	sll	a3,v1,0x10
bfc04968:	03ca302a 	slt	a2,s8,t2
bfc0496c:	00041403 	sra	v0,a0,0x10
bfc04970:	10c00002 	beqz	a2,bfc0497c <core_bench_matrix+0x9ac>
bfc04974:	00072403 	sra	a0,a3,0x10
bfc04978:	00402021 	move	a0,v0
bfc0497c:	14c00002 	bnez	a2,bfc04988 <core_bench_matrix+0x9b8>
bfc04980:	00003021 	move	a2,zero
bfc04984:	01403021 	move	a2,t2
bfc04988:	25290001 	addiu	t1,t1,1
bfc0498c:	25080004 	addiu	t0,t0,4
bfc04990:	00a01821 	move	v1,a1
bfc04994:	8d050000 	lw	a1,0(t0)
bfc04998:	3098ffff 	andi	t8,a0,0xffff
bfc0499c:	0065982a 	slt	s3,v1,a1
bfc049a0:	00c53821 	addu	a3,a2,a1
bfc049a4:	03138021 	addu	s0,t8,s3
bfc049a8:	2717000a 	addiu	s7,t8,10
bfc049ac:	00178c00 	sll	s1,s7,0x10
bfc049b0:	00105400 	sll	t2,s0,0x10
bfc049b4:	03c7302a 	slt	a2,s8,a3
bfc049b8:	00111403 	sra	v0,s1,0x10
bfc049bc:	10c00002 	beqz	a2,bfc049c8 <core_bench_matrix+0x9f8>
bfc049c0:	000a2403 	sra	a0,t2,0x10
bfc049c4:	00402021 	move	a0,v0
bfc049c8:	14c00002 	bnez	a2,bfc049d4 <core_bench_matrix+0xa04>
bfc049cc:	00003021 	move	a2,zero
bfc049d0:	00e03021 	move	a2,a3
bfc049d4:	25290001 	addiu	t1,t1,1
bfc049d8:	25080004 	addiu	t0,t0,4
bfc049dc:	00a01821 	move	v1,a1
bfc049e0:	8d070000 	lw	a3,0(t0)
bfc049e4:	3085ffff 	andi	a1,a0,0xffff
bfc049e8:	0067102a 	slt	v0,v1,a3
bfc049ec:	00a26821 	addu	t5,a1,v0
bfc049f0:	24a4000a 	addiu	a0,a1,10
bfc049f4:	00c73021 	addu	a2,a2,a3
bfc049f8:	0004cc00 	sll	t9,a0,0x10
bfc049fc:	000d7400 	sll	t6,t5,0x10
bfc04a00:	03c6282a 	slt	a1,s8,a2
bfc04a04:	00191403 	sra	v0,t9,0x10
bfc04a08:	10a00002 	beqz	a1,bfc04a14 <core_bench_matrix+0xa44>
bfc04a0c:	000e2403 	sra	a0,t6,0x10
bfc04a10:	00402021 	move	a0,v0
bfc04a14:	10a00002 	beqz	a1,bfc04a20 <core_bench_matrix+0xa50>
bfc04a18:	00000000 	nop
bfc04a1c:	00003021 	move	a2,zero
bfc04a20:	25290001 	addiu	t1,t1,1
bfc04a24:	0134802b 	sltu	s0,t1,s4
bfc04a28:	12000039 	beqz	s0,bfc04b10 <core_bench_matrix+0xb40>
bfc04a2c:	250a0004 	addiu	t2,t0,4
bfc04a30:	8d050004 	lw	a1,4(t0)
bfc04a34:	3091ffff 	andi	s1,a0,0xffff
bfc04a38:	00e5782a 	slt	t7,a3,a1
bfc04a3c:	00c54021 	addu	t0,a2,a1
bfc04a40:	022fb821 	addu	s7,s1,t7
bfc04a44:	2635000a 	addiu	s5,s1,10
bfc04a48:	00159c00 	sll	s3,s5,0x10
bfc04a4c:	0017b400 	sll	s6,s7,0x10
bfc04a50:	03c8302a 	slt	a2,s8,t0
bfc04a54:	00132403 	sra	a0,s3,0x10
bfc04a58:	10c00002 	beqz	a2,bfc04a64 <core_bench_matrix+0xa94>
bfc04a5c:	00161403 	sra	v0,s6,0x10
bfc04a60:	00801021 	move	v0,a0
bfc04a64:	14c00002 	bnez	a2,bfc04a70 <core_bench_matrix+0xaa0>
bfc04a68:	00003821 	move	a3,zero
bfc04a6c:	01003821 	move	a3,t0
bfc04a70:	8d460004 	lw	a2,4(t2)
bfc04a74:	304fffff 	andi	t7,v0,0xffff
bfc04a78:	00a6682a 	slt	t5,a1,a2
bfc04a7c:	00e63821 	addu	a3,a3,a2
bfc04a80:	01edc821 	addu	t9,t7,t5
bfc04a84:	25f6000a 	addiu	s6,t7,10
bfc04a88:	0016ac00 	sll	s5,s6,0x10
bfc04a8c:	00194400 	sll	t0,t9,0x10
bfc04a90:	03c7282a 	slt	a1,s8,a3
bfc04a94:	00152403 	sra	a0,s5,0x10
bfc04a98:	10a00002 	beqz	a1,bfc04aa4 <core_bench_matrix+0xad4>
bfc04a9c:	00081403 	sra	v0,t0,0x10
bfc04aa0:	00801021 	move	v0,a0
bfc04aa4:	10a00002 	beqz	a1,bfc04ab0 <core_bench_matrix+0xae0>
bfc04aa8:	00000000 	nop
bfc04aac:	00003821 	move	a3,zero
bfc04ab0:	8d450008 	lw	a1,8(t2)
bfc04ab4:	3050ffff 	andi	s0,v0,0xffff
bfc04ab8:	00c5882a 	slt	s1,a2,a1
bfc04abc:	00e53821 	addu	a3,a3,a1
bfc04ac0:	02111821 	addu	v1,s0,s1
bfc04ac4:	260e000a 	addiu	t6,s0,10
bfc04ac8:	000e1400 	sll	v0,t6,0x10
bfc04acc:	00032400 	sll	a0,v1,0x10
bfc04ad0:	03c7302a 	slt	a2,s8,a3
bfc04ad4:	00021403 	sra	v0,v0,0x10
bfc04ad8:	10c00002 	beqz	a2,bfc04ae4 <core_bench_matrix+0xb14>
bfc04adc:	00042403 	sra	a0,a0,0x10
bfc04ae0:	00402021 	move	a0,v0
bfc04ae4:	14c00006 	bnez	a2,bfc04b00 <core_bench_matrix+0xb30>
bfc04ae8:	00000000 	nop
bfc04aec:	00e03021 	move	a2,a3
bfc04af0:	25290003 	addiu	t1,t1,3
bfc04af4:	2548000c 	addiu	t0,t2,12
bfc04af8:	0bf01278 	j	bfc049e0 <core_bench_matrix+0xa10>
bfc04afc:	00a01821 	move	v1,a1
bfc04b00:	0bf012bc 	j	bfc04af0 <core_bench_matrix+0xb20>
bfc04b04:	00003021 	move	a2,zero
	...
bfc04b10:	258c0001 	addiu	t4,t4,1
bfc04b14:	8faa001c 	lw	t2,28(sp)
bfc04b18:	0194482b 	sltu	t1,t4,s4
bfc04b1c:	11200003 	beqz	t1,bfc04b2c <core_bench_matrix+0xb5c>
bfc04b20:	016a5821 	addu	t3,t3,t2
bfc04b24:	0bf01235 	j	bfc048d4 <core_bench_matrix+0x904>
bfc04b28:	00e01821 	move	v1,a3
bfc04b2c:	03e02821 	move	a1,ra
bfc04b30:	0ff017d8 	jal	bfc05f60 <crc16>
bfc04b34:	00000000 	nop
bfc04b38:	8fa60030 	lw	a2,48(sp)
bfc04b3c:	8fb6002c 	lw	s6,44(sp)
bfc04b40:	afa20018 	sw	v0,24(sp)
bfc04b44:	afa60014 	sw	a2,20(sp)
bfc04b48:	afa00024 	sw	zero,36(sp)
bfc04b4c:	8fb70014 	lw	s7,20(sp)
bfc04b50:	8fb30028 	lw	s3,40(sp)
bfc04b54:	0000a821 	move	s5,zero
bfc04b58:	86df0000 	lh	ra,0(s6)
bfc04b5c:	86680000 	lh	t0,0(s3)
bfc04b60:	24190001 	li	t9,1
bfc04b64:	011f0018 	mult	t0,ra
bfc04b68:	268bffff 	addiu	t3,s4,-1
bfc04b6c:	0334602b 	sltu	t4,t9,s4
bfc04b70:	31630007 	andi	v1,t3,0x7
bfc04b74:	26d80002 	addiu	t8,s6,2
bfc04b78:	0000f812 	mflo	ra
bfc04b7c:	11800084 	beqz	t4,bfc04d90 <core_bench_matrix+0xdc0>
bfc04b80:	02725021 	addu	t2,s3,s2
bfc04b84:	10600047 	beqz	v1,bfc04ca4 <core_bench_matrix+0xcd4>
bfc04b88:	00000000 	nop
bfc04b8c:	1079003b 	beq	v1,t9,bfc04c7c <core_bench_matrix+0xcac>
bfc04b90:	240b0002 	li	t3,2
bfc04b94:	106b0031 	beq	v1,t3,bfc04c5c <core_bench_matrix+0xc8c>
bfc04b98:	24090003 	li	t1,3
bfc04b9c:	10690027 	beq	v1,t1,bfc04c3c <core_bench_matrix+0xc6c>
bfc04ba0:	24050004 	li	a1,4
bfc04ba4:	1065001d 	beq	v1,a1,bfc04c1c <core_bench_matrix+0xc4c>
bfc04ba8:	240c0005 	li	t4,5
bfc04bac:	106c0013 	beq	v1,t4,bfc04bfc <core_bench_matrix+0xc2c>
bfc04bb0:	24070006 	li	a3,6
bfc04bb4:	10670009 	beq	v1,a3,bfc04bdc <core_bench_matrix+0xc0c>
bfc04bb8:	00000000 	nop
bfc04bbc:	87020000 	lh	v0,0(t8)
bfc04bc0:	85440000 	lh	a0,0(t2)
bfc04bc4:	24190002 	li	t9,2
bfc04bc8:	00820018 	mult	a0,v0
bfc04bcc:	01525021 	addu	t2,t2,s2
bfc04bd0:	26d80004 	addiu	t8,s6,4
bfc04bd4:	00003012 	mflo	a2
bfc04bd8:	03e6f821 	addu	ra,ra,a2
bfc04bdc:	854e0000 	lh	t6,0(t2)
bfc04be0:	87100000 	lh	s0,0(t8)
bfc04be4:	27390001 	addiu	t9,t9,1
bfc04be8:	01d00018 	mult	t6,s0
bfc04bec:	27180002 	addiu	t8,t8,2
bfc04bf0:	01525021 	addu	t2,t2,s2
bfc04bf4:	00004012 	mflo	t0
bfc04bf8:	03e8f821 	addu	ra,ra,t0
bfc04bfc:	854f0000 	lh	t7,0(t2)
bfc04c00:	870d0000 	lh	t5,0(t8)
bfc04c04:	27390001 	addiu	t9,t9,1
bfc04c08:	01ed0018 	mult	t7,t5
bfc04c0c:	27180002 	addiu	t8,t8,2
bfc04c10:	01525021 	addu	t2,t2,s2
bfc04c14:	00008812 	mflo	s1
bfc04c18:	03f1f821 	addu	ra,ra,s1
bfc04c1c:	854b0000 	lh	t3,0(t2)
bfc04c20:	87090000 	lh	t1,0(t8)
bfc04c24:	27390001 	addiu	t9,t9,1
bfc04c28:	01690018 	mult	t3,t1
bfc04c2c:	27180002 	addiu	t8,t8,2
bfc04c30:	01525021 	addu	t2,t2,s2
bfc04c34:	00001812 	mflo	v1
bfc04c38:	03e3f821 	addu	ra,ra,v1
bfc04c3c:	854c0000 	lh	t4,0(t2)
bfc04c40:	87070000 	lh	a3,0(t8)
bfc04c44:	27390001 	addiu	t9,t9,1
bfc04c48:	01870018 	mult	t4,a3
bfc04c4c:	27180002 	addiu	t8,t8,2
bfc04c50:	01525021 	addu	t2,t2,s2
bfc04c54:	00002812 	mflo	a1
bfc04c58:	03e5f821 	addu	ra,ra,a1
bfc04c5c:	85440000 	lh	a0,0(t2)
bfc04c60:	87020000 	lh	v0,0(t8)
bfc04c64:	27390001 	addiu	t9,t9,1
bfc04c68:	00820018 	mult	a0,v0
bfc04c6c:	27180002 	addiu	t8,t8,2
bfc04c70:	01525021 	addu	t2,t2,s2
bfc04c74:	00003012 	mflo	a2
bfc04c78:	03e6f821 	addu	ra,ra,a2
bfc04c7c:	85500000 	lh	s0,0(t2)
bfc04c80:	87110000 	lh	s1,0(t8)
bfc04c84:	27390001 	addiu	t9,t9,1
bfc04c88:	02110018 	mult	s0,s1
bfc04c8c:	0334402b 	sltu	t0,t9,s4
bfc04c90:	27180002 	addiu	t8,t8,2
bfc04c94:	01525021 	addu	t2,t2,s2
bfc04c98:	00007012 	mflo	t6
bfc04c9c:	1100003c 	beqz	t0,bfc04d90 <core_bench_matrix+0xdc0>
bfc04ca0:	03eef821 	addu	ra,ra,t6
bfc04ca4:	854f0000 	lh	t7,0(t2)
bfc04ca8:	87080000 	lh	t0,0(t8)
bfc04cac:	01523821 	addu	a3,t2,s2
bfc04cb0:	01e80018 	mult	t7,t0
bfc04cb4:	870d0002 	lh	t5,2(t8)
bfc04cb8:	84ec0000 	lh	t4,0(a3)
bfc04cbc:	00f27021 	addu	t6,a3,s2
bfc04cc0:	87110004 	lh	s1,4(t8)
bfc04cc4:	85c90000 	lh	t1,0(t6)
bfc04cc8:	01d23021 	addu	a2,t6,s2
bfc04ccc:	87100006 	lh	s0,6(t8)
bfc04cd0:	84c80000 	lh	t0,0(a2)
bfc04cd4:	00d22021 	addu	a0,a2,s2
bfc04cd8:	870f0008 	lh	t7,8(t8)
bfc04cdc:	84870000 	lh	a3,0(a0)
bfc04ce0:	00922821 	addu	a1,a0,s2
bfc04ce4:	00001012 	mflo	v0
bfc04ce8:	870e000a 	lh	t6,10(t8)
bfc04cec:	03e21021 	addu	v0,ra,v0
bfc04cf0:	84a60000 	lh	a2,0(a1)
bfc04cf4:	018d0018 	mult	t4,t5
bfc04cf8:	00b21821 	addu	v1,a1,s2
bfc04cfc:	870c000c 	lh	t4,12(t8)
bfc04d00:	84640000 	lh	a0,0(v1)
bfc04d04:	00725021 	addu	t2,v1,s2
bfc04d08:	85430000 	lh	v1,0(t2)
bfc04d0c:	870d000e 	lh	t5,14(t8)
bfc04d10:	27390008 	addiu	t9,t9,8
bfc04d14:	0334282b 	sltu	a1,t9,s4
bfc04d18:	27180010 	addiu	t8,t8,16
bfc04d1c:	01525021 	addu	t2,t2,s2
bfc04d20:	00005812 	mflo	t3
	...
bfc04d2c:	01310018 	mult	t1,s1
bfc04d30:	004b8821 	addu	s1,v0,t3
bfc04d34:	00004812 	mflo	t1
bfc04d38:	02295821 	addu	t3,s1,t1
bfc04d3c:	00000000 	nop
bfc04d40:	01100018 	mult	t0,s0
bfc04d44:	0000f812 	mflo	ra
bfc04d48:	017f4821 	addu	t1,t3,ra
bfc04d4c:	00000000 	nop
bfc04d50:	00ef0018 	mult	a3,t7
bfc04d54:	00003812 	mflo	a3
bfc04d58:	01271021 	addu	v0,t1,a3
bfc04d5c:	00000000 	nop
bfc04d60:	00ce0018 	mult	a2,t6
bfc04d64:	00008012 	mflo	s0
bfc04d68:	00507821 	addu	t7,v0,s0
bfc04d6c:	00000000 	nop
bfc04d70:	008c0018 	mult	a0,t4
bfc04d74:	00007012 	mflo	t6
bfc04d78:	01ee8821 	addu	s1,t7,t6
bfc04d7c:	00000000 	nop
bfc04d80:	006d0018 	mult	v1,t5
bfc04d84:	00001812 	mflo	v1
bfc04d88:	14a0ffc6 	bnez	a1,bfc04ca4 <core_bench_matrix+0xcd4>
bfc04d8c:	0223f821 	addu	ra,s1,v1
bfc04d90:	26b50001 	addiu	s5,s5,1
bfc04d94:	02b4c02b 	sltu	t8,s5,s4
bfc04d98:	aeff0000 	sw	ra,0(s7)
bfc04d9c:	26730002 	addiu	s3,s3,2
bfc04da0:	1700ff6d 	bnez	t8,bfc04b58 <core_bench_matrix+0xb88>
bfc04da4:	26f70004 	addiu	s7,s7,4
bfc04da8:	8fb00024 	lw	s0,36(sp)
bfc04dac:	8fb50014 	lw	s5,20(sp)
bfc04db0:	8fb9001c 	lw	t9,28(sp)
bfc04db4:	261f0001 	addiu	ra,s0,1
bfc04db8:	02b99821 	addu	s3,s5,t9
bfc04dbc:	03f4b82b 	sltu	s7,ra,s4
bfc04dc0:	afbf0024 	sw	ra,36(sp)
bfc04dc4:	02d2b021 	addu	s6,s6,s2
bfc04dc8:	16e0ff60 	bnez	s7,bfc04b4c <core_bench_matrix+0xb7c>
bfc04dcc:	afb30014 	sw	s3,20(sp)
bfc04dd0:	8fab0030 	lw	t3,48(sp)
bfc04dd4:	00003021 	move	a2,zero
bfc04dd8:	00001821 	move	v1,zero
bfc04ddc:	00002021 	move	a0,zero
bfc04de0:	00006021 	move	t4,zero
bfc04de4:	2687ffff 	addiu	a3,s4,-1
bfc04de8:	30ea0003 	andi	t2,a3,0x3
bfc04dec:	01604021 	move	t0,t3
bfc04df0:	1140003f 	beqz	t2,bfc04ef0 <core_bench_matrix+0xf20>
bfc04df4:	00004821 	move	t1,zero
bfc04df8:	8d670000 	lw	a3,0(t3)
bfc04dfc:	3090ffff 	andi	s0,a0,0xffff
bfc04e00:	0067c82a 	slt	t9,v1,a3
bfc04e04:	00c73021 	addu	a2,a2,a3
bfc04e08:	0219c021 	addu	t8,s0,t9
bfc04e0c:	2613000a 	addiu	s3,s0,10
bfc04e10:	00137400 	sll	t6,s3,0x10
bfc04e14:	0018bc00 	sll	s7,t8,0x10
bfc04e18:	03c6282a 	slt	a1,s8,a2
bfc04e1c:	000e1403 	sra	v0,t6,0x10
bfc04e20:	10a00002 	beqz	a1,bfc04e2c <core_bench_matrix+0xe5c>
bfc04e24:	00172403 	sra	a0,s7,0x10
bfc04e28:	00402021 	move	a0,v0
bfc04e2c:	10a00002 	beqz	a1,bfc04e38 <core_bench_matrix+0xe68>
bfc04e30:	24090001 	li	t1,1
bfc04e34:	00003021 	move	a2,zero
bfc04e38:	0134882b 	sltu	s1,t1,s4
bfc04e3c:	12200078 	beqz	s1,bfc05020 <core_bench_matrix+0x1050>
bfc04e40:	25680004 	addiu	t0,t3,4
bfc04e44:	1149002a 	beq	t2,t1,bfc04ef0 <core_bench_matrix+0xf20>
bfc04e48:	00e01821 	move	v1,a3
bfc04e4c:	24150002 	li	s5,2
bfc04e50:	11550014 	beq	t2,s5,bfc04ea4 <core_bench_matrix+0xed4>
bfc04e54:	309fffff 	andi	ra,a0,0xffff
bfc04e58:	8d050000 	lw	a1,0(t0)
bfc04e5c:	00000000 	nop
bfc04e60:	00c55021 	addu	t2,a2,a1
bfc04e64:	00e5302a 	slt	a2,a3,a1
bfc04e68:	03e67821 	addu	t7,ra,a2
bfc04e6c:	27e7000a 	addiu	a3,ra,10
bfc04e70:	00076c00 	sll	t5,a3,0x10
bfc04e74:	000fb400 	sll	s6,t7,0x10
bfc04e78:	03ca302a 	slt	a2,s8,t2
bfc04e7c:	000d1403 	sra	v0,t5,0x10
bfc04e80:	10c00002 	beqz	a2,bfc04e8c <core_bench_matrix+0xebc>
bfc04e84:	00162403 	sra	a0,s6,0x10
bfc04e88:	00402021 	move	a0,v0
bfc04e8c:	14c00002 	bnez	a2,bfc04e98 <core_bench_matrix+0xec8>
bfc04e90:	00003021 	move	a2,zero
bfc04e94:	01403021 	move	a2,t2
bfc04e98:	25290001 	addiu	t1,t1,1
bfc04e9c:	25080004 	addiu	t0,t0,4
bfc04ea0:	00a01821 	move	v1,a1
bfc04ea4:	8d050000 	lw	a1,0(t0)
bfc04ea8:	3097ffff 	andi	s7,a0,0xffff
bfc04eac:	0065c02a 	slt	t8,v1,a1
bfc04eb0:	26e2000a 	addiu	v0,s7,10
bfc04eb4:	00c53821 	addu	a3,a2,a1
bfc04eb8:	02f81821 	addu	v1,s7,t8
bfc04ebc:	00022400 	sll	a0,v0,0x10
bfc04ec0:	00035400 	sll	t2,v1,0x10
bfc04ec4:	03c7302a 	slt	a2,s8,a3
bfc04ec8:	00041403 	sra	v0,a0,0x10
bfc04ecc:	10c00002 	beqz	a2,bfc04ed8 <core_bench_matrix+0xf08>
bfc04ed0:	000a2403 	sra	a0,t2,0x10
bfc04ed4:	00402021 	move	a0,v0
bfc04ed8:	14c00002 	bnez	a2,bfc04ee4 <core_bench_matrix+0xf14>
bfc04edc:	00003021 	move	a2,zero
bfc04ee0:	00e03021 	move	a2,a3
bfc04ee4:	25290001 	addiu	t1,t1,1
bfc04ee8:	25080004 	addiu	t0,t0,4
bfc04eec:	00a01821 	move	v1,a1
bfc04ef0:	8d070000 	lw	a3,0(t0)
bfc04ef4:	3085ffff 	andi	a1,a0,0xffff
bfc04ef8:	0067b82a 	slt	s7,v1,a3
bfc04efc:	00b72021 	addu	a0,a1,s7
bfc04f00:	24b8000a 	addiu	t8,a1,10
bfc04f04:	00c73021 	addu	a2,a2,a3
bfc04f08:	00187c00 	sll	t7,t8,0x10
bfc04f0c:	00045400 	sll	t2,a0,0x10
bfc04f10:	03c6282a 	slt	a1,s8,a2
bfc04f14:	000f1403 	sra	v0,t7,0x10
bfc04f18:	10a00002 	beqz	a1,bfc04f24 <core_bench_matrix+0xf54>
bfc04f1c:	000a2403 	sra	a0,t2,0x10
bfc04f20:	00402021 	move	a0,v0
bfc04f24:	10a00002 	beqz	a1,bfc04f30 <core_bench_matrix+0xf60>
bfc04f28:	00000000 	nop
bfc04f2c:	00003021 	move	a2,zero
bfc04f30:	25290001 	addiu	t1,t1,1
bfc04f34:	0134982b 	sltu	s3,t1,s4
bfc04f38:	12600039 	beqz	s3,bfc05020 <core_bench_matrix+0x1050>
bfc04f3c:	250a0004 	addiu	t2,t0,4
bfc04f40:	8d050004 	lw	a1,4(t0)
bfc04f44:	308effff 	andi	t6,a0,0xffff
bfc04f48:	00e5182a 	slt	v1,a3,a1
bfc04f4c:	25c2000a 	addiu	v0,t6,10
bfc04f50:	00c54021 	addu	t0,a2,a1
bfc04f54:	01c38821 	addu	s1,t6,v1
bfc04f58:	00026c00 	sll	t5,v0,0x10
bfc04f5c:	0011b400 	sll	s6,s1,0x10
bfc04f60:	03c8302a 	slt	a2,s8,t0
bfc04f64:	000d2403 	sra	a0,t5,0x10
bfc04f68:	10c00002 	beqz	a2,bfc04f74 <core_bench_matrix+0xfa4>
bfc04f6c:	00161403 	sra	v0,s6,0x10
bfc04f70:	00801021 	move	v0,a0
bfc04f74:	14c00002 	bnez	a2,bfc04f80 <core_bench_matrix+0xfb0>
bfc04f78:	00003821 	move	a3,zero
bfc04f7c:	01003821 	move	a3,t0
bfc04f80:	8d460004 	lw	a2,4(t2)
bfc04f84:	3059ffff 	andi	t9,v0,0xffff
bfc04f88:	00a6882a 	slt	s1,a1,a2
bfc04f8c:	00e63821 	addu	a3,a3,a2
bfc04f90:	03317021 	addu	t6,t9,s1
bfc04f94:	2730000a 	addiu	s0,t9,10
bfc04f98:	00109c00 	sll	s3,s0,0x10
bfc04f9c:	000e4400 	sll	t0,t6,0x10
bfc04fa0:	03c7282a 	slt	a1,s8,a3
bfc04fa4:	00132403 	sra	a0,s3,0x10
bfc04fa8:	10a00002 	beqz	a1,bfc04fb4 <core_bench_matrix+0xfe4>
bfc04fac:	00081403 	sra	v0,t0,0x10
bfc04fb0:	00801021 	move	v0,a0
bfc04fb4:	10a00002 	beqz	a1,bfc04fc0 <core_bench_matrix+0xff0>
bfc04fb8:	00000000 	nop
bfc04fbc:	00003821 	move	a3,zero
bfc04fc0:	8d450008 	lw	a1,8(t2)
bfc04fc4:	305fffff 	andi	ra,v0,0xffff
bfc04fc8:	00c5182a 	slt	v1,a2,a1
bfc04fcc:	00e53821 	addu	a3,a3,a1
bfc04fd0:	03e3b021 	addu	s6,ra,v1
bfc04fd4:	27ed000a 	addiu	t5,ra,10
bfc04fd8:	000d7c00 	sll	t7,t5,0x10
bfc04fdc:	0016ac00 	sll	s5,s6,0x10
bfc04fe0:	03c7302a 	slt	a2,s8,a3
bfc04fe4:	000f1403 	sra	v0,t7,0x10
bfc04fe8:	10c00002 	beqz	a2,bfc04ff4 <core_bench_matrix+0x1024>
bfc04fec:	00152403 	sra	a0,s5,0x10
bfc04ff0:	00402021 	move	a0,v0
bfc04ff4:	14c00006 	bnez	a2,bfc05010 <core_bench_matrix+0x1040>
bfc04ff8:	00000000 	nop
bfc04ffc:	00e03021 	move	a2,a3
bfc05000:	25290003 	addiu	t1,t1,3
bfc05004:	2548000c 	addiu	t0,t2,12
bfc05008:	0bf013bc 	j	bfc04ef0 <core_bench_matrix+0xf20>
bfc0500c:	00a01821 	move	v1,a1
bfc05010:	0bf01400 	j	bfc05000 <core_bench_matrix+0x1030>
bfc05014:	00003021 	move	a2,zero
	...
bfc05020:	258c0001 	addiu	t4,t4,1
bfc05024:	8fa8001c 	lw	t0,28(sp)
bfc05028:	0194482b 	sltu	t1,t4,s4
bfc0502c:	11200003 	beqz	t1,bfc0503c <core_bench_matrix+0x106c>
bfc05030:	01685821 	addu	t3,t3,t0
bfc05034:	0bf01379 	j	bfc04de4 <core_bench_matrix+0xe14>
bfc05038:	00e01821 	move	v1,a3
bfc0503c:	8fa50018 	lw	a1,24(sp)
bfc05040:	0ff017d8 	jal	bfc05f60 <crc16>
bfc05044:	0000b021 	move	s6,zero
bfc05048:	8fb3002c 	lw	s3,44(sp)
bfc0504c:	8fb50030 	lw	s5,48(sp)
bfc05050:	0040b821 	move	s7,v0
bfc05054:	8fb10028 	lw	s1,40(sp)
bfc05058:	02a0c021 	move	t8,s5
bfc0505c:	0000c821 	move	t9,zero
bfc05060:	862e0000 	lh	t6,0(s1)
bfc05064:	86630000 	lh	v1,0(s3)
bfc05068:	240f0001 	li	t7,1
bfc0506c:	01c30018 	mult	t6,v1
bfc05070:	268dffff 	addiu	t5,s4,-1
bfc05074:	01f4582b 	sltu	t3,t7,s4
bfc05078:	31a40003 	andi	a0,t5,0x3
bfc0507c:	02327021 	addu	t6,s1,s2
bfc05080:	00001012 	mflo	v0
bfc05084:	00028143 	sra	s0,v0,0x5
bfc05088:	0002f883 	sra	ra,v0,0x2
bfc0508c:	320c007f 	andi	t4,s0,0x7f
bfc05090:	33e6000f 	andi	a2,ra,0xf
bfc05094:	01860018 	mult	t4,a2
bfc05098:	00008012 	mflo	s0
bfc0509c:	1160006a 	beqz	t3,bfc05248 <core_bench_matrix+0x1278>
bfc050a0:	266d0002 	addiu	t5,s3,2
bfc050a4:	10800031 	beqz	a0,bfc0516c <core_bench_matrix+0x119c>
bfc050a8:	00000000 	nop
bfc050ac:	108f001f 	beq	a0,t7,bfc0512c <core_bench_matrix+0x115c>
bfc050b0:	240b0002 	li	t3,2
bfc050b4:	108b000f 	beq	a0,t3,bfc050f4 <core_bench_matrix+0x1124>
bfc050b8:	00000000 	nop
bfc050bc:	85af0000 	lh	t7,0(t5)
bfc050c0:	85cd0000 	lh	t5,0(t6)
bfc050c4:	01d27021 	addu	t6,t6,s2
bfc050c8:	01af0018 	mult	t5,t7
bfc050cc:	240f0002 	li	t7,2
bfc050d0:	266d0004 	addiu	t5,s3,4
bfc050d4:	00004012 	mflo	t0
bfc050d8:	00085083 	sra	t2,t0,0x2
bfc050dc:	00083143 	sra	a2,t0,0x5
bfc050e0:	30c7007f 	andi	a3,a2,0x7f
bfc050e4:	3145000f 	andi	a1,t2,0xf
bfc050e8:	00e50018 	mult	a3,a1
bfc050ec:	00004812 	mflo	t1
bfc050f0:	02098021 	addu	s0,s0,t1
bfc050f4:	85c90000 	lh	t1,0(t6)
bfc050f8:	85a50000 	lh	a1,0(t5)
bfc050fc:	25ef0001 	addiu	t7,t7,1
bfc05100:	01250018 	mult	t1,a1
bfc05104:	25ad0002 	addiu	t5,t5,2
bfc05108:	01d27021 	addu	t6,t6,s2
bfc0510c:	00005812 	mflo	t3
bfc05110:	000b2083 	sra	a0,t3,0x2
bfc05114:	000b1143 	sra	v0,t3,0x5
bfc05118:	305f007f 	andi	ra,v0,0x7f
bfc0511c:	3083000f 	andi	v1,a0,0xf
bfc05120:	03e30018 	mult	ra,v1
bfc05124:	00006012 	mflo	t4
bfc05128:	020c8021 	addu	s0,s0,t4
bfc0512c:	85c40000 	lh	a0,0(t6)
bfc05130:	85a20000 	lh	v0,0(t5)
bfc05134:	25ef0001 	addiu	t7,t7,1
bfc05138:	00820018 	mult	a0,v0
bfc0513c:	01f4382b 	sltu	a3,t7,s4
bfc05140:	25ad0002 	addiu	t5,t5,2
bfc05144:	01d27021 	addu	t6,t6,s2
bfc05148:	00001812 	mflo	v1
bfc0514c:	00036083 	sra	t4,v1,0x2
bfc05150:	0003f943 	sra	ra,v1,0x5
bfc05154:	33e6007f 	andi	a2,ra,0x7f
bfc05158:	3188000f 	andi	t0,t4,0xf
bfc0515c:	00c80018 	mult	a2,t0
bfc05160:	00005012 	mflo	t2
bfc05164:	10e00038 	beqz	a3,bfc05248 <core_bench_matrix+0x1278>
bfc05168:	020a8021 	addu	s0,s0,t2
bfc0516c:	85c60000 	lh	a2,0(t6)
bfc05170:	85a30000 	lh	v1,0(t5)
bfc05174:	01d26021 	addu	t4,t6,s2
bfc05178:	00c30018 	mult	a2,v1
bfc0517c:	85a90002 	lh	t1,2(t5)
bfc05180:	85850000 	lh	a1,0(t4)
bfc05184:	01927021 	addu	t6,t4,s2
bfc05188:	85aa0004 	lh	t2,4(t5)
bfc0518c:	85c40000 	lh	a0,0(t6)
bfc05190:	01d23821 	addu	a3,t6,s2
bfc05194:	85a30006 	lh	v1,6(t5)
bfc05198:	84e60000 	lh	a2,0(a3)
bfc0519c:	00f27021 	addu	t6,a3,s2
bfc051a0:	25ef0004 	addiu	t7,t7,4
bfc051a4:	01f4602b 	sltu	t4,t7,s4
bfc051a8:	25ad0008 	addiu	t5,t5,8
bfc051ac:	0000f812 	mflo	ra
bfc051b0:	001f4083 	sra	t0,ra,0x2
bfc051b4:	001f1143 	sra	v0,ra,0x5
bfc051b8:	00a90018 	mult	a1,t1
bfc051bc:	305f007f 	andi	ra,v0,0x7f
bfc051c0:	3108000f 	andi	t0,t0,0xf
bfc051c4:	00005812 	mflo	t3
bfc051c8:	000b4883 	sra	t1,t3,0x2
bfc051cc:	000b2943 	sra	a1,t3,0x5
bfc051d0:	008a0018 	mult	a0,t2
bfc051d4:	30a5007f 	andi	a1,a1,0x7f
bfc051d8:	3129000f 	andi	t1,t1,0xf
bfc051dc:	00003812 	mflo	a3
bfc051e0:	00075083 	sra	t2,a3,0x2
bfc051e4:	00072143 	sra	a0,a3,0x5
bfc051e8:	00c30018 	mult	a2,v1
bfc051ec:	3084007f 	andi	a0,a0,0x7f
bfc051f0:	3147000f 	andi	a3,t2,0xf
bfc051f4:	00005812 	mflo	t3
bfc051f8:	000b1943 	sra	v1,t3,0x5
bfc051fc:	000b3083 	sra	a2,t3,0x2
bfc05200:	03e80018 	mult	ra,t0
bfc05204:	30cb000f 	andi	t3,a2,0xf
bfc05208:	3068007f 	andi	t0,v1,0x7f
bfc0520c:	00001012 	mflo	v0
bfc05210:	0202f821 	addu	ra,s0,v0
bfc05214:	00000000 	nop
bfc05218:	00a90018 	mult	a1,t1
bfc0521c:	00005012 	mflo	t2
bfc05220:	03ea4821 	addu	t1,ra,t2
bfc05224:	00000000 	nop
bfc05228:	00870018 	mult	a0,a3
bfc0522c:	00002012 	mflo	a0
bfc05230:	01245021 	addu	t2,t1,a0
bfc05234:	00000000 	nop
bfc05238:	010b0018 	mult	t0,t3
bfc0523c:	00002812 	mflo	a1
bfc05240:	1580ffca 	bnez	t4,bfc0516c <core_bench_matrix+0x119c>
bfc05244:	01458021 	addu	s0,t2,a1
bfc05248:	27390001 	addiu	t9,t9,1
bfc0524c:	0334782b 	sltu	t7,t9,s4
bfc05250:	af100000 	sw	s0,0(t8)
bfc05254:	26310002 	addiu	s1,s1,2
bfc05258:	15e0ff81 	bnez	t7,bfc05060 <core_bench_matrix+0x1090>
bfc0525c:	27180004 	addiu	t8,t8,4
bfc05260:	26d60001 	addiu	s6,s6,1
bfc05264:	8fb1001c 	lw	s1,28(sp)
bfc05268:	02d4c82b 	sltu	t9,s6,s4
bfc0526c:	02729821 	addu	s3,s3,s2
bfc05270:	1720ff78 	bnez	t9,bfc05054 <core_bench_matrix+0x1084>
bfc05274:	02b1a821 	addu	s5,s5,s1
bfc05278:	00003021 	move	a2,zero
bfc0527c:	00001821 	move	v1,zero
bfc05280:	00002021 	move	a0,zero
bfc05284:	00005821 	move	t3,zero
bfc05288:	2687ffff 	addiu	a3,s4,-1
bfc0528c:	30ea0003 	andi	t2,a3,0x3
bfc05290:	8fa80020 	lw	t0,32(sp)
bfc05294:	11400040 	beqz	t2,bfc05398 <core_bench_matrix+0x13c8>
bfc05298:	00004821 	move	t1,zero
bfc0529c:	8d070000 	lw	a3,0(t0)
bfc052a0:	3093ffff 	andi	s3,a0,0xffff
bfc052a4:	0067802a 	slt	s0,v1,a3
bfc052a8:	00c73021 	addu	a2,a2,a3
bfc052ac:	02707021 	addu	t6,s3,s0
bfc052b0:	266c000a 	addiu	t4,s3,10
bfc052b4:	000c7c00 	sll	t7,t4,0x10
bfc052b8:	000e6c00 	sll	t5,t6,0x10
bfc052bc:	03c6282a 	slt	a1,s8,a2
bfc052c0:	000f1403 	sra	v0,t7,0x10
bfc052c4:	10a00002 	beqz	a1,bfc052d0 <core_bench_matrix+0x1300>
bfc052c8:	000d2403 	sra	a0,t5,0x10
bfc052cc:	00402021 	move	a0,v0
bfc052d0:	10a00002 	beqz	a1,bfc052dc <core_bench_matrix+0x130c>
bfc052d4:	24090001 	li	t1,1
bfc052d8:	00003021 	move	a2,zero
bfc052dc:	8fa30020 	lw	v1,32(sp)
bfc052e0:	0134282b 	sltu	a1,t1,s4
bfc052e4:	10a0007b 	beqz	a1,bfc054d4 <core_bench_matrix+0x1504>
bfc052e8:	24680004 	addiu	t0,v1,4
bfc052ec:	1149002a 	beq	t2,t1,bfc05398 <core_bench_matrix+0x13c8>
bfc052f0:	00e01821 	move	v1,a3
bfc052f4:	24020002 	li	v0,2
bfc052f8:	11420014 	beq	t2,v0,bfc0534c <core_bench_matrix+0x137c>
bfc052fc:	3095ffff 	andi	s5,a0,0xffff
bfc05300:	8d050000 	lw	a1,0(t0)
bfc05304:	00000000 	nop
bfc05308:	00e5b02a 	slt	s6,a3,a1
bfc0530c:	02b62021 	addu	a0,s5,s6
bfc05310:	00c55021 	addu	t2,a2,a1
bfc05314:	26b1000a 	addiu	s1,s5,10
bfc05318:	0011cc00 	sll	t9,s1,0x10
bfc0531c:	00043c00 	sll	a3,a0,0x10
bfc05320:	03ca302a 	slt	a2,s8,t2
bfc05324:	00191403 	sra	v0,t9,0x10
bfc05328:	10c00002 	beqz	a2,bfc05334 <core_bench_matrix+0x1364>
bfc0532c:	00072403 	sra	a0,a3,0x10
bfc05330:	00402021 	move	a0,v0
bfc05334:	14c00002 	bnez	a2,bfc05340 <core_bench_matrix+0x1370>
bfc05338:	00003021 	move	a2,zero
bfc0533c:	01403021 	move	a2,t2
bfc05340:	25290001 	addiu	t1,t1,1
bfc05344:	25080004 	addiu	t0,t0,4
bfc05348:	00a01821 	move	v1,a1
bfc0534c:	8d050000 	lw	a1,0(t0)
bfc05350:	308fffff 	andi	t7,a0,0xffff
bfc05354:	00c53821 	addu	a3,a2,a1
bfc05358:	0065302a 	slt	a2,v1,a1
bfc0535c:	01e6c021 	addu	t8,t7,a2
bfc05360:	25ee000a 	addiu	t6,t7,10
bfc05364:	000e6c00 	sll	t5,t6,0x10
bfc05368:	00185400 	sll	t2,t8,0x10
bfc0536c:	03c7302a 	slt	a2,s8,a3
bfc05370:	000d1403 	sra	v0,t5,0x10
bfc05374:	10c00002 	beqz	a2,bfc05380 <core_bench_matrix+0x13b0>
bfc05378:	000a2403 	sra	a0,t2,0x10
bfc0537c:	00402021 	move	a0,v0
bfc05380:	14c00002 	bnez	a2,bfc0538c <core_bench_matrix+0x13bc>
bfc05384:	00003021 	move	a2,zero
bfc05388:	00e03021 	move	a2,a3
bfc0538c:	25290001 	addiu	t1,t1,1
bfc05390:	25080004 	addiu	t0,t0,4
bfc05394:	00a01821 	move	v1,a1
bfc05398:	8d070000 	lw	a3,0(t0)
bfc0539c:	3085ffff 	andi	a1,a0,0xffff
bfc053a0:	0067702a 	slt	t6,v1,a3
bfc053a4:	00ae5021 	addu	t2,a1,t6
bfc053a8:	24bf000a 	addiu	ra,a1,10
bfc053ac:	00c73021 	addu	a2,a2,a3
bfc053b0:	001f1400 	sll	v0,ra,0x10
bfc053b4:	000a2400 	sll	a0,t2,0x10
bfc053b8:	03c6282a 	slt	a1,s8,a2
bfc053bc:	00021403 	sra	v0,v0,0x10
bfc053c0:	10a00002 	beqz	a1,bfc053cc <core_bench_matrix+0x13fc>
bfc053c4:	00042403 	sra	a0,a0,0x10
bfc053c8:	00402021 	move	a0,v0
bfc053cc:	10a00002 	beqz	a1,bfc053d8 <core_bench_matrix+0x1408>
bfc053d0:	00000000 	nop
bfc053d4:	00003021 	move	a2,zero
bfc053d8:	25290001 	addiu	t1,t1,1
bfc053dc:	0134602b 	sltu	t4,t1,s4
bfc053e0:	1180003b 	beqz	t4,bfc054d0 <core_bench_matrix+0x1500>
bfc053e4:	250a0004 	addiu	t2,t0,4
bfc053e8:	8d050004 	lw	a1,4(t0)
bfc053ec:	3090ffff 	andi	s0,a0,0xffff
bfc053f0:	00e5682a 	slt	t5,a3,a1
bfc053f4:	00c54021 	addu	t0,a2,a1
bfc053f8:	020db021 	addu	s6,s0,t5
bfc053fc:	2613000a 	addiu	s3,s0,10
bfc05400:	0013c400 	sll	t8,s3,0x10
bfc05404:	0016ac00 	sll	s5,s6,0x10
bfc05408:	03c8302a 	slt	a2,s8,t0
bfc0540c:	00182403 	sra	a0,t8,0x10
bfc05410:	10c00002 	beqz	a2,bfc0541c <core_bench_matrix+0x144c>
bfc05414:	00151403 	sra	v0,s5,0x10
bfc05418:	00801021 	move	v0,a0
bfc0541c:	14c00002 	bnez	a2,bfc05428 <core_bench_matrix+0x1458>
bfc05420:	00003821 	move	a3,zero
bfc05424:	01003821 	move	a3,t0
bfc05428:	8d460004 	lw	a2,4(t2)
bfc0542c:	305fffff 	andi	ra,v0,0xffff
bfc05430:	00a6182a 	slt	v1,a1,a2
bfc05434:	00e63821 	addu	a3,a3,a2
bfc05438:	03e36021 	addu	t4,ra,v1
bfc0543c:	27f0000a 	addiu	s0,ra,10
bfc05440:	00109c00 	sll	s3,s0,0x10
bfc05444:	000c4400 	sll	t0,t4,0x10
bfc05448:	03c7282a 	slt	a1,s8,a3
bfc0544c:	00132403 	sra	a0,s3,0x10
bfc05450:	10a00002 	beqz	a1,bfc0545c <core_bench_matrix+0x148c>
bfc05454:	00081403 	sra	v0,t0,0x10
bfc05458:	00801021 	move	v0,a0
bfc0545c:	10a00002 	beqz	a1,bfc05468 <core_bench_matrix+0x1498>
bfc05460:	00000000 	nop
bfc05464:	00003821 	move	a3,zero
bfc05468:	8d450008 	lw	a1,8(t2)
bfc0546c:	3055ffff 	andi	s5,v0,0xffff
bfc05470:	00c5b02a 	slt	s6,a2,a1
bfc05474:	00e53821 	addu	a3,a3,a1
bfc05478:	02b6c821 	addu	t9,s5,s6
bfc0547c:	26b1000a 	addiu	s1,s5,10
bfc05480:	00111400 	sll	v0,s1,0x10
bfc05484:	00192400 	sll	a0,t9,0x10
bfc05488:	03c7302a 	slt	a2,s8,a3
bfc0548c:	00021403 	sra	v0,v0,0x10
bfc05490:	10c00002 	beqz	a2,bfc0549c <core_bench_matrix+0x14cc>
bfc05494:	00042403 	sra	a0,a0,0x10
bfc05498:	00402021 	move	a0,v0
bfc0549c:	14c00008 	bnez	a2,bfc054c0 <core_bench_matrix+0x14f0>
bfc054a0:	00000000 	nop
bfc054a4:	00e03021 	move	a2,a3
bfc054a8:	25290003 	addiu	t1,t1,3
bfc054ac:	2548000c 	addiu	t0,t2,12
bfc054b0:	0bf014e6 	j	bfc05398 <core_bench_matrix+0x13c8>
bfc054b4:	00a01821 	move	v1,a1
	...
bfc054c0:	0bf0152a 	j	bfc054a8 <core_bench_matrix+0x14d8>
bfc054c4:	00003021 	move	a2,zero
	...
bfc054d0:	8fa30020 	lw	v1,32(sp)
bfc054d4:	8faf001c 	lw	t7,28(sp)
bfc054d8:	256b0001 	addiu	t3,t3,1
bfc054dc:	006f4821 	addu	t1,v1,t7
bfc054e0:	0174402b 	sltu	t0,t3,s4
bfc054e4:	11000003 	beqz	t0,bfc054f4 <core_bench_matrix+0x1524>
bfc054e8:	afa90020 	sw	t1,32(sp)
bfc054ec:	0bf014a2 	j	bfc05288 <core_bench_matrix+0x12b8>
bfc054f0:	00e01821 	move	v1,a3
bfc054f4:	0ff017d8 	jal	bfc05f60 <crc16>
bfc054f8:	02e02821 	move	a1,s7
bfc054fc:	8fb70034 	lw	s7,52(sp)
bfc05500:	00407821 	move	t7,v0
bfc05504:	0017f023 	negu	s8,s7
bfc05508:	33cdffff 	andi	t5,s8,0xffff
bfc0550c:	00007021 	move	t6,zero
bfc05510:	8fb90010 	lw	t9,16(sp)
bfc05514:	240c0001 	li	t4,1
bfc05518:	97360000 	lhu	s6,0(t9)
bfc0551c:	2691ffff 	addiu	s1,s4,-1
bfc05520:	01b6a821 	addu	s5,t5,s6
bfc05524:	0194b82b 	sltu	s7,t4,s4
bfc05528:	a7350000 	sh	s5,0(t9)
bfc0552c:	32230007 	andi	v1,s1,0x7
bfc05530:	12e00051 	beqz	s7,bfc05678 <core_bench_matrix+0x16a8>
bfc05534:	272b0002 	addiu	t3,t9,2
bfc05538:	10600033 	beqz	v1,bfc05608 <core_bench_matrix+0x1638>
bfc0553c:	00000000 	nop
bfc05540:	106c002a 	beq	v1,t4,bfc055ec <core_bench_matrix+0x161c>
bfc05544:	24060002 	li	a2,2
bfc05548:	10660023 	beq	v1,a2,bfc055d8 <core_bench_matrix+0x1608>
bfc0554c:	24180003 	li	t8,3
bfc05550:	1078001c 	beq	v1,t8,bfc055c4 <core_bench_matrix+0x15f4>
bfc05554:	24130004 	li	s3,4
bfc05558:	10730015 	beq	v1,s3,bfc055b0 <core_bench_matrix+0x15e0>
bfc0555c:	24100005 	li	s0,5
bfc05560:	1070000e 	beq	v1,s0,bfc0559c <core_bench_matrix+0x15cc>
bfc05564:	240a0006 	li	t2,6
bfc05568:	106a0007 	beq	v1,t2,bfc05588 <core_bench_matrix+0x15b8>
bfc0556c:	00000000 	nop
bfc05570:	95690000 	lhu	t1,0(t3)
bfc05574:	8fbf0010 	lw	ra,16(sp)
bfc05578:	01a94021 	addu	t0,t5,t1
bfc0557c:	a5680000 	sh	t0,0(t3)
bfc05580:	240c0002 	li	t4,2
bfc05584:	27eb0004 	addiu	t3,ra,4
bfc05588:	95650000 	lhu	a1,0(t3)
bfc0558c:	258c0001 	addiu	t4,t4,1
bfc05590:	01a53821 	addu	a3,t5,a1
bfc05594:	a5670000 	sh	a3,0(t3)
bfc05598:	256b0002 	addiu	t3,t3,2
bfc0559c:	95630000 	lhu	v1,0(t3)
bfc055a0:	258c0001 	addiu	t4,t4,1
bfc055a4:	01a32021 	addu	a0,t5,v1
bfc055a8:	a5640000 	sh	a0,0(t3)
bfc055ac:	256b0002 	addiu	t3,t3,2
bfc055b0:	957e0000 	lhu	s8,0(t3)
bfc055b4:	258c0001 	addiu	t4,t4,1
bfc055b8:	01be1021 	addu	v0,t5,s8
bfc055bc:	a5620000 	sh	v0,0(t3)
bfc055c0:	256b0002 	addiu	t3,t3,2
bfc055c4:	95790000 	lhu	t9,0(t3)
bfc055c8:	258c0001 	addiu	t4,t4,1
bfc055cc:	01b9b821 	addu	s7,t5,t9
bfc055d0:	a5770000 	sh	s7,0(t3)
bfc055d4:	256b0002 	addiu	t3,t3,2
bfc055d8:	95750000 	lhu	s5,0(t3)
bfc055dc:	258c0001 	addiu	t4,t4,1
bfc055e0:	01b58821 	addu	s1,t5,s5
bfc055e4:	a5710000 	sh	s1,0(t3)
bfc055e8:	256b0002 	addiu	t3,t3,2
bfc055ec:	95780000 	lhu	t8,0(t3)
bfc055f0:	258c0001 	addiu	t4,t4,1
bfc055f4:	01b83021 	addu	a2,t5,t8
bfc055f8:	0194b02b 	sltu	s6,t4,s4
bfc055fc:	a5660000 	sh	a2,0(t3)
bfc05600:	12c0001d 	beqz	s6,bfc05678 <core_bench_matrix+0x16a8>
bfc05604:	256b0002 	addiu	t3,t3,2
bfc05608:	95620000 	lhu	v0,0(t3)
bfc0560c:	95630002 	lhu	v1,2(t3)
bfc05610:	95640004 	lhu	a0,4(t3)
bfc05614:	95650006 	lhu	a1,6(t3)
bfc05618:	95670008 	lhu	a3,8(t3)
bfc0561c:	9569000a 	lhu	t1,10(t3)
bfc05620:	9568000c 	lhu	t0,12(t3)
bfc05624:	957f000e 	lhu	ra,14(t3)
bfc05628:	258c0008 	addiu	t4,t4,8
bfc0562c:	01a25021 	addu	t2,t5,v0
bfc05630:	01a38021 	addu	s0,t5,v1
bfc05634:	01a49821 	addu	s3,t5,a0
bfc05638:	01a5c021 	addu	t8,t5,a1
bfc0563c:	01a73021 	addu	a2,t5,a3
bfc05640:	01a9b021 	addu	s6,t5,t1
bfc05644:	01a8a821 	addu	s5,t5,t0
bfc05648:	01bf8821 	addu	s1,t5,ra
bfc0564c:	0194c82b 	sltu	t9,t4,s4
bfc05650:	a56a0000 	sh	t2,0(t3)
bfc05654:	a5700002 	sh	s0,2(t3)
bfc05658:	a5730004 	sh	s3,4(t3)
bfc0565c:	a5780006 	sh	t8,6(t3)
bfc05660:	a5660008 	sh	a2,8(t3)
bfc05664:	a576000a 	sh	s6,10(t3)
bfc05668:	a575000c 	sh	s5,12(t3)
bfc0566c:	a571000e 	sh	s1,14(t3)
bfc05670:	1720ffe5 	bnez	t9,bfc05608 <core_bench_matrix+0x1638>
bfc05674:	256b0010 	addiu	t3,t3,16
bfc05678:	8fbe0010 	lw	s8,16(sp)
bfc0567c:	25ce0001 	addiu	t6,t6,1
bfc05680:	03d26021 	addu	t4,s8,s2
bfc05684:	01d4582b 	sltu	t3,t6,s4
bfc05688:	1560ffa1 	bnez	t3,bfc05510 <core_bench_matrix+0x1540>
bfc0568c:	afac0010 	sw	t4,16(sp)
bfc05690:	000f9400 	sll	s2,t7,0x10
bfc05694:	8fa50038 	lw	a1,56(sp)
bfc05698:	00122403 	sra	a0,s2,0x10
bfc0569c:	8fbf0064 	lw	ra,100(sp)
bfc056a0:	8fbe0060 	lw	s8,96(sp)
bfc056a4:	8fb7005c 	lw	s7,92(sp)
bfc056a8:	8fb60058 	lw	s6,88(sp)
bfc056ac:	8fb50054 	lw	s5,84(sp)
bfc056b0:	8fb40050 	lw	s4,80(sp)
bfc056b4:	8fb3004c 	lw	s3,76(sp)
bfc056b8:	8fb20048 	lw	s2,72(sp)
bfc056bc:	8fb10044 	lw	s1,68(sp)
bfc056c0:	8fb00040 	lw	s0,64(sp)
bfc056c4:	0bf017d8 	j	bfc05f60 <crc16>
bfc056c8:	27bd0068 	addiu	sp,sp,104
bfc056cc:	00002021 	move	a0,zero
bfc056d0:	0ff017d8 	jal	bfc05f60 <crc16>
bfc056d4:	00002821 	move	a1,zero
bfc056d8:	00402821 	move	a1,v0
bfc056dc:	0ff017d8 	jal	bfc05f60 <crc16>
bfc056e0:	00002021 	move	a0,zero
bfc056e4:	00402821 	move	a1,v0
bfc056e8:	0ff017d8 	jal	bfc05f60 <crc16>
bfc056ec:	00002021 	move	a0,zero
bfc056f0:	00402821 	move	a1,v0
bfc056f4:	0ff017d8 	jal	bfc05f60 <crc16>
bfc056f8:	00002021 	move	a0,zero
bfc056fc:	0bf015a4 	j	bfc05690 <core_bench_matrix+0x16c0>
bfc05700:	00407821 	move	t7,v0
	...

bfc05710 <parseval>:
parseval():
bfc05710:	80870000 	lb	a3,0(a0)
bfc05714:	2402002d 	li	v0,45
bfc05718:	10e2003d 	beq	a3,v0,bfc05810 <parseval+0x100>
bfc0571c:	00802821 	move	a1,a0
bfc05720:	24030030 	li	v1,48
bfc05724:	10e3003f 	beq	a3,v1,bfc05824 <parseval+0x114>
bfc05728:	240a0001 	li	t2,1
bfc0572c:	24ebffd0 	addiu	t3,a3,-48
bfc05730:	316900ff 	andi	t1,t3,0xff
bfc05734:	2d28000a 	sltiu	t0,t1,10
bfc05738:	1100002b 	beqz	t0,bfc057e8 <parseval+0xd8>
bfc0573c:	00004021 	move	t0,zero
bfc05740:	000868c0 	sll	t5,t0,0x3
bfc05744:	00086040 	sll	t4,t0,0x1
bfc05748:	018d4021 	addu	t0,t4,t5
bfc0574c:	00e85821 	addu	t3,a3,t0
bfc05750:	80a70001 	lb	a3,1(a1)
bfc05754:	2568ffd0 	addiu	t0,t3,-48
bfc05758:	24e4ffd0 	addiu	a0,a3,-48
bfc0575c:	000848c0 	sll	t1,t0,0x3
bfc05760:	00083040 	sll	a2,t0,0x1
bfc05764:	308300ff 	andi	v1,a0,0xff
bfc05768:	00c91021 	addu	v0,a2,t1
bfc0576c:	2c79000a 	sltiu	t9,v1,10
bfc05770:	1320001d 	beqz	t9,bfc057e8 <parseval+0xd8>
bfc05774:	00e21021 	addu	v0,a3,v0
bfc05778:	80a70002 	lb	a3,2(a1)
bfc0577c:	2448ffd0 	addiu	t0,v0,-48
bfc05780:	24e4ffd0 	addiu	a0,a3,-48
bfc05784:	000810c0 	sll	v0,t0,0x3
bfc05788:	00083040 	sll	a2,t0,0x1
bfc0578c:	309900ff 	andi	t9,a0,0xff
bfc05790:	00c21821 	addu	v1,a2,v0
bfc05794:	2f38000a 	sltiu	t8,t9,10
bfc05798:	13000013 	beqz	t8,bfc057e8 <parseval+0xd8>
bfc0579c:	00e31821 	addu	v1,a3,v1
bfc057a0:	80a70003 	lb	a3,3(a1)
bfc057a4:	24a50004 	addiu	a1,a1,4
bfc057a8:	24eeffd0 	addiu	t6,a3,-48
bfc057ac:	31c800ff 	andi	t0,t6,0xff
bfc057b0:	2d09000a 	sltiu	t1,t0,10
bfc057b4:	2468ffd0 	addiu	t0,v1,-48
bfc057b8:	000868c0 	sll	t5,t0,0x3
bfc057bc:	00086040 	sll	t4,t0,0x1
bfc057c0:	018d5821 	addu	t3,t4,t5
bfc057c4:	11200008 	beqz	t1,bfc057e8 <parseval+0xd8>
bfc057c8:	00eb1821 	addu	v1,a3,t3
bfc057cc:	80a70000 	lb	a3,0(a1)
bfc057d0:	00000000 	nop
bfc057d4:	24f9ffd0 	addiu	t9,a3,-48
bfc057d8:	333800ff 	andi	t8,t9,0xff
bfc057dc:	2f0f000a 	sltiu	t7,t8,10
bfc057e0:	15e0ffd7 	bnez	t7,bfc05740 <parseval+0x30>
bfc057e4:	2468ffd0 	addiu	t0,v1,-48
bfc057e8:	240e004b 	li	t6,75
bfc057ec:	10ee0028 	beq	a3,t6,bfc05890 <parseval+0x180>
bfc057f0:	240f004d 	li	t7,77
bfc057f4:	14ef0003 	bne	a3,t7,bfc05804 <parseval+0xf4>
bfc057f8:	010a0018 	mult	t0,t2
bfc057fc:	00084500 	sll	t0,t0,0x14
bfc05800:	010a0018 	mult	t0,t2
bfc05804:	00001012 	mflo	v0
bfc05808:	03e00008 	jr	ra
bfc0580c:	00000000 	nop
bfc05810:	24850001 	addiu	a1,a0,1
bfc05814:	80a70000 	lb	a3,0(a1)
bfc05818:	24030030 	li	v1,48
bfc0581c:	14e3ffc3 	bne	a3,v1,bfc0572c <parseval+0x1c>
bfc05820:	240affff 	li	t2,-1
bfc05824:	80a60001 	lb	a2,1(a1)
bfc05828:	24040078 	li	a0,120
bfc0582c:	14c4ffc0 	bne	a2,a0,bfc05730 <parseval+0x20>
bfc05830:	24ebffd0 	addiu	t3,a3,-48
bfc05834:	24a40002 	addiu	a0,a1,2
bfc05838:	00004021 	move	t0,zero
bfc0583c:	80870000 	lb	a3,0(a0)
bfc05840:	00084900 	sll	t1,t0,0x4
bfc05844:	30e500ff 	andi	a1,a3,0xff
bfc05848:	24b8ffd0 	addiu	t8,a1,-48
bfc0584c:	24afff9f 	addiu	t7,a1,-97
bfc05850:	330e00ff 	andi	t6,t8,0xff
bfc05854:	24e5ffd0 	addiu	a1,a3,-48
bfc05858:	31ed00ff 	andi	t5,t7,0xff
bfc0585c:	2dcc000a 	sltiu	t4,t6,10
bfc05860:	28a6000a 	slti	a2,a1,10
bfc05864:	24840001 	addiu	a0,a0,1
bfc05868:	15800003 	bnez	t4,bfc05878 <parseval+0x168>
bfc0586c:	2da30006 	sltiu	v1,t5,6
bfc05870:	1060ffde 	beqz	v1,bfc057ec <parseval+0xdc>
bfc05874:	240e004b 	li	t6,75
bfc05878:	14c00002 	bnez	a2,bfc05884 <parseval+0x174>
bfc0587c:	00000000 	nop
bfc05880:	24e5ffa9 	addiu	a1,a3,-87
bfc05884:	0bf0160f 	j	bfc0583c <parseval+0x12c>
bfc05888:	00a94021 	addu	t0,a1,t1
bfc0588c:	00000000 	nop
bfc05890:	00084280 	sll	t0,t0,0xa
bfc05894:	010a0018 	mult	t0,t2
bfc05898:	00001012 	mflo	v0
bfc0589c:	03e00008 	jr	ra
bfc058a0:	00000000 	nop
	...

bfc058b0 <crcu8>:
crcu8():
bfc058b0:	30a5ffff 	andi	a1,a1,0xffff
bfc058b4:	308400ff 	andi	a0,a0,0xff
bfc058b8:	00853026 	xor	a2,a0,a1
bfc058bc:	38a74002 	xori	a3,a1,0x4002
bfc058c0:	00071042 	srl	v0,a3,0x1
bfc058c4:	30c30001 	andi	v1,a2,0x1
bfc058c8:	00042042 	srl	a0,a0,0x1
bfc058cc:	34468000 	ori	a2,v0,0x8000
bfc058d0:	14600043 	bnez	v1,bfc059e0 <crcu8+0x130>
bfc058d4:	00051042 	srl	v0,a1,0x1
bfc058d8:	00402821 	move	a1,v0
bfc058dc:	00855026 	xor	t2,a0,a1
bfc058e0:	38ab4002 	xori	t3,a1,0x4002
bfc058e4:	000b4842 	srl	t1,t3,0x1
bfc058e8:	31480001 	andi	t0,t2,0x1
bfc058ec:	00042042 	srl	a0,a0,0x1
bfc058f0:	35268000 	ori	a2,t1,0x8000
bfc058f4:	15000043 	bnez	t0,bfc05a04 <crcu8+0x154>
bfc058f8:	00051042 	srl	v0,a1,0x1
bfc058fc:	00402821 	move	a1,v0
bfc05900:	00857026 	xor	t6,a0,a1
bfc05904:	38af4002 	xori	t7,a1,0x4002
bfc05908:	000f6842 	srl	t5,t7,0x1
bfc0590c:	31cc0001 	andi	t4,t6,0x1
bfc05910:	00042042 	srl	a0,a0,0x1
bfc05914:	35a68000 	ori	a2,t5,0x8000
bfc05918:	15800043 	bnez	t4,bfc05a28 <crcu8+0x178>
bfc0591c:	00051042 	srl	v0,a1,0x1
bfc05920:	00402821 	move	a1,v0
bfc05924:	00851826 	xor	v1,a0,a1
bfc05928:	38a24002 	xori	v0,a1,0x4002
bfc0592c:	0002c842 	srl	t9,v0,0x1
bfc05930:	30780001 	andi	t8,v1,0x1
bfc05934:	00042042 	srl	a0,a0,0x1
bfc05938:	37268000 	ori	a2,t9,0x8000
bfc0593c:	17000043 	bnez	t8,bfc05a4c <crcu8+0x19c>
bfc05940:	00051042 	srl	v0,a1,0x1
bfc05944:	00402821 	move	a1,v0
bfc05948:	00853026 	xor	a2,a0,a1
bfc0594c:	38a94002 	xori	t1,a1,0x4002
bfc05950:	00094042 	srl	t0,t1,0x1
bfc05954:	30c70001 	andi	a3,a2,0x1
bfc05958:	00042042 	srl	a0,a0,0x1
bfc0595c:	35068000 	ori	a2,t0,0x8000
bfc05960:	14e00043 	bnez	a3,bfc05a70 <crcu8+0x1c0>
bfc05964:	00051042 	srl	v0,a1,0x1
bfc05968:	00402821 	move	a1,v0
bfc0596c:	00856026 	xor	t4,a0,a1
bfc05970:	38ad4002 	xori	t5,a1,0x4002
bfc05974:	000d5842 	srl	t3,t5,0x1
bfc05978:	318a0001 	andi	t2,t4,0x1
bfc0597c:	00042042 	srl	a0,a0,0x1
bfc05980:	35668000 	ori	a2,t3,0x8000
bfc05984:	15400043 	bnez	t2,bfc05a94 <crcu8+0x1e4>
bfc05988:	00051042 	srl	v0,a1,0x1
bfc0598c:	00402821 	move	a1,v0
bfc05990:	0085c026 	xor	t8,a0,a1
bfc05994:	38b94002 	xori	t9,a1,0x4002
bfc05998:	00197842 	srl	t7,t9,0x1
bfc0599c:	330e0001 	andi	t6,t8,0x1
bfc059a0:	35e68000 	ori	a2,t7,0x8000
bfc059a4:	15c00043 	bnez	t6,bfc05ab4 <crcu8+0x204>
bfc059a8:	00051042 	srl	v0,a1,0x1
bfc059ac:	00402821 	move	a1,v0
bfc059b0:	38a74002 	xori	a3,a1,0x4002
bfc059b4:	00071042 	srl	v0,a3,0x1
bfc059b8:	00042042 	srl	a0,a0,0x1
bfc059bc:	30a30001 	andi	v1,a1,0x1
bfc059c0:	34468000 	ori	a2,v0,0x8000
bfc059c4:	14640043 	bne	v1,a0,bfc05ad4 <crcu8+0x224>
bfc059c8:	00051042 	srl	v0,a1,0x1
bfc059cc:	03e00008 	jr	ra
bfc059d0:	3042ffff 	andi	v0,v0,0xffff
	...
bfc059e0:	00c02821 	move	a1,a2
bfc059e4:	00855026 	xor	t2,a0,a1
bfc059e8:	38ab4002 	xori	t3,a1,0x4002
bfc059ec:	000b4842 	srl	t1,t3,0x1
bfc059f0:	31480001 	andi	t0,t2,0x1
bfc059f4:	00042042 	srl	a0,a0,0x1
bfc059f8:	35268000 	ori	a2,t1,0x8000
bfc059fc:	1100ffbf 	beqz	t0,bfc058fc <crcu8+0x4c>
bfc05a00:	00051042 	srl	v0,a1,0x1
bfc05a04:	00c02821 	move	a1,a2
bfc05a08:	00857026 	xor	t6,a0,a1
bfc05a0c:	38af4002 	xori	t7,a1,0x4002
bfc05a10:	000f6842 	srl	t5,t7,0x1
bfc05a14:	31cc0001 	andi	t4,t6,0x1
bfc05a18:	00042042 	srl	a0,a0,0x1
bfc05a1c:	35a68000 	ori	a2,t5,0x8000
bfc05a20:	1180ffbf 	beqz	t4,bfc05920 <crcu8+0x70>
bfc05a24:	00051042 	srl	v0,a1,0x1
bfc05a28:	00c02821 	move	a1,a2
bfc05a2c:	00851826 	xor	v1,a0,a1
bfc05a30:	38a24002 	xori	v0,a1,0x4002
bfc05a34:	0002c842 	srl	t9,v0,0x1
bfc05a38:	30780001 	andi	t8,v1,0x1
bfc05a3c:	00042042 	srl	a0,a0,0x1
bfc05a40:	37268000 	ori	a2,t9,0x8000
bfc05a44:	1300ffbf 	beqz	t8,bfc05944 <crcu8+0x94>
bfc05a48:	00051042 	srl	v0,a1,0x1
bfc05a4c:	00c02821 	move	a1,a2
bfc05a50:	00853026 	xor	a2,a0,a1
bfc05a54:	38a94002 	xori	t1,a1,0x4002
bfc05a58:	00094042 	srl	t0,t1,0x1
bfc05a5c:	30c70001 	andi	a3,a2,0x1
bfc05a60:	00042042 	srl	a0,a0,0x1
bfc05a64:	35068000 	ori	a2,t0,0x8000
bfc05a68:	10e0ffbf 	beqz	a3,bfc05968 <crcu8+0xb8>
bfc05a6c:	00051042 	srl	v0,a1,0x1
bfc05a70:	00c02821 	move	a1,a2
bfc05a74:	00856026 	xor	t4,a0,a1
bfc05a78:	38ad4002 	xori	t5,a1,0x4002
bfc05a7c:	000d5842 	srl	t3,t5,0x1
bfc05a80:	318a0001 	andi	t2,t4,0x1
bfc05a84:	00042042 	srl	a0,a0,0x1
bfc05a88:	35668000 	ori	a2,t3,0x8000
bfc05a8c:	1140ffbf 	beqz	t2,bfc0598c <crcu8+0xdc>
bfc05a90:	00051042 	srl	v0,a1,0x1
bfc05a94:	00c02821 	move	a1,a2
bfc05a98:	0085c026 	xor	t8,a0,a1
bfc05a9c:	38b94002 	xori	t9,a1,0x4002
bfc05aa0:	00197842 	srl	t7,t9,0x1
bfc05aa4:	330e0001 	andi	t6,t8,0x1
bfc05aa8:	35e68000 	ori	a2,t7,0x8000
bfc05aac:	11c0ffbf 	beqz	t6,bfc059ac <crcu8+0xfc>
bfc05ab0:	00051042 	srl	v0,a1,0x1
bfc05ab4:	00c02821 	move	a1,a2
bfc05ab8:	38a74002 	xori	a3,a1,0x4002
bfc05abc:	00071042 	srl	v0,a3,0x1
bfc05ac0:	00042042 	srl	a0,a0,0x1
bfc05ac4:	30a30001 	andi	v1,a1,0x1
bfc05ac8:	34468000 	ori	a2,v0,0x8000
bfc05acc:	1064ffbf 	beq	v1,a0,bfc059cc <crcu8+0x11c>
bfc05ad0:	00051042 	srl	v0,a1,0x1
bfc05ad4:	00c01021 	move	v0,a2
bfc05ad8:	03e00008 	jr	ra
bfc05adc:	3042ffff 	andi	v0,v0,0xffff

bfc05ae0 <check_data_types>:
check_data_types():
bfc05ae0:	03e00008 	jr	ra
bfc05ae4:	00001021 	move	v0,zero
	...

bfc05af0 <crcu16>:
crcu16():
bfc05af0:	3087ffff 	andi	a3,a0,0xffff
bfc05af4:	30a5ffff 	andi	a1,a1,0xffff
bfc05af8:	30e400ff 	andi	a0,a3,0xff
bfc05afc:	00853026 	xor	a2,a0,a1
bfc05b00:	38a84002 	xori	t0,a1,0x4002
bfc05b04:	00081042 	srl	v0,t0,0x1
bfc05b08:	30c30001 	andi	v1,a2,0x1
bfc05b0c:	00042042 	srl	a0,a0,0x1
bfc05b10:	34468000 	ori	a2,v0,0x8000
bfc05b14:	1460008a 	bnez	v1,bfc05d40 <crcu16+0x250>
bfc05b18:	00051042 	srl	v0,a1,0x1
bfc05b1c:	00402821 	move	a1,v0
bfc05b20:	00855826 	xor	t3,a0,a1
bfc05b24:	38ac4002 	xori	t4,a1,0x4002
bfc05b28:	000c5042 	srl	t2,t4,0x1
bfc05b2c:	31690001 	andi	t1,t3,0x1
bfc05b30:	00042042 	srl	a0,a0,0x1
bfc05b34:	35468000 	ori	a2,t2,0x8000
bfc05b38:	1520008a 	bnez	t1,bfc05d64 <crcu16+0x274>
bfc05b3c:	00051042 	srl	v0,a1,0x1
bfc05b40:	00402821 	move	a1,v0
bfc05b44:	00857826 	xor	t7,a0,a1
bfc05b48:	38b84002 	xori	t8,a1,0x4002
bfc05b4c:	00187042 	srl	t6,t8,0x1
bfc05b50:	31ed0001 	andi	t5,t7,0x1
bfc05b54:	00042042 	srl	a0,a0,0x1
bfc05b58:	35c68000 	ori	a2,t6,0x8000
bfc05b5c:	15a0008a 	bnez	t5,bfc05d88 <crcu16+0x298>
bfc05b60:	00051042 	srl	v0,a1,0x1
bfc05b64:	00402821 	move	a1,v0
bfc05b68:	00851826 	xor	v1,a0,a1
bfc05b6c:	38a64002 	xori	a2,a1,0x4002
bfc05b70:	00061042 	srl	v0,a2,0x1
bfc05b74:	30790001 	andi	t9,v1,0x1
bfc05b78:	34468000 	ori	a2,v0,0x8000
bfc05b7c:	00042042 	srl	a0,a0,0x1
bfc05b80:	1720008a 	bnez	t9,bfc05dac <crcu16+0x2bc>
bfc05b84:	00051042 	srl	v0,a1,0x1
bfc05b88:	00402821 	move	a1,v0
bfc05b8c:	00855026 	xor	t2,a0,a1
bfc05b90:	38ab4002 	xori	t3,a1,0x4002
bfc05b94:	000b4842 	srl	t1,t3,0x1
bfc05b98:	31480001 	andi	t0,t2,0x1
bfc05b9c:	00042042 	srl	a0,a0,0x1
bfc05ba0:	35268000 	ori	a2,t1,0x8000
bfc05ba4:	1500008a 	bnez	t0,bfc05dd0 <crcu16+0x2e0>
bfc05ba8:	00051042 	srl	v0,a1,0x1
bfc05bac:	00402821 	move	a1,v0
bfc05bb0:	00857026 	xor	t6,a0,a1
bfc05bb4:	38af4002 	xori	t7,a1,0x4002
bfc05bb8:	000f6842 	srl	t5,t7,0x1
bfc05bbc:	31cc0001 	andi	t4,t6,0x1
bfc05bc0:	00042042 	srl	a0,a0,0x1
bfc05bc4:	35a68000 	ori	a2,t5,0x8000
bfc05bc8:	1580008a 	bnez	t4,bfc05df4 <crcu16+0x304>
bfc05bcc:	00051042 	srl	v0,a1,0x1
bfc05bd0:	00402821 	move	a1,v0
bfc05bd4:	38a24002 	xori	v0,a1,0x4002
bfc05bd8:	00851826 	xor	v1,a0,a1
bfc05bdc:	0002c842 	srl	t9,v0,0x1
bfc05be0:	30780001 	andi	t8,v1,0x1
bfc05be4:	37268000 	ori	a2,t9,0x8000
bfc05be8:	1700008a 	bnez	t8,bfc05e14 <crcu16+0x324>
bfc05bec:	00051042 	srl	v0,a1,0x1
bfc05bf0:	00402821 	move	a1,v0
bfc05bf4:	38a64002 	xori	a2,a1,0x4002
bfc05bf8:	00064842 	srl	t1,a2,0x1
bfc05bfc:	00042042 	srl	a0,a0,0x1
bfc05c00:	30a80001 	andi	t0,a1,0x1
bfc05c04:	35268000 	ori	a2,t1,0x8000
bfc05c08:	1504008a 	bne	t0,a0,bfc05e34 <crcu16+0x344>
bfc05c0c:	00051042 	srl	v0,a1,0x1
bfc05c10:	00402821 	move	a1,v0
bfc05c14:	00075a02 	srl	t3,a3,0x8
bfc05c18:	01656026 	xor	t4,t3,a1
bfc05c1c:	38ad4002 	xori	t5,a1,0x4002
bfc05c20:	000d5042 	srl	t2,t5,0x1
bfc05c24:	31870001 	andi	a3,t4,0x1
bfc05c28:	000b2042 	srl	a0,t3,0x1
bfc05c2c:	35468000 	ori	a2,t2,0x8000
bfc05c30:	14e0008a 	bnez	a3,bfc05e5c <crcu16+0x36c>
bfc05c34:	00051042 	srl	v0,a1,0x1
bfc05c38:	00402821 	move	a1,v0
bfc05c3c:	0085c026 	xor	t8,a0,a1
bfc05c40:	38b94002 	xori	t9,a1,0x4002
bfc05c44:	00197842 	srl	t7,t9,0x1
bfc05c48:	330e0001 	andi	t6,t8,0x1
bfc05c4c:	00042042 	srl	a0,a0,0x1
bfc05c50:	35e68000 	ori	a2,t7,0x8000
bfc05c54:	15c0008a 	bnez	t6,bfc05e80 <crcu16+0x390>
bfc05c58:	00051042 	srl	v0,a1,0x1
bfc05c5c:	00402821 	move	a1,v0
bfc05c60:	00854026 	xor	t0,a0,a1
bfc05c64:	38a94002 	xori	t1,a1,0x4002
bfc05c68:	00091042 	srl	v0,t1,0x1
bfc05c6c:	31030001 	andi	v1,t0,0x1
bfc05c70:	34468000 	ori	a2,v0,0x8000
bfc05c74:	00042042 	srl	a0,a0,0x1
bfc05c78:	1460008a 	bnez	v1,bfc05ea4 <crcu16+0x3b4>
bfc05c7c:	00051042 	srl	v0,a1,0x1
bfc05c80:	00402821 	move	a1,v0
bfc05c84:	00853026 	xor	a2,a0,a1
bfc05c88:	38ab4002 	xori	t3,a1,0x4002
bfc05c8c:	000b5042 	srl	t2,t3,0x1
bfc05c90:	30c70001 	andi	a3,a2,0x1
bfc05c94:	00042042 	srl	a0,a0,0x1
bfc05c98:	35468000 	ori	a2,t2,0x8000
bfc05c9c:	14e0008a 	bnez	a3,bfc05ec8 <crcu16+0x3d8>
bfc05ca0:	00051042 	srl	v0,a1,0x1
bfc05ca4:	00402821 	move	a1,v0
bfc05ca8:	00857026 	xor	t6,a0,a1
bfc05cac:	38af4002 	xori	t7,a1,0x4002
bfc05cb0:	000f6842 	srl	t5,t7,0x1
bfc05cb4:	31cc0001 	andi	t4,t6,0x1
bfc05cb8:	00042042 	srl	a0,a0,0x1
bfc05cbc:	35a68000 	ori	a2,t5,0x8000
bfc05cc0:	1580008a 	bnez	t4,bfc05eec <crcu16+0x3fc>
bfc05cc4:	00051042 	srl	v0,a1,0x1
bfc05cc8:	00402821 	move	a1,v0
bfc05ccc:	00851826 	xor	v1,a0,a1
bfc05cd0:	38a24002 	xori	v0,a1,0x4002
bfc05cd4:	0002c842 	srl	t9,v0,0x1
bfc05cd8:	30780001 	andi	t8,v1,0x1
bfc05cdc:	00042042 	srl	a0,a0,0x1
bfc05ce0:	37268000 	ori	a2,t9,0x8000
bfc05ce4:	1700008a 	bnez	t8,bfc05f10 <crcu16+0x420>
bfc05ce8:	00051042 	srl	v0,a1,0x1
bfc05cec:	00402821 	move	a1,v0
bfc05cf0:	00853826 	xor	a3,a0,a1
bfc05cf4:	38aa4002 	xori	t2,a1,0x4002
bfc05cf8:	000a4842 	srl	t1,t2,0x1
bfc05cfc:	30e80001 	andi	t0,a3,0x1
bfc05d00:	35268000 	ori	a2,t1,0x8000
bfc05d04:	1500008a 	bnez	t0,bfc05f30 <crcu16+0x440>
bfc05d08:	00051042 	srl	v0,a1,0x1
bfc05d0c:	00402821 	move	a1,v0
bfc05d10:	38a64002 	xori	a2,a1,0x4002
bfc05d14:	00066042 	srl	t4,a2,0x1
bfc05d18:	00042042 	srl	a0,a0,0x1
bfc05d1c:	30ab0001 	andi	t3,a1,0x1
bfc05d20:	35868000 	ori	a2,t4,0x8000
bfc05d24:	1564008a 	bne	t3,a0,bfc05f50 <crcu16+0x460>
bfc05d28:	00051042 	srl	v0,a1,0x1
bfc05d2c:	03e00008 	jr	ra
bfc05d30:	3042ffff 	andi	v0,v0,0xffff
	...
bfc05d40:	00c02821 	move	a1,a2
bfc05d44:	00855826 	xor	t3,a0,a1
bfc05d48:	38ac4002 	xori	t4,a1,0x4002
bfc05d4c:	000c5042 	srl	t2,t4,0x1
bfc05d50:	31690001 	andi	t1,t3,0x1
bfc05d54:	00042042 	srl	a0,a0,0x1
bfc05d58:	35468000 	ori	a2,t2,0x8000
bfc05d5c:	1120ff78 	beqz	t1,bfc05b40 <crcu16+0x50>
bfc05d60:	00051042 	srl	v0,a1,0x1
bfc05d64:	00c02821 	move	a1,a2
bfc05d68:	00857826 	xor	t7,a0,a1
bfc05d6c:	38b84002 	xori	t8,a1,0x4002
bfc05d70:	00187042 	srl	t6,t8,0x1
bfc05d74:	31ed0001 	andi	t5,t7,0x1
bfc05d78:	00042042 	srl	a0,a0,0x1
bfc05d7c:	35c68000 	ori	a2,t6,0x8000
bfc05d80:	11a0ff78 	beqz	t5,bfc05b64 <crcu16+0x74>
bfc05d84:	00051042 	srl	v0,a1,0x1
bfc05d88:	00c02821 	move	a1,a2
bfc05d8c:	00851826 	xor	v1,a0,a1
bfc05d90:	38a64002 	xori	a2,a1,0x4002
bfc05d94:	00061042 	srl	v0,a2,0x1
bfc05d98:	30790001 	andi	t9,v1,0x1
bfc05d9c:	34468000 	ori	a2,v0,0x8000
bfc05da0:	00042042 	srl	a0,a0,0x1
bfc05da4:	1320ff78 	beqz	t9,bfc05b88 <crcu16+0x98>
bfc05da8:	00051042 	srl	v0,a1,0x1
bfc05dac:	00c02821 	move	a1,a2
bfc05db0:	00855026 	xor	t2,a0,a1
bfc05db4:	38ab4002 	xori	t3,a1,0x4002
bfc05db8:	000b4842 	srl	t1,t3,0x1
bfc05dbc:	31480001 	andi	t0,t2,0x1
bfc05dc0:	00042042 	srl	a0,a0,0x1
bfc05dc4:	35268000 	ori	a2,t1,0x8000
bfc05dc8:	1100ff78 	beqz	t0,bfc05bac <crcu16+0xbc>
bfc05dcc:	00051042 	srl	v0,a1,0x1
bfc05dd0:	00c02821 	move	a1,a2
bfc05dd4:	00857026 	xor	t6,a0,a1
bfc05dd8:	38af4002 	xori	t7,a1,0x4002
bfc05ddc:	000f6842 	srl	t5,t7,0x1
bfc05de0:	31cc0001 	andi	t4,t6,0x1
bfc05de4:	00042042 	srl	a0,a0,0x1
bfc05de8:	35a68000 	ori	a2,t5,0x8000
bfc05dec:	1180ff78 	beqz	t4,bfc05bd0 <crcu16+0xe0>
bfc05df0:	00051042 	srl	v0,a1,0x1
bfc05df4:	00c02821 	move	a1,a2
bfc05df8:	38a24002 	xori	v0,a1,0x4002
bfc05dfc:	00851826 	xor	v1,a0,a1
bfc05e00:	0002c842 	srl	t9,v0,0x1
bfc05e04:	30780001 	andi	t8,v1,0x1
bfc05e08:	37268000 	ori	a2,t9,0x8000
bfc05e0c:	1300ff78 	beqz	t8,bfc05bf0 <crcu16+0x100>
bfc05e10:	00051042 	srl	v0,a1,0x1
bfc05e14:	00c02821 	move	a1,a2
bfc05e18:	38a64002 	xori	a2,a1,0x4002
bfc05e1c:	00064842 	srl	t1,a2,0x1
bfc05e20:	00042042 	srl	a0,a0,0x1
bfc05e24:	30a80001 	andi	t0,a1,0x1
bfc05e28:	35268000 	ori	a2,t1,0x8000
bfc05e2c:	1104ff78 	beq	t0,a0,bfc05c10 <crcu16+0x120>
bfc05e30:	00051042 	srl	v0,a1,0x1
bfc05e34:	00c02821 	move	a1,a2
bfc05e38:	00075a02 	srl	t3,a3,0x8
bfc05e3c:	01656026 	xor	t4,t3,a1
bfc05e40:	38ad4002 	xori	t5,a1,0x4002
bfc05e44:	000d5042 	srl	t2,t5,0x1
bfc05e48:	31870001 	andi	a3,t4,0x1
bfc05e4c:	000b2042 	srl	a0,t3,0x1
bfc05e50:	35468000 	ori	a2,t2,0x8000
bfc05e54:	10e0ff78 	beqz	a3,bfc05c38 <crcu16+0x148>
bfc05e58:	00051042 	srl	v0,a1,0x1
bfc05e5c:	00c02821 	move	a1,a2
bfc05e60:	0085c026 	xor	t8,a0,a1
bfc05e64:	38b94002 	xori	t9,a1,0x4002
bfc05e68:	00197842 	srl	t7,t9,0x1
bfc05e6c:	330e0001 	andi	t6,t8,0x1
bfc05e70:	00042042 	srl	a0,a0,0x1
bfc05e74:	35e68000 	ori	a2,t7,0x8000
bfc05e78:	11c0ff78 	beqz	t6,bfc05c5c <crcu16+0x16c>
bfc05e7c:	00051042 	srl	v0,a1,0x1
bfc05e80:	00c02821 	move	a1,a2
bfc05e84:	00854026 	xor	t0,a0,a1
bfc05e88:	38a94002 	xori	t1,a1,0x4002
bfc05e8c:	00091042 	srl	v0,t1,0x1
bfc05e90:	31030001 	andi	v1,t0,0x1
bfc05e94:	34468000 	ori	a2,v0,0x8000
bfc05e98:	00042042 	srl	a0,a0,0x1
bfc05e9c:	1060ff78 	beqz	v1,bfc05c80 <crcu16+0x190>
bfc05ea0:	00051042 	srl	v0,a1,0x1
bfc05ea4:	00c02821 	move	a1,a2
bfc05ea8:	00853026 	xor	a2,a0,a1
bfc05eac:	38ab4002 	xori	t3,a1,0x4002
bfc05eb0:	000b5042 	srl	t2,t3,0x1
bfc05eb4:	30c70001 	andi	a3,a2,0x1
bfc05eb8:	00042042 	srl	a0,a0,0x1
bfc05ebc:	35468000 	ori	a2,t2,0x8000
bfc05ec0:	10e0ff78 	beqz	a3,bfc05ca4 <crcu16+0x1b4>
bfc05ec4:	00051042 	srl	v0,a1,0x1
bfc05ec8:	00c02821 	move	a1,a2
bfc05ecc:	00857026 	xor	t6,a0,a1
bfc05ed0:	38af4002 	xori	t7,a1,0x4002
bfc05ed4:	000f6842 	srl	t5,t7,0x1
bfc05ed8:	31cc0001 	andi	t4,t6,0x1
bfc05edc:	00042042 	srl	a0,a0,0x1
bfc05ee0:	35a68000 	ori	a2,t5,0x8000
bfc05ee4:	1180ff78 	beqz	t4,bfc05cc8 <crcu16+0x1d8>
bfc05ee8:	00051042 	srl	v0,a1,0x1
bfc05eec:	00c02821 	move	a1,a2
bfc05ef0:	00851826 	xor	v1,a0,a1
bfc05ef4:	38a24002 	xori	v0,a1,0x4002
bfc05ef8:	0002c842 	srl	t9,v0,0x1
bfc05efc:	30780001 	andi	t8,v1,0x1
bfc05f00:	00042042 	srl	a0,a0,0x1
bfc05f04:	37268000 	ori	a2,t9,0x8000
bfc05f08:	1300ff78 	beqz	t8,bfc05cec <crcu16+0x1fc>
bfc05f0c:	00051042 	srl	v0,a1,0x1
bfc05f10:	00c02821 	move	a1,a2
bfc05f14:	00853826 	xor	a3,a0,a1
bfc05f18:	38aa4002 	xori	t2,a1,0x4002
bfc05f1c:	000a4842 	srl	t1,t2,0x1
bfc05f20:	30e80001 	andi	t0,a3,0x1
bfc05f24:	35268000 	ori	a2,t1,0x8000
bfc05f28:	1100ff78 	beqz	t0,bfc05d0c <crcu16+0x21c>
bfc05f2c:	00051042 	srl	v0,a1,0x1
bfc05f30:	00c02821 	move	a1,a2
bfc05f34:	38a64002 	xori	a2,a1,0x4002
bfc05f38:	00066042 	srl	t4,a2,0x1
bfc05f3c:	00042042 	srl	a0,a0,0x1
bfc05f40:	30ab0001 	andi	t3,a1,0x1
bfc05f44:	35868000 	ori	a2,t4,0x8000
bfc05f48:	1164ff78 	beq	t3,a0,bfc05d2c <crcu16+0x23c>
bfc05f4c:	00051042 	srl	v0,a1,0x1
bfc05f50:	00c01021 	move	v0,a2
bfc05f54:	03e00008 	jr	ra
bfc05f58:	3042ffff 	andi	v0,v0,0xffff
bfc05f5c:	00000000 	nop

bfc05f60 <crc16>:
crc16():
bfc05f60:	3087ffff 	andi	a3,a0,0xffff
bfc05f64:	30a5ffff 	andi	a1,a1,0xffff
bfc05f68:	30e400ff 	andi	a0,a3,0xff
bfc05f6c:	00a43026 	xor	a2,a1,a0
bfc05f70:	38a84002 	xori	t0,a1,0x4002
bfc05f74:	00081042 	srl	v0,t0,0x1
bfc05f78:	30c30001 	andi	v1,a2,0x1
bfc05f7c:	00042042 	srl	a0,a0,0x1
bfc05f80:	34468000 	ori	a2,v0,0x8000
bfc05f84:	1460008a 	bnez	v1,bfc061b0 <crc16+0x250>
bfc05f88:	00051042 	srl	v0,a1,0x1
bfc05f8c:	00402821 	move	a1,v0
bfc05f90:	00855826 	xor	t3,a0,a1
bfc05f94:	38ac4002 	xori	t4,a1,0x4002
bfc05f98:	000c5042 	srl	t2,t4,0x1
bfc05f9c:	31690001 	andi	t1,t3,0x1
bfc05fa0:	00042042 	srl	a0,a0,0x1
bfc05fa4:	35468000 	ori	a2,t2,0x8000
bfc05fa8:	1520008a 	bnez	t1,bfc061d4 <crc16+0x274>
bfc05fac:	00051042 	srl	v0,a1,0x1
bfc05fb0:	00402821 	move	a1,v0
bfc05fb4:	00857826 	xor	t7,a0,a1
bfc05fb8:	38b84002 	xori	t8,a1,0x4002
bfc05fbc:	00187042 	srl	t6,t8,0x1
bfc05fc0:	31ed0001 	andi	t5,t7,0x1
bfc05fc4:	00042042 	srl	a0,a0,0x1
bfc05fc8:	35c68000 	ori	a2,t6,0x8000
bfc05fcc:	15a0008a 	bnez	t5,bfc061f8 <crc16+0x298>
bfc05fd0:	00051042 	srl	v0,a1,0x1
bfc05fd4:	00402821 	move	a1,v0
bfc05fd8:	00851826 	xor	v1,a0,a1
bfc05fdc:	38a64002 	xori	a2,a1,0x4002
bfc05fe0:	00061042 	srl	v0,a2,0x1
bfc05fe4:	30790001 	andi	t9,v1,0x1
bfc05fe8:	34468000 	ori	a2,v0,0x8000
bfc05fec:	00042042 	srl	a0,a0,0x1
bfc05ff0:	1720008a 	bnez	t9,bfc0621c <crc16+0x2bc>
bfc05ff4:	00051042 	srl	v0,a1,0x1
bfc05ff8:	00402821 	move	a1,v0
bfc05ffc:	00855026 	xor	t2,a0,a1
bfc06000:	38ab4002 	xori	t3,a1,0x4002
bfc06004:	000b4842 	srl	t1,t3,0x1
bfc06008:	31480001 	andi	t0,t2,0x1
bfc0600c:	00042042 	srl	a0,a0,0x1
bfc06010:	35268000 	ori	a2,t1,0x8000
bfc06014:	1500008a 	bnez	t0,bfc06240 <crc16+0x2e0>
bfc06018:	00051042 	srl	v0,a1,0x1
bfc0601c:	00402821 	move	a1,v0
bfc06020:	00857026 	xor	t6,a0,a1
bfc06024:	38af4002 	xori	t7,a1,0x4002
bfc06028:	000f6842 	srl	t5,t7,0x1
bfc0602c:	31cc0001 	andi	t4,t6,0x1
bfc06030:	00042042 	srl	a0,a0,0x1
bfc06034:	35a68000 	ori	a2,t5,0x8000
bfc06038:	1580008a 	bnez	t4,bfc06264 <crc16+0x304>
bfc0603c:	00051042 	srl	v0,a1,0x1
bfc06040:	00402821 	move	a1,v0
bfc06044:	38a24002 	xori	v0,a1,0x4002
bfc06048:	00851826 	xor	v1,a0,a1
bfc0604c:	0002c842 	srl	t9,v0,0x1
bfc06050:	30780001 	andi	t8,v1,0x1
bfc06054:	37268000 	ori	a2,t9,0x8000
bfc06058:	1700008a 	bnez	t8,bfc06284 <crc16+0x324>
bfc0605c:	00051042 	srl	v0,a1,0x1
bfc06060:	00402821 	move	a1,v0
bfc06064:	38a64002 	xori	a2,a1,0x4002
bfc06068:	00064842 	srl	t1,a2,0x1
bfc0606c:	00042042 	srl	a0,a0,0x1
bfc06070:	30a80001 	andi	t0,a1,0x1
bfc06074:	35268000 	ori	a2,t1,0x8000
bfc06078:	1504008a 	bne	t0,a0,bfc062a4 <crc16+0x344>
bfc0607c:	00051042 	srl	v0,a1,0x1
bfc06080:	00402821 	move	a1,v0
bfc06084:	00075a02 	srl	t3,a3,0x8
bfc06088:	01656026 	xor	t4,t3,a1
bfc0608c:	38ad4002 	xori	t5,a1,0x4002
bfc06090:	000d5042 	srl	t2,t5,0x1
bfc06094:	31870001 	andi	a3,t4,0x1
bfc06098:	000b2042 	srl	a0,t3,0x1
bfc0609c:	35468000 	ori	a2,t2,0x8000
bfc060a0:	14e0008a 	bnez	a3,bfc062cc <crc16+0x36c>
bfc060a4:	00051042 	srl	v0,a1,0x1
bfc060a8:	00402821 	move	a1,v0
bfc060ac:	0085c026 	xor	t8,a0,a1
bfc060b0:	38b94002 	xori	t9,a1,0x4002
bfc060b4:	00197842 	srl	t7,t9,0x1
bfc060b8:	330e0001 	andi	t6,t8,0x1
bfc060bc:	00042042 	srl	a0,a0,0x1
bfc060c0:	35e68000 	ori	a2,t7,0x8000
bfc060c4:	15c0008a 	bnez	t6,bfc062f0 <crc16+0x390>
bfc060c8:	00051042 	srl	v0,a1,0x1
bfc060cc:	00402821 	move	a1,v0
bfc060d0:	00854026 	xor	t0,a0,a1
bfc060d4:	38a94002 	xori	t1,a1,0x4002
bfc060d8:	00091042 	srl	v0,t1,0x1
bfc060dc:	31030001 	andi	v1,t0,0x1
bfc060e0:	34468000 	ori	a2,v0,0x8000
bfc060e4:	00042042 	srl	a0,a0,0x1
bfc060e8:	1460008a 	bnez	v1,bfc06314 <crc16+0x3b4>
bfc060ec:	00051042 	srl	v0,a1,0x1
bfc060f0:	00402821 	move	a1,v0
bfc060f4:	00853026 	xor	a2,a0,a1
bfc060f8:	38ab4002 	xori	t3,a1,0x4002
bfc060fc:	000b5042 	srl	t2,t3,0x1
bfc06100:	30c70001 	andi	a3,a2,0x1
bfc06104:	00042042 	srl	a0,a0,0x1
bfc06108:	35468000 	ori	a2,t2,0x8000
bfc0610c:	14e0008a 	bnez	a3,bfc06338 <crc16+0x3d8>
bfc06110:	00051042 	srl	v0,a1,0x1
bfc06114:	00402821 	move	a1,v0
bfc06118:	00857026 	xor	t6,a0,a1
bfc0611c:	38af4002 	xori	t7,a1,0x4002
bfc06120:	000f6842 	srl	t5,t7,0x1
bfc06124:	31cc0001 	andi	t4,t6,0x1
bfc06128:	00042042 	srl	a0,a0,0x1
bfc0612c:	35a68000 	ori	a2,t5,0x8000
bfc06130:	1580008a 	bnez	t4,bfc0635c <crc16+0x3fc>
bfc06134:	00051042 	srl	v0,a1,0x1
bfc06138:	00402821 	move	a1,v0
bfc0613c:	00851826 	xor	v1,a0,a1
bfc06140:	38a24002 	xori	v0,a1,0x4002
bfc06144:	0002c842 	srl	t9,v0,0x1
bfc06148:	30780001 	andi	t8,v1,0x1
bfc0614c:	00042042 	srl	a0,a0,0x1
bfc06150:	37268000 	ori	a2,t9,0x8000
bfc06154:	1700008a 	bnez	t8,bfc06380 <crc16+0x420>
bfc06158:	00051042 	srl	v0,a1,0x1
bfc0615c:	00402821 	move	a1,v0
bfc06160:	00853826 	xor	a3,a0,a1
bfc06164:	38aa4002 	xori	t2,a1,0x4002
bfc06168:	000a4842 	srl	t1,t2,0x1
bfc0616c:	30e80001 	andi	t0,a3,0x1
bfc06170:	35268000 	ori	a2,t1,0x8000
bfc06174:	1500008a 	bnez	t0,bfc063a0 <crc16+0x440>
bfc06178:	00051042 	srl	v0,a1,0x1
bfc0617c:	00402821 	move	a1,v0
bfc06180:	38a64002 	xori	a2,a1,0x4002
bfc06184:	00066042 	srl	t4,a2,0x1
bfc06188:	00042042 	srl	a0,a0,0x1
bfc0618c:	30ab0001 	andi	t3,a1,0x1
bfc06190:	35868000 	ori	a2,t4,0x8000
bfc06194:	1564008a 	bne	t3,a0,bfc063c0 <crc16+0x460>
bfc06198:	00051042 	srl	v0,a1,0x1
bfc0619c:	03e00008 	jr	ra
bfc061a0:	3042ffff 	andi	v0,v0,0xffff
	...
bfc061b0:	00c02821 	move	a1,a2
bfc061b4:	00855826 	xor	t3,a0,a1
bfc061b8:	38ac4002 	xori	t4,a1,0x4002
bfc061bc:	000c5042 	srl	t2,t4,0x1
bfc061c0:	31690001 	andi	t1,t3,0x1
bfc061c4:	00042042 	srl	a0,a0,0x1
bfc061c8:	35468000 	ori	a2,t2,0x8000
bfc061cc:	1120ff78 	beqz	t1,bfc05fb0 <crc16+0x50>
bfc061d0:	00051042 	srl	v0,a1,0x1
bfc061d4:	00c02821 	move	a1,a2
bfc061d8:	00857826 	xor	t7,a0,a1
bfc061dc:	38b84002 	xori	t8,a1,0x4002
bfc061e0:	00187042 	srl	t6,t8,0x1
bfc061e4:	31ed0001 	andi	t5,t7,0x1
bfc061e8:	00042042 	srl	a0,a0,0x1
bfc061ec:	35c68000 	ori	a2,t6,0x8000
bfc061f0:	11a0ff78 	beqz	t5,bfc05fd4 <crc16+0x74>
bfc061f4:	00051042 	srl	v0,a1,0x1
bfc061f8:	00c02821 	move	a1,a2
bfc061fc:	00851826 	xor	v1,a0,a1
bfc06200:	38a64002 	xori	a2,a1,0x4002
bfc06204:	00061042 	srl	v0,a2,0x1
bfc06208:	30790001 	andi	t9,v1,0x1
bfc0620c:	34468000 	ori	a2,v0,0x8000
bfc06210:	00042042 	srl	a0,a0,0x1
bfc06214:	1320ff78 	beqz	t9,bfc05ff8 <crc16+0x98>
bfc06218:	00051042 	srl	v0,a1,0x1
bfc0621c:	00c02821 	move	a1,a2
bfc06220:	00855026 	xor	t2,a0,a1
bfc06224:	38ab4002 	xori	t3,a1,0x4002
bfc06228:	000b4842 	srl	t1,t3,0x1
bfc0622c:	31480001 	andi	t0,t2,0x1
bfc06230:	00042042 	srl	a0,a0,0x1
bfc06234:	35268000 	ori	a2,t1,0x8000
bfc06238:	1100ff78 	beqz	t0,bfc0601c <crc16+0xbc>
bfc0623c:	00051042 	srl	v0,a1,0x1
bfc06240:	00c02821 	move	a1,a2
bfc06244:	00857026 	xor	t6,a0,a1
bfc06248:	38af4002 	xori	t7,a1,0x4002
bfc0624c:	000f6842 	srl	t5,t7,0x1
bfc06250:	31cc0001 	andi	t4,t6,0x1
bfc06254:	00042042 	srl	a0,a0,0x1
bfc06258:	35a68000 	ori	a2,t5,0x8000
bfc0625c:	1180ff78 	beqz	t4,bfc06040 <crc16+0xe0>
bfc06260:	00051042 	srl	v0,a1,0x1
bfc06264:	00c02821 	move	a1,a2
bfc06268:	38a24002 	xori	v0,a1,0x4002
bfc0626c:	00851826 	xor	v1,a0,a1
bfc06270:	0002c842 	srl	t9,v0,0x1
bfc06274:	30780001 	andi	t8,v1,0x1
bfc06278:	37268000 	ori	a2,t9,0x8000
bfc0627c:	1300ff78 	beqz	t8,bfc06060 <crc16+0x100>
bfc06280:	00051042 	srl	v0,a1,0x1
bfc06284:	00c02821 	move	a1,a2
bfc06288:	38a64002 	xori	a2,a1,0x4002
bfc0628c:	00064842 	srl	t1,a2,0x1
bfc06290:	00042042 	srl	a0,a0,0x1
bfc06294:	30a80001 	andi	t0,a1,0x1
bfc06298:	35268000 	ori	a2,t1,0x8000
bfc0629c:	1104ff78 	beq	t0,a0,bfc06080 <crc16+0x120>
bfc062a0:	00051042 	srl	v0,a1,0x1
bfc062a4:	00c02821 	move	a1,a2
bfc062a8:	00075a02 	srl	t3,a3,0x8
bfc062ac:	01656026 	xor	t4,t3,a1
bfc062b0:	38ad4002 	xori	t5,a1,0x4002
bfc062b4:	000d5042 	srl	t2,t5,0x1
bfc062b8:	31870001 	andi	a3,t4,0x1
bfc062bc:	000b2042 	srl	a0,t3,0x1
bfc062c0:	35468000 	ori	a2,t2,0x8000
bfc062c4:	10e0ff78 	beqz	a3,bfc060a8 <crc16+0x148>
bfc062c8:	00051042 	srl	v0,a1,0x1
bfc062cc:	00c02821 	move	a1,a2
bfc062d0:	0085c026 	xor	t8,a0,a1
bfc062d4:	38b94002 	xori	t9,a1,0x4002
bfc062d8:	00197842 	srl	t7,t9,0x1
bfc062dc:	330e0001 	andi	t6,t8,0x1
bfc062e0:	00042042 	srl	a0,a0,0x1
bfc062e4:	35e68000 	ori	a2,t7,0x8000
bfc062e8:	11c0ff78 	beqz	t6,bfc060cc <crc16+0x16c>
bfc062ec:	00051042 	srl	v0,a1,0x1
bfc062f0:	00c02821 	move	a1,a2
bfc062f4:	00854026 	xor	t0,a0,a1
bfc062f8:	38a94002 	xori	t1,a1,0x4002
bfc062fc:	00091042 	srl	v0,t1,0x1
bfc06300:	31030001 	andi	v1,t0,0x1
bfc06304:	34468000 	ori	a2,v0,0x8000
bfc06308:	00042042 	srl	a0,a0,0x1
bfc0630c:	1060ff78 	beqz	v1,bfc060f0 <crc16+0x190>
bfc06310:	00051042 	srl	v0,a1,0x1
bfc06314:	00c02821 	move	a1,a2
bfc06318:	00853026 	xor	a2,a0,a1
bfc0631c:	38ab4002 	xori	t3,a1,0x4002
bfc06320:	000b5042 	srl	t2,t3,0x1
bfc06324:	30c70001 	andi	a3,a2,0x1
bfc06328:	00042042 	srl	a0,a0,0x1
bfc0632c:	35468000 	ori	a2,t2,0x8000
bfc06330:	10e0ff78 	beqz	a3,bfc06114 <crc16+0x1b4>
bfc06334:	00051042 	srl	v0,a1,0x1
bfc06338:	00c02821 	move	a1,a2
bfc0633c:	00857026 	xor	t6,a0,a1
bfc06340:	38af4002 	xori	t7,a1,0x4002
bfc06344:	000f6842 	srl	t5,t7,0x1
bfc06348:	31cc0001 	andi	t4,t6,0x1
bfc0634c:	00042042 	srl	a0,a0,0x1
bfc06350:	35a68000 	ori	a2,t5,0x8000
bfc06354:	1180ff78 	beqz	t4,bfc06138 <crc16+0x1d8>
bfc06358:	00051042 	srl	v0,a1,0x1
bfc0635c:	00c02821 	move	a1,a2
bfc06360:	00851826 	xor	v1,a0,a1
bfc06364:	38a24002 	xori	v0,a1,0x4002
bfc06368:	0002c842 	srl	t9,v0,0x1
bfc0636c:	30780001 	andi	t8,v1,0x1
bfc06370:	00042042 	srl	a0,a0,0x1
bfc06374:	37268000 	ori	a2,t9,0x8000
bfc06378:	1300ff78 	beqz	t8,bfc0615c <crc16+0x1fc>
bfc0637c:	00051042 	srl	v0,a1,0x1
bfc06380:	00c02821 	move	a1,a2
bfc06384:	00853826 	xor	a3,a0,a1
bfc06388:	38aa4002 	xori	t2,a1,0x4002
bfc0638c:	000a4842 	srl	t1,t2,0x1
bfc06390:	30e80001 	andi	t0,a3,0x1
bfc06394:	35268000 	ori	a2,t1,0x8000
bfc06398:	1100ff78 	beqz	t0,bfc0617c <crc16+0x21c>
bfc0639c:	00051042 	srl	v0,a1,0x1
bfc063a0:	00c02821 	move	a1,a2
bfc063a4:	38a64002 	xori	a2,a1,0x4002
bfc063a8:	00066042 	srl	t4,a2,0x1
bfc063ac:	00042042 	srl	a0,a0,0x1
bfc063b0:	30ab0001 	andi	t3,a1,0x1
bfc063b4:	35868000 	ori	a2,t4,0x8000
bfc063b8:	1164ff78 	beq	t3,a0,bfc0619c <crc16+0x23c>
bfc063bc:	00051042 	srl	v0,a1,0x1
bfc063c0:	00c01021 	move	v0,a2
bfc063c4:	03e00008 	jr	ra
bfc063c8:	3042ffff 	andi	v0,v0,0xffff
bfc063cc:	00000000 	nop

bfc063d0 <crcu32>:
crcu32():
bfc063d0:	3087ffff 	andi	a3,a0,0xffff
bfc063d4:	30a5ffff 	andi	a1,a1,0xffff
bfc063d8:	00804021 	move	t0,a0
bfc063dc:	30e400ff 	andi	a0,a3,0xff
bfc063e0:	00a43026 	xor	a2,a1,a0
bfc063e4:	38a94002 	xori	t1,a1,0x4002
bfc063e8:	00091042 	srl	v0,t1,0x1
bfc063ec:	30c30001 	andi	v1,a2,0x1
bfc063f0:	00042042 	srl	a0,a0,0x1
bfc063f4:	34468000 	ori	a2,v0,0x8000
bfc063f8:	14600119 	bnez	v1,bfc06860 <crcu32+0x490>
bfc063fc:	00051042 	srl	v0,a1,0x1
bfc06400:	00402821 	move	a1,v0
bfc06404:	00856026 	xor	t4,a0,a1
bfc06408:	38ad4002 	xori	t5,a1,0x4002
bfc0640c:	000d5842 	srl	t3,t5,0x1
bfc06410:	318a0001 	andi	t2,t4,0x1
bfc06414:	00042042 	srl	a0,a0,0x1
bfc06418:	35668000 	ori	a2,t3,0x8000
bfc0641c:	15400119 	bnez	t2,bfc06884 <crcu32+0x4b4>
bfc06420:	00051042 	srl	v0,a1,0x1
bfc06424:	00402821 	move	a1,v0
bfc06428:	0085c026 	xor	t8,a0,a1
bfc0642c:	38b94002 	xori	t9,a1,0x4002
bfc06430:	00197842 	srl	t7,t9,0x1
bfc06434:	330e0001 	andi	t6,t8,0x1
bfc06438:	00042042 	srl	a0,a0,0x1
bfc0643c:	35e68000 	ori	a2,t7,0x8000
bfc06440:	15c00119 	bnez	t6,bfc068a8 <crcu32+0x4d8>
bfc06444:	00051042 	srl	v0,a1,0x1
bfc06448:	00402821 	move	a1,v0
bfc0644c:	00853026 	xor	a2,a0,a1
bfc06450:	38a94002 	xori	t1,a1,0x4002
bfc06454:	00091042 	srl	v0,t1,0x1
bfc06458:	30c30001 	andi	v1,a2,0x1
bfc0645c:	00042042 	srl	a0,a0,0x1
bfc06460:	34468000 	ori	a2,v0,0x8000
bfc06464:	14600119 	bnez	v1,bfc068cc <crcu32+0x4fc>
bfc06468:	00051042 	srl	v0,a1,0x1
bfc0646c:	00402821 	move	a1,v0
bfc06470:	00856026 	xor	t4,a0,a1
bfc06474:	38ad4002 	xori	t5,a1,0x4002
bfc06478:	000d5842 	srl	t3,t5,0x1
bfc0647c:	318a0001 	andi	t2,t4,0x1
bfc06480:	00042042 	srl	a0,a0,0x1
bfc06484:	35668000 	ori	a2,t3,0x8000
bfc06488:	15400119 	bnez	t2,bfc068f0 <crcu32+0x520>
bfc0648c:	00051042 	srl	v0,a1,0x1
bfc06490:	00402821 	move	a1,v0
bfc06494:	0085c026 	xor	t8,a0,a1
bfc06498:	38b94002 	xori	t9,a1,0x4002
bfc0649c:	00197842 	srl	t7,t9,0x1
bfc064a0:	330e0001 	andi	t6,t8,0x1
bfc064a4:	00042042 	srl	a0,a0,0x1
bfc064a8:	35e68000 	ori	a2,t7,0x8000
bfc064ac:	15c00119 	bnez	t6,bfc06914 <crcu32+0x544>
bfc064b0:	00051042 	srl	v0,a1,0x1
bfc064b4:	00402821 	move	a1,v0
bfc064b8:	00853026 	xor	a2,a0,a1
bfc064bc:	38a94002 	xori	t1,a1,0x4002
bfc064c0:	00091042 	srl	v0,t1,0x1
bfc064c4:	30c30001 	andi	v1,a2,0x1
bfc064c8:	34468000 	ori	a2,v0,0x8000
bfc064cc:	14600119 	bnez	v1,bfc06934 <crcu32+0x564>
bfc064d0:	00051042 	srl	v0,a1,0x1
bfc064d4:	00402821 	move	a1,v0
bfc064d8:	38ac4002 	xori	t4,a1,0x4002
bfc064dc:	000c5842 	srl	t3,t4,0x1
bfc064e0:	00042042 	srl	a0,a0,0x1
bfc064e4:	30aa0001 	andi	t2,a1,0x1
bfc064e8:	35668000 	ori	a2,t3,0x8000
bfc064ec:	15440119 	bne	t2,a0,bfc06954 <crcu32+0x584>
bfc064f0:	00051042 	srl	v0,a1,0x1
bfc064f4:	00402821 	move	a1,v0
bfc064f8:	00077202 	srl	t6,a3,0x8
bfc064fc:	01c57826 	xor	t7,t6,a1
bfc06500:	38b84002 	xori	t8,a1,0x4002
bfc06504:	00186842 	srl	t5,t8,0x1
bfc06508:	31e70001 	andi	a3,t7,0x1
bfc0650c:	000e2042 	srl	a0,t6,0x1
bfc06510:	35a68000 	ori	a2,t5,0x8000
bfc06514:	14e00119 	bnez	a3,bfc0697c <crcu32+0x5ac>
bfc06518:	00051042 	srl	v0,a1,0x1
bfc0651c:	00402821 	move	a1,v0
bfc06520:	00851826 	xor	v1,a0,a1
bfc06524:	38a64002 	xori	a2,a1,0x4002
bfc06528:	00061042 	srl	v0,a2,0x1
bfc0652c:	30790001 	andi	t9,v1,0x1
bfc06530:	34468000 	ori	a2,v0,0x8000
bfc06534:	00042042 	srl	a0,a0,0x1
bfc06538:	17200119 	bnez	t9,bfc069a0 <crcu32+0x5d0>
bfc0653c:	00051042 	srl	v0,a1,0x1
bfc06540:	00402821 	move	a1,v0
bfc06544:	00855826 	xor	t3,a0,a1
bfc06548:	38ac4002 	xori	t4,a1,0x4002
bfc0654c:	000c5042 	srl	t2,t4,0x1
bfc06550:	31690001 	andi	t1,t3,0x1
bfc06554:	00042042 	srl	a0,a0,0x1
bfc06558:	35468000 	ori	a2,t2,0x8000
bfc0655c:	15200119 	bnez	t1,bfc069c4 <crcu32+0x5f4>
bfc06560:	00051042 	srl	v0,a1,0x1
bfc06564:	00402821 	move	a1,v0
bfc06568:	00857026 	xor	t6,a0,a1
bfc0656c:	38af4002 	xori	t7,a1,0x4002
bfc06570:	000f6842 	srl	t5,t7,0x1
bfc06574:	31c70001 	andi	a3,t6,0x1
bfc06578:	00042042 	srl	a0,a0,0x1
bfc0657c:	35a68000 	ori	a2,t5,0x8000
bfc06580:	14e00119 	bnez	a3,bfc069e8 <crcu32+0x618>
bfc06584:	00051042 	srl	v0,a1,0x1
bfc06588:	00402821 	move	a1,v0
bfc0658c:	00851826 	xor	v1,a0,a1
bfc06590:	38a24002 	xori	v0,a1,0x4002
bfc06594:	0002c842 	srl	t9,v0,0x1
bfc06598:	30780001 	andi	t8,v1,0x1
bfc0659c:	00042042 	srl	a0,a0,0x1
bfc065a0:	37268000 	ori	a2,t9,0x8000
bfc065a4:	17000119 	bnez	t8,bfc06a0c <crcu32+0x63c>
bfc065a8:	00051042 	srl	v0,a1,0x1
bfc065ac:	00402821 	move	a1,v0
bfc065b0:	00853026 	xor	a2,a0,a1
bfc065b4:	38ab4002 	xori	t3,a1,0x4002
bfc065b8:	000b5042 	srl	t2,t3,0x1
bfc065bc:	30c90001 	andi	t1,a2,0x1
bfc065c0:	00042042 	srl	a0,a0,0x1
bfc065c4:	35468000 	ori	a2,t2,0x8000
bfc065c8:	15200119 	bnez	t1,bfc06a30 <crcu32+0x660>
bfc065cc:	00051042 	srl	v0,a1,0x1
bfc065d0:	00402821 	move	a1,v0
bfc065d4:	00856826 	xor	t5,a0,a1
bfc065d8:	38ae4002 	xori	t6,a1,0x4002
bfc065dc:	000e3842 	srl	a3,t6,0x1
bfc065e0:	31ac0001 	andi	t4,t5,0x1
bfc065e4:	34e68000 	ori	a2,a3,0x8000
bfc065e8:	15800119 	bnez	t4,bfc06a50 <crcu32+0x680>
bfc065ec:	00051042 	srl	v0,a1,0x1
bfc065f0:	00402821 	move	a1,v0
bfc065f4:	38b94002 	xori	t9,a1,0x4002
bfc065f8:	0019c042 	srl	t8,t9,0x1
bfc065fc:	00042042 	srl	a0,a0,0x1
bfc06600:	30af0001 	andi	t7,a1,0x1
bfc06604:	37068000 	ori	a2,t8,0x8000
bfc06608:	15e40119 	bne	t7,a0,bfc06a70 <crcu32+0x6a0>
bfc0660c:	00051042 	srl	v0,a1,0x1
bfc06610:	00083c02 	srl	a3,t0,0x10
bfc06614:	00402821 	move	a1,v0
bfc06618:	30e900ff 	andi	t1,a3,0xff
bfc0661c:	01251826 	xor	v1,t1,a1
bfc06620:	38aa4002 	xori	t2,a1,0x4002
bfc06624:	000a1042 	srl	v0,t2,0x1
bfc06628:	30680001 	andi	t0,v1,0x1
bfc0662c:	34468000 	ori	a2,v0,0x8000
bfc06630:	00092042 	srl	a0,t1,0x1
bfc06634:	15000119 	bnez	t0,bfc06a9c <crcu32+0x6cc>
bfc06638:	00051042 	srl	v0,a1,0x1
bfc0663c:	00402821 	move	a1,v0
bfc06640:	00853026 	xor	a2,a0,a1
bfc06644:	38ad4002 	xori	t5,a1,0x4002
bfc06648:	000d6042 	srl	t4,t5,0x1
bfc0664c:	30cb0001 	andi	t3,a2,0x1
bfc06650:	00042042 	srl	a0,a0,0x1
bfc06654:	35868000 	ori	a2,t4,0x8000
bfc06658:	15600119 	bnez	t3,bfc06ac0 <crcu32+0x6f0>
bfc0665c:	00051042 	srl	v0,a1,0x1
bfc06660:	00402821 	move	a1,v0
bfc06664:	0085c026 	xor	t8,a0,a1
bfc06668:	38b94002 	xori	t9,a1,0x4002
bfc0666c:	00197842 	srl	t7,t9,0x1
bfc06670:	330e0001 	andi	t6,t8,0x1
bfc06674:	00042042 	srl	a0,a0,0x1
bfc06678:	35e68000 	ori	a2,t7,0x8000
bfc0667c:	15c00119 	bnez	t6,bfc06ae4 <crcu32+0x714>
bfc06680:	00051042 	srl	v0,a1,0x1
bfc06684:	00402821 	move	a1,v0
bfc06688:	00854826 	xor	t1,a0,a1
bfc0668c:	38a34002 	xori	v1,a1,0x4002
bfc06690:	00031042 	srl	v0,v1,0x1
bfc06694:	31280001 	andi	t0,t1,0x1
bfc06698:	34468000 	ori	a2,v0,0x8000
bfc0669c:	00042042 	srl	a0,a0,0x1
bfc066a0:	15000119 	bnez	t0,bfc06b08 <crcu32+0x738>
bfc066a4:	00051042 	srl	v0,a1,0x1
bfc066a8:	00402821 	move	a1,v0
bfc066ac:	00856026 	xor	t4,a0,a1
bfc066b0:	38a64002 	xori	a2,a1,0x4002
bfc066b4:	00065842 	srl	t3,a2,0x1
bfc066b8:	318a0001 	andi	t2,t4,0x1
bfc066bc:	00042042 	srl	a0,a0,0x1
bfc066c0:	35668000 	ori	a2,t3,0x8000
bfc066c4:	15400119 	bnez	t2,bfc06b2c <crcu32+0x75c>
bfc066c8:	00051042 	srl	v0,a1,0x1
bfc066cc:	00402821 	move	a1,v0
bfc066d0:	00857826 	xor	t7,a0,a1
bfc066d4:	38b84002 	xori	t8,a1,0x4002
bfc066d8:	00187042 	srl	t6,t8,0x1
bfc066dc:	31ed0001 	andi	t5,t7,0x1
bfc066e0:	00042042 	srl	a0,a0,0x1
bfc066e4:	35c68000 	ori	a2,t6,0x8000
bfc066e8:	15a00119 	bnez	t5,bfc06b50 <crcu32+0x780>
bfc066ec:	00051042 	srl	v0,a1,0x1
bfc066f0:	00402821 	move	a1,v0
bfc066f4:	38a24002 	xori	v0,a1,0x4002
bfc066f8:	00854826 	xor	t1,a0,a1
bfc066fc:	00024042 	srl	t0,v0,0x1
bfc06700:	31390001 	andi	t9,t1,0x1
bfc06704:	35068000 	ori	a2,t0,0x8000
bfc06708:	17200119 	bnez	t9,bfc06b70 <crcu32+0x7a0>
bfc0670c:	00051042 	srl	v0,a1,0x1
bfc06710:	00402821 	move	a1,v0
bfc06714:	38ab4002 	xori	t3,a1,0x4002
bfc06718:	000b5042 	srl	t2,t3,0x1
bfc0671c:	00042042 	srl	a0,a0,0x1
bfc06720:	30a30001 	andi	v1,a1,0x1
bfc06724:	35468000 	ori	a2,t2,0x8000
bfc06728:	14640119 	bne	v1,a0,bfc06b90 <crcu32+0x7c0>
bfc0672c:	00051042 	srl	v0,a1,0x1
bfc06730:	00073202 	srl	a2,a3,0x8
bfc06734:	00402821 	move	a1,v0
bfc06738:	00c56826 	xor	t5,a2,a1
bfc0673c:	38ae4002 	xori	t6,a1,0x4002
bfc06740:	000e6042 	srl	t4,t6,0x1
bfc06744:	31a70001 	andi	a3,t5,0x1
bfc06748:	00062042 	srl	a0,a2,0x1
bfc0674c:	00051042 	srl	v0,a1,0x1
bfc06750:	14e00119 	bnez	a3,bfc06bb8 <crcu32+0x7e8>
bfc06754:	35868000 	ori	a2,t4,0x8000
bfc06758:	00402821 	move	a1,v0
bfc0675c:	0085c826 	xor	t9,a0,a1
bfc06760:	38a84002 	xori	t0,a1,0x4002
bfc06764:	0008c042 	srl	t8,t0,0x1
bfc06768:	332f0001 	andi	t7,t9,0x1
bfc0676c:	00042042 	srl	a0,a0,0x1
bfc06770:	37068000 	ori	a2,t8,0x8000
bfc06774:	15e00119 	bnez	t7,bfc06bdc <crcu32+0x80c>
bfc06778:	00051042 	srl	v0,a1,0x1
bfc0677c:	00402821 	move	a1,v0
bfc06780:	00851826 	xor	v1,a0,a1
bfc06784:	38aa4002 	xori	t2,a1,0x4002
bfc06788:	000a1042 	srl	v0,t2,0x1
bfc0678c:	30690001 	andi	t1,v1,0x1
bfc06790:	34468000 	ori	a2,v0,0x8000
bfc06794:	00042042 	srl	a0,a0,0x1
bfc06798:	15200119 	bnez	t1,bfc06c00 <crcu32+0x830>
bfc0679c:	00051042 	srl	v0,a1,0x1
bfc067a0:	00402821 	move	a1,v0
bfc067a4:	00856026 	xor	t4,a0,a1
bfc067a8:	38a64002 	xori	a2,a1,0x4002
bfc067ac:	00063842 	srl	a3,a2,0x1
bfc067b0:	318b0001 	andi	t3,t4,0x1
bfc067b4:	00042042 	srl	a0,a0,0x1
bfc067b8:	34e68000 	ori	a2,a3,0x8000
bfc067bc:	15600119 	bnez	t3,bfc06c24 <crcu32+0x854>
bfc067c0:	00051042 	srl	v0,a1,0x1
bfc067c4:	00402821 	move	a1,v0
bfc067c8:	00857826 	xor	t7,a0,a1
bfc067cc:	38b84002 	xori	t8,a1,0x4002
bfc067d0:	00187042 	srl	t6,t8,0x1
bfc067d4:	31ed0001 	andi	t5,t7,0x1
bfc067d8:	00042042 	srl	a0,a0,0x1
bfc067dc:	35c68000 	ori	a2,t6,0x8000
bfc067e0:	15a00119 	bnez	t5,bfc06c48 <crcu32+0x878>
bfc067e4:	00051042 	srl	v0,a1,0x1
bfc067e8:	00402821 	move	a1,v0
bfc067ec:	00854826 	xor	t1,a0,a1
bfc067f0:	38a24002 	xori	v0,a1,0x4002
bfc067f4:	00024042 	srl	t0,v0,0x1
bfc067f8:	31390001 	andi	t9,t1,0x1
bfc067fc:	00042042 	srl	a0,a0,0x1
bfc06800:	35068000 	ori	a2,t0,0x8000
bfc06804:	17200119 	bnez	t9,bfc06c6c <crcu32+0x89c>
bfc06808:	00051042 	srl	v0,a1,0x1
bfc0680c:	00402821 	move	a1,v0
bfc06810:	00855826 	xor	t3,a0,a1
bfc06814:	38a74002 	xori	a3,a1,0x4002
bfc06818:	00075042 	srl	t2,a3,0x1
bfc0681c:	31630001 	andi	v1,t3,0x1
bfc06820:	35468000 	ori	a2,t2,0x8000
bfc06824:	14600119 	bnez	v1,bfc06c8c <crcu32+0x8bc>
bfc06828:	00051042 	srl	v0,a1,0x1
bfc0682c:	00402821 	move	a1,v0
bfc06830:	38a64002 	xori	a2,a1,0x4002
bfc06834:	00066842 	srl	t5,a2,0x1
bfc06838:	00042042 	srl	a0,a0,0x1
bfc0683c:	30ac0001 	andi	t4,a1,0x1
bfc06840:	35a68000 	ori	a2,t5,0x8000
bfc06844:	15840119 	bne	t4,a0,bfc06cac <crcu32+0x8dc>
bfc06848:	00051042 	srl	v0,a1,0x1
bfc0684c:	03e00008 	jr	ra
bfc06850:	3042ffff 	andi	v0,v0,0xffff
	...
bfc06860:	00c02821 	move	a1,a2
bfc06864:	00856026 	xor	t4,a0,a1
bfc06868:	38ad4002 	xori	t5,a1,0x4002
bfc0686c:	000d5842 	srl	t3,t5,0x1
bfc06870:	318a0001 	andi	t2,t4,0x1
bfc06874:	00042042 	srl	a0,a0,0x1
bfc06878:	35668000 	ori	a2,t3,0x8000
bfc0687c:	1140fee9 	beqz	t2,bfc06424 <crcu32+0x54>
bfc06880:	00051042 	srl	v0,a1,0x1
bfc06884:	00c02821 	move	a1,a2
bfc06888:	0085c026 	xor	t8,a0,a1
bfc0688c:	38b94002 	xori	t9,a1,0x4002
bfc06890:	00197842 	srl	t7,t9,0x1
bfc06894:	330e0001 	andi	t6,t8,0x1
bfc06898:	00042042 	srl	a0,a0,0x1
bfc0689c:	35e68000 	ori	a2,t7,0x8000
bfc068a0:	11c0fee9 	beqz	t6,bfc06448 <crcu32+0x78>
bfc068a4:	00051042 	srl	v0,a1,0x1
bfc068a8:	00c02821 	move	a1,a2
bfc068ac:	00853026 	xor	a2,a0,a1
bfc068b0:	38a94002 	xori	t1,a1,0x4002
bfc068b4:	00091042 	srl	v0,t1,0x1
bfc068b8:	30c30001 	andi	v1,a2,0x1
bfc068bc:	00042042 	srl	a0,a0,0x1
bfc068c0:	34468000 	ori	a2,v0,0x8000
bfc068c4:	1060fee9 	beqz	v1,bfc0646c <crcu32+0x9c>
bfc068c8:	00051042 	srl	v0,a1,0x1
bfc068cc:	00c02821 	move	a1,a2
bfc068d0:	00856026 	xor	t4,a0,a1
bfc068d4:	38ad4002 	xori	t5,a1,0x4002
bfc068d8:	000d5842 	srl	t3,t5,0x1
bfc068dc:	318a0001 	andi	t2,t4,0x1
bfc068e0:	00042042 	srl	a0,a0,0x1
bfc068e4:	35668000 	ori	a2,t3,0x8000
bfc068e8:	1140fee9 	beqz	t2,bfc06490 <crcu32+0xc0>
bfc068ec:	00051042 	srl	v0,a1,0x1
bfc068f0:	00c02821 	move	a1,a2
bfc068f4:	0085c026 	xor	t8,a0,a1
bfc068f8:	38b94002 	xori	t9,a1,0x4002
bfc068fc:	00197842 	srl	t7,t9,0x1
bfc06900:	330e0001 	andi	t6,t8,0x1
bfc06904:	00042042 	srl	a0,a0,0x1
bfc06908:	35e68000 	ori	a2,t7,0x8000
bfc0690c:	11c0fee9 	beqz	t6,bfc064b4 <crcu32+0xe4>
bfc06910:	00051042 	srl	v0,a1,0x1
bfc06914:	00c02821 	move	a1,a2
bfc06918:	00853026 	xor	a2,a0,a1
bfc0691c:	38a94002 	xori	t1,a1,0x4002
bfc06920:	00091042 	srl	v0,t1,0x1
bfc06924:	30c30001 	andi	v1,a2,0x1
bfc06928:	34468000 	ori	a2,v0,0x8000
bfc0692c:	1060fee9 	beqz	v1,bfc064d4 <crcu32+0x104>
bfc06930:	00051042 	srl	v0,a1,0x1
bfc06934:	00c02821 	move	a1,a2
bfc06938:	38ac4002 	xori	t4,a1,0x4002
bfc0693c:	000c5842 	srl	t3,t4,0x1
bfc06940:	00042042 	srl	a0,a0,0x1
bfc06944:	30aa0001 	andi	t2,a1,0x1
bfc06948:	35668000 	ori	a2,t3,0x8000
bfc0694c:	1144fee9 	beq	t2,a0,bfc064f4 <crcu32+0x124>
bfc06950:	00051042 	srl	v0,a1,0x1
bfc06954:	00c02821 	move	a1,a2
bfc06958:	00077202 	srl	t6,a3,0x8
bfc0695c:	01c57826 	xor	t7,t6,a1
bfc06960:	38b84002 	xori	t8,a1,0x4002
bfc06964:	00186842 	srl	t5,t8,0x1
bfc06968:	31e70001 	andi	a3,t7,0x1
bfc0696c:	000e2042 	srl	a0,t6,0x1
bfc06970:	35a68000 	ori	a2,t5,0x8000
bfc06974:	10e0fee9 	beqz	a3,bfc0651c <crcu32+0x14c>
bfc06978:	00051042 	srl	v0,a1,0x1
bfc0697c:	00c02821 	move	a1,a2
bfc06980:	00851826 	xor	v1,a0,a1
bfc06984:	38a64002 	xori	a2,a1,0x4002
bfc06988:	00061042 	srl	v0,a2,0x1
bfc0698c:	30790001 	andi	t9,v1,0x1
bfc06990:	34468000 	ori	a2,v0,0x8000
bfc06994:	00042042 	srl	a0,a0,0x1
bfc06998:	1320fee9 	beqz	t9,bfc06540 <crcu32+0x170>
bfc0699c:	00051042 	srl	v0,a1,0x1
bfc069a0:	00c02821 	move	a1,a2
bfc069a4:	00855826 	xor	t3,a0,a1
bfc069a8:	38ac4002 	xori	t4,a1,0x4002
bfc069ac:	000c5042 	srl	t2,t4,0x1
bfc069b0:	31690001 	andi	t1,t3,0x1
bfc069b4:	00042042 	srl	a0,a0,0x1
bfc069b8:	35468000 	ori	a2,t2,0x8000
bfc069bc:	1120fee9 	beqz	t1,bfc06564 <crcu32+0x194>
bfc069c0:	00051042 	srl	v0,a1,0x1
bfc069c4:	00c02821 	move	a1,a2
bfc069c8:	00857026 	xor	t6,a0,a1
bfc069cc:	38af4002 	xori	t7,a1,0x4002
bfc069d0:	000f6842 	srl	t5,t7,0x1
bfc069d4:	31c70001 	andi	a3,t6,0x1
bfc069d8:	00042042 	srl	a0,a0,0x1
bfc069dc:	35a68000 	ori	a2,t5,0x8000
bfc069e0:	10e0fee9 	beqz	a3,bfc06588 <crcu32+0x1b8>
bfc069e4:	00051042 	srl	v0,a1,0x1
bfc069e8:	00c02821 	move	a1,a2
bfc069ec:	00851826 	xor	v1,a0,a1
bfc069f0:	38a24002 	xori	v0,a1,0x4002
bfc069f4:	0002c842 	srl	t9,v0,0x1
bfc069f8:	30780001 	andi	t8,v1,0x1
bfc069fc:	00042042 	srl	a0,a0,0x1
bfc06a00:	37268000 	ori	a2,t9,0x8000
bfc06a04:	1300fee9 	beqz	t8,bfc065ac <crcu32+0x1dc>
bfc06a08:	00051042 	srl	v0,a1,0x1
bfc06a0c:	00c02821 	move	a1,a2
bfc06a10:	00853026 	xor	a2,a0,a1
bfc06a14:	38ab4002 	xori	t3,a1,0x4002
bfc06a18:	000b5042 	srl	t2,t3,0x1
bfc06a1c:	30c90001 	andi	t1,a2,0x1
bfc06a20:	00042042 	srl	a0,a0,0x1
bfc06a24:	35468000 	ori	a2,t2,0x8000
bfc06a28:	1120fee9 	beqz	t1,bfc065d0 <crcu32+0x200>
bfc06a2c:	00051042 	srl	v0,a1,0x1
bfc06a30:	00c02821 	move	a1,a2
bfc06a34:	00856826 	xor	t5,a0,a1
bfc06a38:	38ae4002 	xori	t6,a1,0x4002
bfc06a3c:	000e3842 	srl	a3,t6,0x1
bfc06a40:	31ac0001 	andi	t4,t5,0x1
bfc06a44:	34e68000 	ori	a2,a3,0x8000
bfc06a48:	1180fee9 	beqz	t4,bfc065f0 <crcu32+0x220>
bfc06a4c:	00051042 	srl	v0,a1,0x1
bfc06a50:	00c02821 	move	a1,a2
bfc06a54:	38b94002 	xori	t9,a1,0x4002
bfc06a58:	0019c042 	srl	t8,t9,0x1
bfc06a5c:	00042042 	srl	a0,a0,0x1
bfc06a60:	30af0001 	andi	t7,a1,0x1
bfc06a64:	37068000 	ori	a2,t8,0x8000
bfc06a68:	11e4fee9 	beq	t7,a0,bfc06610 <crcu32+0x240>
bfc06a6c:	00051042 	srl	v0,a1,0x1
bfc06a70:	00083c02 	srl	a3,t0,0x10
bfc06a74:	00c02821 	move	a1,a2
bfc06a78:	30e900ff 	andi	t1,a3,0xff
bfc06a7c:	01251826 	xor	v1,t1,a1
bfc06a80:	38aa4002 	xori	t2,a1,0x4002
bfc06a84:	000a1042 	srl	v0,t2,0x1
bfc06a88:	30680001 	andi	t0,v1,0x1
bfc06a8c:	34468000 	ori	a2,v0,0x8000
bfc06a90:	00092042 	srl	a0,t1,0x1
bfc06a94:	1100fee9 	beqz	t0,bfc0663c <crcu32+0x26c>
bfc06a98:	00051042 	srl	v0,a1,0x1
bfc06a9c:	00c02821 	move	a1,a2
bfc06aa0:	00853026 	xor	a2,a0,a1
bfc06aa4:	38ad4002 	xori	t5,a1,0x4002
bfc06aa8:	000d6042 	srl	t4,t5,0x1
bfc06aac:	30cb0001 	andi	t3,a2,0x1
bfc06ab0:	00042042 	srl	a0,a0,0x1
bfc06ab4:	35868000 	ori	a2,t4,0x8000
bfc06ab8:	1160fee9 	beqz	t3,bfc06660 <crcu32+0x290>
bfc06abc:	00051042 	srl	v0,a1,0x1
bfc06ac0:	00c02821 	move	a1,a2
bfc06ac4:	0085c026 	xor	t8,a0,a1
bfc06ac8:	38b94002 	xori	t9,a1,0x4002
bfc06acc:	00197842 	srl	t7,t9,0x1
bfc06ad0:	330e0001 	andi	t6,t8,0x1
bfc06ad4:	00042042 	srl	a0,a0,0x1
bfc06ad8:	35e68000 	ori	a2,t7,0x8000
bfc06adc:	11c0fee9 	beqz	t6,bfc06684 <crcu32+0x2b4>
bfc06ae0:	00051042 	srl	v0,a1,0x1
bfc06ae4:	00c02821 	move	a1,a2
bfc06ae8:	00854826 	xor	t1,a0,a1
bfc06aec:	38a34002 	xori	v1,a1,0x4002
bfc06af0:	00031042 	srl	v0,v1,0x1
bfc06af4:	31280001 	andi	t0,t1,0x1
bfc06af8:	34468000 	ori	a2,v0,0x8000
bfc06afc:	00042042 	srl	a0,a0,0x1
bfc06b00:	1100fee9 	beqz	t0,bfc066a8 <crcu32+0x2d8>
bfc06b04:	00051042 	srl	v0,a1,0x1
bfc06b08:	00c02821 	move	a1,a2
bfc06b0c:	00856026 	xor	t4,a0,a1
bfc06b10:	38a64002 	xori	a2,a1,0x4002
bfc06b14:	00065842 	srl	t3,a2,0x1
bfc06b18:	318a0001 	andi	t2,t4,0x1
bfc06b1c:	00042042 	srl	a0,a0,0x1
bfc06b20:	35668000 	ori	a2,t3,0x8000
bfc06b24:	1140fee9 	beqz	t2,bfc066cc <crcu32+0x2fc>
bfc06b28:	00051042 	srl	v0,a1,0x1
bfc06b2c:	00c02821 	move	a1,a2
bfc06b30:	00857826 	xor	t7,a0,a1
bfc06b34:	38b84002 	xori	t8,a1,0x4002
bfc06b38:	00187042 	srl	t6,t8,0x1
bfc06b3c:	31ed0001 	andi	t5,t7,0x1
bfc06b40:	00042042 	srl	a0,a0,0x1
bfc06b44:	35c68000 	ori	a2,t6,0x8000
bfc06b48:	11a0fee9 	beqz	t5,bfc066f0 <crcu32+0x320>
bfc06b4c:	00051042 	srl	v0,a1,0x1
bfc06b50:	00c02821 	move	a1,a2
bfc06b54:	38a24002 	xori	v0,a1,0x4002
bfc06b58:	00854826 	xor	t1,a0,a1
bfc06b5c:	00024042 	srl	t0,v0,0x1
bfc06b60:	31390001 	andi	t9,t1,0x1
bfc06b64:	35068000 	ori	a2,t0,0x8000
bfc06b68:	1320fee9 	beqz	t9,bfc06710 <crcu32+0x340>
bfc06b6c:	00051042 	srl	v0,a1,0x1
bfc06b70:	00c02821 	move	a1,a2
bfc06b74:	38ab4002 	xori	t3,a1,0x4002
bfc06b78:	000b5042 	srl	t2,t3,0x1
bfc06b7c:	00042042 	srl	a0,a0,0x1
bfc06b80:	30a30001 	andi	v1,a1,0x1
bfc06b84:	35468000 	ori	a2,t2,0x8000
bfc06b88:	1064fee9 	beq	v1,a0,bfc06730 <crcu32+0x360>
bfc06b8c:	00051042 	srl	v0,a1,0x1
bfc06b90:	00c02821 	move	a1,a2
bfc06b94:	00073202 	srl	a2,a3,0x8
bfc06b98:	00c56826 	xor	t5,a2,a1
bfc06b9c:	38ae4002 	xori	t6,a1,0x4002
bfc06ba0:	000e6042 	srl	t4,t6,0x1
bfc06ba4:	31a70001 	andi	a3,t5,0x1
bfc06ba8:	00062042 	srl	a0,a2,0x1
bfc06bac:	00051042 	srl	v0,a1,0x1
bfc06bb0:	10e0fee9 	beqz	a3,bfc06758 <crcu32+0x388>
bfc06bb4:	35868000 	ori	a2,t4,0x8000
bfc06bb8:	00c02821 	move	a1,a2
bfc06bbc:	0085c826 	xor	t9,a0,a1
bfc06bc0:	38a84002 	xori	t0,a1,0x4002
bfc06bc4:	0008c042 	srl	t8,t0,0x1
bfc06bc8:	332f0001 	andi	t7,t9,0x1
bfc06bcc:	00042042 	srl	a0,a0,0x1
bfc06bd0:	37068000 	ori	a2,t8,0x8000
bfc06bd4:	11e0fee9 	beqz	t7,bfc0677c <crcu32+0x3ac>
bfc06bd8:	00051042 	srl	v0,a1,0x1
bfc06bdc:	00c02821 	move	a1,a2
bfc06be0:	00851826 	xor	v1,a0,a1
bfc06be4:	38aa4002 	xori	t2,a1,0x4002
bfc06be8:	000a1042 	srl	v0,t2,0x1
bfc06bec:	30690001 	andi	t1,v1,0x1
bfc06bf0:	34468000 	ori	a2,v0,0x8000
bfc06bf4:	00042042 	srl	a0,a0,0x1
bfc06bf8:	1120fee9 	beqz	t1,bfc067a0 <crcu32+0x3d0>
bfc06bfc:	00051042 	srl	v0,a1,0x1
bfc06c00:	00c02821 	move	a1,a2
bfc06c04:	00856026 	xor	t4,a0,a1
bfc06c08:	38a64002 	xori	a2,a1,0x4002
bfc06c0c:	00063842 	srl	a3,a2,0x1
bfc06c10:	318b0001 	andi	t3,t4,0x1
bfc06c14:	00042042 	srl	a0,a0,0x1
bfc06c18:	34e68000 	ori	a2,a3,0x8000
bfc06c1c:	1160fee9 	beqz	t3,bfc067c4 <crcu32+0x3f4>
bfc06c20:	00051042 	srl	v0,a1,0x1
bfc06c24:	00c02821 	move	a1,a2
bfc06c28:	00857826 	xor	t7,a0,a1
bfc06c2c:	38b84002 	xori	t8,a1,0x4002
bfc06c30:	00187042 	srl	t6,t8,0x1
bfc06c34:	31ed0001 	andi	t5,t7,0x1
bfc06c38:	00042042 	srl	a0,a0,0x1
bfc06c3c:	35c68000 	ori	a2,t6,0x8000
bfc06c40:	11a0fee9 	beqz	t5,bfc067e8 <crcu32+0x418>
bfc06c44:	00051042 	srl	v0,a1,0x1
bfc06c48:	00c02821 	move	a1,a2
bfc06c4c:	00854826 	xor	t1,a0,a1
bfc06c50:	38a24002 	xori	v0,a1,0x4002
bfc06c54:	00024042 	srl	t0,v0,0x1
bfc06c58:	31390001 	andi	t9,t1,0x1
bfc06c5c:	00042042 	srl	a0,a0,0x1
bfc06c60:	35068000 	ori	a2,t0,0x8000
bfc06c64:	1320fee9 	beqz	t9,bfc0680c <crcu32+0x43c>
bfc06c68:	00051042 	srl	v0,a1,0x1
bfc06c6c:	00c02821 	move	a1,a2
bfc06c70:	00855826 	xor	t3,a0,a1
bfc06c74:	38a74002 	xori	a3,a1,0x4002
bfc06c78:	00075042 	srl	t2,a3,0x1
bfc06c7c:	31630001 	andi	v1,t3,0x1
bfc06c80:	35468000 	ori	a2,t2,0x8000
bfc06c84:	1060fee9 	beqz	v1,bfc0682c <crcu32+0x45c>
bfc06c88:	00051042 	srl	v0,a1,0x1
bfc06c8c:	00c02821 	move	a1,a2
bfc06c90:	38a64002 	xori	a2,a1,0x4002
bfc06c94:	00066842 	srl	t5,a2,0x1
bfc06c98:	00042042 	srl	a0,a0,0x1
bfc06c9c:	30ac0001 	andi	t4,a1,0x1
bfc06ca0:	35a68000 	ori	a2,t5,0x8000
bfc06ca4:	1184fee9 	beq	t4,a0,bfc0684c <crcu32+0x47c>
bfc06ca8:	00051042 	srl	v0,a1,0x1
bfc06cac:	00c01021 	move	v0,a2
bfc06cb0:	03e00008 	jr	ra
bfc06cb4:	3042ffff 	andi	v0,v0,0xffff
	...

bfc06cc0 <get_seed_args>:
get_seed_args():
bfc06cc0:	0085282a 	slt	a1,a0,a1
bfc06cc4:	10a00042 	beqz	a1,bfc06dd0 <get_seed_args+0x110>
bfc06cc8:	00001021 	move	v0,zero
bfc06ccc:	00043880 	sll	a3,a0,0x2
bfc06cd0:	00c71821 	addu	v1,a2,a3
bfc06cd4:	8c660000 	lw	a2,0(v1)
bfc06cd8:	2402002d 	li	v0,45
bfc06cdc:	80c70000 	lb	a3,0(a2)
bfc06ce0:	00000000 	nop
bfc06ce4:	10e2003e 	beq	a3,v0,bfc06de0 <get_seed_args+0x120>
bfc06ce8:	24040030 	li	a0,48
bfc06cec:	10e40041 	beq	a3,a0,bfc06df4 <get_seed_args+0x134>
bfc06cf0:	240a0001 	li	t2,1
bfc06cf4:	24edffd0 	addiu	t5,a3,-48
bfc06cf8:	31ac00ff 	andi	t4,t5,0xff
bfc06cfc:	2d8b000a 	sltiu	t3,t4,10
bfc06d00:	1160002b 	beqz	t3,bfc06db0 <get_seed_args+0xf0>
bfc06d04:	00004021 	move	t0,zero
bfc06d08:	000878c0 	sll	t7,t0,0x3
bfc06d0c:	00087040 	sll	t6,t0,0x1
bfc06d10:	01cf4021 	addu	t0,t6,t7
bfc06d14:	00e86821 	addu	t5,a3,t0
bfc06d18:	80c70001 	lb	a3,1(a2)
bfc06d1c:	25a8ffd0 	addiu	t0,t5,-48
bfc06d20:	24e9ffd0 	addiu	t1,a3,-48
bfc06d24:	000860c0 	sll	t4,t0,0x3
bfc06d28:	00085840 	sll	t3,t0,0x1
bfc06d2c:	312400ff 	andi	a0,t1,0xff
bfc06d30:	016c1021 	addu	v0,t3,t4
bfc06d34:	2c83000a 	sltiu	v1,a0,10
bfc06d38:	1060001d 	beqz	v1,bfc06db0 <get_seed_args+0xf0>
bfc06d3c:	00e21021 	addu	v0,a3,v0
bfc06d40:	80c70002 	lb	a3,2(a2)
bfc06d44:	2448ffd0 	addiu	t0,v0,-48
bfc06d48:	24e4ffd0 	addiu	a0,a3,-48
bfc06d4c:	000810c0 	sll	v0,t0,0x3
bfc06d50:	00084840 	sll	t1,t0,0x1
bfc06d54:	308500ff 	andi	a1,a0,0xff
bfc06d58:	01221821 	addu	v1,t1,v0
bfc06d5c:	2cb9000a 	sltiu	t9,a1,10
bfc06d60:	13200013 	beqz	t9,bfc06db0 <get_seed_args+0xf0>
bfc06d64:	00e31821 	addu	v1,a3,v1
bfc06d68:	80c70003 	lb	a3,3(a2)
bfc06d6c:	24c60004 	addiu	a2,a2,4
bfc06d70:	24efffd0 	addiu	t7,a3,-48
bfc06d74:	31e800ff 	andi	t0,t7,0xff
bfc06d78:	2d0b000a 	sltiu	t3,t0,10
bfc06d7c:	2468ffd0 	addiu	t0,v1,-48
bfc06d80:	000870c0 	sll	t6,t0,0x3
bfc06d84:	00086840 	sll	t5,t0,0x1
bfc06d88:	01ae6021 	addu	t4,t5,t6
bfc06d8c:	11600008 	beqz	t3,bfc06db0 <get_seed_args+0xf0>
bfc06d90:	00ec1821 	addu	v1,a3,t4
bfc06d94:	80c70000 	lb	a3,0(a2)
bfc06d98:	00000000 	nop
bfc06d9c:	24e5ffd0 	addiu	a1,a3,-48
bfc06da0:	30b900ff 	andi	t9,a1,0xff
bfc06da4:	2f38000a 	sltiu	t8,t9,10
bfc06da8:	1700ffd7 	bnez	t8,bfc06d08 <get_seed_args+0x48>
bfc06dac:	2468ffd0 	addiu	t0,v1,-48
bfc06db0:	2418004b 	li	t8,75
bfc06db4:	10f8002a 	beq	a3,t8,bfc06e60 <get_seed_args+0x1a0>
bfc06db8:	2406004d 	li	a2,77
bfc06dbc:	14e60003 	bne	a3,a2,bfc06dcc <get_seed_args+0x10c>
bfc06dc0:	010a0018 	mult	t0,t2
bfc06dc4:	00084500 	sll	t0,t0,0x14
bfc06dc8:	010a0018 	mult	t0,t2
bfc06dcc:	00001012 	mflo	v0
bfc06dd0:	03e00008 	jr	ra
bfc06dd4:	00000000 	nop
	...
bfc06de0:	24c60001 	addiu	a2,a2,1
bfc06de4:	80c70000 	lb	a3,0(a2)
bfc06de8:	00000000 	nop
bfc06dec:	14e4ffc1 	bne	a3,a0,bfc06cf4 <get_seed_args+0x34>
bfc06df0:	240affff 	li	t2,-1
bfc06df4:	80c90001 	lb	t1,1(a2)
bfc06df8:	24080078 	li	t0,120
bfc06dfc:	1528ffbe 	bne	t1,t0,bfc06cf8 <get_seed_args+0x38>
bfc06e00:	24edffd0 	addiu	t5,a3,-48
bfc06e04:	24c40002 	addiu	a0,a2,2
bfc06e08:	00004021 	move	t0,zero
bfc06e0c:	80870000 	lb	a3,0(a0)
bfc06e10:	00084900 	sll	t1,t0,0x4
bfc06e14:	30e500ff 	andi	a1,a3,0xff
bfc06e18:	24b9ffd0 	addiu	t9,a1,-48
bfc06e1c:	24a6ff9f 	addiu	a2,a1,-97
bfc06e20:	333800ff 	andi	t8,t9,0xff
bfc06e24:	30cf00ff 	andi	t7,a2,0xff
bfc06e28:	24e5ffd0 	addiu	a1,a3,-48
bfc06e2c:	2f0e000a 	sltiu	t6,t8,10
bfc06e30:	28a6000a 	slti	a2,a1,10
bfc06e34:	24840001 	addiu	a0,a0,1
bfc06e38:	15c00003 	bnez	t6,bfc06e48 <get_seed_args+0x188>
bfc06e3c:	2de30006 	sltiu	v1,t7,6
bfc06e40:	1060ffdc 	beqz	v1,bfc06db4 <get_seed_args+0xf4>
bfc06e44:	2418004b 	li	t8,75
bfc06e48:	14c00002 	bnez	a2,bfc06e54 <get_seed_args+0x194>
bfc06e4c:	00000000 	nop
bfc06e50:	24e5ffa9 	addiu	a1,a3,-87
bfc06e54:	0bf01b83 	j	bfc06e0c <get_seed_args+0x14c>
bfc06e58:	00a94021 	addu	t0,a1,t1
bfc06e5c:	00000000 	nop
bfc06e60:	00084280 	sll	t0,t0,0xa
bfc06e64:	010a0018 	mult	t0,t2
bfc06e68:	00001012 	mflo	v0
bfc06e6c:	03e00008 	jr	ra
bfc06e70:	00000000 	nop
	...

bfc06e80 <core_init_state>:
core_init_state():
bfc06e80:	27bdffe0 	addiu	sp,sp,-32
bfc06e84:	00c0c821 	move	t9,a2
bfc06e88:	3c06bfc1 	lui	a2,0xbfc1
bfc06e8c:	afb40010 	sw	s4,16(sp)
bfc06e90:	00006021 	move	t4,zero
bfc06e94:	24d4a970 	addiu	s4,a2,-22160
bfc06e98:	00003021 	move	a2,zero
bfc06e9c:	afb20008 	sw	s2,8(sp)
bfc06ea0:	00ccc021 	addu	t8,a2,t4
bfc06ea4:	00809021 	move	s2,a0
bfc06ea8:	afb00000 	sw	s0,0(sp)
bfc06eac:	270f0001 	addiu	t7,t8,1
bfc06eb0:	2650ffff 	addiu	s0,s2,-1
bfc06eb4:	00052c00 	sll	a1,a1,0x10
bfc06eb8:	3c07bfc1 	lui	a3,0xbfc1
bfc06ebc:	3c04bfc1 	lui	a0,0xbfc1
bfc06ec0:	3c03bfc1 	lui	v1,0xbfc1
bfc06ec4:	3c02bfc1 	lui	v0,0xbfc1
bfc06ec8:	01f0502b 	sltu	t2,t7,s0
bfc06ecc:	afb7001c 	sw	s7,28(sp)
bfc06ed0:	afb60018 	sw	s6,24(sp)
bfc06ed4:	afb50014 	sw	s5,20(sp)
bfc06ed8:	afb3000c 	sw	s3,12(sp)
bfc06edc:	afb10004 	sw	s1,4(sp)
bfc06ee0:	00052c03 	sra	a1,a1,0x10
bfc06ee4:	24f1a8c0 	addiu	s1,a3,-22336
bfc06ee8:	2495a960 	addiu	s5,a0,-22176
bfc06eec:	2476a950 	addiu	s6,v1,-22192
bfc06ef0:	2457a940 	addiu	s7,v0,-22208
bfc06ef4:	00005821 	move	t3,zero
bfc06ef8:	1140001c 	beqz	t2,bfc06f6c <core_init_state+0xec>
bfc06efc:	2413002c 	li	s3,44
bfc06f00:	1580007b 	bnez	t4,bfc070f0 <core_init_state+0x270>
bfc06f04:	2d880004 	sltiu	t0,t4,4
bfc06f08:	00c07821 	move	t7,a2
bfc06f0c:	24aa0001 	addiu	t2,a1,1
bfc06f10:	000a2c00 	sll	a1,t2,0x10
bfc06f14:	00052c03 	sra	a1,a1,0x10
bfc06f18:	30a80007 	andi	t0,a1,0x7
bfc06f1c:	00085880 	sll	t3,t0,0x2
bfc06f20:	022b3821 	addu	a3,s1,t3
bfc06f24:	8cf80000 	lw	t8,0(a3)
bfc06f28:	00000000 	nop
bfc06f2c:	03000008 	jr	t8
bfc06f30:	00000000 	nop
	...
bfc06f40:	00054042 	srl	t0,a1,0x1
bfc06f44:	310b000c 	andi	t3,t0,0xc
bfc06f48:	01743821 	addu	a3,t3,s4
bfc06f4c:	8ceb0000 	lw	t3,0(a3)
bfc06f50:	240c0008 	li	t4,8
bfc06f54:	01e03021 	move	a2,t7
bfc06f58:	00ccc021 	addu	t8,a2,t4
bfc06f5c:	270f0001 	addiu	t7,t8,1
bfc06f60:	01f0502b 	sltu	t2,t7,s0
bfc06f64:	1540ffe6 	bnez	t2,bfc06f00 <core_init_state+0x80>
bfc06f68:	00000000 	nop
bfc06f6c:	00d2782b 	sltu	t7,a2,s2
bfc06f70:	11e0003a 	beqz	t7,bfc0705c <core_init_state+0x1dc>
bfc06f74:	00069827 	nor	s3,zero,a2
bfc06f78:	24c50001 	addiu	a1,a2,1
bfc06f7c:	02728821 	addu	s1,s3,s2
bfc06f80:	03263021 	addu	a2,t9,a2
bfc06f84:	00b2802b 	sltu	s0,a1,s2
bfc06f88:	32270007 	andi	a3,s1,0x7
bfc06f8c:	a0c00000 	sb	zero,0(a2)
bfc06f90:	12000032 	beqz	s0,bfc0705c <core_init_state+0x1dc>
bfc06f94:	24c40001 	addiu	a0,a2,1
bfc06f98:	10e00024 	beqz	a3,bfc0702c <core_init_state+0x1ac>
bfc06f9c:	24150001 	li	s5,1
bfc06fa0:	10f5001d 	beq	a3,s5,bfc07018 <core_init_state+0x198>
bfc06fa4:	24160002 	li	s6,2
bfc06fa8:	10f60018 	beq	a3,s6,bfc0700c <core_init_state+0x18c>
bfc06fac:	24170003 	li	s7,3
bfc06fb0:	10f70013 	beq	a3,s7,bfc07000 <core_init_state+0x180>
bfc06fb4:	24190004 	li	t9,4
bfc06fb8:	10f9000e 	beq	a3,t9,bfc06ff4 <core_init_state+0x174>
bfc06fbc:	24020005 	li	v0,5
bfc06fc0:	10e20009 	beq	a3,v0,bfc06fe8 <core_init_state+0x168>
bfc06fc4:	240e0006 	li	t6,6
bfc06fc8:	10ee0004 	beq	a3,t6,bfc06fdc <core_init_state+0x15c>
bfc06fcc:	00000000 	nop
bfc06fd0:	a0c00001 	sb	zero,1(a2)
bfc06fd4:	24a50001 	addiu	a1,a1,1
bfc06fd8:	24840001 	addiu	a0,a0,1
bfc06fdc:	a0800000 	sb	zero,0(a0)
bfc06fe0:	24a50001 	addiu	a1,a1,1
bfc06fe4:	24840001 	addiu	a0,a0,1
bfc06fe8:	a0800000 	sb	zero,0(a0)
bfc06fec:	24a50001 	addiu	a1,a1,1
bfc06ff0:	24840001 	addiu	a0,a0,1
bfc06ff4:	a0800000 	sb	zero,0(a0)
bfc06ff8:	24a50001 	addiu	a1,a1,1
bfc06ffc:	24840001 	addiu	a0,a0,1
bfc07000:	a0800000 	sb	zero,0(a0)
bfc07004:	24a50001 	addiu	a1,a1,1
bfc07008:	24840001 	addiu	a0,a0,1
bfc0700c:	a0800000 	sb	zero,0(a0)
bfc07010:	24a50001 	addiu	a1,a1,1
bfc07014:	24840001 	addiu	a0,a0,1
bfc07018:	24a50001 	addiu	a1,a1,1
bfc0701c:	00b2302b 	sltu	a2,a1,s2
bfc07020:	a0800000 	sb	zero,0(a0)
bfc07024:	10c0000d 	beqz	a2,bfc0705c <core_init_state+0x1dc>
bfc07028:	24840001 	addiu	a0,a0,1
bfc0702c:	24a50008 	addiu	a1,a1,8
bfc07030:	00b2a02b 	sltu	s4,a1,s2
bfc07034:	a0800000 	sb	zero,0(a0)
bfc07038:	a0800001 	sb	zero,1(a0)
bfc0703c:	a0800002 	sb	zero,2(a0)
bfc07040:	a0800003 	sb	zero,3(a0)
bfc07044:	a0800004 	sb	zero,4(a0)
bfc07048:	a0800005 	sb	zero,5(a0)
bfc0704c:	a0800006 	sb	zero,6(a0)
bfc07050:	a0800007 	sb	zero,7(a0)
bfc07054:	1680fff5 	bnez	s4,bfc0702c <core_init_state+0x1ac>
bfc07058:	24840008 	addiu	a0,a0,8
bfc0705c:	8fb7001c 	lw	s7,28(sp)
bfc07060:	8fb60018 	lw	s6,24(sp)
bfc07064:	8fb50014 	lw	s5,20(sp)
bfc07068:	8fb40010 	lw	s4,16(sp)
bfc0706c:	8fb3000c 	lw	s3,12(sp)
bfc07070:	8fb20008 	lw	s2,8(sp)
bfc07074:	8fb10004 	lw	s1,4(sp)
bfc07078:	8fb00000 	lw	s0,0(sp)
bfc0707c:	03e00008 	jr	ra
bfc07080:	27bd0020 	addiu	sp,sp,32
	...
bfc07090:	0005c042 	srl	t8,a1,0x1
bfc07094:	330c000c 	andi	t4,t8,0xc
bfc07098:	01952021 	addu	a0,t4,s5
bfc0709c:	8c8b0000 	lw	t3,0(a0)
bfc070a0:	240c0008 	li	t4,8
bfc070a4:	0bf01bd6 	j	bfc06f58 <core_init_state+0xd8>
bfc070a8:	01e03021 	move	a2,t7
bfc070ac:	00000000 	nop
bfc070b0:	00051842 	srl	v1,a1,0x1
bfc070b4:	306d000c 	andi	t5,v1,0xc
bfc070b8:	01b64821 	addu	t1,t5,s6
bfc070bc:	8d2b0000 	lw	t3,0(t1)
bfc070c0:	240c0008 	li	t4,8
bfc070c4:	0bf01bd6 	j	bfc06f58 <core_init_state+0xd8>
bfc070c8:	01e03021 	move	a2,t7
bfc070cc:	00000000 	nop
bfc070d0:	00057042 	srl	t6,a1,0x1
bfc070d4:	31c6000c 	andi	a2,t6,0xc
bfc070d8:	00d71021 	addu	v0,a2,s7
bfc070dc:	8c4b0000 	lw	t3,0(v0)
bfc070e0:	240c0004 	li	t4,4
bfc070e4:	0bf01bd6 	j	bfc06f58 <core_init_state+0xd8>
bfc070e8:	01e03021 	move	a2,t7
bfc070ec:	00000000 	nop
bfc070f0:	1100005b 	beqz	t0,bfc07260 <core_init_state+0x3e0>
bfc070f4:	03265021 	addu	t2,t9,a2
bfc070f8:	916d0000 	lbu	t5,0(t3)
bfc070fc:	24070001 	li	a3,1
bfc07100:	2588ffff 	addiu	t0,t4,-1
bfc07104:	00ec482b 	sltu	t1,a3,t4
bfc07108:	31030007 	andi	v1,t0,0x7
bfc0710c:	a14d0000 	sb	t5,0(t2)
bfc07110:	1120004e 	beqz	t1,bfc0724c <core_init_state+0x3cc>
bfc07114:	25480001 	addiu	t0,t2,1
bfc07118:	10600032 	beqz	v1,bfc071e4 <core_init_state+0x364>
bfc0711c:	01672021 	addu	a0,t3,a3
bfc07120:	10670029 	beq	v1,a3,bfc071c8 <core_init_state+0x348>
bfc07124:	24090002 	li	t1,2
bfc07128:	10690021 	beq	v1,t1,bfc071b0 <core_init_state+0x330>
bfc0712c:	240d0003 	li	t5,3
bfc07130:	106d001a 	beq	v1,t5,bfc0719c <core_init_state+0x31c>
bfc07134:	24040004 	li	a0,4
bfc07138:	10640013 	beq	v1,a0,bfc07188 <core_init_state+0x308>
bfc0713c:	24020005 	li	v0,5
bfc07140:	1062000c 	beq	v1,v0,bfc07174 <core_init_state+0x2f4>
bfc07144:	240e0006 	li	t6,6
bfc07148:	106e0006 	beq	v1,t6,bfc07164 <core_init_state+0x2e4>
bfc0714c:	01673021 	addu	a2,t3,a3
bfc07150:	91630001 	lbu	v1,1(t3)
bfc07154:	25480002 	addiu	t0,t2,2
bfc07158:	a1430001 	sb	v1,1(t2)
bfc0715c:	24070002 	li	a3,2
bfc07160:	01673021 	addu	a2,t3,a3
bfc07164:	90ca0000 	lbu	t2,0(a2)
bfc07168:	24e70001 	addiu	a3,a3,1
bfc0716c:	a10a0000 	sb	t2,0(t0)
bfc07170:	25080001 	addiu	t0,t0,1
bfc07174:	01676821 	addu	t5,t3,a3
bfc07178:	91a90000 	lbu	t1,0(t5)
bfc0717c:	24e70001 	addiu	a3,a3,1
bfc07180:	a1090000 	sb	t1,0(t0)
bfc07184:	25080001 	addiu	t0,t0,1
bfc07188:	01671021 	addu	v0,t3,a3
bfc0718c:	90440000 	lbu	a0,0(v0)
bfc07190:	24e70001 	addiu	a3,a3,1
bfc07194:	a1040000 	sb	a0,0(t0)
bfc07198:	25080001 	addiu	t0,t0,1
bfc0719c:	01671821 	addu	v1,t3,a3
bfc071a0:	906e0000 	lbu	t6,0(v1)
bfc071a4:	24e70001 	addiu	a3,a3,1
bfc071a8:	a10e0000 	sb	t6,0(t0)
bfc071ac:	25080001 	addiu	t0,t0,1
bfc071b0:	01673021 	addu	a2,t3,a3
bfc071b4:	90ca0000 	lbu	t2,0(a2)
bfc071b8:	24e70001 	addiu	a3,a3,1
bfc071bc:	a10a0000 	sb	t2,0(t0)
bfc071c0:	25080001 	addiu	t0,t0,1
bfc071c4:	01672021 	addu	a0,t3,a3
bfc071c8:	908d0000 	lbu	t5,0(a0)
bfc071cc:	24e70001 	addiu	a3,a3,1
bfc071d0:	00ec482b 	sltu	t1,a3,t4
bfc071d4:	a10d0000 	sb	t5,0(t0)
bfc071d8:	1120001c 	beqz	t1,bfc0724c <core_init_state+0x3cc>
bfc071dc:	25080001 	addiu	t0,t0,1
bfc071e0:	01672021 	addu	a0,t3,a3
bfc071e4:	90830000 	lbu	v1,0(a0)
bfc071e8:	24e70008 	addiu	a3,a3,8
bfc071ec:	a1030000 	sb	v1,0(t0)
bfc071f0:	90890001 	lbu	t1,1(a0)
bfc071f4:	00000000 	nop
bfc071f8:	a1090001 	sb	t1,1(t0)
bfc071fc:	90860002 	lbu	a2,2(a0)
bfc07200:	00000000 	nop
bfc07204:	a1060002 	sb	a2,2(t0)
bfc07208:	908a0003 	lbu	t2,3(a0)
bfc0720c:	00000000 	nop
bfc07210:	a10a0003 	sb	t2,3(t0)
bfc07214:	908d0004 	lbu	t5,4(a0)
bfc07218:	00000000 	nop
bfc0721c:	a10d0004 	sb	t5,4(t0)
bfc07220:	90890005 	lbu	t1,5(a0)
bfc07224:	00000000 	nop
bfc07228:	a1090005 	sb	t1,5(t0)
bfc0722c:	90860006 	lbu	a2,6(a0)
bfc07230:	00000000 	nop
bfc07234:	a1060006 	sb	a2,6(t0)
bfc07238:	90820007 	lbu	v0,7(a0)
bfc0723c:	00ec202b 	sltu	a0,a3,t4
bfc07240:	a1020007 	sb	v0,7(t0)
bfc07244:	1480ffe6 	bnez	a0,bfc071e0 <core_init_state+0x360>
bfc07248:	25080008 	addiu	t0,t0,8
bfc0724c:	03386021 	addu	t4,t9,t8
bfc07250:	0bf01bc3 	j	bfc06f0c <core_init_state+0x8c>
bfc07254:	a1930000 	sb	s3,0(t4)
	...
bfc07260:	014b6825 	or	t5,t2,t3
bfc07264:	31a90003 	andi	t1,t5,0x3
bfc07268:	1520ffa3 	bnez	t1,bfc070f8 <core_init_state+0x278>
bfc0726c:	25620004 	addiu	v0,t3,4
bfc07270:	004a702b 	sltu	t6,v0,t2
bfc07274:	15c00005 	bnez	t6,bfc0728c <core_init_state+0x40c>
bfc07278:	000c7082 	srl	t6,t4,0x2
bfc0727c:	25440004 	addiu	a0,t2,4
bfc07280:	008b182b 	sltu	v1,a0,t3
bfc07284:	1060ff9c 	beqz	v1,bfc070f8 <core_init_state+0x278>
bfc07288:	00000000 	nop
bfc0728c:	000e6880 	sll	t5,t6,0x2
bfc07290:	11a00058 	beqz	t5,bfc073f4 <core_init_state+0x574>
bfc07294:	24090001 	li	t1,1
bfc07298:	8d680000 	lw	t0,0(t3)
bfc0729c:	25c7ffff 	addiu	a3,t6,-1
bfc072a0:	012e202b 	sltu	a0,t1,t6
bfc072a4:	ad480000 	sw	t0,0(t2)
bfc072a8:	30e30007 	andi	v1,a3,0x7
bfc072ac:	25480004 	addiu	t0,t2,4
bfc072b0:	1080004e 	beqz	a0,bfc073ec <core_init_state+0x56c>
bfc072b4:	25670004 	addiu	a3,t3,4
bfc072b8:	10600032 	beqz	v1,bfc07384 <core_init_state+0x504>
bfc072bc:	00000000 	nop
bfc072c0:	10690029 	beq	v1,t1,bfc07368 <core_init_state+0x4e8>
bfc072c4:	24040002 	li	a0,2
bfc072c8:	10640022 	beq	v1,a0,bfc07354 <core_init_state+0x4d4>
bfc072cc:	24020003 	li	v0,3
bfc072d0:	1062001b 	beq	v1,v0,bfc07340 <core_init_state+0x4c0>
bfc072d4:	24040004 	li	a0,4
bfc072d8:	10640014 	beq	v1,a0,bfc0732c <core_init_state+0x4ac>
bfc072dc:	24020005 	li	v0,5
bfc072e0:	1062000d 	beq	v1,v0,bfc07318 <core_init_state+0x498>
bfc072e4:	24040006 	li	a0,6
bfc072e8:	10640006 	beq	v1,a0,bfc07304 <core_init_state+0x484>
bfc072ec:	00000000 	nop
bfc072f0:	8ce90000 	lw	t1,0(a3)
bfc072f4:	25480008 	addiu	t0,t2,8
bfc072f8:	ad490004 	sw	t1,4(t2)
bfc072fc:	25670008 	addiu	a3,t3,8
bfc07300:	24090002 	li	t1,2
bfc07304:	8cea0000 	lw	t2,0(a3)
bfc07308:	25290001 	addiu	t1,t1,1
bfc0730c:	ad0a0000 	sw	t2,0(t0)
bfc07310:	24e70004 	addiu	a3,a3,4
bfc07314:	25080004 	addiu	t0,t0,4
bfc07318:	8ce30000 	lw	v1,0(a3)
bfc0731c:	25290001 	addiu	t1,t1,1
bfc07320:	ad030000 	sw	v1,0(t0)
bfc07324:	24e70004 	addiu	a3,a3,4
bfc07328:	25080004 	addiu	t0,t0,4
bfc0732c:	8ce20000 	lw	v0,0(a3)
bfc07330:	25290001 	addiu	t1,t1,1
bfc07334:	ad020000 	sw	v0,0(t0)
bfc07338:	24e70004 	addiu	a3,a3,4
bfc0733c:	25080004 	addiu	t0,t0,4
bfc07340:	8ce40000 	lw	a0,0(a3)
bfc07344:	25290001 	addiu	t1,t1,1
bfc07348:	ad040000 	sw	a0,0(t0)
bfc0734c:	24e70004 	addiu	a3,a3,4
bfc07350:	25080004 	addiu	t0,t0,4
bfc07354:	8cea0000 	lw	t2,0(a3)
bfc07358:	25290001 	addiu	t1,t1,1
bfc0735c:	ad0a0000 	sw	t2,0(t0)
bfc07360:	24e70004 	addiu	a3,a3,4
bfc07364:	25080004 	addiu	t0,t0,4
bfc07368:	8ce20000 	lw	v0,0(a3)
bfc0736c:	25290001 	addiu	t1,t1,1
bfc07370:	012e182b 	sltu	v1,t1,t6
bfc07374:	ad020000 	sw	v0,0(t0)
bfc07378:	24e70004 	addiu	a3,a3,4
bfc0737c:	1060001b 	beqz	v1,bfc073ec <core_init_state+0x56c>
bfc07380:	25080004 	addiu	t0,t0,4
bfc07384:	8cea0000 	lw	t2,0(a3)
bfc07388:	25290008 	addiu	t1,t1,8
bfc0738c:	ad0a0000 	sw	t2,0(t0)
bfc07390:	8ce20004 	lw	v0,4(a3)
bfc07394:	012e502b 	sltu	t2,t1,t6
bfc07398:	ad020004 	sw	v0,4(t0)
bfc0739c:	8ce40008 	lw	a0,8(a3)
bfc073a0:	00000000 	nop
bfc073a4:	ad040008 	sw	a0,8(t0)
bfc073a8:	8ce3000c 	lw	v1,12(a3)
bfc073ac:	00000000 	nop
bfc073b0:	ad03000c 	sw	v1,12(t0)
bfc073b4:	8ce20010 	lw	v0,16(a3)
bfc073b8:	00000000 	nop
bfc073bc:	ad020010 	sw	v0,16(t0)
bfc073c0:	8ce40014 	lw	a0,20(a3)
bfc073c4:	00000000 	nop
bfc073c8:	ad040014 	sw	a0,20(t0)
bfc073cc:	8ce30018 	lw	v1,24(a3)
bfc073d0:	00000000 	nop
bfc073d4:	ad030018 	sw	v1,24(t0)
bfc073d8:	8ce2001c 	lw	v0,28(a3)
bfc073dc:	24e70020 	addiu	a3,a3,32
bfc073e0:	ad02001c 	sw	v0,28(t0)
bfc073e4:	1540ffe7 	bnez	t2,bfc07384 <core_init_state+0x504>
bfc073e8:	25080020 	addiu	t0,t0,32
bfc073ec:	118dff97 	beq	t4,t5,bfc0724c <core_init_state+0x3cc>
bfc073f0:	00000000 	nop
bfc073f4:	016d5821 	addu	t3,t3,t5
bfc073f8:	01a61821 	addu	v1,t5,a2
bfc073fc:	000d4027 	nor	t0,zero,t5
bfc07400:	91670000 	lbu	a3,0(t3)
bfc07404:	25a90001 	addiu	t1,t5,1
bfc07408:	03235021 	addu	t2,t9,v1
bfc0740c:	010c7021 	addu	t6,t0,t4
bfc07410:	012c302b 	sltu	a2,t1,t4
bfc07414:	a1470000 	sb	a3,0(t2)
bfc07418:	31c40007 	andi	a0,t6,0x7
bfc0741c:	25680001 	addiu	t0,t3,1
bfc07420:	10c0ff8a 	beqz	a2,bfc0724c <core_init_state+0x3cc>
bfc07424:	25470001 	addiu	a3,t2,1
bfc07428:	10800032 	beqz	a0,bfc074f4 <core_init_state+0x674>
bfc0742c:	24020001 	li	v0,1
bfc07430:	10820029 	beq	a0,v0,bfc074d8 <core_init_state+0x658>
bfc07434:	240e0002 	li	t6,2
bfc07438:	108e0022 	beq	a0,t6,bfc074c4 <core_init_state+0x644>
bfc0743c:	24030003 	li	v1,3
bfc07440:	1083001b 	beq	a0,v1,bfc074b0 <core_init_state+0x630>
bfc07444:	24060004 	li	a2,4
bfc07448:	10860014 	beq	a0,a2,bfc0749c <core_init_state+0x61c>
bfc0744c:	24020005 	li	v0,5
bfc07450:	1082000d 	beq	a0,v0,bfc07488 <core_init_state+0x608>
bfc07454:	240e0006 	li	t6,6
bfc07458:	108e0006 	beq	a0,t6,bfc07474 <core_init_state+0x5f4>
bfc0745c:	00000000 	nop
bfc07460:	91670001 	lbu	a3,1(t3)
bfc07464:	25a90002 	addiu	t1,t5,2
bfc07468:	a1470001 	sb	a3,1(t2)
bfc0746c:	25680002 	addiu	t0,t3,2
bfc07470:	25470002 	addiu	a3,t2,2
bfc07474:	910b0000 	lbu	t3,0(t0)
bfc07478:	25290001 	addiu	t1,t1,1
bfc0747c:	a0eb0000 	sb	t3,0(a3)
bfc07480:	25080001 	addiu	t0,t0,1
bfc07484:	24e70001 	addiu	a3,a3,1
bfc07488:	910a0000 	lbu	t2,0(t0)
bfc0748c:	25290001 	addiu	t1,t1,1
bfc07490:	a0ea0000 	sb	t2,0(a3)
bfc07494:	25080001 	addiu	t0,t0,1
bfc07498:	24e70001 	addiu	a3,a3,1
bfc0749c:	910d0000 	lbu	t5,0(t0)
bfc074a0:	25290001 	addiu	t1,t1,1
bfc074a4:	a0ed0000 	sb	t5,0(a3)
bfc074a8:	25080001 	addiu	t0,t0,1
bfc074ac:	24e70001 	addiu	a3,a3,1
bfc074b0:	91040000 	lbu	a0,0(t0)
bfc074b4:	25290001 	addiu	t1,t1,1
bfc074b8:	a0e40000 	sb	a0,0(a3)
bfc074bc:	25080001 	addiu	t0,t0,1
bfc074c0:	24e70001 	addiu	a3,a3,1
bfc074c4:	91030000 	lbu	v1,0(t0)
bfc074c8:	25290001 	addiu	t1,t1,1
bfc074cc:	a0e30000 	sb	v1,0(a3)
bfc074d0:	25080001 	addiu	t0,t0,1
bfc074d4:	24e70001 	addiu	a3,a3,1
bfc074d8:	91020000 	lbu	v0,0(t0)
bfc074dc:	25290001 	addiu	t1,t1,1
bfc074e0:	012c302b 	sltu	a2,t1,t4
bfc074e4:	a0e20000 	sb	v0,0(a3)
bfc074e8:	25080001 	addiu	t0,t0,1
bfc074ec:	10c0ff57 	beqz	a2,bfc0724c <core_init_state+0x3cc>
bfc074f0:	24e70001 	addiu	a3,a3,1
bfc074f4:	910b0000 	lbu	t3,0(t0)
bfc074f8:	25290008 	addiu	t1,t1,8
bfc074fc:	a0eb0000 	sb	t3,0(a3)
bfc07500:	91030001 	lbu	v1,1(t0)
bfc07504:	012c582b 	sltu	t3,t1,t4
bfc07508:	a0e30001 	sb	v1,1(a3)
bfc0750c:	910e0002 	lbu	t6,2(t0)
bfc07510:	00000000 	nop
bfc07514:	a0ee0002 	sb	t6,2(a3)
bfc07518:	91060003 	lbu	a2,3(t0)
bfc0751c:	00000000 	nop
bfc07520:	a0e60003 	sb	a2,3(a3)
bfc07524:	910a0004 	lbu	t2,4(t0)
bfc07528:	00000000 	nop
bfc0752c:	a0ea0004 	sb	t2,4(a3)
bfc07530:	91020005 	lbu	v0,5(t0)
bfc07534:	00000000 	nop
bfc07538:	a0e20005 	sb	v0,5(a3)
bfc0753c:	91040006 	lbu	a0,6(t0)
bfc07540:	00000000 	nop
bfc07544:	a0e40006 	sb	a0,6(a3)
bfc07548:	910d0007 	lbu	t5,7(t0)
bfc0754c:	25080008 	addiu	t0,t0,8
bfc07550:	a0ed0007 	sb	t5,7(a3)
bfc07554:	1560ffe7 	bnez	t3,bfc074f4 <core_init_state+0x674>
bfc07558:	24e70008 	addiu	a3,a3,8
bfc0755c:	03386021 	addu	t4,t9,t8
bfc07560:	0bf01bc3 	j	bfc06f0c <core_init_state+0x8c>
bfc07564:	a1930000 	sb	s3,0(t4)
	...

bfc07570 <core_state_transition>:
core_state_transition():
bfc07570:	27bdffe8 	addiu	sp,sp,-24
bfc07574:	8c880000 	lw	t0,0(a0)
bfc07578:	afb10008 	sw	s1,8(sp)
bfc0757c:	afb40014 	sw	s4,20(sp)
bfc07580:	afb30010 	sw	s3,16(sp)
bfc07584:	afb2000c 	sw	s2,12(sp)
bfc07588:	afb00004 	sw	s0,4(sp)
bfc0758c:	91060000 	lbu	a2,0(t0)
bfc07590:	00000000 	nop
bfc07594:	10c000bd 	beqz	a2,bfc0788c <core_state_transition+0x31c>
bfc07598:	00808821 	move	s1,a0
bfc0759c:	2402002c 	li	v0,44
bfc075a0:	10c200bc 	beq	a2,v0,bfc07894 <core_state_transition+0x324>
bfc075a4:	3c03bfc1 	lui	v1,0xbfc1
bfc075a8:	2464a8e0 	addiu	a0,v1,-22304
bfc075ac:	00003821 	move	a3,zero
bfc075b0:	24b80004 	addiu	t8,a1,4
bfc075b4:	240f0001 	li	t7,1
bfc075b8:	24ab0018 	addiu	t3,a1,24
bfc075bc:	2410002b 	li	s0,43
bfc075c0:	24aa000c 	addiu	t2,a1,12
bfc075c4:	2412002d 	li	s2,45
bfc075c8:	24130045 	li	s3,69
bfc075cc:	24ac0014 	addiu	t4,a1,20
bfc075d0:	24140065 	li	s4,101
bfc075d4:	2419002e 	li	t9,46
bfc075d8:	24ae0010 	addiu	t6,a1,16
bfc075dc:	24a90008 	addiu	t1,a1,8
bfc075e0:	240d002c 	li	t5,44
bfc075e4:	00071880 	sll	v1,a3,0x2
bfc075e8:	00831021 	addu	v0,a0,v1
bfc075ec:	8c430000 	lw	v1,0(v0)
bfc075f0:	00000000 	nop
bfc075f4:	00600008 	jr	v1
bfc075f8:	00000000 	nop
bfc075fc:	00000000 	nop
bfc07600:	24c3ffd0 	addiu	v1,a2,-48
bfc07604:	306200ff 	andi	v0,v1,0xff
bfc07608:	2c47000a 	sltiu	a3,v0,10
bfc0760c:	10e00084 	beqz	a3,bfc07820 <core_state_transition+0x2b0>
bfc07610:	24070004 	li	a3,4
bfc07614:	8ca60000 	lw	a2,0(a1)
bfc07618:	00000000 	nop
bfc0761c:	24c30001 	addiu	v1,a2,1
bfc07620:	aca30000 	sw	v1,0(a1)
bfc07624:	25080001 	addiu	t0,t0,1
bfc07628:	91060000 	lbu	a2,0(t0)
bfc0762c:	00000000 	nop
bfc07630:	10c00006 	beqz	a2,bfc0764c <core_state_transition+0xdc>
bfc07634:	00000000 	nop
bfc07638:	10ef0004 	beq	a3,t7,bfc0764c <core_state_transition+0xdc>
bfc0763c:	00000000 	nop
bfc07640:	14cdffe9 	bne	a2,t5,bfc075e8 <core_state_transition+0x78>
bfc07644:	00071880 	sll	v1,a3,0x2
bfc07648:	25080001 	addiu	t0,t0,1
bfc0764c:	ae280000 	sw	t0,0(s1)
bfc07650:	00e01021 	move	v0,a3
bfc07654:	8fb40014 	lw	s4,20(sp)
bfc07658:	8fb30010 	lw	s3,16(sp)
bfc0765c:	8fb2000c 	lw	s2,12(sp)
bfc07660:	8fb10008 	lw	s1,8(sp)
bfc07664:	8fb00004 	lw	s0,4(sp)
bfc07668:	03e00008 	jr	ra
bfc0766c:	27bd0018 	addiu	sp,sp,24
bfc07670:	24c3ffd0 	addiu	v1,a2,-48
bfc07674:	306200ff 	andi	v0,v1,0xff
bfc07678:	2c46000a 	sltiu	a2,v0,10
bfc0767c:	14c0ffe9 	bnez	a2,bfc07624 <core_state_transition+0xb4>
bfc07680:	00000000 	nop
bfc07684:	8f020000 	lw	v0,0(t8)
bfc07688:	24070001 	li	a3,1
bfc0768c:	24460001 	addiu	a2,v0,1
bfc07690:	0bf01d89 	j	bfc07624 <core_state_transition+0xb4>
bfc07694:	af060000 	sw	a2,0(t8)
	...
bfc076a0:	24c2ffd0 	addiu	v0,a2,-48
bfc076a4:	304600ff 	andi	a2,v0,0xff
bfc076a8:	2cc7000a 	sltiu	a3,a2,10
bfc076ac:	10e0004c 	beqz	a3,bfc077e0 <core_state_transition+0x270>
bfc076b0:	00000000 	nop
bfc076b4:	8d660000 	lw	a2,0(t3)
bfc076b8:	24070007 	li	a3,7
bfc076bc:	24c30001 	addiu	v1,a2,1
bfc076c0:	0bf01d89 	j	bfc07624 <core_state_transition+0xb4>
bfc076c4:	ad630000 	sw	v1,0(t3)
	...
bfc076d0:	10d30033 	beq	a2,s3,bfc077a0 <core_state_transition+0x230>
bfc076d4:	00000000 	nop
bfc076d8:	10d40031 	beq	a2,s4,bfc077a0 <core_state_transition+0x230>
bfc076dc:	24c3ffd0 	addiu	v1,a2,-48
bfc076e0:	306200ff 	andi	v0,v1,0xff
bfc076e4:	2c46000a 	sltiu	a2,v0,10
bfc076e8:	14c0ffce 	bnez	a2,bfc07624 <core_state_transition+0xb4>
bfc076ec:	00000000 	nop
bfc076f0:	8d820000 	lw	v0,0(t4)
bfc076f4:	24070001 	li	a3,1
bfc076f8:	24460001 	addiu	a2,v0,1
bfc076fc:	0bf01d89 	j	bfc07624 <core_state_transition+0xb4>
bfc07700:	ad860000 	sw	a2,0(t4)
	...
bfc07710:	10d90057 	beq	a2,t9,bfc07870 <core_state_transition+0x300>
bfc07714:	24c2ffd0 	addiu	v0,a2,-48
bfc07718:	304600ff 	andi	a2,v0,0xff
bfc0771c:	2cc3000a 	sltiu	v1,a2,10
bfc07720:	1460ffc0 	bnez	v1,bfc07624 <core_state_transition+0xb4>
bfc07724:	00000000 	nop
bfc07728:	8dc60000 	lw	a2,0(t6)
bfc0772c:	24070001 	li	a3,1
bfc07730:	24c30001 	addiu	v1,a2,1
bfc07734:	0bf01d89 	j	bfc07624 <core_state_transition+0xb4>
bfc07738:	adc30000 	sw	v1,0(t6)
bfc0773c:	00000000 	nop
bfc07740:	24c3ffd0 	addiu	v1,a2,-48
bfc07744:	306200ff 	andi	v0,v1,0xff
bfc07748:	2c47000a 	sltiu	a3,v0,10
bfc0774c:	10e0002c 	beqz	a3,bfc07800 <core_state_transition+0x290>
bfc07750:	24070004 	li	a3,4
bfc07754:	8d220000 	lw	v0,0(t1)
bfc07758:	00000000 	nop
bfc0775c:	24460001 	addiu	a2,v0,1
bfc07760:	0bf01d89 	j	bfc07624 <core_state_transition+0xb4>
bfc07764:	ad260000 	sw	a2,0(t1)
	...
bfc07770:	10d00013 	beq	a2,s0,bfc077c0 <core_state_transition+0x250>
bfc07774:	00000000 	nop
bfc07778:	10d20011 	beq	a2,s2,bfc077c0 <core_state_transition+0x250>
bfc0777c:	00000000 	nop
bfc07780:	8d430000 	lw	v1,0(t2)
bfc07784:	24070001 	li	a3,1
bfc07788:	24620001 	addiu	v0,v1,1
bfc0778c:	0bf01d89 	j	bfc07624 <core_state_transition+0xb4>
bfc07790:	ad420000 	sw	v0,0(t2)
	...
bfc077a0:	8d830000 	lw	v1,0(t4)
bfc077a4:	24070003 	li	a3,3
bfc077a8:	24620001 	addiu	v0,v1,1
bfc077ac:	0bf01d89 	j	bfc07624 <core_state_transition+0xb4>
bfc077b0:	ad820000 	sw	v0,0(t4)
	...
bfc077c0:	8d460000 	lw	a2,0(t2)
bfc077c4:	24070006 	li	a3,6
bfc077c8:	24c30001 	addiu	v1,a2,1
bfc077cc:	0bf01d89 	j	bfc07624 <core_state_transition+0xb4>
bfc077d0:	ad430000 	sw	v1,0(t2)
	...
bfc077e0:	8d630000 	lw	v1,0(t3)
bfc077e4:	24070001 	li	a3,1
bfc077e8:	24620001 	addiu	v0,v1,1
bfc077ec:	0bf01d89 	j	bfc07624 <core_state_transition+0xb4>
bfc077f0:	ad620000 	sw	v0,0(t3)
	...
bfc07800:	10d90013 	beq	a2,t9,bfc07850 <core_state_transition+0x2e0>
bfc07804:	00000000 	nop
bfc07808:	8d230000 	lw	v1,0(t1)
bfc0780c:	24070001 	li	a3,1
bfc07810:	24620001 	addiu	v0,v1,1
bfc07814:	0bf01d89 	j	bfc07624 <core_state_transition+0xb4>
bfc07818:	ad220000 	sw	v0,0(t1)
bfc0781c:	00000000 	nop
bfc07820:	10d0ff7c 	beq	a2,s0,bfc07614 <core_state_transition+0xa4>
bfc07824:	24070002 	li	a3,2
bfc07828:	10d2ff7a 	beq	a2,s2,bfc07614 <core_state_transition+0xa4>
bfc0782c:	00000000 	nop
bfc07830:	10d90014 	beq	a2,t9,bfc07884 <core_state_transition+0x314>
bfc07834:	00000000 	nop
bfc07838:	8f020000 	lw	v0,0(t8)
bfc0783c:	24070001 	li	a3,1
bfc07840:	24460001 	addiu	a2,v0,1
bfc07844:	0bf01d85 	j	bfc07614 <core_state_transition+0xa4>
bfc07848:	af060000 	sw	a2,0(t8)
bfc0784c:	00000000 	nop
bfc07850:	8d260000 	lw	a2,0(t1)
bfc07854:	24070005 	li	a3,5
bfc07858:	24c30001 	addiu	v1,a2,1
bfc0785c:	0bf01d89 	j	bfc07624 <core_state_transition+0xb4>
bfc07860:	ad230000 	sw	v1,0(t1)
	...
bfc07870:	8dc20000 	lw	v0,0(t6)
bfc07874:	24070005 	li	a3,5
bfc07878:	24460001 	addiu	a2,v0,1
bfc0787c:	0bf01d89 	j	bfc07624 <core_state_transition+0xb4>
bfc07880:	adc60000 	sw	a2,0(t6)
bfc07884:	0bf01d85 	j	bfc07614 <core_state_transition+0xa4>
bfc07888:	24070005 	li	a3,5
bfc0788c:	0bf01d93 	j	bfc0764c <core_state_transition+0xdc>
bfc07890:	00003821 	move	a3,zero
bfc07894:	00003821 	move	a3,zero
bfc07898:	0bf01d93 	j	bfc0764c <core_state_transition+0xdc>
bfc0789c:	25080001 	addiu	t0,t0,1

bfc078a0 <core_bench_state>:
core_bench_state():
bfc078a0:	27bdff98 	addiu	sp,sp,-104
bfc078a4:	afb40060 	sw	s4,96(sp)
bfc078a8:	afb3005c 	sw	s3,92(sp)
bfc078ac:	afb20058 	sw	s2,88(sp)
bfc078b0:	afb00050 	sw	s0,80(sp)
bfc078b4:	afbf0064 	sw	ra,100(sp)
bfc078b8:	afb10054 	sw	s1,84(sp)
bfc078bc:	90ab0000 	lbu	t3,0(a1)
bfc078c0:	00068400 	sll	s0,a2,0x10
bfc078c4:	00079400 	sll	s2,a3,0x10
bfc078c8:	00809821 	move	s3,a0
bfc078cc:	00108403 	sra	s0,s0,0x10
bfc078d0:	afa00030 	sw	zero,48(sp)
bfc078d4:	afa00010 	sw	zero,16(sp)
bfc078d8:	afa00034 	sw	zero,52(sp)
bfc078dc:	afa00014 	sw	zero,20(sp)
bfc078e0:	afa00038 	sw	zero,56(sp)
bfc078e4:	afa00018 	sw	zero,24(sp)
bfc078e8:	afa0003c 	sw	zero,60(sp)
bfc078ec:	afa0001c 	sw	zero,28(sp)
bfc078f0:	afa00040 	sw	zero,64(sp)
bfc078f4:	afa00020 	sw	zero,32(sp)
bfc078f8:	afa00044 	sw	zero,68(sp)
bfc078fc:	afa00024 	sw	zero,36(sp)
bfc07900:	afa00048 	sw	zero,72(sp)
bfc07904:	afa00028 	sw	zero,40(sp)
bfc07908:	afa0004c 	sw	zero,76(sp)
bfc0790c:	afa0002c 	sw	zero,44(sp)
bfc07910:	87ad0078 	lh	t5,120(sp)
bfc07914:	97b4007c 	lhu	s4,124(sp)
bfc07918:	11600054 	beqz	t3,bfc07a6c <core_bench_state+0x1cc>
bfc0791c:	00129403 	sra	s2,s2,0x10
bfc07920:	3c02bfc1 	lui	v0,0xbfc1
bfc07924:	01604821 	move	t1,t3
bfc07928:	240e002c 	li	t6,44
bfc0792c:	2459a900 	addiu	t9,v0,-22272
bfc07930:	00a06021 	move	t4,a1
bfc07934:	27b10010 	addiu	s1,sp,16
bfc07938:	240f0001 	li	t7,1
bfc0793c:	241f002b 	li	ra,43
bfc07940:	2404002d 	li	a0,45
bfc07944:	24060045 	li	a2,69
bfc07948:	112e0028 	beq	t1,t6,bfc079ec <core_bench_state+0x14c>
bfc0794c:	24070065 	li	a3,101
bfc07950:	00005021 	move	t2,zero
bfc07954:	2418002e 	li	t8,46
bfc07958:	000a4080 	sll	t0,t2,0x2
bfc0795c:	03281021 	addu	v0,t9,t0
bfc07960:	8c430000 	lw	v1,0(v0)
bfc07964:	00000000 	nop
bfc07968:	00600008 	jr	v1
bfc0796c:	00000000 	nop
bfc07970:	1126008f 	beq	t1,a2,bfc07bb0 <core_bench_state+0x310>
bfc07974:	00000000 	nop
bfc07978:	1127008d 	beq	t1,a3,bfc07bb0 <core_bench_state+0x310>
bfc0797c:	2522ffd0 	addiu	v0,t1,-48
bfc07980:	304900ff 	andi	t1,v0,0xff
bfc07984:	2d23000a 	sltiu	v1,t1,10
bfc07988:	14600005 	bnez	v1,bfc079a0 <core_bench_state+0x100>
bfc0798c:	00000000 	nop
bfc07990:	8fa30044 	lw	v1,68(sp)
bfc07994:	240a0001 	li	t2,1
bfc07998:	24680001 	addiu	t0,v1,1
bfc0799c:	afa80044 	sw	t0,68(sp)
bfc079a0:	258c0001 	addiu	t4,t4,1
bfc079a4:	91880000 	lbu	t0,0(t4)
bfc079a8:	00000000 	nop
bfc079ac:	11000029 	beqz	t0,bfc07a54 <core_bench_state+0x1b4>
bfc079b0:	01004821 	move	t1,t0
bfc079b4:	114f00b2 	beq	t2,t7,bfc07c80 <core_bench_state+0x3e0>
bfc079b8:	00000000 	nop
bfc079bc:	152effe7 	bne	t1,t6,bfc0795c <core_bench_state+0xbc>
bfc079c0:	000a4080 	sll	t0,t2,0x2
bfc079c4:	02281821 	addu	v1,s1,t0
bfc079c8:	8c6a0000 	lw	t2,0(v1)
bfc079cc:	258c0001 	addiu	t4,t4,1
bfc079d0:	91880000 	lbu	t0,0(t4)
bfc079d4:	25490001 	addiu	t1,t2,1
bfc079d8:	11000024 	beqz	t0,bfc07a6c <core_bench_state+0x1cc>
bfc079dc:	ac690000 	sw	t1,0(v1)
bfc079e0:	01004821 	move	t1,t0
bfc079e4:	152effdb 	bne	t1,t6,bfc07954 <core_bench_state+0xb4>
bfc079e8:	00005021 	move	t2,zero
bfc079ec:	00005021 	move	t2,zero
bfc079f0:	000a4080 	sll	t0,t2,0x2
bfc079f4:	02281821 	addu	v1,s1,t0
bfc079f8:	8c6a0000 	lw	t2,0(v1)
bfc079fc:	258c0001 	addiu	t4,t4,1
bfc07a00:	91880000 	lbu	t0,0(t4)
bfc07a04:	25490001 	addiu	t1,t2,1
bfc07a08:	1500fff5 	bnez	t0,bfc079e0 <core_bench_state+0x140>
bfc07a0c:	ac690000 	sw	t1,0(v1)
bfc07a10:	0bf01e9c 	j	bfc07a70 <core_bench_state+0x1d0>
bfc07a14:	00b32021 	addu	a0,a1,s3
	...
bfc07a20:	2522ffd0 	addiu	v0,t1,-48
bfc07a24:	304300ff 	andi	v1,v0,0xff
bfc07a28:	2c68000a 	sltiu	t0,v1,10
bfc07a2c:	1500ffdc 	bnez	t0,bfc079a0 <core_bench_state+0x100>
bfc07a30:	00000000 	nop
bfc07a34:	8fa80034 	lw	t0,52(sp)
bfc07a38:	258c0001 	addiu	t4,t4,1
bfc07a3c:	25090001 	addiu	t1,t0,1
bfc07a40:	afa90034 	sw	t1,52(sp)
bfc07a44:	91880000 	lbu	t0,0(t4)
bfc07a48:	240a0001 	li	t2,1
bfc07a4c:	1500ffd9 	bnez	t0,bfc079b4 <core_bench_state+0x114>
bfc07a50:	01004821 	move	t1,t0
bfc07a54:	000a6080 	sll	t4,t2,0x2
bfc07a58:	022cc821 	addu	t9,s1,t4
bfc07a5c:	8f3f0000 	lw	ra,0(t9)
bfc07a60:	00000000 	nop
bfc07a64:	27e40001 	addiu	a0,ra,1
bfc07a68:	af240000 	sw	a0,0(t9)
bfc07a6c:	00b32021 	addu	a0,a1,s3
bfc07a70:	00a4382b 	sltu	a3,a1,a0
bfc07a74:	10e00091 	beqz	a3,bfc07cbc <core_bench_state+0x41c>
bfc07a78:	00ad1821 	addu	v1,a1,t5
bfc07a7c:	00a04021 	move	t0,a1
bfc07a80:	240a002c 	li	t2,44
bfc07a84:	000d4823 	negu	t1,t5
bfc07a88:	116a0002 	beq	t3,t2,bfc07a94 <core_bench_state+0x1f4>
bfc07a8c:	01703026 	xor	a2,t3,s0
bfc07a90:	a1060000 	sb	a2,0(t0)
bfc07a94:	006d1821 	addu	v1,v1,t5
bfc07a98:	006d6023 	subu	t4,v1,t5
bfc07a9c:	0184582b 	sltu	t3,t4,a0
bfc07aa0:	11600084 	beqz	t3,bfc07cb4 <core_bench_state+0x414>
bfc07aa4:	010d4021 	addu	t0,t0,t5
bfc07aa8:	00697021 	addu	t6,v1,t1
bfc07aac:	91cb0000 	lbu	t3,0(t6)
bfc07ab0:	0bf01ea2 	j	bfc07a88 <core_bench_state+0x1e8>
bfc07ab4:	00000000 	nop
	...
bfc07ac0:	11380067 	beq	t1,t8,bfc07c60 <core_bench_state+0x3c0>
bfc07ac4:	2528ffd0 	addiu	t0,t1,-48
bfc07ac8:	310200ff 	andi	v0,t0,0xff
bfc07acc:	2c49000a 	sltiu	t1,v0,10
bfc07ad0:	1520ffb3 	bnez	t1,bfc079a0 <core_bench_state+0x100>
bfc07ad4:	00000000 	nop
bfc07ad8:	8fa90040 	lw	t1,64(sp)
bfc07adc:	240a0001 	li	t2,1
bfc07ae0:	25230001 	addiu	v1,t1,1
bfc07ae4:	0bf01e68 	j	bfc079a0 <core_bench_state+0x100>
bfc07ae8:	afa30040 	sw	v1,64(sp)
bfc07aec:	00000000 	nop
bfc07af0:	113f0037 	beq	t1,ra,bfc07bd0 <core_bench_state+0x330>
bfc07af4:	00000000 	nop
bfc07af8:	11240035 	beq	t1,a0,bfc07bd0 <core_bench_state+0x330>
bfc07afc:	00000000 	nop
bfc07b00:	8fa3003c 	lw	v1,60(sp)
bfc07b04:	240a0001 	li	t2,1
bfc07b08:	24680001 	addiu	t0,v1,1
bfc07b0c:	0bf01e68 	j	bfc079a0 <core_bench_state+0x100>
bfc07b10:	afa8003c 	sw	t0,60(sp)
	...
bfc07b20:	2522ffd0 	addiu	v0,t1,-48
bfc07b24:	304900ff 	andi	t1,v0,0xff
bfc07b28:	2d2a000a 	sltiu	t2,t1,10
bfc07b2c:	11400038 	beqz	t2,bfc07c10 <core_bench_state+0x370>
bfc07b30:	00000000 	nop
bfc07b34:	8fa30048 	lw	v1,72(sp)
bfc07b38:	240a0007 	li	t2,7
bfc07b3c:	24680001 	addiu	t0,v1,1
bfc07b40:	0bf01e68 	j	bfc079a0 <core_bench_state+0x100>
bfc07b44:	afa80048 	sw	t0,72(sp)
	...
bfc07b50:	2522ffd0 	addiu	v0,t1,-48
bfc07b54:	304300ff 	andi	v1,v0,0xff
bfc07b58:	2c6a000a 	sltiu	t2,v1,10
bfc07b5c:	11400034 	beqz	t2,bfc07c30 <core_bench_state+0x390>
bfc07b60:	240a0004 	li	t2,4
bfc07b64:	8fa20030 	lw	v0,48(sp)
bfc07b68:	00000000 	nop
bfc07b6c:	24430001 	addiu	v1,v0,1
bfc07b70:	0bf01e68 	j	bfc079a0 <core_bench_state+0x100>
bfc07b74:	afa30030 	sw	v1,48(sp)
	...
bfc07b80:	2523ffd0 	addiu	v1,t1,-48
bfc07b84:	306800ff 	andi	t0,v1,0xff
bfc07b88:	2d0a000a 	sltiu	t2,t0,10
bfc07b8c:	11400018 	beqz	t2,bfc07bf0 <core_bench_state+0x350>
bfc07b90:	240a0004 	li	t2,4
bfc07b94:	8fa20038 	lw	v0,56(sp)
bfc07b98:	00000000 	nop
bfc07b9c:	24490001 	addiu	t1,v0,1
bfc07ba0:	0bf01e68 	j	bfc079a0 <core_bench_state+0x100>
bfc07ba4:	afa90038 	sw	t1,56(sp)
	...
bfc07bb0:	8fa80044 	lw	t0,68(sp)
bfc07bb4:	240a0003 	li	t2,3
bfc07bb8:	25020001 	addiu	v0,t0,1
bfc07bbc:	0bf01e68 	j	bfc079a0 <core_bench_state+0x100>
bfc07bc0:	afa20044 	sw	v0,68(sp)
	...
bfc07bd0:	8fa2003c 	lw	v0,60(sp)
bfc07bd4:	240a0006 	li	t2,6
bfc07bd8:	24490001 	addiu	t1,v0,1
bfc07bdc:	0bf01e68 	j	bfc079a0 <core_bench_state+0x100>
bfc07be0:	afa9003c 	sw	t1,60(sp)
	...
bfc07bf0:	1138002b 	beq	t1,t8,bfc07ca0 <core_bench_state+0x400>
bfc07bf4:	00000000 	nop
bfc07bf8:	8fa20038 	lw	v0,56(sp)
bfc07bfc:	240a0001 	li	t2,1
bfc07c00:	24490001 	addiu	t1,v0,1
bfc07c04:	0bf01e68 	j	bfc079a0 <core_bench_state+0x100>
bfc07c08:	afa90038 	sw	t1,56(sp)
bfc07c0c:	00000000 	nop
bfc07c10:	8fa20048 	lw	v0,72(sp)
bfc07c14:	240a0001 	li	t2,1
bfc07c18:	24490001 	addiu	t1,v0,1
bfc07c1c:	0bf01e68 	j	bfc079a0 <core_bench_state+0x100>
bfc07c20:	afa90048 	sw	t1,72(sp)
	...
bfc07c30:	113fffcc 	beq	t1,ra,bfc07b64 <core_bench_state+0x2c4>
bfc07c34:	240a0002 	li	t2,2
bfc07c38:	1124ffca 	beq	t1,a0,bfc07b64 <core_bench_state+0x2c4>
bfc07c3c:	00000000 	nop
bfc07c40:	11380136 	beq	t1,t8,bfc0811c <core_bench_state+0x87c>
bfc07c44:	00000000 	nop
bfc07c48:	8fa80034 	lw	t0,52(sp)
bfc07c4c:	240a0001 	li	t2,1
bfc07c50:	25090001 	addiu	t1,t0,1
bfc07c54:	0bf01ed9 	j	bfc07b64 <core_bench_state+0x2c4>
bfc07c58:	afa90034 	sw	t1,52(sp)
bfc07c5c:	00000000 	nop
bfc07c60:	8fa30040 	lw	v1,64(sp)
bfc07c64:	240a0005 	li	t2,5
bfc07c68:	24680001 	addiu	t0,v1,1
bfc07c6c:	0bf01e68 	j	bfc079a0 <core_bench_state+0x100>
bfc07c70:	afa80040 	sw	t0,64(sp)
	...
bfc07c80:	8fa90014 	lw	t1,20(sp)
bfc07c84:	00000000 	nop
bfc07c88:	252a0001 	addiu	t2,t1,1
bfc07c8c:	afaa0014 	sw	t2,20(sp)
bfc07c90:	0bf01e79 	j	bfc079e4 <core_bench_state+0x144>
bfc07c94:	01004821 	move	t1,t0
	...
bfc07ca0:	8fa30038 	lw	v1,56(sp)
bfc07ca4:	240a0005 	li	t2,5
bfc07ca8:	24680001 	addiu	t0,v1,1
bfc07cac:	0bf01e68 	j	bfc079a0 <core_bench_state+0x100>
bfc07cb0:	afa80038 	sw	t0,56(sp)
bfc07cb4:	90ab0000 	lbu	t3,0(a1)
bfc07cb8:	00000000 	nop
bfc07cbc:	11600053 	beqz	t3,bfc07e0c <core_bench_state+0x56c>
bfc07cc0:	3c11bfc1 	lui	s1,0xbfc1
bfc07cc4:	240a002c 	li	t2,44
bfc07cc8:	262fa920 	addiu	t7,s1,-22240
bfc07ccc:	00a04821 	move	t1,a1
bfc07cd0:	27b10010 	addiu	s1,sp,16
bfc07cd4:	240c0001 	li	t4,1
bfc07cd8:	2418002b 	li	t8,43
bfc07cdc:	2419002d 	li	t9,45
bfc07ce0:	241f0045 	li	ra,69
bfc07ce4:	116a002a 	beq	t3,t2,bfc07d90 <core_bench_state+0x4f0>
bfc07ce8:	24100065 	li	s0,101
bfc07cec:	00004021 	move	t0,zero
bfc07cf0:	240e002e 	li	t6,46
bfc07cf4:	00081080 	sll	v0,t0,0x2
bfc07cf8:	01e21821 	addu	v1,t7,v0
bfc07cfc:	8c730000 	lw	s3,0(v1)
bfc07d00:	00000000 	nop
bfc07d04:	02600008 	jr	s3
bfc07d08:	00000000 	nop
bfc07d0c:	00000000 	nop
bfc07d10:	117f00bf 	beq	t3,ra,bfc08010 <core_bench_state+0x770>
bfc07d14:	00000000 	nop
bfc07d18:	117000bd 	beq	t3,s0,bfc08010 <core_bench_state+0x770>
bfc07d1c:	2566ffd0 	addiu	a2,t3,-48
bfc07d20:	30cb00ff 	andi	t3,a2,0xff
bfc07d24:	2d62000a 	sltiu	v0,t3,10
bfc07d28:	14400005 	bnez	v0,bfc07d40 <core_bench_state+0x4a0>
bfc07d2c:	00000000 	nop
bfc07d30:	8fa30044 	lw	v1,68(sp)
bfc07d34:	24080001 	li	t0,1
bfc07d38:	24730001 	addiu	s3,v1,1
bfc07d3c:	afb30044 	sw	s3,68(sp)
bfc07d40:	25290001 	addiu	t1,t1,1
bfc07d44:	91260000 	lbu	a2,0(t1)
bfc07d48:	00000000 	nop
bfc07d4c:	10c00029 	beqz	a2,bfc07df4 <core_bench_state+0x554>
bfc07d50:	00c05821 	move	t3,a2
bfc07d54:	110c00e2 	beq	t0,t4,bfc080e0 <core_bench_state+0x840>
bfc07d58:	00000000 	nop
bfc07d5c:	156affe6 	bne	t3,t2,bfc07cf8 <core_bench_state+0x458>
bfc07d60:	00081080 	sll	v0,t0,0x2
bfc07d64:	00083080 	sll	a2,t0,0x2
bfc07d68:	02261821 	addu	v1,s1,a2
bfc07d6c:	8c620000 	lw	v0,0(v1)
bfc07d70:	25290001 	addiu	t1,t1,1
bfc07d74:	91260000 	lbu	a2,0(t1)
bfc07d78:	24530001 	addiu	s3,v0,1
bfc07d7c:	10c00023 	beqz	a2,bfc07e0c <core_bench_state+0x56c>
bfc07d80:	ac730000 	sw	s3,0(v1)
bfc07d84:	00c05821 	move	t3,a2
bfc07d88:	156affd9 	bne	t3,t2,bfc07cf0 <core_bench_state+0x450>
bfc07d8c:	00004021 	move	t0,zero
bfc07d90:	00004021 	move	t0,zero
bfc07d94:	00083080 	sll	a2,t0,0x2
bfc07d98:	02261821 	addu	v1,s1,a2
bfc07d9c:	8c620000 	lw	v0,0(v1)
bfc07da0:	25290001 	addiu	t1,t1,1
bfc07da4:	91260000 	lbu	a2,0(t1)
bfc07da8:	24530001 	addiu	s3,v0,1
bfc07dac:	14c0fff5 	bnez	a2,bfc07d84 <core_bench_state+0x4e4>
bfc07db0:	ac730000 	sw	s3,0(v1)
bfc07db4:	0bf01f83 	j	bfc07e0c <core_bench_state+0x56c>
bfc07db8:	00000000 	nop
bfc07dbc:	00000000 	nop
bfc07dc0:	2566ffd0 	addiu	a2,t3,-48
bfc07dc4:	30cb00ff 	andi	t3,a2,0xff
bfc07dc8:	2d62000a 	sltiu	v0,t3,10
bfc07dcc:	1440ffdc 	bnez	v0,bfc07d40 <core_bench_state+0x4a0>
bfc07dd0:	00000000 	nop
bfc07dd4:	8fa30034 	lw	v1,52(sp)
bfc07dd8:	25290001 	addiu	t1,t1,1
bfc07ddc:	24730001 	addiu	s3,v1,1
bfc07de0:	afb30034 	sw	s3,52(sp)
bfc07de4:	91260000 	lbu	a2,0(t1)
bfc07de8:	24080001 	li	t0,1
bfc07dec:	14c0ffd9 	bnez	a2,bfc07d54 <core_bench_state+0x4b4>
bfc07df0:	00c05821 	move	t3,a2
bfc07df4:	00081080 	sll	v0,t0,0x2
bfc07df8:	02225821 	addu	t3,s1,v0
bfc07dfc:	8d710000 	lw	s1,0(t3)
bfc07e00:	00000000 	nop
bfc07e04:	26300001 	addiu	s0,s1,1
bfc07e08:	ad700000 	sw	s0,0(t3)
bfc07e0c:	10e0000d 	beqz	a3,bfc07e44 <core_bench_state+0x5a4>
bfc07e10:	00a01821 	move	v1,a1
bfc07e14:	2406002c 	li	a2,44
bfc07e18:	00ad2821 	addu	a1,a1,t5
bfc07e1c:	90620000 	lbu	v0,0(v1)
bfc07e20:	00000000 	nop
bfc07e24:	10460002 	beq	v0,a2,bfc07e30 <core_bench_state+0x590>
bfc07e28:	00523826 	xor	a3,v0,s2
bfc07e2c:	a0670000 	sb	a3,0(v1)
bfc07e30:	00ad2821 	addu	a1,a1,t5
bfc07e34:	00adc023 	subu	t8,a1,t5
bfc07e38:	0304782b 	sltu	t7,t8,a0
bfc07e3c:	15e0fff7 	bnez	t7,bfc07e1c <core_bench_state+0x57c>
bfc07e40:	006d1821 	addu	v1,v1,t5
bfc07e44:	8fa40010 	lw	a0,16(sp)
bfc07e48:	0ff018f4 	jal	bfc063d0 <crcu32>
bfc07e4c:	02802821 	move	a1,s4
bfc07e50:	8fa40030 	lw	a0,48(sp)
bfc07e54:	0ff018f4 	jal	bfc063d0 <crcu32>
bfc07e58:	00402821 	move	a1,v0
bfc07e5c:	8fa40014 	lw	a0,20(sp)
bfc07e60:	0ff018f4 	jal	bfc063d0 <crcu32>
bfc07e64:	00402821 	move	a1,v0
bfc07e68:	8fa40034 	lw	a0,52(sp)
bfc07e6c:	0ff018f4 	jal	bfc063d0 <crcu32>
bfc07e70:	00402821 	move	a1,v0
bfc07e74:	8fa40018 	lw	a0,24(sp)
bfc07e78:	0ff018f4 	jal	bfc063d0 <crcu32>
bfc07e7c:	00402821 	move	a1,v0
bfc07e80:	8fa40038 	lw	a0,56(sp)
bfc07e84:	0ff018f4 	jal	bfc063d0 <crcu32>
bfc07e88:	00402821 	move	a1,v0
bfc07e8c:	8fa4001c 	lw	a0,28(sp)
bfc07e90:	0ff018f4 	jal	bfc063d0 <crcu32>
bfc07e94:	00402821 	move	a1,v0
bfc07e98:	8fa4003c 	lw	a0,60(sp)
bfc07e9c:	0ff018f4 	jal	bfc063d0 <crcu32>
bfc07ea0:	00402821 	move	a1,v0
bfc07ea4:	8fa40020 	lw	a0,32(sp)
bfc07ea8:	0ff018f4 	jal	bfc063d0 <crcu32>
bfc07eac:	00402821 	move	a1,v0
bfc07eb0:	8fa40040 	lw	a0,64(sp)
bfc07eb4:	0ff018f4 	jal	bfc063d0 <crcu32>
bfc07eb8:	00402821 	move	a1,v0
bfc07ebc:	8fa40024 	lw	a0,36(sp)
bfc07ec0:	0ff018f4 	jal	bfc063d0 <crcu32>
bfc07ec4:	00402821 	move	a1,v0
bfc07ec8:	8fa40044 	lw	a0,68(sp)
bfc07ecc:	0ff018f4 	jal	bfc063d0 <crcu32>
bfc07ed0:	00402821 	move	a1,v0
bfc07ed4:	8fa40028 	lw	a0,40(sp)
bfc07ed8:	0ff018f4 	jal	bfc063d0 <crcu32>
bfc07edc:	00402821 	move	a1,v0
bfc07ee0:	8fa40048 	lw	a0,72(sp)
bfc07ee4:	0ff018f4 	jal	bfc063d0 <crcu32>
bfc07ee8:	00402821 	move	a1,v0
bfc07eec:	8fa4002c 	lw	a0,44(sp)
bfc07ef0:	0ff018f4 	jal	bfc063d0 <crcu32>
bfc07ef4:	00402821 	move	a1,v0
bfc07ef8:	8fa4004c 	lw	a0,76(sp)
bfc07efc:	8fbf0064 	lw	ra,100(sp)
bfc07f00:	8fb40060 	lw	s4,96(sp)
bfc07f04:	8fb3005c 	lw	s3,92(sp)
bfc07f08:	8fb20058 	lw	s2,88(sp)
bfc07f0c:	8fb10054 	lw	s1,84(sp)
bfc07f10:	8fb00050 	lw	s0,80(sp)
bfc07f14:	00402821 	move	a1,v0
bfc07f18:	0bf018f4 	j	bfc063d0 <crcu32>
bfc07f1c:	27bd0068 	addiu	sp,sp,104
bfc07f20:	2562ffd0 	addiu	v0,t3,-48
bfc07f24:	304300ff 	andi	v1,v0,0xff
bfc07f28:	2c68000a 	sltiu	t0,v1,10
bfc07f2c:	11000048 	beqz	t0,bfc08050 <core_bench_state+0x7b0>
bfc07f30:	00000000 	nop
bfc07f34:	8fa60048 	lw	a2,72(sp)
bfc07f38:	24080007 	li	t0,7
bfc07f3c:	24cb0001 	addiu	t3,a2,1
bfc07f40:	0bf01f50 	j	bfc07d40 <core_bench_state+0x4a0>
bfc07f44:	afab0048 	sw	t3,72(sp)
	...
bfc07f50:	2573ffd0 	addiu	s3,t3,-48
bfc07f54:	326600ff 	andi	a2,s3,0xff
bfc07f58:	2cc8000a 	sltiu	t0,a2,10
bfc07f5c:	11000044 	beqz	t0,bfc08070 <core_bench_state+0x7d0>
bfc07f60:	24080004 	li	t0,4
bfc07f64:	8fa60030 	lw	a2,48(sp)
bfc07f68:	00000000 	nop
bfc07f6c:	24c20001 	addiu	v0,a2,1
bfc07f70:	0bf01f50 	j	bfc07d40 <core_bench_state+0x4a0>
bfc07f74:	afa20030 	sw	v0,48(sp)
	...
bfc07f80:	1178002b 	beq	t3,t8,bfc08030 <core_bench_state+0x790>
bfc07f84:	00000000 	nop
bfc07f88:	11790029 	beq	t3,t9,bfc08030 <core_bench_state+0x790>
bfc07f8c:	00000000 	nop
bfc07f90:	8fb3003c 	lw	s3,60(sp)
bfc07f94:	24080001 	li	t0,1
bfc07f98:	26660001 	addiu	a2,s3,1
bfc07f9c:	0bf01f50 	j	bfc07d40 <core_bench_state+0x4a0>
bfc07fa0:	afa6003c 	sw	a2,60(sp)
	...
bfc07fb0:	116e0043 	beq	t3,t6,bfc080c0 <core_bench_state+0x820>
bfc07fb4:	2562ffd0 	addiu	v0,t3,-48
bfc07fb8:	304300ff 	andi	v1,v0,0xff
bfc07fbc:	2c73000a 	sltiu	s3,v1,10
bfc07fc0:	1660ff5f 	bnez	s3,bfc07d40 <core_bench_state+0x4a0>
bfc07fc4:	00000000 	nop
bfc07fc8:	8fa60040 	lw	a2,64(sp)
bfc07fcc:	24080001 	li	t0,1
bfc07fd0:	24cb0001 	addiu	t3,a2,1
bfc07fd4:	0bf01f50 	j	bfc07d40 <core_bench_state+0x4a0>
bfc07fd8:	afab0040 	sw	t3,64(sp)
bfc07fdc:	00000000 	nop
bfc07fe0:	2563ffd0 	addiu	v1,t3,-48
bfc07fe4:	307300ff 	andi	s3,v1,0xff
bfc07fe8:	2e68000a 	sltiu	t0,s3,10
bfc07fec:	1100002c 	beqz	t0,bfc080a0 <core_bench_state+0x800>
bfc07ff0:	24080004 	li	t0,4
bfc07ff4:	8fa20038 	lw	v0,56(sp)
bfc07ff8:	00000000 	nop
bfc07ffc:	244b0001 	addiu	t3,v0,1
bfc08000:	0bf01f50 	j	bfc07d40 <core_bench_state+0x4a0>
bfc08004:	afab0038 	sw	t3,56(sp)
	...
bfc08010:	8fa30044 	lw	v1,68(sp)
bfc08014:	24080003 	li	t0,3
bfc08018:	24730001 	addiu	s3,v1,1
bfc0801c:	0bf01f50 	j	bfc07d40 <core_bench_state+0x4a0>
bfc08020:	afb30044 	sw	s3,68(sp)
	...
bfc08030:	8fab003c 	lw	t3,60(sp)
bfc08034:	24080006 	li	t0,6
bfc08038:	25620001 	addiu	v0,t3,1
bfc0803c:	0bf01f50 	j	bfc07d40 <core_bench_state+0x4a0>
bfc08040:	afa2003c 	sw	v0,60(sp)
	...
bfc08050:	8fa30048 	lw	v1,72(sp)
bfc08054:	24080001 	li	t0,1
bfc08058:	24730001 	addiu	s3,v1,1
bfc0805c:	0bf01f50 	j	bfc07d40 <core_bench_state+0x4a0>
bfc08060:	afb30048 	sw	s3,72(sp)
	...
bfc08070:	1178ffbc 	beq	t3,t8,bfc07f64 <core_bench_state+0x6c4>
bfc08074:	24080002 	li	t0,2
bfc08078:	1179ffba 	beq	t3,t9,bfc07f64 <core_bench_state+0x6c4>
bfc0807c:	00000000 	nop
bfc08080:	116e0024 	beq	t3,t6,bfc08114 <core_bench_state+0x874>
bfc08084:	00000000 	nop
bfc08088:	8fa30034 	lw	v1,52(sp)
bfc0808c:	24080001 	li	t0,1
bfc08090:	246b0001 	addiu	t3,v1,1
bfc08094:	0bf01fd9 	j	bfc07f64 <core_bench_state+0x6c4>
bfc08098:	afab0034 	sw	t3,52(sp)
bfc0809c:	00000000 	nop
bfc080a0:	116e0017 	beq	t3,t6,bfc08100 <core_bench_state+0x860>
bfc080a4:	00000000 	nop
bfc080a8:	8fab0038 	lw	t3,56(sp)
bfc080ac:	24080001 	li	t0,1
bfc080b0:	25630001 	addiu	v1,t3,1
bfc080b4:	0bf01f50 	j	bfc07d40 <core_bench_state+0x4a0>
bfc080b8:	afa30038 	sw	v1,56(sp)
bfc080bc:	00000000 	nop
bfc080c0:	8fa60040 	lw	a2,64(sp)
bfc080c4:	24080005 	li	t0,5
bfc080c8:	24c20001 	addiu	v0,a2,1
bfc080cc:	0bf01f50 	j	bfc07d40 <core_bench_state+0x4a0>
bfc080d0:	afa20040 	sw	v0,64(sp)
	...
bfc080e0:	8fa80014 	lw	t0,20(sp)
bfc080e4:	00c05821 	move	t3,a2
bfc080e8:	250e0001 	addiu	t6,t0,1
bfc080ec:	0bf01f62 	j	bfc07d88 <core_bench_state+0x4e8>
bfc080f0:	afae0014 	sw	t6,20(sp)
	...
bfc08100:	8fb30038 	lw	s3,56(sp)
bfc08104:	24080005 	li	t0,5
bfc08108:	26660001 	addiu	a2,s3,1
bfc0810c:	0bf01f50 	j	bfc07d40 <core_bench_state+0x4a0>
bfc08110:	afa60038 	sw	a2,56(sp)
bfc08114:	0bf01fd9 	j	bfc07f64 <core_bench_state+0x6c4>
bfc08118:	24080005 	li	t0,5
bfc0811c:	0bf01ed9 	j	bfc07b64 <core_bench_state+0x2c4>
bfc08120:	240a0005 	li	t2,5
	...

bfc08130 <cmp_idx>:
cmp_idx():
bfc08130:	10c00007 	beqz	a2,bfc08150 <cmp_idx+0x20>
bfc08134:	00803821 	move	a3,a0
bfc08138:	84ef0002 	lh	t7,2(a3)
bfc0813c:	84a70002 	lh	a3,2(a1)
bfc08140:	03e00008 	jr	ra
bfc08144:	01e71023 	subu	v0,t7,a3
	...
bfc08150:	848d0000 	lh	t5,0(a0)
bfc08154:	2409ff00 	li	t1,-256
bfc08158:	31aeffff 	andi	t6,t5,0xffff
bfc0815c:	000e5a02 	srl	t3,t6,0x8
bfc08160:	01a96024 	and	t4,t5,t1
bfc08164:	016c5025 	or	t2,t3,t4
bfc08168:	a48a0000 	sh	t2,0(a0)
bfc0816c:	84a80000 	lh	t0,0(a1)
bfc08170:	84ef0002 	lh	t7,2(a3)
bfc08174:	3106ffff 	andi	a2,t0,0xffff
bfc08178:	01091824 	and	v1,t0,t1
bfc0817c:	00062202 	srl	a0,a2,0x8
bfc08180:	84a70002 	lh	a3,2(a1)
bfc08184:	00831025 	or	v0,a0,v1
bfc08188:	a4a20000 	sh	v0,0(a1)
bfc0818c:	03e00008 	jr	ra
bfc08190:	01e71023 	subu	v0,t7,a3
	...

bfc081a0 <copy_info>:
copy_info():
bfc081a0:	94a20002 	lhu	v0,2(a1)
bfc081a4:	94a30000 	lhu	v1,0(a1)
bfc081a8:	a4820002 	sh	v0,2(a0)
bfc081ac:	03e00008 	jr	ra
bfc081b0:	a4830000 	sh	v1,0(a0)
	...

bfc081c0 <core_list_insert_new>:
core_list_insert_new():
bfc081c0:	8cc80000 	lw	t0,0(a2)
bfc081c4:	8fa30010 	lw	v1,16(sp)
bfc081c8:	25090008 	addiu	t1,t0,8
bfc081cc:	0123102b 	sltu	v0,t1,v1
bfc081d0:	00805021 	move	t2,a0
bfc081d4:	14400006 	bnez	v0,bfc081f0 <core_list_insert_new+0x30>
bfc081d8:	00a01821 	move	v1,a1
bfc081dc:	00004021 	move	t0,zero
bfc081e0:	03e00008 	jr	ra
bfc081e4:	01001021 	move	v0,t0
	...
bfc081f0:	8ce40000 	lw	a0,0(a3)
bfc081f4:	8fa50014 	lw	a1,20(sp)
bfc081f8:	248c0004 	addiu	t4,a0,4
bfc081fc:	0185582b 	sltu	t3,t4,a1
bfc08200:	1160fff6 	beqz	t3,bfc081dc <core_list_insert_new+0x1c>
bfc08204:	00000000 	nop
bfc08208:	ad040004 	sw	a0,4(t0)
bfc0820c:	8cee0000 	lw	t6,0(a3)
bfc08210:	acc90000 	sw	t1,0(a2)
bfc08214:	25cd0004 	addiu	t5,t6,4
bfc08218:	aced0000 	sw	t5,0(a3)
bfc0821c:	8d490000 	lw	t1,0(t2)
bfc08220:	8d060004 	lw	a2,4(t0)
bfc08224:	94640002 	lhu	a0,2(v1)
bfc08228:	94670000 	lhu	a3,0(v1)
bfc0822c:	ad090000 	sw	t1,0(t0)
bfc08230:	a4c40002 	sh	a0,2(a2)
bfc08234:	a4c70000 	sh	a3,0(a2)
bfc08238:	0bf02078 	j	bfc081e0 <core_list_insert_new+0x20>
bfc0823c:	ad480000 	sw	t0,0(t2)

bfc08240 <core_list_remove>:
core_list_remove():
bfc08240:	8c820000 	lw	v0,0(a0)
bfc08244:	8c860004 	lw	a2,4(a0)
bfc08248:	8c430004 	lw	v1,4(v0)
bfc0824c:	8c450000 	lw	a1,0(v0)
bfc08250:	ac830004 	sw	v1,4(a0)
bfc08254:	ac850000 	sw	a1,0(a0)
bfc08258:	ac460004 	sw	a2,4(v0)
bfc0825c:	03e00008 	jr	ra
bfc08260:	ac400000 	sw	zero,0(v0)
	...

bfc08270 <core_list_undo_remove>:
core_list_undo_remove():
bfc08270:	00801021 	move	v0,a0
bfc08274:	8c860004 	lw	a2,4(a0)
bfc08278:	8ca30004 	lw	v1,4(a1)
bfc0827c:	8ca40000 	lw	a0,0(a1)
bfc08280:	ac430004 	sw	v1,4(v0)
bfc08284:	ac440000 	sw	a0,0(v0)
bfc08288:	aca60004 	sw	a2,4(a1)
bfc0828c:	03e00008 	jr	ra
bfc08290:	aca20000 	sw	v0,0(a1)
	...

bfc082a0 <core_list_find>:
core_list_find():
bfc082a0:	84a60002 	lh	a2,2(a1)
bfc082a4:	00000000 	nop
bfc082a8:	04c00011 	bltz	a2,bfc082f0 <core_list_find+0x50>
bfc082ac:	00000000 	nop
bfc082b0:	1080000b 	beqz	a0,bfc082e0 <core_list_find+0x40>
bfc082b4:	00000000 	nop
bfc082b8:	8c870004 	lw	a3,4(a0)
bfc082bc:	00000000 	nop
bfc082c0:	84e50002 	lh	a1,2(a3)
bfc082c4:	00000000 	nop
bfc082c8:	10a60005 	beq	a1,a2,bfc082e0 <core_list_find+0x40>
bfc082cc:	00000000 	nop
bfc082d0:	8c840000 	lw	a0,0(a0)
bfc082d4:	00000000 	nop
bfc082d8:	1480fff7 	bnez	a0,bfc082b8 <core_list_find+0x18>
bfc082dc:	00000000 	nop
bfc082e0:	03e00008 	jr	ra
bfc082e4:	00801021 	move	v0,a0
	...
bfc082f0:	1080fffb 	beqz	a0,bfc082e0 <core_list_find+0x40>
bfc082f4:	00000000 	nop
bfc082f8:	8c830004 	lw	v1,4(a0)
bfc082fc:	84a50000 	lh	a1,0(a1)
bfc08300:	90620000 	lbu	v0,0(v1)
bfc08304:	00000000 	nop
bfc08308:	1445000b 	bne	v0,a1,bfc08338 <core_list_find+0x98>
bfc0830c:	00000000 	nop
bfc08310:	0bf020b8 	j	bfc082e0 <core_list_find+0x40>
bfc08314:	00000000 	nop
	...
bfc08320:	8c880004 	lw	t0,4(a0)
bfc08324:	00000000 	nop
bfc08328:	91060000 	lbu	a2,0(t0)
bfc0832c:	00000000 	nop
bfc08330:	10c5ffeb 	beq	a2,a1,bfc082e0 <core_list_find+0x40>
bfc08334:	00000000 	nop
bfc08338:	8c840000 	lw	a0,0(a0)
bfc0833c:	00000000 	nop
bfc08340:	1480fff7 	bnez	a0,bfc08320 <core_list_find+0x80>
bfc08344:	00801021 	move	v0,a0
bfc08348:	03e00008 	jr	ra
bfc0834c:	00000000 	nop

bfc08350 <core_list_reverse>:
core_list_reverse():
bfc08350:	10800027 	beqz	a0,bfc083f0 <core_list_reverse+0xa0>
bfc08354:	00801021 	move	v0,a0
bfc08358:	8c430000 	lw	v1,0(v0)
bfc0835c:	00002021 	move	a0,zero
bfc08360:	10600023 	beqz	v1,bfc083f0 <core_list_reverse+0xa0>
bfc08364:	ac440000 	sw	a0,0(v0)
bfc08368:	8c640000 	lw	a0,0(v1)
bfc0836c:	ac620000 	sw	v0,0(v1)
bfc08370:	1080001f 	beqz	a0,bfc083f0 <core_list_reverse+0xa0>
bfc08374:	00601021 	move	v0,v1
bfc08378:	8c850000 	lw	a1,0(a0)
bfc0837c:	00801021 	move	v0,a0
bfc08380:	10a0001b 	beqz	a1,bfc083f0 <core_list_reverse+0xa0>
bfc08384:	ac830000 	sw	v1,0(a0)
bfc08388:	8ca30000 	lw	v1,0(a1)
bfc0838c:	00a01021 	move	v0,a1
bfc08390:	10600017 	beqz	v1,bfc083f0 <core_list_reverse+0xa0>
bfc08394:	aca40000 	sw	a0,0(a1)
bfc08398:	8c640000 	lw	a0,0(v1)
bfc0839c:	00601021 	move	v0,v1
bfc083a0:	10800013 	beqz	a0,bfc083f0 <core_list_reverse+0xa0>
bfc083a4:	ac650000 	sw	a1,0(v1)
bfc083a8:	8c850000 	lw	a1,0(a0)
bfc083ac:	00801021 	move	v0,a0
bfc083b0:	10a0000f 	beqz	a1,bfc083f0 <core_list_reverse+0xa0>
bfc083b4:	ac830000 	sw	v1,0(a0)
bfc083b8:	8ca30000 	lw	v1,0(a1)
bfc083bc:	00a01021 	move	v0,a1
bfc083c0:	1060000b 	beqz	v1,bfc083f0 <core_list_reverse+0xa0>
bfc083c4:	aca40000 	sw	a0,0(a1)
bfc083c8:	00601021 	move	v0,v1
bfc083cc:	8c630000 	lw	v1,0(v1)
bfc083d0:	00402021 	move	a0,v0
bfc083d4:	10600006 	beqz	v1,bfc083f0 <core_list_reverse+0xa0>
bfc083d8:	ac450000 	sw	a1,0(v0)
bfc083dc:	00601021 	move	v0,v1
bfc083e0:	8c430000 	lw	v1,0(v0)
bfc083e4:	00000000 	nop
bfc083e8:	1460ffdf 	bnez	v1,bfc08368 <core_list_reverse+0x18>
bfc083ec:	ac440000 	sw	a0,0(v0)
bfc083f0:	03e00008 	jr	ra
bfc083f4:	00000000 	nop
	...

bfc08400 <core_list_mergesort>:
core_list_mergesort():
bfc08400:	27bdffc8 	addiu	sp,sp,-56
bfc08404:	afb60028 	sw	s6,40(sp)
bfc08408:	0080b021 	move	s6,a0
bfc0840c:	afbe0030 	sw	s8,48(sp)
bfc08410:	afb50024 	sw	s5,36(sp)
bfc08414:	afbf0034 	sw	ra,52(sp)
bfc08418:	afb7002c 	sw	s7,44(sp)
bfc0841c:	afb40020 	sw	s4,32(sp)
bfc08420:	afb3001c 	sw	s3,28(sp)
bfc08424:	afb20018 	sw	s2,24(sp)
bfc08428:	afb10014 	sw	s1,20(sp)
bfc0842c:	afb00010 	sw	s0,16(sp)
bfc08430:	00a0f021 	move	s8,a1
bfc08434:	afa60040 	sw	a2,64(sp)
bfc08438:	12c00090 	beqz	s6,bfc0867c <core_list_mergesort+0x27c>
bfc0843c:	24150001 	li	s5,1
bfc08440:	02c09821 	move	s3,s6
bfc08444:	0000a021 	move	s4,zero
bfc08448:	0000b021 	move	s6,zero
bfc0844c:	0000b821 	move	s7,zero
bfc08450:	8e700000 	lw	s0,0(s3)
bfc08454:	26a2ffff 	addiu	v0,s5,-1
bfc08458:	26f70001 	addiu	s7,s7,1
bfc0845c:	30430007 	andi	v1,v0,0x7
bfc08460:	12000053 	beqz	s0,bfc085b0 <core_list_mergesort+0x1b0>
bfc08464:	24110001 	li	s1,1
bfc08468:	0235202a 	slt	a0,s1,s5
bfc0846c:	10800050 	beqz	a0,bfc085b0 <core_list_mergesort+0x1b0>
bfc08470:	00000000 	nop
bfc08474:	1060002c 	beqz	v1,bfc08528 <core_list_mergesort+0x128>
bfc08478:	00000000 	nop
bfc0847c:	10710023 	beq	v1,s1,bfc0850c <core_list_mergesort+0x10c>
bfc08480:	24050002 	li	a1,2
bfc08484:	1065001d 	beq	v1,a1,bfc084fc <core_list_mergesort+0xfc>
bfc08488:	24060003 	li	a2,3
bfc0848c:	10660017 	beq	v1,a2,bfc084ec <core_list_mergesort+0xec>
bfc08490:	24070004 	li	a3,4
bfc08494:	10670011 	beq	v1,a3,bfc084dc <core_list_mergesort+0xdc>
bfc08498:	24080005 	li	t0,5
bfc0849c:	1068000b 	beq	v1,t0,bfc084cc <core_list_mergesort+0xcc>
bfc084a0:	24090006 	li	t1,6
bfc084a4:	10690005 	beq	v1,t1,bfc084bc <core_list_mergesort+0xbc>
bfc084a8:	00000000 	nop
bfc084ac:	8e100000 	lw	s0,0(s0)
bfc084b0:	00000000 	nop
bfc084b4:	1200003e 	beqz	s0,bfc085b0 <core_list_mergesort+0x1b0>
bfc084b8:	24110002 	li	s1,2
bfc084bc:	8e100000 	lw	s0,0(s0)
bfc084c0:	00000000 	nop
bfc084c4:	1200003a 	beqz	s0,bfc085b0 <core_list_mergesort+0x1b0>
bfc084c8:	26310001 	addiu	s1,s1,1
bfc084cc:	8e100000 	lw	s0,0(s0)
bfc084d0:	00000000 	nop
bfc084d4:	12000036 	beqz	s0,bfc085b0 <core_list_mergesort+0x1b0>
bfc084d8:	26310001 	addiu	s1,s1,1
bfc084dc:	8e100000 	lw	s0,0(s0)
bfc084e0:	00000000 	nop
bfc084e4:	12000032 	beqz	s0,bfc085b0 <core_list_mergesort+0x1b0>
bfc084e8:	26310001 	addiu	s1,s1,1
bfc084ec:	8e100000 	lw	s0,0(s0)
bfc084f0:	00000000 	nop
bfc084f4:	1200002e 	beqz	s0,bfc085b0 <core_list_mergesort+0x1b0>
bfc084f8:	26310001 	addiu	s1,s1,1
bfc084fc:	8e100000 	lw	s0,0(s0)
bfc08500:	00000000 	nop
bfc08504:	1200002a 	beqz	s0,bfc085b0 <core_list_mergesort+0x1b0>
bfc08508:	26310001 	addiu	s1,s1,1
bfc0850c:	8e100000 	lw	s0,0(s0)
bfc08510:	00000000 	nop
bfc08514:	12000026 	beqz	s0,bfc085b0 <core_list_mergesort+0x1b0>
bfc08518:	26310001 	addiu	s1,s1,1
bfc0851c:	0235502a 	slt	t2,s1,s5
bfc08520:	11400023 	beqz	t2,bfc085b0 <core_list_mergesort+0x1b0>
bfc08524:	00000000 	nop
bfc08528:	8e100000 	lw	s0,0(s0)
bfc0852c:	26310001 	addiu	s1,s1,1
bfc08530:	1200001f 	beqz	s0,bfc085b0 <core_list_mergesort+0x1b0>
bfc08534:	02201021 	move	v0,s1
bfc08538:	8e100000 	lw	s0,0(s0)
bfc0853c:	00000000 	nop
bfc08540:	1200001b 	beqz	s0,bfc085b0 <core_list_mergesort+0x1b0>
bfc08544:	26310001 	addiu	s1,s1,1
bfc08548:	8e100000 	lw	s0,0(s0)
bfc0854c:	00000000 	nop
bfc08550:	12000017 	beqz	s0,bfc085b0 <core_list_mergesort+0x1b0>
bfc08554:	24510002 	addiu	s1,v0,2
bfc08558:	8e100000 	lw	s0,0(s0)
bfc0855c:	00000000 	nop
bfc08560:	12000013 	beqz	s0,bfc085b0 <core_list_mergesort+0x1b0>
bfc08564:	24510003 	addiu	s1,v0,3
bfc08568:	8e100000 	lw	s0,0(s0)
bfc0856c:	00000000 	nop
bfc08570:	1200000f 	beqz	s0,bfc085b0 <core_list_mergesort+0x1b0>
bfc08574:	24510004 	addiu	s1,v0,4
bfc08578:	8e100000 	lw	s0,0(s0)
bfc0857c:	00000000 	nop
bfc08580:	1200000b 	beqz	s0,bfc085b0 <core_list_mergesort+0x1b0>
bfc08584:	24510005 	addiu	s1,v0,5
bfc08588:	8e100000 	lw	s0,0(s0)
bfc0858c:	00000000 	nop
bfc08590:	12000007 	beqz	s0,bfc085b0 <core_list_mergesort+0x1b0>
bfc08594:	24510006 	addiu	s1,v0,6
bfc08598:	8e100000 	lw	s0,0(s0)
bfc0859c:	24510007 	addiu	s1,v0,7
bfc085a0:	12000003 	beqz	s0,bfc085b0 <core_list_mergesort+0x1b0>
bfc085a4:	0235102a 	slt	v0,s1,s5
bfc085a8:	1440ffdf 	bnez	v0,bfc08528 <core_list_mergesort+0x128>
bfc085ac:	00000000 	nop
bfc085b0:	12200017 	beqz	s1,bfc08610 <core_list_mergesort+0x210>
bfc085b4:	02a09021 	move	s2,s5
bfc085b8:	12400021 	beqz	s2,bfc08640 <core_list_mergesort+0x240>
bfc085bc:	00000000 	nop
bfc085c0:	1200001f 	beqz	s0,bfc08640 <core_list_mergesort+0x240>
bfc085c4:	00000000 	nop
bfc085c8:	8e640004 	lw	a0,4(s3)
bfc085cc:	8e050004 	lw	a1,4(s0)
bfc085d0:	8fa60040 	lw	a2,64(sp)
bfc085d4:	03c0f809 	jalr	s8
bfc085d8:	00000000 	nop
bfc085dc:	18400018 	blez	v0,bfc08640 <core_list_mergesort+0x240>
bfc085e0:	00000000 	nop
bfc085e4:	8e040000 	lw	a0,0(s0)
bfc085e8:	2652ffff 	addiu	s2,s2,-1
bfc085ec:	02601821 	move	v1,s3
bfc085f0:	02001021 	move	v0,s0
bfc085f4:	1280000e 	beqz	s4,bfc08630 <core_list_mergesort+0x230>
bfc085f8:	00000000 	nop
bfc085fc:	ae820000 	sw	v0,0(s4)
bfc08600:	0040a021 	move	s4,v0
bfc08604:	00609821 	move	s3,v1
bfc08608:	1620ffeb 	bnez	s1,bfc085b8 <core_list_mergesort+0x1b8>
bfc0860c:	00808021 	move	s0,a0
bfc08610:	12400013 	beqz	s2,bfc08660 <core_list_mergesort+0x260>
bfc08614:	00000000 	nop
bfc08618:	12000013 	beqz	s0,bfc08668 <core_list_mergesort+0x268>
bfc0861c:	2652ffff 	addiu	s2,s2,-1
bfc08620:	02601821 	move	v1,s3
bfc08624:	8e040000 	lw	a0,0(s0)
bfc08628:	1680fff4 	bnez	s4,bfc085fc <core_list_mergesort+0x1fc>
bfc0862c:	02001021 	move	v0,s0
bfc08630:	0bf02180 	j	bfc08600 <core_list_mergesort+0x200>
bfc08634:	0040b021 	move	s6,v0
	...
bfc08640:	2631ffff 	addiu	s1,s1,-1
bfc08644:	02002021 	move	a0,s0
bfc08648:	8e630000 	lw	v1,0(s3)
bfc0864c:	0bf0217d 	j	bfc085f4 <core_list_mergesort+0x1f4>
bfc08650:	02601021 	move	v0,s3
	...
bfc08660:	1600ff7b 	bnez	s0,bfc08450 <core_list_mergesort+0x50>
bfc08664:	02009821 	move	s3,s0
bfc08668:	24030001 	li	v1,1
bfc0866c:	12e30004 	beq	s7,v1,bfc08680 <core_list_mergesort+0x280>
bfc08670:	ae800000 	sw	zero,0(s4)
bfc08674:	16c0ff72 	bnez	s6,bfc08440 <core_list_mergesort+0x40>
bfc08678:	0015a840 	sll	s5,s5,0x1
bfc0867c:	aec00000 	sw	zero,0(s6)
bfc08680:	8fbf0034 	lw	ra,52(sp)
bfc08684:	02c01021 	move	v0,s6
bfc08688:	8fbe0030 	lw	s8,48(sp)
bfc0868c:	8fb7002c 	lw	s7,44(sp)
bfc08690:	8fb60028 	lw	s6,40(sp)
bfc08694:	8fb50024 	lw	s5,36(sp)
bfc08698:	8fb40020 	lw	s4,32(sp)
bfc0869c:	8fb3001c 	lw	s3,28(sp)
bfc086a0:	8fb20018 	lw	s2,24(sp)
bfc086a4:	8fb10014 	lw	s1,20(sp)
bfc086a8:	8fb00010 	lw	s0,16(sp)
bfc086ac:	03e00008 	jr	ra
bfc086b0:	27bd0038 	addiu	sp,sp,56
	...

bfc086c0 <calc_func>:
calc_func():
bfc086c0:	27bdffd0 	addiu	sp,sp,-48
bfc086c4:	afb10020 	sw	s1,32(sp)
bfc086c8:	84910000 	lh	s1,0(a0)
bfc086cc:	afb30028 	sw	s3,40(sp)
bfc086d0:	32220080 	andi	v0,s1,0x80
bfc086d4:	afb20024 	sw	s2,36(sp)
bfc086d8:	afbf002c 	sw	ra,44(sp)
bfc086dc:	afb0001c 	sw	s0,28(sp)
bfc086e0:	00809821 	move	s3,a0
bfc086e4:	14400036 	bnez	v0,bfc087c0 <calc_func+0x100>
bfc086e8:	00a09021 	move	s2,a1
bfc086ec:	001120c3 	sra	a0,s1,0x3
bfc086f0:	3086000f 	andi	a2,a0,0xf
bfc086f4:	00061900 	sll	v1,a2,0x4
bfc086f8:	32240007 	andi	a0,s1,0x7
bfc086fc:	14800028 	bnez	a0,bfc087a0 <calc_func+0xe0>
bfc08700:	00662825 	or	a1,v1,a2
bfc08704:	28a80022 	slti	t0,a1,34
bfc08708:	11000002 	beqz	t0,bfc08714 <calc_func+0x54>
bfc0870c:	00a01821 	move	v1,a1
bfc08710:	24030022 	li	v1,34
bfc08714:	8e450014 	lw	a1,20(s2)
bfc08718:	8e440018 	lw	a0,24(s2)
bfc0871c:	86460000 	lh	a2,0(s2)
bfc08720:	86470002 	lh	a3,2(s2)
bfc08724:	96490038 	lhu	t1,56(s2)
bfc08728:	afa30010 	sw	v1,16(sp)
bfc0872c:	0ff01e28 	jal	bfc078a0 <core_bench_state>
bfc08730:	afa90014 	sw	t1,20(sp)
bfc08734:	9645003e 	lhu	a1,62(s2)
bfc08738:	00028400 	sll	s0,v0,0x10
bfc0873c:	14a00002 	bnez	a1,bfc08748 <calc_func+0x88>
bfc08740:	00108403 	sra	s0,s0,0x10
bfc08744:	a642003e 	sh	v0,62(s2)
bfc08748:	3210ffff 	andi	s0,s0,0xffff
bfc0874c:	96450038 	lhu	a1,56(s2)
bfc08750:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc08754:	02002021 	move	a0,s0
bfc08758:	240fff00 	li	t7,-256
bfc0875c:	022f7024 	and	t6,s1,t7
bfc08760:	3210007f 	andi	s0,s0,0x7f
bfc08764:	35cd0080 	ori	t5,t6,0x80
bfc08768:	8fbf002c 	lw	ra,44(sp)
bfc0876c:	020d6025 	or	t4,s0,t5
bfc08770:	a6420038 	sh	v0,56(s2)
bfc08774:	8fb10020 	lw	s1,32(sp)
bfc08778:	02001021 	move	v0,s0
bfc0877c:	a66c0000 	sh	t4,0(s3)
bfc08780:	8fb20024 	lw	s2,36(sp)
bfc08784:	8fb30028 	lw	s3,40(sp)
bfc08788:	8fb0001c 	lw	s0,28(sp)
bfc0878c:	03e00008 	jr	ra
bfc08790:	27bd0030 	addiu	sp,sp,48
	...
bfc087a0:	24070001 	li	a3,1
bfc087a4:	10870012 	beq	a0,a3,bfc087f0 <calc_func+0x130>
bfc087a8:	02208021 	move	s0,s1
bfc087ac:	0bf021d3 	j	bfc0874c <calc_func+0x8c>
bfc087b0:	3210ffff 	andi	s0,s0,0xffff
	...
bfc087c0:	8fbf002c 	lw	ra,44(sp)
bfc087c4:	3230007f 	andi	s0,s1,0x7f
bfc087c8:	02001021 	move	v0,s0
bfc087cc:	8fb30028 	lw	s3,40(sp)
bfc087d0:	8fb20024 	lw	s2,36(sp)
bfc087d4:	8fb10020 	lw	s1,32(sp)
bfc087d8:	8fb0001c 	lw	s0,28(sp)
bfc087dc:	03e00008 	jr	ra
bfc087e0:	27bd0030 	addiu	sp,sp,48
	...
bfc087f0:	96460038 	lhu	a2,56(s2)
bfc087f4:	0ff00ff4 	jal	bfc03fd0 <core_bench_matrix>
bfc087f8:	26440028 	addiu	a0,s2,40
bfc087fc:	964a003c 	lhu	t2,60(s2)
bfc08800:	00025c00 	sll	t3,v0,0x10
bfc08804:	1540ffd0 	bnez	t2,bfc08748 <calc_func+0x88>
bfc08808:	000b8403 	sra	s0,t3,0x10
bfc0880c:	0bf021d2 	j	bfc08748 <calc_func+0x88>
bfc08810:	a642003c 	sh	v0,60(s2)
	...

bfc08820 <core_list_init>:
core_list_init():
bfc08820:	24090014 	li	t1,20
bfc08824:	15200002 	bnez	t1,bfc08830 <core_list_init+0x10>
bfc08828:	0089001b 	divu	zero,a0,t1
bfc0882c:	0007000d 	break	0x7
bfc08830:	27bdffc8 	addiu	sp,sp,-56
bfc08834:	afb10014 	sw	s1,20(sp)
bfc08838:	24a90010 	addiu	t1,a1,16
bfc0883c:	00063400 	sll	a2,a2,0x10
bfc08840:	24028080 	li	v0,-32640
bfc08844:	afb00010 	sw	s0,16(sp)
bfc08848:	afbf0034 	sw	ra,52(sp)
bfc0884c:	afbe0030 	sw	s8,48(sp)
bfc08850:	afb7002c 	sw	s7,44(sp)
bfc08854:	afb60028 	sw	s6,40(sp)
bfc08858:	afb50024 	sw	s5,36(sp)
bfc0885c:	afb40020 	sw	s4,32(sp)
bfc08860:	afb3001c 	sw	s3,28(sp)
bfc08864:	afb20018 	sw	s2,24(sp)
bfc08868:	00063403 	sra	a2,a2,0x10
bfc0886c:	aca00000 	sw	zero,0(a1)
bfc08870:	24ab0008 	addiu	t3,a1,8
bfc08874:	00004012 	mflo	t0
bfc08878:	2511fffe 	addiu	s1,t0,-2
bfc0887c:	001138c0 	sll	a3,s1,0x3
bfc08880:	00a76821 	addu	t5,a1,a3
bfc08884:	00111880 	sll	v1,s1,0x2
bfc08888:	012d202b 	sltu	a0,t1,t5
bfc0888c:	a5a20000 	sh	v0,0(t5)
bfc08890:	01a38021 	addu	s0,t5,v1
bfc08894:	acad0004 	sw	t5,4(a1)
bfc08898:	a5a00002 	sh	zero,2(t5)
bfc0889c:	10800188 	beqz	a0,bfc08ec0 <core_list_init+0x6a0>
bfc088a0:	25aa0004 	addiu	t2,t5,4
bfc088a4:	25a70008 	addiu	a3,t5,8
bfc088a8:	00f0602b 	sltu	t4,a3,s0
bfc088ac:	11800184 	beqz	t4,bfc08ec0 <core_list_init+0x6a0>
bfc088b0:	240f7fff 	li	t7,32767
bfc088b4:	240effff 	li	t6,-1
bfc088b8:	ad600000 	sw	zero,0(t3)
bfc088bc:	01604021 	move	t0,t3
bfc088c0:	a54f0002 	sh	t7,2(t2)
bfc088c4:	a5ae0004 	sh	t6,4(t5)
bfc088c8:	ad6a0004 	sw	t2,4(t3)
bfc088cc:	acab0000 	sw	t3,0(a1)
bfc088d0:	122000c4 	beqz	s1,bfc08be4 <core_list_init+0x3c4>
bfc088d4:	262affff 	addiu	t2,s1,-1
bfc088d8:	31440003 	andi	a0,t2,0x3
bfc088dc:	30cfffff 	andi	t7,a2,0xffff
bfc088e0:	00006021 	move	t4,zero
bfc088e4:	10800077 	beqz	a0,bfc08ac4 <core_list_init+0x2a4>
bfc088e8:	24127fff 	li	s2,32767
bfc088ec:	252b0008 	addiu	t3,t1,8
bfc088f0:	016da02b 	sltu	s4,t3,t5
bfc088f4:	1680007a 	bnez	s4,bfc08ae0 <core_list_init+0x2c0>
bfc088f8:	24ea0004 	addiu	t2,a3,4
bfc088fc:	01205821 	move	t3,t1
bfc08900:	00e05021 	move	t2,a3
bfc08904:	240c0001 	li	t4,1
bfc08908:	01604821 	move	t1,t3
bfc0890c:	108c006d 	beq	a0,t4,bfc08ac4 <core_list_init+0x2a4>
bfc08910:	01403821 	move	a3,t2
bfc08914:	241e0002 	li	s8,2
bfc08918:	109e000a 	beq	a0,s8,bfc08944 <core_list_init+0x124>
bfc0891c:	00000000 	nop
bfc08920:	25670008 	addiu	a3,t3,8
bfc08924:	00edf82b 	sltu	ra,a3,t5
bfc08928:	17e0007d 	bnez	ra,bfc08b20 <core_list_init+0x300>
bfc0892c:	254e0004 	addiu	t6,t2,4
bfc08930:	01603821 	move	a3,t3
bfc08934:	01407021 	move	t6,t2
bfc08938:	00e04821 	move	t1,a3
bfc0893c:	258c0001 	addiu	t4,t4,1
bfc08940:	01c03821 	move	a3,t6
bfc08944:	252a0008 	addiu	t2,t1,8
bfc08948:	014d582b 	sltu	t3,t2,t5
bfc0894c:	15600088 	bnez	t3,bfc08b70 <core_list_init+0x350>
bfc08950:	24eb0004 	addiu	t3,a3,4
bfc08954:	01205021 	move	t2,t1
bfc08958:	00e05821 	move	t3,a3
bfc0895c:	258c0001 	addiu	t4,t4,1
bfc08960:	01404821 	move	t1,t2
bfc08964:	0bf022b1 	j	bfc08ac4 <core_list_init+0x2a4>
bfc08968:	01603821 	move	a3,t3
bfc0896c:	24ea0004 	addiu	t2,a3,4
bfc08970:	0150a02b 	sltu	s4,t2,s0
bfc08974:	12800057 	beqz	s4,bfc08ad4 <core_list_init+0x2b4>
bfc08978:	319effff 	andi	s8,t4,0xffff
bfc0897c:	03cf2026 	xor	a0,s8,t7
bfc08980:	309f000f 	andi	ra,a0,0xf
bfc08984:	001fc0c0 	sll	t8,ra,0x3
bfc08988:	33d90007 	andi	t9,s8,0x7
bfc0898c:	0319b825 	or	s7,t8,t9
bfc08990:	0017b200 	sll	s6,s7,0x8
bfc08994:	02d7a825 	or	s5,s6,s7
bfc08998:	ad280000 	sw	t0,0(t1)
bfc0899c:	a4f50000 	sh	s5,0(a3)
bfc089a0:	01204021 	move	t0,t1
bfc089a4:	a4f20002 	sh	s2,2(a3)
bfc089a8:	aca90000 	sw	t1,0(a1)
bfc089ac:	ad270004 	sw	a3,4(t1)
bfc089b0:	258e0001 	addiu	t6,t4,1
bfc089b4:	01d1182b 	sltu	v1,t6,s1
bfc089b8:	1060008a 	beqz	v1,bfc08be4 <core_list_init+0x3c4>
bfc089bc:	256c0008 	addiu	t4,t3,8
bfc089c0:	018d102b 	sltu	v0,t4,t5
bfc089c4:	10400084 	beqz	v0,bfc08bd8 <core_list_init+0x3b8>
bfc089c8:	00000000 	nop
bfc089cc:	25470004 	addiu	a3,t2,4
bfc089d0:	00f0482b 	sltu	t1,a3,s0
bfc089d4:	11200080 	beqz	t1,bfc08bd8 <core_list_init+0x3b8>
bfc089d8:	31d9ffff 	andi	t9,t6,0xffff
bfc089dc:	032ff826 	xor	ra,t9,t7
bfc089e0:	33fe000f 	andi	s8,ra,0xf
bfc089e4:	001eb8c0 	sll	s7,s8,0x3
bfc089e8:	33380007 	andi	t8,t9,0x7
bfc089ec:	02f8b025 	or	s6,s7,t8
bfc089f0:	0016aa00 	sll	s5,s6,0x8
bfc089f4:	02b6a025 	or	s4,s5,s6
bfc089f8:	ad680000 	sw	t0,0(t3)
bfc089fc:	a5540000 	sh	s4,0(t2)
bfc08a00:	01604021 	move	t0,t3
bfc08a04:	a5520002 	sh	s2,2(t2)
bfc08a08:	acab0000 	sw	t3,0(a1)
bfc08a0c:	ad6a0004 	sw	t2,4(t3)
bfc08a10:	258a0008 	addiu	t2,t4,8
bfc08a14:	014d582b 	sltu	t3,t2,t5
bfc08a18:	1160006c 	beqz	t3,bfc08bcc <core_list_init+0x3ac>
bfc08a1c:	25c30001 	addiu	v1,t6,1
bfc08a20:	24e90004 	addiu	t1,a3,4
bfc08a24:	0130202b 	sltu	a0,t1,s0
bfc08a28:	10800068 	beqz	a0,bfc08bcc <core_list_init+0x3ac>
bfc08a2c:	3076ffff 	andi	s6,v1,0xffff
bfc08a30:	02cfc026 	xor	t8,s6,t7
bfc08a34:	3317000f 	andi	s7,t8,0xf
bfc08a38:	0017a0c0 	sll	s4,s7,0x3
bfc08a3c:	32d50007 	andi	s5,s6,0x7
bfc08a40:	02951825 	or	v1,s4,s5
bfc08a44:	00039a00 	sll	s3,v1,0x8
bfc08a48:	02631025 	or	v0,s3,v1
bfc08a4c:	ad880000 	sw	t0,0(t4)
bfc08a50:	a4e20000 	sh	v0,0(a3)
bfc08a54:	01804021 	move	t0,t4
bfc08a58:	a4f20002 	sh	s2,2(a3)
bfc08a5c:	acac0000 	sw	t4,0(a1)
bfc08a60:	ad870004 	sw	a3,4(t4)
bfc08a64:	25470008 	addiu	a3,t2,8
bfc08a68:	00ed602b 	sltu	t4,a3,t5
bfc08a6c:	11800054 	beqz	t4,bfc08bc0 <core_list_init+0x3a0>
bfc08a70:	25c30002 	addiu	v1,t6,2
bfc08a74:	252b0004 	addiu	t3,t1,4
bfc08a78:	0170c82b 	sltu	t9,t3,s0
bfc08a7c:	13200050 	beqz	t9,bfc08bc0 <core_list_init+0x3a0>
bfc08a80:	3074ffff 	andi	s4,v1,0xffff
bfc08a84:	028fa826 	xor	s5,s4,t7
bfc08a88:	32a3000f 	andi	v1,s5,0xf
bfc08a8c:	000398c0 	sll	s3,v1,0x3
bfc08a90:	32820007 	andi	v0,s4,0x7
bfc08a94:	02622025 	or	a0,s3,v0
bfc08a98:	0004fa00 	sll	ra,a0,0x8
bfc08a9c:	03e4f025 	or	s8,ra,a0
bfc08aa0:	ad480000 	sw	t0,0(t2)
bfc08aa4:	a53e0000 	sh	s8,0(t1)
bfc08aa8:	01404021 	move	t0,t2
bfc08aac:	a5320002 	sh	s2,2(t1)
bfc08ab0:	acaa0000 	sw	t2,0(a1)
bfc08ab4:	ad490004 	sw	t1,4(t2)
bfc08ab8:	00e04821 	move	t1,a3
bfc08abc:	25cc0003 	addiu	t4,t6,3
bfc08ac0:	01603821 	move	a3,t3
bfc08ac4:	252b0008 	addiu	t3,t1,8
bfc08ac8:	016d982b 	sltu	s3,t3,t5
bfc08acc:	1660ffa7 	bnez	s3,bfc0896c <core_list_init+0x14c>
bfc08ad0:	00000000 	nop
bfc08ad4:	01205821 	move	t3,t1
bfc08ad8:	0bf0226c 	j	bfc089b0 <core_list_init+0x190>
bfc08adc:	00e05021 	move	t2,a3
bfc08ae0:	0150a82b 	sltu	s5,t2,s0
bfc08ae4:	12a0ff85 	beqz	s5,bfc088fc <core_list_init+0xdc>
bfc08ae8:	31f9000f 	andi	t9,t7,0xf
bfc08aec:	0019c0c0 	sll	t8,t9,0x3
bfc08af0:	0018ba00 	sll	s7,t8,0x8
bfc08af4:	02f8b025 	or	s6,s7,t8
bfc08af8:	ad280000 	sw	t0,0(t1)
bfc08afc:	a4f60000 	sh	s6,0(a3)
bfc08b00:	01204021 	move	t0,t1
bfc08b04:	a4f20002 	sh	s2,2(a3)
bfc08b08:	aca90000 	sw	t1,0(a1)
bfc08b0c:	0bf02241 	j	bfc08904 <core_list_init+0xe4>
bfc08b10:	ad270004 	sw	a3,4(t1)
	...
bfc08b20:	01d0202b 	sltu	a0,t6,s0
bfc08b24:	1080ff82 	beqz	a0,bfc08930 <core_list_init+0x110>
bfc08b28:	3195ffff 	andi	s5,t4,0xffff
bfc08b2c:	02afb826 	xor	s7,s5,t7
bfc08b30:	32f6000f 	andi	s6,s7,0xf
bfc08b34:	001698c0 	sll	s3,s6,0x3
bfc08b38:	32b40007 	andi	s4,s5,0x7
bfc08b3c:	02741825 	or	v1,s3,s4
bfc08b40:	00034a00 	sll	t1,v1,0x8
bfc08b44:	01231025 	or	v0,t1,v1
bfc08b48:	ad680000 	sw	t0,0(t3)
bfc08b4c:	a5420000 	sh	v0,0(t2)
bfc08b50:	01604021 	move	t0,t3
bfc08b54:	a5520002 	sh	s2,2(t2)
bfc08b58:	acab0000 	sw	t3,0(a1)
bfc08b5c:	0bf0224e 	j	bfc08938 <core_list_init+0x118>
bfc08b60:	ad6a0004 	sw	t2,4(t3)
	...
bfc08b70:	0170702b 	sltu	t6,t3,s0
bfc08b74:	11c0ff77 	beqz	t6,bfc08954 <core_list_init+0x134>
bfc08b78:	3182ffff 	andi	v0,t4,0xffff
bfc08b7c:	004f9826 	xor	s3,v0,t7
bfc08b80:	3263000f 	andi	v1,s3,0xf
bfc08b84:	0003f8c0 	sll	ra,v1,0x3
bfc08b88:	30440007 	andi	a0,v0,0x7
bfc08b8c:	03e4f025 	or	s8,ra,a0
bfc08b90:	001eca00 	sll	t9,s8,0x8
bfc08b94:	033ec025 	or	t8,t9,s8
bfc08b98:	ad280000 	sw	t0,0(t1)
bfc08b9c:	a4f80000 	sh	t8,0(a3)
bfc08ba0:	01204021 	move	t0,t1
bfc08ba4:	a4f20002 	sh	s2,2(a3)
bfc08ba8:	aca90000 	sw	t1,0(a1)
bfc08bac:	0bf02257 	j	bfc0895c <core_list_init+0x13c>
bfc08bb0:	ad270004 	sw	a3,4(t1)
	...
bfc08bc0:	01403821 	move	a3,t2
bfc08bc4:	0bf022ae 	j	bfc08ab8 <core_list_init+0x298>
bfc08bc8:	01205821 	move	t3,t1
bfc08bcc:	01805021 	move	t2,t4
bfc08bd0:	0bf02299 	j	bfc08a64 <core_list_init+0x244>
bfc08bd4:	00e04821 	move	t1,a3
bfc08bd8:	01606021 	move	t4,t3
bfc08bdc:	0bf02284 	j	bfc08a10 <core_list_init+0x1f0>
bfc08be0:	01403821 	move	a3,t2
bfc08be4:	240b0005 	li	t3,5
bfc08be8:	15600002 	bnez	t3,bfc08bf4 <core_list_init+0x3d4>
bfc08bec:	022b001b 	divu	zero,s1,t3
bfc08bf0:	0007000d 	break	0x7
bfc08bf4:	24090002 	li	t1,2
bfc08bf8:	00002012 	mflo	a0
bfc08bfc:	0bf02307 	j	bfc08c1c <core_list_init+0x3fc>
bfc08c00:	24070001 	li	a3,1
bfc08c04:	8d0d0004 	lw	t5,4(t0)
bfc08c08:	00000000 	nop
bfc08c0c:	a5a70002 	sh	a3,2(t5)
bfc08c10:	25290001 	addiu	t1,t1,1
bfc08c14:	24e70001 	addiu	a3,a3,1
bfc08c18:	00604021 	move	t0,v1
bfc08c1c:	312e0007 	andi	t6,t1,0x7
bfc08c20:	000e9200 	sll	s2,t6,0x8
bfc08c24:	00c76026 	xor	t4,a2,a3
bfc08c28:	8d030000 	lw	v1,0(t0)
bfc08c2c:	024c8825 	or	s1,s2,t4
bfc08c30:	322a3fff 	andi	t2,s1,0x3fff
bfc08c34:	10600006 	beqz	v1,bfc08c50 <core_list_init+0x430>
bfc08c38:	00e4102b 	sltu	v0,a3,a0
bfc08c3c:	1440fff1 	bnez	v0,bfc08c04 <core_list_init+0x3e4>
bfc08c40:	00000000 	nop
bfc08c44:	8d100004 	lw	s0,4(t0)
bfc08c48:	0bf02304 	j	bfc08c10 <core_list_init+0x3f0>
bfc08c4c:	a60a0002 	sh	t2,2(s0)
bfc08c50:	24150001 	li	s5,1
bfc08c54:	10a0008b 	beqz	a1,bfc08e84 <core_list_init+0x664>
bfc08c58:	241e0001 	li	s8,1
bfc08c5c:	00a08821 	move	s1,a1
bfc08c60:	0000b821 	move	s7,zero
bfc08c64:	0000a021 	move	s4,zero
bfc08c68:	0000b021 	move	s6,zero
bfc08c6c:	8e300000 	lw	s0,0(s1)
bfc08c70:	26a5ffff 	addiu	a1,s5,-1
bfc08c74:	26f70001 	addiu	s7,s7,1
bfc08c78:	30a30007 	andi	v1,a1,0x7
bfc08c7c:	12000053 	beqz	s0,bfc08dcc <core_list_init+0x5ac>
bfc08c80:	24120001 	li	s2,1
bfc08c84:	0255382a 	slt	a3,s2,s5
bfc08c88:	10e00050 	beqz	a3,bfc08dcc <core_list_init+0x5ac>
bfc08c8c:	00000000 	nop
bfc08c90:	1060002c 	beqz	v1,bfc08d44 <core_list_init+0x524>
bfc08c94:	00000000 	nop
bfc08c98:	10720023 	beq	v1,s2,bfc08d28 <core_list_init+0x508>
bfc08c9c:	24080002 	li	t0,2
bfc08ca0:	1068001d 	beq	v1,t0,bfc08d18 <core_list_init+0x4f8>
bfc08ca4:	24060003 	li	a2,3
bfc08ca8:	10660017 	beq	v1,a2,bfc08d08 <core_list_init+0x4e8>
bfc08cac:	24090004 	li	t1,4
bfc08cb0:	10690011 	beq	v1,t1,bfc08cf8 <core_list_init+0x4d8>
bfc08cb4:	240f0005 	li	t7,5
bfc08cb8:	106f000b 	beq	v1,t7,bfc08ce8 <core_list_init+0x4c8>
bfc08cbc:	240a0006 	li	t2,6
bfc08cc0:	106a0005 	beq	v1,t2,bfc08cd8 <core_list_init+0x4b8>
bfc08cc4:	00000000 	nop
bfc08cc8:	8e100000 	lw	s0,0(s0)
bfc08ccc:	00000000 	nop
bfc08cd0:	1200003e 	beqz	s0,bfc08dcc <core_list_init+0x5ac>
bfc08cd4:	24120002 	li	s2,2
bfc08cd8:	8e100000 	lw	s0,0(s0)
bfc08cdc:	00000000 	nop
bfc08ce0:	1200003a 	beqz	s0,bfc08dcc <core_list_init+0x5ac>
bfc08ce4:	26520001 	addiu	s2,s2,1
bfc08ce8:	8e100000 	lw	s0,0(s0)
bfc08cec:	00000000 	nop
bfc08cf0:	12000036 	beqz	s0,bfc08dcc <core_list_init+0x5ac>
bfc08cf4:	26520001 	addiu	s2,s2,1
bfc08cf8:	8e100000 	lw	s0,0(s0)
bfc08cfc:	00000000 	nop
bfc08d00:	12000032 	beqz	s0,bfc08dcc <core_list_init+0x5ac>
bfc08d04:	26520001 	addiu	s2,s2,1
bfc08d08:	8e100000 	lw	s0,0(s0)
bfc08d0c:	00000000 	nop
bfc08d10:	1200002e 	beqz	s0,bfc08dcc <core_list_init+0x5ac>
bfc08d14:	26520001 	addiu	s2,s2,1
bfc08d18:	8e100000 	lw	s0,0(s0)
bfc08d1c:	00000000 	nop
bfc08d20:	1200002a 	beqz	s0,bfc08dcc <core_list_init+0x5ac>
bfc08d24:	26520001 	addiu	s2,s2,1
bfc08d28:	8e100000 	lw	s0,0(s0)
bfc08d2c:	00000000 	nop
bfc08d30:	12000026 	beqz	s0,bfc08dcc <core_list_init+0x5ac>
bfc08d34:	26520001 	addiu	s2,s2,1
bfc08d38:	0255982a 	slt	s3,s2,s5
bfc08d3c:	12600023 	beqz	s3,bfc08dcc <core_list_init+0x5ac>
bfc08d40:	00000000 	nop
bfc08d44:	8e100000 	lw	s0,0(s0)
bfc08d48:	26520001 	addiu	s2,s2,1
bfc08d4c:	1200001f 	beqz	s0,bfc08dcc <core_list_init+0x5ac>
bfc08d50:	02401021 	move	v0,s2
bfc08d54:	8e100000 	lw	s0,0(s0)
bfc08d58:	00000000 	nop
bfc08d5c:	1200001b 	beqz	s0,bfc08dcc <core_list_init+0x5ac>
bfc08d60:	26520001 	addiu	s2,s2,1
bfc08d64:	8e100000 	lw	s0,0(s0)
bfc08d68:	00000000 	nop
bfc08d6c:	12000017 	beqz	s0,bfc08dcc <core_list_init+0x5ac>
bfc08d70:	24520002 	addiu	s2,v0,2
bfc08d74:	8e100000 	lw	s0,0(s0)
bfc08d78:	00000000 	nop
bfc08d7c:	12000013 	beqz	s0,bfc08dcc <core_list_init+0x5ac>
bfc08d80:	24520003 	addiu	s2,v0,3
bfc08d84:	8e100000 	lw	s0,0(s0)
bfc08d88:	00000000 	nop
bfc08d8c:	1200000f 	beqz	s0,bfc08dcc <core_list_init+0x5ac>
bfc08d90:	24520004 	addiu	s2,v0,4
bfc08d94:	8e100000 	lw	s0,0(s0)
bfc08d98:	00000000 	nop
bfc08d9c:	1200000b 	beqz	s0,bfc08dcc <core_list_init+0x5ac>
bfc08da0:	24520005 	addiu	s2,v0,5
bfc08da4:	8e100000 	lw	s0,0(s0)
bfc08da8:	00000000 	nop
bfc08dac:	12000007 	beqz	s0,bfc08dcc <core_list_init+0x5ac>
bfc08db0:	24520006 	addiu	s2,v0,6
bfc08db4:	8e100000 	lw	s0,0(s0)
bfc08db8:	24520007 	addiu	s2,v0,7
bfc08dbc:	12000003 	beqz	s0,bfc08dcc <core_list_init+0x5ac>
bfc08dc0:	0255102a 	slt	v0,s2,s5
bfc08dc4:	1440ffdf 	bnez	v0,bfc08d44 <core_list_init+0x524>
bfc08dc8:	00000000 	nop
bfc08dcc:	12400016 	beqz	s2,bfc08e28 <core_list_init+0x608>
bfc08dd0:	02a09821 	move	s3,s5
bfc08dd4:	1260001e 	beqz	s3,bfc08e50 <core_list_init+0x630>
bfc08dd8:	00000000 	nop
bfc08ddc:	1200001c 	beqz	s0,bfc08e50 <core_list_init+0x630>
bfc08de0:	00000000 	nop
bfc08de4:	8e240004 	lw	a0,4(s1)
bfc08de8:	8e050004 	lw	a1,4(s0)
bfc08dec:	0ff0204c 	jal	bfc08130 <cmp_idx>
bfc08df0:	00003021 	move	a2,zero
bfc08df4:	18400016 	blez	v0,bfc08e50 <core_list_init+0x630>
bfc08df8:	00000000 	nop
bfc08dfc:	8e020000 	lw	v0,0(s0)
bfc08e00:	02201821 	move	v1,s1
bfc08e04:	2673ffff 	addiu	s3,s3,-1
bfc08e08:	02008821 	move	s1,s0
bfc08e0c:	1280000e 	beqz	s4,bfc08e48 <core_list_init+0x628>
bfc08e10:	00000000 	nop
bfc08e14:	ae910000 	sw	s1,0(s4)
bfc08e18:	0220a021 	move	s4,s1
bfc08e1c:	00408021 	move	s0,v0
bfc08e20:	1640ffec 	bnez	s2,bfc08dd4 <core_list_init+0x5b4>
bfc08e24:	00608821 	move	s1,v1
bfc08e28:	1260000d 	beqz	s3,bfc08e60 <core_list_init+0x640>
bfc08e2c:	00000000 	nop
bfc08e30:	1200000f 	beqz	s0,bfc08e70 <core_list_init+0x650>
bfc08e34:	02201821 	move	v1,s1
bfc08e38:	2673ffff 	addiu	s3,s3,-1
bfc08e3c:	8e020000 	lw	v0,0(s0)
bfc08e40:	1680fff4 	bnez	s4,bfc08e14 <core_list_init+0x5f4>
bfc08e44:	02008821 	move	s1,s0
bfc08e48:	0bf02386 	j	bfc08e18 <core_list_init+0x5f8>
bfc08e4c:	0220b021 	move	s6,s1
bfc08e50:	2652ffff 	addiu	s2,s2,-1
bfc08e54:	8e230000 	lw	v1,0(s1)
bfc08e58:	0bf02383 	j	bfc08e0c <core_list_init+0x5ec>
bfc08e5c:	02001021 	move	v0,s0
bfc08e60:	1600ff82 	bnez	s0,bfc08c6c <core_list_init+0x44c>
bfc08e64:	02008821 	move	s1,s0
	...
bfc08e70:	12fe0006 	beq	s7,s8,bfc08e8c <core_list_init+0x66c>
bfc08e74:	ae800000 	sw	zero,0(s4)
bfc08e78:	02c02821 	move	a1,s6
bfc08e7c:	14a0ff77 	bnez	a1,bfc08c5c <core_list_init+0x43c>
bfc08e80:	0015a840 	sll	s5,s5,0x1
bfc08e84:	aca00000 	sw	zero,0(a1)
bfc08e88:	0000b021 	move	s6,zero
bfc08e8c:	8fbf0034 	lw	ra,52(sp)
bfc08e90:	02c01021 	move	v0,s6
bfc08e94:	8fbe0030 	lw	s8,48(sp)
bfc08e98:	8fb7002c 	lw	s7,44(sp)
bfc08e9c:	8fb60028 	lw	s6,40(sp)
bfc08ea0:	8fb50024 	lw	s5,36(sp)
bfc08ea4:	8fb40020 	lw	s4,32(sp)
bfc08ea8:	8fb3001c 	lw	s3,28(sp)
bfc08eac:	8fb20018 	lw	s2,24(sp)
bfc08eb0:	8fb10014 	lw	s1,20(sp)
bfc08eb4:	8fb00010 	lw	s0,16(sp)
bfc08eb8:	03e00008 	jr	ra
bfc08ebc:	27bd0038 	addiu	sp,sp,56
bfc08ec0:	8ca80000 	lw	t0,0(a1)
bfc08ec4:	01604821 	move	t1,t3
bfc08ec8:	0bf02234 	j	bfc088d0 <core_list_init+0xb0>
bfc08ecc:	01403821 	move	a3,t2

bfc08ed0 <cmp_complex>:
cmp_complex():
bfc08ed0:	27bdffc8 	addiu	sp,sp,-56
bfc08ed4:	afb10020 	sw	s1,32(sp)
bfc08ed8:	84910000 	lh	s1,0(a0)
bfc08edc:	afb50030 	sw	s5,48(sp)
bfc08ee0:	32220080 	andi	v0,s1,0x80
bfc08ee4:	afb4002c 	sw	s4,44(sp)
bfc08ee8:	afb20024 	sw	s2,36(sp)
bfc08eec:	afbf0034 	sw	ra,52(sp)
bfc08ef0:	afb30028 	sw	s3,40(sp)
bfc08ef4:	afb0001c 	sw	s0,28(sp)
bfc08ef8:	0080a021 	move	s4,a0
bfc08efc:	00a0a821 	move	s5,a1
bfc08f00:	1440003b 	bnez	v0,bfc08ff0 <cmp_complex+0x120>
bfc08f04:	00c09021 	move	s2,a2
bfc08f08:	001120c3 	sra	a0,s1,0x3
bfc08f0c:	3086000f 	andi	a2,a0,0xf
bfc08f10:	00061900 	sll	v1,a2,0x4
bfc08f14:	32240007 	andi	a0,s1,0x7
bfc08f18:	1480002d 	bnez	a0,bfc08fd0 <cmp_complex+0x100>
bfc08f1c:	00662825 	or	a1,v1,a2
bfc08f20:	28a80022 	slti	t0,a1,34
bfc08f24:	11000002 	beqz	t0,bfc08f30 <cmp_complex+0x60>
bfc08f28:	00a01821 	move	v1,a1
bfc08f2c:	24030022 	li	v1,34
bfc08f30:	8e450014 	lw	a1,20(s2)
bfc08f34:	8e440018 	lw	a0,24(s2)
bfc08f38:	86460000 	lh	a2,0(s2)
bfc08f3c:	86470002 	lh	a3,2(s2)
bfc08f40:	96490038 	lhu	t1,56(s2)
bfc08f44:	afa30010 	sw	v1,16(sp)
bfc08f48:	0ff01e28 	jal	bfc078a0 <core_bench_state>
bfc08f4c:	afa90014 	sw	t1,20(sp)
bfc08f50:	9645003e 	lhu	a1,62(s2)
bfc08f54:	00028400 	sll	s0,v0,0x10
bfc08f58:	14a00002 	bnez	a1,bfc08f64 <cmp_complex+0x94>
bfc08f5c:	00108403 	sra	s0,s0,0x10
bfc08f60:	a642003e 	sh	v0,62(s2)
bfc08f64:	3210ffff 	andi	s0,s0,0xffff
bfc08f68:	96450038 	lhu	a1,56(s2)
bfc08f6c:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc08f70:	02002021 	move	a0,s0
bfc08f74:	240fff00 	li	t7,-256
bfc08f78:	022f7024 	and	t6,s1,t7
bfc08f7c:	3213007f 	andi	s3,s0,0x7f
bfc08f80:	35cd0080 	ori	t5,t6,0x80
bfc08f84:	026d6025 	or	t4,s3,t5
bfc08f88:	a6420038 	sh	v0,56(s2)
bfc08f8c:	a68c0000 	sh	t4,0(s4)
bfc08f90:	86b10000 	lh	s1,0(s5)
bfc08f94:	00000000 	nop
bfc08f98:	32340080 	andi	s4,s1,0x80
bfc08f9c:	1280001a 	beqz	s4,bfc09008 <cmp_complex+0x138>
bfc08fa0:	0011f8c3 	sra	ra,s1,0x3
bfc08fa4:	3230007f 	andi	s0,s1,0x7f
bfc08fa8:	8fbf0034 	lw	ra,52(sp)
bfc08fac:	02701023 	subu	v0,s3,s0
bfc08fb0:	8fb50030 	lw	s5,48(sp)
bfc08fb4:	8fb4002c 	lw	s4,44(sp)
bfc08fb8:	8fb30028 	lw	s3,40(sp)
bfc08fbc:	8fb20024 	lw	s2,36(sp)
bfc08fc0:	8fb10020 	lw	s1,32(sp)
bfc08fc4:	8fb0001c 	lw	s0,28(sp)
bfc08fc8:	03e00008 	jr	ra
bfc08fcc:	27bd0038 	addiu	sp,sp,56
bfc08fd0:	24070001 	li	a3,1
bfc08fd4:	10870042 	beq	a0,a3,bfc090e0 <cmp_complex+0x210>
bfc08fd8:	02208021 	move	s0,s1
bfc08fdc:	0bf023da 	j	bfc08f68 <cmp_complex+0x98>
bfc08fe0:	3210ffff 	andi	s0,s0,0xffff
	...
bfc08ff0:	3233007f 	andi	s3,s1,0x7f
bfc08ff4:	86b10000 	lh	s1,0(s5)
bfc08ff8:	00000000 	nop
bfc08ffc:	32340080 	andi	s4,s1,0x80
bfc09000:	1680ffe8 	bnez	s4,bfc08fa4 <cmp_complex+0xd4>
bfc09004:	0011f8c3 	sra	ra,s1,0x3
bfc09008:	33f8000f 	andi	t8,ra,0xf
bfc0900c:	0018c900 	sll	t9,t8,0x4
bfc09010:	32240007 	andi	a0,s1,0x7
bfc09014:	14800016 	bnez	a0,bfc09070 <cmp_complex+0x1a0>
bfc09018:	03382825 	or	a1,t9,t8
bfc0901c:	28a60022 	slti	a2,a1,34
bfc09020:	14c00002 	bnez	a2,bfc0902c <cmp_complex+0x15c>
bfc09024:	24030022 	li	v1,34
bfc09028:	00a01821 	move	v1,a1
bfc0902c:	8e440018 	lw	a0,24(s2)
bfc09030:	86470002 	lh	a3,2(s2)
bfc09034:	8e450014 	lw	a1,20(s2)
bfc09038:	86460000 	lh	a2,0(s2)
bfc0903c:	96480038 	lhu	t0,56(s2)
bfc09040:	afa30010 	sw	v1,16(sp)
bfc09044:	0ff01e28 	jal	bfc078a0 <core_bench_state>
bfc09048:	afa80014 	sw	t0,20(sp)
bfc0904c:	9644003e 	lhu	a0,62(s2)
bfc09050:	00023c00 	sll	a3,v0,0x10
bfc09054:	14800009 	bnez	a0,bfc0907c <cmp_complex+0x1ac>
bfc09058:	00078403 	sra	s0,a3,0x10
bfc0905c:	0bf0241f 	j	bfc0907c <cmp_complex+0x1ac>
bfc09060:	a642003e 	sh	v0,62(s2)
	...
bfc09070:	24020001 	li	v0,1
bfc09074:	1082000e 	beq	a0,v0,bfc090b0 <cmp_complex+0x1e0>
bfc09078:	02208021 	move	s0,s1
bfc0907c:	3210ffff 	andi	s0,s0,0xffff
bfc09080:	96450038 	lhu	a1,56(s2)
bfc09084:	0ff016bc 	jal	bfc05af0 <crcu16>
bfc09088:	02002021 	move	a0,s0
bfc0908c:	240bff00 	li	t3,-256
bfc09090:	022b5024 	and	t2,s1,t3
bfc09094:	3210007f 	andi	s0,s0,0x7f
bfc09098:	35430080 	ori	v1,t2,0x80
bfc0909c:	02038825 	or	s1,s0,v1
bfc090a0:	a6420038 	sh	v0,56(s2)
bfc090a4:	0bf023ea 	j	bfc08fa8 <cmp_complex+0xd8>
bfc090a8:	a6b10000 	sh	s1,0(s5)
bfc090ac:	00000000 	nop
bfc090b0:	96460038 	lhu	a2,56(s2)
bfc090b4:	0ff00ff4 	jal	bfc03fd0 <core_bench_matrix>
bfc090b8:	26440028 	addiu	a0,s2,40
bfc090bc:	9645003c 	lhu	a1,60(s2)
bfc090c0:	00024c00 	sll	t1,v0,0x10
bfc090c4:	14a0ffed 	bnez	a1,bfc0907c <cmp_complex+0x1ac>
bfc090c8:	00098403 	sra	s0,t1,0x10
bfc090cc:	0bf0241f 	j	bfc0907c <cmp_complex+0x1ac>
bfc090d0:	a642003c 	sh	v0,60(s2)
	...
bfc090e0:	96460038 	lhu	a2,56(s2)
bfc090e4:	0ff00ff4 	jal	bfc03fd0 <core_bench_matrix>
bfc090e8:	26440028 	addiu	a0,s2,40
bfc090ec:	964a003c 	lhu	t2,60(s2)
bfc090f0:	00025c00 	sll	t3,v0,0x10
bfc090f4:	1540ff9b 	bnez	t2,bfc08f64 <cmp_complex+0x94>
bfc090f8:	000b8403 	sra	s0,t3,0x10
bfc090fc:	0bf023d9 	j	bfc08f64 <cmp_complex+0x94>
bfc09100:	a642003c 	sh	v0,60(s2)
	...

bfc09110 <core_bench_list>:
core_bench_list():
bfc09110:	848a0004 	lh	t2,4(a0)
bfc09114:	27bdffc0 	addiu	sp,sp,-64
bfc09118:	00052c00 	sll	a1,a1,0x10
bfc0911c:	afb5002c 	sw	s5,44(sp)
bfc09120:	afbf003c 	sw	ra,60(sp)
bfc09124:	afbe0038 	sw	s8,56(sp)
bfc09128:	afb70034 	sw	s7,52(sp)
bfc0912c:	afb60030 	sw	s6,48(sp)
bfc09130:	afb40028 	sw	s4,40(sp)
bfc09134:	afb30024 	sw	s3,36(sp)
bfc09138:	afb20020 	sw	s2,32(sp)
bfc0913c:	afb1001c 	sw	s1,28(sp)
bfc09140:	afb00018 	sw	s0,24(sp)
bfc09144:	afa40040 	sw	a0,64(sp)
bfc09148:	8c950024 	lw	s5,36(a0)
bfc0914c:	1940028f 	blez	t2,bfc09b8c <core_bench_list+0xa7c>
bfc09150:	00052c03 	sra	a1,a1,0x10
bfc09154:	afa50010 	sw	a1,16(sp)
bfc09158:	00004821 	move	t1,zero
bfc0915c:	00004021 	move	t0,zero
bfc09160:	00005821 	move	t3,zero
bfc09164:	00003821 	move	a3,zero
bfc09168:	8fa30010 	lw	v1,16(sp)
bfc0916c:	30e200ff 	andi	v0,a3,0xff
bfc09170:	04600160 	bltz	v1,bfc096f4 <core_bench_list+0x5e4>
bfc09174:	afa20014 	sw	v0,20(sp)
bfc09178:	12a00174 	beqz	s5,bfc0974c <core_bench_list+0x63c>
bfc0917c:	00000000 	nop
bfc09180:	8eaf0004 	lw	t7,4(s5)
bfc09184:	8fad0010 	lw	t5,16(sp)
bfc09188:	85ee0002 	lh	t6,2(t7)
bfc0918c:	00000000 	nop
bfc09190:	11cd000d 	beq	t6,t5,bfc091c8 <core_bench_list+0xb8>
bfc09194:	02a03021 	move	a2,s5
bfc09198:	0bf0246e 	j	bfc091b8 <core_bench_list+0xa8>
bfc0919c:	02a02021 	move	a0,s5
bfc091a0:	8c920004 	lw	s2,4(a0)
bfc091a4:	8fb00010 	lw	s0,16(sp)
bfc091a8:	86510002 	lh	s1,2(s2)
bfc091ac:	00000000 	nop
bfc091b0:	12300005 	beq	s1,s0,bfc091c8 <core_bench_list+0xb8>
bfc091b4:	00803021 	move	a2,a0
bfc091b8:	8c840000 	lw	a0,0(a0)
bfc091bc:	00000000 	nop
bfc091c0:	1480fff7 	bnez	a0,bfc091a0 <core_bench_list+0x90>
bfc091c4:	00003021 	move	a2,zero
bfc091c8:	8ea20000 	lw	v0,0(s5)
bfc091cc:	00001821 	move	v1,zero
bfc091d0:	10400023 	beqz	v0,bfc09260 <core_bench_list+0x150>
bfc091d4:	aea30000 	sw	v1,0(s5)
bfc091d8:	8c430000 	lw	v1,0(v0)
bfc091dc:	ac550000 	sw	s5,0(v0)
bfc091e0:	1060001f 	beqz	v1,bfc09260 <core_bench_list+0x150>
bfc091e4:	0040a821 	move	s5,v0
bfc091e8:	8c640000 	lw	a0,0(v1)
bfc091ec:	0060a821 	move	s5,v1
bfc091f0:	1080001b 	beqz	a0,bfc09260 <core_bench_list+0x150>
bfc091f4:	ac620000 	sw	v0,0(v1)
bfc091f8:	8c820000 	lw	v0,0(a0)
bfc091fc:	0080a821 	move	s5,a0
bfc09200:	10400017 	beqz	v0,bfc09260 <core_bench_list+0x150>
bfc09204:	ac830000 	sw	v1,0(a0)
bfc09208:	8c430000 	lw	v1,0(v0)
bfc0920c:	0040a821 	move	s5,v0
bfc09210:	10600013 	beqz	v1,bfc09260 <core_bench_list+0x150>
bfc09214:	ac440000 	sw	a0,0(v0)
bfc09218:	8c640000 	lw	a0,0(v1)
bfc0921c:	0060a821 	move	s5,v1
bfc09220:	1080000f 	beqz	a0,bfc09260 <core_bench_list+0x150>
bfc09224:	ac620000 	sw	v0,0(v1)
bfc09228:	8c820000 	lw	v0,0(a0)
bfc0922c:	0080a821 	move	s5,a0
bfc09230:	1040000b 	beqz	v0,bfc09260 <core_bench_list+0x150>
bfc09234:	ac830000 	sw	v1,0(a0)
bfc09238:	0040a821 	move	s5,v0
bfc0923c:	8c420000 	lw	v0,0(v0)
bfc09240:	02a01821 	move	v1,s5
bfc09244:	10400006 	beqz	v0,bfc09260 <core_bench_list+0x150>
bfc09248:	aea40000 	sw	a0,0(s5)
bfc0924c:	0040a821 	move	s5,v0
bfc09250:	8ea20000 	lw	v0,0(s5)
bfc09254:	00000000 	nop
bfc09258:	1440ffdf 	bnez	v0,bfc091d8 <core_bench_list+0xc8>
bfc0925c:	aea30000 	sw	v1,0(s5)
bfc09260:	10c0013c 	beqz	a2,bfc09754 <core_bench_list+0x644>
bfc09264:	02a01021 	move	v0,s5
bfc09268:	8ccd0004 	lw	t5,4(a2)
bfc0926c:	250c0001 	addiu	t4,t0,1
bfc09270:	85a40000 	lh	a0,0(t5)
bfc09274:	00000000 	nop
bfc09278:	30820001 	andi	v0,a0,0x1
bfc0927c:	10400005 	beqz	v0,bfc09294 <core_bench_list+0x184>
bfc09280:	3188ffff 	andi	t0,t4,0xffff
bfc09284:	00047a43 	sra	t7,a0,0x9
bfc09288:	31ee0001 	andi	t6,t7,0x1
bfc0928c:	012e2021 	addu	a0,t1,t6
bfc09290:	3089ffff 	andi	t1,a0,0xffff
bfc09294:	8cc40000 	lw	a0,0(a2)
bfc09298:	00000000 	nop
bfc0929c:	10800008 	beqz	a0,bfc092c0 <core_bench_list+0x1b0>
bfc092a0:	00000000 	nop
bfc092a4:	8c900000 	lw	s0,0(a0)
bfc092a8:	00000000 	nop
bfc092ac:	acd00000 	sw	s0,0(a2)
bfc092b0:	8ea60000 	lw	a2,0(s5)
bfc092b4:	00000000 	nop
bfc092b8:	ac860000 	sw	a2,0(a0)
bfc092bc:	aea40000 	sw	a0,0(s5)
bfc092c0:	8fa30010 	lw	v1,16(sp)
bfc092c4:	00000000 	nop
bfc092c8:	04600004 	bltz	v1,bfc092dc <core_bench_list+0x1cc>
bfc092cc:	24730001 	addiu	s3,v1,1
bfc092d0:	00139400 	sll	s2,s3,0x10
bfc092d4:	00128c03 	sra	s1,s2,0x10
bfc092d8:	afb10010 	sw	s1,16(sp)
bfc092dc:	24f60001 	addiu	s6,a3,1
bfc092e0:	00163c00 	sll	a3,s6,0x10
bfc092e4:	00073c03 	sra	a3,a3,0x10
bfc092e8:	00eaa02a 	slt	s4,a3,t2
bfc092ec:	1680ff9e 	bnez	s4,bfc09168 <core_bench_list+0x58>
bfc092f0:	00000000 	nop
bfc092f4:	012b5023 	subu	t2,t1,t3
bfc092f8:	00084880 	sll	t1,t0,0x2
bfc092fc:	01494021 	addu	t0,t2,t1
bfc09300:	311effff 	andi	s8,t0,0xffff
bfc09304:	18a00090 	blez	a1,bfc09548 <core_bench_list+0x438>
bfc09308:	00000000 	nop
bfc0930c:	12a0008d 	beqz	s5,bfc09544 <core_bench_list+0x434>
bfc09310:	24160001 	li	s6,1
bfc09314:	0000b821 	move	s7,zero
bfc09318:	0000a021 	move	s4,zero
bfc0931c:	00002021 	move	a0,zero
bfc09320:	8eb10000 	lw	s1,0(s5)
bfc09324:	26cbffff 	addiu	t3,s6,-1
bfc09328:	26f70001 	addiu	s7,s7,1
bfc0932c:	31630007 	andi	v1,t3,0x7
bfc09330:	12200053 	beqz	s1,bfc09480 <core_bench_list+0x370>
bfc09334:	24130001 	li	s3,1
bfc09338:	0276502a 	slt	t2,s3,s6
bfc0933c:	11400051 	beqz	t2,bfc09484 <core_bench_list+0x374>
bfc09340:	02a08021 	move	s0,s5
bfc09344:	1060002c 	beqz	v1,bfc093f8 <core_bench_list+0x2e8>
bfc09348:	00000000 	nop
bfc0934c:	10730023 	beq	v1,s3,bfc093dc <core_bench_list+0x2cc>
bfc09350:	24060002 	li	a2,2
bfc09354:	1066001d 	beq	v1,a2,bfc093cc <core_bench_list+0x2bc>
bfc09358:	24090003 	li	t1,3
bfc0935c:	10690017 	beq	v1,t1,bfc093bc <core_bench_list+0x2ac>
bfc09360:	240b0004 	li	t3,4
bfc09364:	106b0011 	beq	v1,t3,bfc093ac <core_bench_list+0x29c>
bfc09368:	24180005 	li	t8,5
bfc0936c:	1078000b 	beq	v1,t8,bfc0939c <core_bench_list+0x28c>
bfc09370:	24190006 	li	t9,6
bfc09374:	10790005 	beq	v1,t9,bfc0938c <core_bench_list+0x27c>
bfc09378:	00000000 	nop
bfc0937c:	8e310000 	lw	s1,0(s1)
bfc09380:	00000000 	nop
bfc09384:	1220003f 	beqz	s1,bfc09484 <core_bench_list+0x374>
bfc09388:	24130002 	li	s3,2
bfc0938c:	8e310000 	lw	s1,0(s1)
bfc09390:	00000000 	nop
bfc09394:	1220003a 	beqz	s1,bfc09480 <core_bench_list+0x370>
bfc09398:	26730001 	addiu	s3,s3,1
bfc0939c:	8e310000 	lw	s1,0(s1)
bfc093a0:	00000000 	nop
bfc093a4:	12200036 	beqz	s1,bfc09480 <core_bench_list+0x370>
bfc093a8:	26730001 	addiu	s3,s3,1
bfc093ac:	8e310000 	lw	s1,0(s1)
bfc093b0:	00000000 	nop
bfc093b4:	12200032 	beqz	s1,bfc09480 <core_bench_list+0x370>
bfc093b8:	26730001 	addiu	s3,s3,1
bfc093bc:	8e310000 	lw	s1,0(s1)
bfc093c0:	00000000 	nop
bfc093c4:	1220002e 	beqz	s1,bfc09480 <core_bench_list+0x370>
bfc093c8:	26730001 	addiu	s3,s3,1
bfc093cc:	8e310000 	lw	s1,0(s1)
bfc093d0:	00000000 	nop
bfc093d4:	1220002a 	beqz	s1,bfc09480 <core_bench_list+0x370>
bfc093d8:	26730001 	addiu	s3,s3,1
bfc093dc:	8e310000 	lw	s1,0(s1)
bfc093e0:	00000000 	nop
bfc093e4:	12200026 	beqz	s1,bfc09480 <core_bench_list+0x370>
bfc093e8:	26730001 	addiu	s3,s3,1
bfc093ec:	0276f82a 	slt	ra,s3,s6
bfc093f0:	13e00024 	beqz	ra,bfc09484 <core_bench_list+0x374>
bfc093f4:	02a08021 	move	s0,s5
bfc093f8:	8e310000 	lw	s1,0(s1)
bfc093fc:	26730001 	addiu	s3,s3,1
bfc09400:	1220001f 	beqz	s1,bfc09480 <core_bench_list+0x370>
bfc09404:	02601021 	move	v0,s3
bfc09408:	8e310000 	lw	s1,0(s1)
bfc0940c:	00000000 	nop
bfc09410:	1220001b 	beqz	s1,bfc09480 <core_bench_list+0x370>
bfc09414:	26730001 	addiu	s3,s3,1
bfc09418:	8e310000 	lw	s1,0(s1)
bfc0941c:	00000000 	nop
bfc09420:	12200017 	beqz	s1,bfc09480 <core_bench_list+0x370>
bfc09424:	24530002 	addiu	s3,v0,2
bfc09428:	8e310000 	lw	s1,0(s1)
bfc0942c:	00000000 	nop
bfc09430:	12200013 	beqz	s1,bfc09480 <core_bench_list+0x370>
bfc09434:	24530003 	addiu	s3,v0,3
bfc09438:	8e310000 	lw	s1,0(s1)
bfc0943c:	00000000 	nop
bfc09440:	1220000f 	beqz	s1,bfc09480 <core_bench_list+0x370>
bfc09444:	24530004 	addiu	s3,v0,4
bfc09448:	8e310000 	lw	s1,0(s1)
bfc0944c:	00000000 	nop
bfc09450:	1220000b 	beqz	s1,bfc09480 <core_bench_list+0x370>
bfc09454:	24530005 	addiu	s3,v0,5
bfc09458:	8e310000 	lw	s1,0(s1)
bfc0945c:	00000000 	nop
bfc09460:	12200007 	beqz	s1,bfc09480 <core_bench_list+0x370>
bfc09464:	24530006 	addiu	s3,v0,6
bfc09468:	8e310000 	lw	s1,0(s1)
bfc0946c:	24530007 	addiu	s3,v0,7
bfc09470:	12200003 	beqz	s1,bfc09480 <core_bench_list+0x370>
bfc09474:	0276102a 	slt	v0,s3,s6
bfc09478:	1440ffdf 	bnez	v0,bfc093f8 <core_bench_list+0x2e8>
bfc0947c:	00000000 	nop
bfc09480:	02a08021 	move	s0,s5
bfc09484:	02c09021 	move	s2,s6
bfc09488:	12600017 	beqz	s3,bfc094e8 <core_bench_list+0x3d8>
bfc0948c:	0080a821 	move	s5,a0
bfc09490:	1240001f 	beqz	s2,bfc09510 <core_bench_list+0x400>
bfc09494:	00000000 	nop
bfc09498:	1220001d 	beqz	s1,bfc09510 <core_bench_list+0x400>
bfc0949c:	00000000 	nop
bfc094a0:	8e040004 	lw	a0,4(s0)
bfc094a4:	8e250004 	lw	a1,4(s1)
bfc094a8:	8fa60040 	lw	a2,64(sp)
bfc094ac:	0ff023b4 	jal	bfc08ed0 <cmp_complex>
bfc094b0:	00000000 	nop
bfc094b4:	18400016 	blez	v0,bfc09510 <core_bench_list+0x400>
bfc094b8:	00000000 	nop
bfc094bc:	8e220000 	lw	v0,0(s1)
bfc094c0:	02001821 	move	v1,s0
bfc094c4:	2652ffff 	addiu	s2,s2,-1
bfc094c8:	02208021 	move	s0,s1
bfc094cc:	1280000e 	beqz	s4,bfc09508 <core_bench_list+0x3f8>
bfc094d0:	00000000 	nop
bfc094d4:	ae900000 	sw	s0,0(s4)
bfc094d8:	0200a021 	move	s4,s0
bfc094dc:	00408821 	move	s1,v0
bfc094e0:	1660ffeb 	bnez	s3,bfc09490 <core_bench_list+0x380>
bfc094e4:	00608021 	move	s0,v1
bfc094e8:	1240000d 	beqz	s2,bfc09520 <core_bench_list+0x410>
bfc094ec:	00000000 	nop
bfc094f0:	1220000f 	beqz	s1,bfc09530 <core_bench_list+0x420>
bfc094f4:	02001821 	move	v1,s0
bfc094f8:	2652ffff 	addiu	s2,s2,-1
bfc094fc:	8e220000 	lw	v0,0(s1)
bfc09500:	1680fff4 	bnez	s4,bfc094d4 <core_bench_list+0x3c4>
bfc09504:	02208021 	move	s0,s1
bfc09508:	0bf02536 	j	bfc094d8 <core_bench_list+0x3c8>
bfc0950c:	0200a821 	move	s5,s0
bfc09510:	2673ffff 	addiu	s3,s3,-1
bfc09514:	8e030000 	lw	v1,0(s0)
bfc09518:	0bf02533 	j	bfc094cc <core_bench_list+0x3bc>
bfc0951c:	02201021 	move	v0,s1
bfc09520:	12200003 	beqz	s1,bfc09530 <core_bench_list+0x420>
bfc09524:	02a02021 	move	a0,s5
bfc09528:	0bf024c8 	j	bfc09320 <core_bench_list+0x210>
bfc0952c:	0220a821 	move	s5,s1
bfc09530:	24050001 	li	a1,1
bfc09534:	12e50004 	beq	s7,a1,bfc09548 <core_bench_list+0x438>
bfc09538:	ae800000 	sw	zero,0(s4)
bfc0953c:	16a0ff75 	bnez	s5,bfc09314 <core_bench_list+0x204>
bfc09540:	0016b040 	sll	s6,s6,0x1
bfc09544:	aea00000 	sw	zero,0(s5)
bfc09548:	8eb80000 	lw	t8,0(s5)
bfc0954c:	8fb70010 	lw	s7,16(sp)
bfc09550:	8f110000 	lw	s1,0(t8)
bfc09554:	8f030004 	lw	v1,4(t8)
bfc09558:	8e390004 	lw	t9,4(s1)
bfc0955c:	8e3f0000 	lw	ra,0(s1)
bfc09560:	af190004 	sw	t9,4(t8)
bfc09564:	af1f0000 	sw	ra,0(t8)
bfc09568:	00603021 	move	a2,v1
bfc0956c:	ae200000 	sw	zero,0(s1)
bfc09570:	06e00172 	bltz	s7,bfc09b3c <core_bench_list+0xa2c>
bfc09574:	ae230004 	sw	v1,4(s1)
bfc09578:	8ea50004 	lw	a1,4(s5)
bfc0957c:	8fa40010 	lw	a0,16(sp)
bfc09580:	84ad0002 	lh	t5,2(a1)
bfc09584:	00000000 	nop
bfc09588:	11a4000f 	beq	t5,a0,bfc095c8 <core_bench_list+0x4b8>
bfc0958c:	02a08021 	move	s0,s5
bfc09590:	0bf0256c 	j	bfc095b0 <core_bench_list+0x4a0>
bfc09594:	02a02021 	move	a0,s5
bfc09598:	8c900004 	lw	s0,4(a0)
bfc0959c:	8fae0010 	lw	t6,16(sp)
bfc095a0:	860f0002 	lh	t7,2(s0)
bfc095a4:	00000000 	nop
bfc095a8:	11ee0007 	beq	t7,t6,bfc095c8 <core_bench_list+0x4b8>
bfc095ac:	00808021 	move	s0,a0
bfc095b0:	8c840000 	lw	a0,0(a0)
bfc095b4:	00000000 	nop
bfc095b8:	1480fff7 	bnez	a0,bfc09598 <core_bench_list+0x488>
bfc095bc:	00000000 	nop
bfc095c0:	8eb00000 	lw	s0,0(s5)
bfc095c4:	00000000 	nop
bfc095c8:	1200006d 	beqz	s0,bfc09780 <core_bench_list+0x670>
bfc095cc:	00000000 	nop
bfc095d0:	84a40000 	lh	a0,0(a1)
bfc095d4:	0ff017d8 	jal	bfc05f60 <crc16>
bfc095d8:	03c02821 	move	a1,s8
bfc095dc:	8e100000 	lw	s0,0(s0)
bfc095e0:	0040f021 	move	s8,v0
bfc095e4:	12000065 	beqz	s0,bfc0977c <core_bench_list+0x66c>
bfc095e8:	00402821 	move	a1,v0
bfc095ec:	8ebe0004 	lw	s8,4(s5)
bfc095f0:	00000000 	nop
bfc095f4:	87c40000 	lh	a0,0(s8)
bfc095f8:	0ff017d8 	jal	bfc05f60 <crc16>
bfc095fc:	00000000 	nop
bfc09600:	8e100000 	lw	s0,0(s0)
bfc09604:	0040f021 	move	s8,v0
bfc09608:	1200005c 	beqz	s0,bfc0977c <core_bench_list+0x66c>
bfc0960c:	00402821 	move	a1,v0
bfc09610:	8eb20004 	lw	s2,4(s5)
bfc09614:	00000000 	nop
bfc09618:	86440000 	lh	a0,0(s2)
bfc0961c:	0ff017d8 	jal	bfc05f60 <crc16>
bfc09620:	00000000 	nop
bfc09624:	8e100000 	lw	s0,0(s0)
bfc09628:	0040f021 	move	s8,v0
bfc0962c:	12000053 	beqz	s0,bfc0977c <core_bench_list+0x66c>
bfc09630:	00402821 	move	a1,v0
bfc09634:	8eb30004 	lw	s3,4(s5)
bfc09638:	00000000 	nop
bfc0963c:	86640000 	lh	a0,0(s3)
bfc09640:	0ff017d8 	jal	bfc05f60 <crc16>
bfc09644:	00000000 	nop
bfc09648:	8e100000 	lw	s0,0(s0)
bfc0964c:	0040f021 	move	s8,v0
bfc09650:	1200004a 	beqz	s0,bfc0977c <core_bench_list+0x66c>
bfc09654:	00402821 	move	a1,v0
bfc09658:	8eb40004 	lw	s4,4(s5)
bfc0965c:	00000000 	nop
bfc09660:	86840000 	lh	a0,0(s4)
bfc09664:	0ff017d8 	jal	bfc05f60 <crc16>
bfc09668:	00000000 	nop
bfc0966c:	8e100000 	lw	s0,0(s0)
bfc09670:	0040f021 	move	s8,v0
bfc09674:	12000041 	beqz	s0,bfc0977c <core_bench_list+0x66c>
bfc09678:	00402821 	move	a1,v0
bfc0967c:	8ebe0004 	lw	s8,4(s5)
bfc09680:	00000000 	nop
bfc09684:	87c40000 	lh	a0,0(s8)
bfc09688:	0ff017d8 	jal	bfc05f60 <crc16>
bfc0968c:	00000000 	nop
bfc09690:	8e100000 	lw	s0,0(s0)
bfc09694:	0040f021 	move	s8,v0
bfc09698:	12000038 	beqz	s0,bfc0977c <core_bench_list+0x66c>
bfc0969c:	00402821 	move	a1,v0
bfc096a0:	8ea70004 	lw	a3,4(s5)
bfc096a4:	00000000 	nop
bfc096a8:	84e40000 	lh	a0,0(a3)
bfc096ac:	0ff017d8 	jal	bfc05f60 <crc16>
bfc096b0:	00000000 	nop
bfc096b4:	8e100000 	lw	s0,0(s0)
bfc096b8:	0040f021 	move	s8,v0
bfc096bc:	1200002f 	beqz	s0,bfc0977c <core_bench_list+0x66c>
bfc096c0:	00402821 	move	a1,v0
bfc096c4:	8ea80004 	lw	t0,4(s5)
bfc096c8:	00000000 	nop
bfc096cc:	85040000 	lh	a0,0(t0)
bfc096d0:	0ff017d8 	jal	bfc05f60 <crc16>
bfc096d4:	00000000 	nop
bfc096d8:	8e100000 	lw	s0,0(s0)
bfc096dc:	00000000 	nop
bfc096e0:	12000026 	beqz	s0,bfc0977c <core_bench_list+0x66c>
bfc096e4:	0040f021 	move	s8,v0
bfc096e8:	8ea50004 	lw	a1,4(s5)
bfc096ec:	0bf02574 	j	bfc095d0 <core_bench_list+0x4c0>
bfc096f0:	00000000 	nop
bfc096f4:	12a00016 	beqz	s5,bfc09750 <core_bench_list+0x640>
bfc096f8:	00001021 	move	v0,zero
bfc096fc:	8eac0004 	lw	t4,4(s5)
bfc09700:	8fa40014 	lw	a0,20(sp)
bfc09704:	91860000 	lbu	a2,0(t4)
bfc09708:	00000000 	nop
bfc0970c:	10c4feae 	beq	a2,a0,bfc091c8 <core_bench_list+0xb8>
bfc09710:	02a03021 	move	a2,s5
bfc09714:	0bf025cd 	j	bfc09734 <core_bench_list+0x624>
bfc09718:	02a02021 	move	a0,s5
bfc0971c:	8c960004 	lw	s6,4(a0)
bfc09720:	8fb30014 	lw	s3,20(sp)
bfc09724:	92d40000 	lbu	s4,0(s6)
bfc09728:	00000000 	nop
bfc0972c:	1293fea6 	beq	s4,s3,bfc091c8 <core_bench_list+0xb8>
bfc09730:	00803021 	move	a2,a0
bfc09734:	8c840000 	lw	a0,0(a0)
bfc09738:	00000000 	nop
bfc0973c:	1480fff7 	bnez	a0,bfc0971c <core_bench_list+0x60c>
bfc09740:	00003021 	move	a2,zero
bfc09744:	0bf02472 	j	bfc091c8 <core_bench_list+0xb8>
bfc09748:	00000000 	nop
bfc0974c:	00001021 	move	v0,zero
bfc09750:	0000a821 	move	s5,zero
bfc09754:	8c430000 	lw	v1,0(v0)
bfc09758:	257f0001 	addiu	ra,t3,1
bfc0975c:	8c7e0004 	lw	s8,4(v1)
bfc09760:	33ebffff 	andi	t3,ra,0xffff
bfc09764:	83d90001 	lb	t9,1(s8)
bfc09768:	00000000 	nop
bfc0976c:	33380001 	andi	t8,t9,0x1
bfc09770:	0138b821 	addu	s7,t1,t8
bfc09774:	0bf024b0 	j	bfc092c0 <core_bench_list+0x1b0>
bfc09778:	32e9ffff 	andi	t1,s7,0xffff
bfc0977c:	8e260004 	lw	a2,4(s1)
bfc09780:	8ea70000 	lw	a3,0(s5)
bfc09784:	24160001 	li	s6,1
bfc09788:	8cea0004 	lw	t2,4(a3)
bfc0978c:	8ce80000 	lw	t0,0(a3)
bfc09790:	ae2a0004 	sw	t2,4(s1)
bfc09794:	ae280000 	sw	t0,0(s1)
bfc09798:	ace60004 	sw	a2,4(a3)
bfc0979c:	12a0008d 	beqz	s5,bfc099d4 <core_bench_list+0x8c4>
bfc097a0:	acf10000 	sw	s1,0(a3)
bfc097a4:	0000b821 	move	s7,zero
bfc097a8:	0000a021 	move	s4,zero
bfc097ac:	00002021 	move	a0,zero
bfc097b0:	8eb10000 	lw	s1,0(s5)
bfc097b4:	26c6ffff 	addiu	a2,s6,-1
bfc097b8:	26f70001 	addiu	s7,s7,1
bfc097bc:	30c30007 	andi	v1,a2,0x7
bfc097c0:	12200053 	beqz	s1,bfc09910 <core_bench_list+0x800>
bfc097c4:	24130001 	li	s3,1
bfc097c8:	0276282a 	slt	a1,s3,s6
bfc097cc:	10a00051 	beqz	a1,bfc09914 <core_bench_list+0x804>
bfc097d0:	02a08021 	move	s0,s5
bfc097d4:	1060002c 	beqz	v1,bfc09888 <core_bench_list+0x778>
bfc097d8:	00000000 	nop
bfc097dc:	10730023 	beq	v1,s3,bfc0986c <core_bench_list+0x75c>
bfc097e0:	24020002 	li	v0,2
bfc097e4:	1062001d 	beq	v1,v0,bfc0985c <core_bench_list+0x74c>
bfc097e8:	240c0003 	li	t4,3
bfc097ec:	106c0017 	beq	v1,t4,bfc0984c <core_bench_list+0x73c>
bfc097f0:	240d0004 	li	t5,4
bfc097f4:	106d0011 	beq	v1,t5,bfc0983c <core_bench_list+0x72c>
bfc097f8:	240e0005 	li	t6,5
bfc097fc:	106e000b 	beq	v1,t6,bfc0982c <core_bench_list+0x71c>
bfc09800:	240f0006 	li	t7,6
bfc09804:	106f0005 	beq	v1,t7,bfc0981c <core_bench_list+0x70c>
bfc09808:	00000000 	nop
bfc0980c:	8e310000 	lw	s1,0(s1)
bfc09810:	00000000 	nop
bfc09814:	1220003f 	beqz	s1,bfc09914 <core_bench_list+0x804>
bfc09818:	24130002 	li	s3,2
bfc0981c:	8e310000 	lw	s1,0(s1)
bfc09820:	00000000 	nop
bfc09824:	1220003a 	beqz	s1,bfc09910 <core_bench_list+0x800>
bfc09828:	26730001 	addiu	s3,s3,1
bfc0982c:	8e310000 	lw	s1,0(s1)
bfc09830:	00000000 	nop
bfc09834:	12200036 	beqz	s1,bfc09910 <core_bench_list+0x800>
bfc09838:	26730001 	addiu	s3,s3,1
bfc0983c:	8e310000 	lw	s1,0(s1)
bfc09840:	00000000 	nop
bfc09844:	12200032 	beqz	s1,bfc09910 <core_bench_list+0x800>
bfc09848:	26730001 	addiu	s3,s3,1
bfc0984c:	8e310000 	lw	s1,0(s1)
bfc09850:	00000000 	nop
bfc09854:	1220002e 	beqz	s1,bfc09910 <core_bench_list+0x800>
bfc09858:	26730001 	addiu	s3,s3,1
bfc0985c:	8e310000 	lw	s1,0(s1)
bfc09860:	00000000 	nop
bfc09864:	1220002a 	beqz	s1,bfc09910 <core_bench_list+0x800>
bfc09868:	26730001 	addiu	s3,s3,1
bfc0986c:	8e310000 	lw	s1,0(s1)
bfc09870:	00000000 	nop
bfc09874:	12200026 	beqz	s1,bfc09910 <core_bench_list+0x800>
bfc09878:	26730001 	addiu	s3,s3,1
bfc0987c:	0276802a 	slt	s0,s3,s6
bfc09880:	12000024 	beqz	s0,bfc09914 <core_bench_list+0x804>
bfc09884:	02a08021 	move	s0,s5
bfc09888:	8e310000 	lw	s1,0(s1)
bfc0988c:	26730001 	addiu	s3,s3,1
bfc09890:	1220001f 	beqz	s1,bfc09910 <core_bench_list+0x800>
bfc09894:	02601021 	move	v0,s3
bfc09898:	8e310000 	lw	s1,0(s1)
bfc0989c:	00000000 	nop
bfc098a0:	1220001b 	beqz	s1,bfc09910 <core_bench_list+0x800>
bfc098a4:	26730001 	addiu	s3,s3,1
bfc098a8:	8e310000 	lw	s1,0(s1)
bfc098ac:	00000000 	nop
bfc098b0:	12200017 	beqz	s1,bfc09910 <core_bench_list+0x800>
bfc098b4:	24530002 	addiu	s3,v0,2
bfc098b8:	8e310000 	lw	s1,0(s1)
bfc098bc:	00000000 	nop
bfc098c0:	12200013 	beqz	s1,bfc09910 <core_bench_list+0x800>
bfc098c4:	24530003 	addiu	s3,v0,3
bfc098c8:	8e310000 	lw	s1,0(s1)
bfc098cc:	00000000 	nop
bfc098d0:	1220000f 	beqz	s1,bfc09910 <core_bench_list+0x800>
bfc098d4:	24530004 	addiu	s3,v0,4
bfc098d8:	8e310000 	lw	s1,0(s1)
bfc098dc:	00000000 	nop
bfc098e0:	1220000b 	beqz	s1,bfc09910 <core_bench_list+0x800>
bfc098e4:	24530005 	addiu	s3,v0,5
bfc098e8:	8e310000 	lw	s1,0(s1)
bfc098ec:	00000000 	nop
bfc098f0:	12200007 	beqz	s1,bfc09910 <core_bench_list+0x800>
bfc098f4:	24530006 	addiu	s3,v0,6
bfc098f8:	8e310000 	lw	s1,0(s1)
bfc098fc:	24530007 	addiu	s3,v0,7
bfc09900:	12200003 	beqz	s1,bfc09910 <core_bench_list+0x800>
bfc09904:	0276102a 	slt	v0,s3,s6
bfc09908:	1440ffdf 	bnez	v0,bfc09888 <core_bench_list+0x778>
bfc0990c:	00000000 	nop
bfc09910:	02a08021 	move	s0,s5
bfc09914:	02c09021 	move	s2,s6
bfc09918:	12600016 	beqz	s3,bfc09974 <core_bench_list+0x864>
bfc0991c:	0080a821 	move	s5,a0
bfc09920:	1240001f 	beqz	s2,bfc099a0 <core_bench_list+0x890>
bfc09924:	00000000 	nop
bfc09928:	1220001d 	beqz	s1,bfc099a0 <core_bench_list+0x890>
bfc0992c:	00000000 	nop
bfc09930:	8e040004 	lw	a0,4(s0)
bfc09934:	8e250004 	lw	a1,4(s1)
bfc09938:	0ff0204c 	jal	bfc08130 <cmp_idx>
bfc0993c:	00003021 	move	a2,zero
bfc09940:	18400017 	blez	v0,bfc099a0 <core_bench_list+0x890>
bfc09944:	00000000 	nop
bfc09948:	8e220000 	lw	v0,0(s1)
bfc0994c:	02001821 	move	v1,s0
bfc09950:	2652ffff 	addiu	s2,s2,-1
bfc09954:	02208021 	move	s0,s1
bfc09958:	1280000e 	beqz	s4,bfc09994 <core_bench_list+0x884>
bfc0995c:	00000000 	nop
bfc09960:	ae900000 	sw	s0,0(s4)
bfc09964:	0200a021 	move	s4,s0
bfc09968:	00408821 	move	s1,v0
bfc0996c:	1660ffec 	bnez	s3,bfc09920 <core_bench_list+0x810>
bfc09970:	00608021 	move	s0,v1
bfc09974:	1240000e 	beqz	s2,bfc099b0 <core_bench_list+0x8a0>
bfc09978:	00000000 	nop
bfc0997c:	12200010 	beqz	s1,bfc099c0 <core_bench_list+0x8b0>
bfc09980:	02001821 	move	v1,s0
bfc09984:	2652ffff 	addiu	s2,s2,-1
bfc09988:	8e220000 	lw	v0,0(s1)
bfc0998c:	1680fff4 	bnez	s4,bfc09960 <core_bench_list+0x850>
bfc09990:	02208021 	move	s0,s1
bfc09994:	0bf02659 	j	bfc09964 <core_bench_list+0x854>
bfc09998:	0200a821 	move	s5,s0
bfc0999c:	00000000 	nop
bfc099a0:	2673ffff 	addiu	s3,s3,-1
bfc099a4:	8e030000 	lw	v1,0(s0)
bfc099a8:	0bf02656 	j	bfc09958 <core_bench_list+0x848>
bfc099ac:	02201021 	move	v0,s1
bfc099b0:	12200003 	beqz	s1,bfc099c0 <core_bench_list+0x8b0>
bfc099b4:	02a02021 	move	a0,s5
bfc099b8:	0bf025ec 	j	bfc097b0 <core_bench_list+0x6a0>
bfc099bc:	0220a821 	move	s5,s1
bfc099c0:	24110001 	li	s1,1
bfc099c4:	12f10004 	beq	s7,s1,bfc099d8 <core_bench_list+0x8c8>
bfc099c8:	ae800000 	sw	zero,0(s4)
bfc099cc:	16a0ff75 	bnez	s5,bfc097a4 <core_bench_list+0x694>
bfc099d0:	0016b040 	sll	s6,s6,0x1
bfc099d4:	aea00000 	sw	zero,0(s5)
bfc099d8:	8eb00000 	lw	s0,0(s5)
bfc099dc:	00000000 	nop
bfc099e0:	12000049 	beqz	s0,bfc09b08 <core_bench_list+0x9f8>
bfc099e4:	00000000 	nop
bfc099e8:	8eb60004 	lw	s6,4(s5)
bfc099ec:	00000000 	nop
bfc099f0:	86c40000 	lh	a0,0(s6)
bfc099f4:	0ff017d8 	jal	bfc05f60 <crc16>
bfc099f8:	03c02821 	move	a1,s8
bfc099fc:	8e100000 	lw	s0,0(s0)
bfc09a00:	0040f021 	move	s8,v0
bfc09a04:	12000040 	beqz	s0,bfc09b08 <core_bench_list+0x9f8>
bfc09a08:	00402821 	move	a1,v0
bfc09a0c:	8ea90004 	lw	t1,4(s5)
bfc09a10:	00000000 	nop
bfc09a14:	85240000 	lh	a0,0(t1)
bfc09a18:	0ff017d8 	jal	bfc05f60 <crc16>
bfc09a1c:	00000000 	nop
bfc09a20:	8e100000 	lw	s0,0(s0)
bfc09a24:	0040f021 	move	s8,v0
bfc09a28:	12000037 	beqz	s0,bfc09b08 <core_bench_list+0x9f8>
bfc09a2c:	00402821 	move	a1,v0
bfc09a30:	8eab0004 	lw	t3,4(s5)
bfc09a34:	00000000 	nop
bfc09a38:	85640000 	lh	a0,0(t3)
bfc09a3c:	0ff017d8 	jal	bfc05f60 <crc16>
bfc09a40:	00000000 	nop
bfc09a44:	8e100000 	lw	s0,0(s0)
bfc09a48:	0040f021 	move	s8,v0
bfc09a4c:	1200002e 	beqz	s0,bfc09b08 <core_bench_list+0x9f8>
bfc09a50:	00402821 	move	a1,v0
bfc09a54:	8eb70004 	lw	s7,4(s5)
bfc09a58:	00000000 	nop
bfc09a5c:	86e40000 	lh	a0,0(s7)
bfc09a60:	0ff017d8 	jal	bfc05f60 <crc16>
bfc09a64:	00000000 	nop
bfc09a68:	8e100000 	lw	s0,0(s0)
bfc09a6c:	0040f021 	move	s8,v0
bfc09a70:	12000025 	beqz	s0,bfc09b08 <core_bench_list+0x9f8>
bfc09a74:	00402821 	move	a1,v0
bfc09a78:	8eb80004 	lw	t8,4(s5)
bfc09a7c:	00000000 	nop
bfc09a80:	87040000 	lh	a0,0(t8)
bfc09a84:	0ff017d8 	jal	bfc05f60 <crc16>
bfc09a88:	00000000 	nop
bfc09a8c:	8e100000 	lw	s0,0(s0)
bfc09a90:	0040f021 	move	s8,v0
bfc09a94:	1200001c 	beqz	s0,bfc09b08 <core_bench_list+0x9f8>
bfc09a98:	00402821 	move	a1,v0
bfc09a9c:	8eb90004 	lw	t9,4(s5)
bfc09aa0:	00000000 	nop
bfc09aa4:	87240000 	lh	a0,0(t9)
bfc09aa8:	0ff017d8 	jal	bfc05f60 <crc16>
bfc09aac:	00000000 	nop
bfc09ab0:	8e100000 	lw	s0,0(s0)
bfc09ab4:	0040f021 	move	s8,v0
bfc09ab8:	12000013 	beqz	s0,bfc09b08 <core_bench_list+0x9f8>
bfc09abc:	00402821 	move	a1,v0
bfc09ac0:	8ebf0004 	lw	ra,4(s5)
bfc09ac4:	00000000 	nop
bfc09ac8:	87e40000 	lh	a0,0(ra)
bfc09acc:	0ff017d8 	jal	bfc05f60 <crc16>
bfc09ad0:	00000000 	nop
bfc09ad4:	8e100000 	lw	s0,0(s0)
bfc09ad8:	0040f021 	move	s8,v0
bfc09adc:	1200000a 	beqz	s0,bfc09b08 <core_bench_list+0x9f8>
bfc09ae0:	00402821 	move	a1,v0
bfc09ae4:	8ea30004 	lw	v1,4(s5)
bfc09ae8:	00000000 	nop
bfc09aec:	84640000 	lh	a0,0(v1)
bfc09af0:	0ff017d8 	jal	bfc05f60 <crc16>
bfc09af4:	00000000 	nop
bfc09af8:	8e100000 	lw	s0,0(s0)
bfc09afc:	00000000 	nop
bfc09b00:	1600ffb9 	bnez	s0,bfc099e8 <core_bench_list+0x8d8>
bfc09b04:	0040f021 	move	s8,v0
bfc09b08:	8fbf003c 	lw	ra,60(sp)
bfc09b0c:	03c01021 	move	v0,s8
bfc09b10:	8fbe0038 	lw	s8,56(sp)
bfc09b14:	8fb70034 	lw	s7,52(sp)
bfc09b18:	8fb60030 	lw	s6,48(sp)
bfc09b1c:	8fb5002c 	lw	s5,44(sp)
bfc09b20:	8fb40028 	lw	s4,40(sp)
bfc09b24:	8fb30024 	lw	s3,36(sp)
bfc09b28:	8fb20020 	lw	s2,32(sp)
bfc09b2c:	8fb1001c 	lw	s1,28(sp)
bfc09b30:	8fb00018 	lw	s0,24(sp)
bfc09b34:	03e00008 	jr	ra
bfc09b38:	27bd0040 	addiu	sp,sp,64
bfc09b3c:	8ea50004 	lw	a1,4(s5)
bfc09b40:	8fac0014 	lw	t4,20(sp)
bfc09b44:	90a20000 	lbu	v0,0(a1)
bfc09b48:	00000000 	nop
bfc09b4c:	104cfe9e 	beq	v0,t4,bfc095c8 <core_bench_list+0x4b8>
bfc09b50:	02a08021 	move	s0,s5
bfc09b54:	0bf026dd 	j	bfc09b74 <core_bench_list+0xa64>
bfc09b58:	02a02021 	move	a0,s5
bfc09b5c:	8c940004 	lw	s4,4(a0)
bfc09b60:	8fb20014 	lw	s2,20(sp)
bfc09b64:	92930000 	lbu	s3,0(s4)
bfc09b68:	00000000 	nop
bfc09b6c:	1253fe96 	beq	s2,s3,bfc095c8 <core_bench_list+0x4b8>
bfc09b70:	00808021 	move	s0,a0
bfc09b74:	8c840000 	lw	a0,0(a0)
bfc09b78:	00000000 	nop
bfc09b7c:	1480fff7 	bnez	a0,bfc09b5c <core_bench_list+0xa4c>
bfc09b80:	00000000 	nop
bfc09b84:	0bf02570 	j	bfc095c0 <core_bench_list+0x4b0>
bfc09b88:	00000000 	nop
bfc09b8c:	afa50010 	sw	a1,16(sp)
bfc09b90:	0bf024c1 	j	bfc09304 <core_bench_list+0x1f4>
bfc09b94:	0000f021 	move	s8,zero
	...

bfc09ba0 <portable_malloc>:
portable_malloc():
bfc09ba0:	03e00008 	jr	ra
bfc09ba4:	00001021 	move	v0,zero
	...

bfc09bb0 <portable_free>:
portable_free():
bfc09bb0:	03e00008 	jr	ra
bfc09bb4:	00000000 	nop
	...

bfc09bc0 <get_time>:
get_time():
bfc09bc0:	3c0cbfc1 	lui	t4,0xbfc1
bfc09bc4:	3c0bbfc1 	lui	t3,0xbfc1
bfc09bc8:	2582ac00 	addiu	v0,t4,-21504
bfc09bcc:	2565abf0 	addiu	a1,t3,-21520
bfc09bd0:	8c580004 	lw	t8,4(v0)
bfc09bd4:	8cb90004 	lw	t9,4(a1)
bfc09bd8:	3c0f000f 	lui	t7,0xf
bfc09bdc:	03197023 	subu	t6,t8,t9
bfc09be0:	35ed4240 	ori	t5,t7,0x4240
bfc09be4:	15a00002 	bnez	t5,bfc09bf0 <get_time+0x30>
bfc09be8:	01cd001b 	divu	zero,t6,t5
bfc09bec:	0007000d 	break	0x7
bfc09bf0:	8d89ac00 	lw	t1,-21504(t4)
bfc09bf4:	8d6aabf0 	lw	t2,-21520(t3)
bfc09bf8:	00000000 	nop
bfc09bfc:	012a1823 	subu	v1,t1,t2
bfc09c00:	00034080 	sll	t0,v1,0x2
bfc09c04:	000339c0 	sll	a3,v1,0x7
bfc09c08:	00e83023 	subu	a2,a3,t0
bfc09c0c:	00c32021 	addu	a0,a2,v1
bfc09c10:	000410c0 	sll	v0,a0,0x3
bfc09c14:	00002812 	mflo	a1
bfc09c18:	03e00008 	jr	ra
bfc09c1c:	00a21021 	addu	v0,a1,v0

bfc09c20 <time_in_secs>:
time_in_secs():
bfc09c20:	240203e8 	li	v0,1000
bfc09c24:	14400002 	bnez	v0,bfc09c30 <time_in_secs+0x10>
bfc09c28:	0082001b 	divu	zero,a0,v0
bfc09c2c:	0007000d 	break	0x7
bfc09c30:	00001012 	mflo	v0
bfc09c34:	03e00008 	jr	ra
bfc09c38:	00000000 	nop
bfc09c3c:	00000000 	nop

bfc09c40 <portable_init>:
portable_init():
bfc09c40:	24020001 	li	v0,1
bfc09c44:	03e00008 	jr	ra
bfc09c48:	a0820000 	sb	v0,0(a0)
bfc09c4c:	00000000 	nop

bfc09c50 <portable_fini>:
portable_fini():
bfc09c50:	03e00008 	jr	ra
bfc09c54:	a0800000 	sb	zero,0(a0)
	...

bfc09c60 <stop_time>:
stop_time():
bfc09c60:	3c05bfc1 	lui	a1,0xbfc1
bfc09c64:	24a5ac00 	addiu	a1,a1,-21504
bfc09c68:	0bf02847 	j	bfc0a11c <clock_gettime>
bfc09c6c:	00002021 	move	a0,zero

bfc09c70 <start_time>:
start_time():
bfc09c70:	3c05bfc1 	lui	a1,0xbfc1
bfc09c74:	24a5abf0 	addiu	a1,a1,-21520
bfc09c78:	0bf02847 	j	bfc0a11c <clock_gettime>
bfc09c7c:	00002021 	move	a0,zero

bfc09c80 <printf>:
printf():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:2
bfc09c80:	27bdffc8 	addiu	sp,sp,-56
bfc09c84:	afb30024 	sw	s3,36(sp)
bfc09c88:	afbf0034 	sw	ra,52(sp)
bfc09c8c:	afb60030 	sw	s6,48(sp)
bfc09c90:	afb5002c 	sw	s5,44(sp)
bfc09c94:	afb40028 	sw	s4,40(sp)
bfc09c98:	afb20020 	sw	s2,32(sp)
bfc09c9c:	afb1001c 	sw	s1,28(sp)
bfc09ca0:	afb00018 	sw	s0,24(sp)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:10
bfc09ca4:	80900000 	lb	s0,0(a0)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:2
bfc09ca8:	00809821 	move	s3,a0
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:8
bfc09cac:	27a4003c 	addiu	a0,sp,60
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:2
bfc09cb0:	afa5003c 	sw	a1,60(sp)
bfc09cb4:	afa60040 	sw	a2,64(sp)
bfc09cb8:	afa70044 	sw	a3,68(sp)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:10
bfc09cbc:	12000013 	beqz	s0,bfc09d0c <printf+0x8c>
bfc09cc0:	afa40010 	sw	a0,16(sp)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:17
bfc09cc4:	3c02bfc1 	lui	v0,0xbfc1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:9
bfc09cc8:	00809021 	move	s2,a0
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:17
bfc09ccc:	2456aa30 	addiu	s6,v0,-21968
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:9
bfc09cd0:	00008821 	move	s1,zero
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:13
bfc09cd4:	24140025 	li	s4,37
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:79
bfc09cd8:	2415000a 	li	s5,10
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:13
bfc09cdc:	12140016 	beq	s0,s4,bfc09d38 <printf+0xb8>
bfc09ce0:	02711021 	addu	v0,s3,s1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:79
bfc09ce4:	1215002f 	beq	s0,s5,bfc09da4 <printf+0x124>
bfc09ce8:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:80
bfc09cec:	0ff027b9 	jal	bfc09ee4 <putchar>
bfc09cf0:	02002021 	move	a0,s0
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:10
bfc09cf4:	26310001 	addiu	s1,s1,1
bfc09cf8:	02711021 	addu	v0,s3,s1
bfc09cfc:	80500000 	lb	s0,0(v0)
bfc09d00:	00000000 	nop
bfc09d04:	1600fff5 	bnez	s0,bfc09cdc <printf+0x5c>
bfc09d08:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:84
bfc09d0c:	8fbf0034 	lw	ra,52(sp)
bfc09d10:	00001021 	move	v0,zero
bfc09d14:	8fb60030 	lw	s6,48(sp)
bfc09d18:	8fb5002c 	lw	s5,44(sp)
bfc09d1c:	8fb40028 	lw	s4,40(sp)
bfc09d20:	8fb30024 	lw	s3,36(sp)
bfc09d24:	8fb20020 	lw	s2,32(sp)
bfc09d28:	8fb1001c 	lw	s1,28(sp)
bfc09d2c:	8fb00018 	lw	s0,24(sp)
bfc09d30:	03e00008 	jr	ra
bfc09d34:	27bd0038 	addiu	sp,sp,56
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:13
bfc09d38:	80440001 	lb	a0,1(v0)
bfc09d3c:	24050001 	li	a1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:17
bfc09d40:	2482ffdb 	addiu	v0,a0,-37
bfc09d44:	304200ff 	andi	v0,v0,0xff
bfc09d48:	2c430054 	sltiu	v1,v0,84
bfc09d4c:	14600005 	bnez	v1,bfc09d64 <printf+0xe4>
bfc09d50:	00021080 	sll	v0,v0,0x2
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:73
bfc09d54:	0ff027b9 	jal	bfc09ee4 <putchar>
bfc09d58:	24040025 	li	a0,37
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:10
bfc09d5c:	0bf0273e 	j	bfc09cf8 <printf+0x78>
bfc09d60:	26310001 	addiu	s1,s1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:17
bfc09d64:	02c21021 	addu	v0,s6,v0
bfc09d68:	8c430000 	lw	v1,0(v0)
bfc09d6c:	00000000 	nop
bfc09d70:	00600008 	jr	v1
bfc09d74:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:65
bfc09d78:	26310001 	addiu	s1,s1,1
bfc09d7c:	02711021 	addu	v0,s3,s1
bfc09d80:	80440001 	lb	a0,1(v0)
bfc09d84:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:67
bfc09d88:	2482ffcf 	addiu	v0,a0,-49
bfc09d8c:	304200ff 	andi	v0,v0,0xff
bfc09d90:	2c420009 	sltiu	v0,v0,9
bfc09d94:	1440003f 	bnez	v0,bfc09e94 <printf+0x214>
bfc09d98:	00002821 	move	a1,zero
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:17
bfc09d9c:	0bf02751 	j	bfc09d44 <printf+0xc4>
bfc09da0:	2482ffdb 	addiu	v0,a0,-37
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:79
bfc09da4:	0ff027b9 	jal	bfc09ee4 <putchar>
bfc09da8:	2404000d 	li	a0,13
bfc09dac:	0bf0273b 	j	bfc09cec <printf+0x6c>
bfc09db0:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:30
bfc09db4:	8e440000 	lw	a0,0(s2)
bfc09db8:	2406000a 	li	a2,10
bfc09dbc:	0ff027f4 	jal	bfc09fd0 <printbase>
bfc09dc0:	00003821 	move	a3,zero
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:31
bfc09dc4:	26520004 	addiu	s2,s2,4
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:32
bfc09dc8:	0bf0273d 	j	bfc09cf4 <printf+0x74>
bfc09dcc:	26310001 	addiu	s1,s1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:20
bfc09dd0:	8e440000 	lw	a0,0(s2)
bfc09dd4:	0ff027c4 	jal	bfc09f10 <putstring>
bfc09dd8:	26310001 	addiu	s1,s1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:21
bfc09ddc:	0bf0273d 	j	bfc09cf4 <printf+0x74>
bfc09de0:	26520004 	addiu	s2,s2,4
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:56
bfc09de4:	8e440000 	lw	a0,0(s2)
bfc09de8:	24060010 	li	a2,16
bfc09dec:	0ff027f4 	jal	bfc09fd0 <printbase>
bfc09df0:	00003821 	move	a3,zero
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:57
bfc09df4:	26520004 	addiu	s2,s2,4
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:58
bfc09df8:	0bf0273d 	j	bfc09cf4 <printf+0x74>
bfc09dfc:	26310001 	addiu	s1,s1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:45
bfc09e00:	8e440000 	lw	a0,0(s2)
bfc09e04:	24060008 	li	a2,8
bfc09e08:	0ff027f4 	jal	bfc09fd0 <printbase>
bfc09e0c:	00003821 	move	a3,zero
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:46
bfc09e10:	26520004 	addiu	s2,s2,4
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:47
bfc09e14:	0bf0273d 	j	bfc09cf4 <printf+0x74>
bfc09e18:	26310001 	addiu	s1,s1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:40
bfc09e1c:	8e440000 	lw	a0,0(s2)
bfc09e20:	2406000a 	li	a2,10
bfc09e24:	0ff027f4 	jal	bfc09fd0 <printbase>
bfc09e28:	00003821 	move	a3,zero
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:41
bfc09e2c:	26520004 	addiu	s2,s2,4
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:42
bfc09e30:	0bf0273d 	j	bfc09cf4 <printf+0x74>
bfc09e34:	26310002 	addiu	s1,s1,2
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:35
bfc09e38:	8e440000 	lw	a0,0(s2)
bfc09e3c:	2406000a 	li	a2,10
bfc09e40:	0ff027f4 	jal	bfc09fd0 <printbase>
bfc09e44:	24070001 	li	a3,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:36
bfc09e48:	26520004 	addiu	s2,s2,4
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:37
bfc09e4c:	0bf0273d 	j	bfc09cf4 <printf+0x74>
bfc09e50:	26310001 	addiu	s1,s1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:25
bfc09e54:	8e440000 	lw	a0,0(s2)
bfc09e58:	0ff027b9 	jal	bfc09ee4 <putchar>
bfc09e5c:	26310001 	addiu	s1,s1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:26
bfc09e60:	0bf0273d 	j	bfc09cf4 <printf+0x74>
bfc09e64:	26520004 	addiu	s2,s2,4
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:50
bfc09e68:	8e440000 	lw	a0,0(s2)
bfc09e6c:	24060002 	li	a2,2
bfc09e70:	0ff027f4 	jal	bfc09fd0 <printbase>
bfc09e74:	00003821 	move	a3,zero
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:51
bfc09e78:	26520004 	addiu	s2,s2,4
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:52
bfc09e7c:	0bf0273d 	j	bfc09cf4 <printf+0x74>
bfc09e80:	26310001 	addiu	s1,s1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:61
bfc09e84:	0ff027b9 	jal	bfc09ee4 <putchar>
bfc09e88:	24040025 	li	a0,37
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:62
bfc09e8c:	0bf0273d 	j	bfc09cf4 <printf+0x74>
bfc09e90:	26310001 	addiu	s1,s1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:67
bfc09e94:	02713021 	addu	a2,s3,s1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:68
bfc09e98:	000510c0 	sll	v0,a1,0x3
bfc09e9c:	00051840 	sll	v1,a1,0x1
bfc09ea0:	00621821 	addu	v1,v1,v0
bfc09ea4:	00641821 	addu	v1,v1,a0
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:67
bfc09ea8:	80c40002 	lb	a0,2(a2)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:68
bfc09eac:	2465ffd0 	addiu	a1,v1,-48
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:67
bfc09eb0:	2482ffcf 	addiu	v0,a0,-49
bfc09eb4:	304200ff 	andi	v0,v0,0xff
bfc09eb8:	2c420009 	sltiu	v0,v0,9
bfc09ebc:	26310001 	addiu	s1,s1,1
bfc09ec0:	1040ff9f 	beqz	v0,bfc09d40 <printf+0xc0>
bfc09ec4:	24c60001 	addiu	a2,a2,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printf.c:68
bfc09ec8:	0bf027a7 	j	bfc09e9c <printf+0x21c>
bfc09ecc:	000510c0 	sll	v0,a1,0x3

bfc09ed0 <tgt_putchar>:
tgt_putchar():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/putchar.c:9
bfc09ed0:	3c19bfb0 	lui	t9,0xbfb0
bfc09ed4:	03e00008 	jr	ra
bfc09ed8:	a324fff0 	sb	a0,-16(t9)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/putchar.c:18
bfc09edc:	03e00008 	jr	ra
bfc09ee0:	00000000 	nop

bfc09ee4 <putchar>:
putchar():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/putchar.c:2
bfc09ee4:	27bdffe8 	addiu	sp,sp,-24
bfc09ee8:	afbf0014 	sw	ra,20(sp)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/putchar.c:3
bfc09eec:	0ff027b4 	jal	bfc09ed0 <tgt_putchar>
bfc09ef0:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/putchar.c:5
bfc09ef4:	8fbf0014 	lw	ra,20(sp)
bfc09ef8:	00001021 	move	v0,zero
bfc09efc:	03e00008 	jr	ra
bfc09f00:	27bd0018 	addiu	sp,sp,24
	...

bfc09f10 <putstring>:
putstring():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:2
bfc09f10:	27bdffe0 	addiu	sp,sp,-32
bfc09f14:	afb10014 	sw	s1,20(sp)
bfc09f18:	afbf001c 	sw	ra,28(sp)
bfc09f1c:	afb20018 	sw	s2,24(sp)
bfc09f20:	afb00010 	sw	s0,16(sp)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:4
bfc09f24:	80900000 	lb	s0,0(a0)
bfc09f28:	00000000 	nop
bfc09f2c:	12000013 	beqz	s0,bfc09f7c <putstring+0x6c>
bfc09f30:	00808821 	move	s1,a0
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:6
bfc09f34:	0bf027d5 	j	bfc09f54 <putstring+0x44>
bfc09f38:	2412000a 	li	s2,10
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:7
bfc09f3c:	0ff027b9 	jal	bfc09ee4 <putchar>
bfc09f40:	02002021 	move	a0,s0
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:4
bfc09f44:	82300000 	lb	s0,0(s1)
bfc09f48:	00000000 	nop
bfc09f4c:	1200000b 	beqz	s0,bfc09f7c <putstring+0x6c>
bfc09f50:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:6
bfc09f54:	1612fff9 	bne	s0,s2,bfc09f3c <putstring+0x2c>
bfc09f58:	26310001 	addiu	s1,s1,1
bfc09f5c:	0ff027b9 	jal	bfc09ee4 <putchar>
bfc09f60:	2404000d 	li	a0,13
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:7
bfc09f64:	0ff027b9 	jal	bfc09ee4 <putchar>
bfc09f68:	02002021 	move	a0,s0
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:4
bfc09f6c:	82300000 	lb	s0,0(s1)
bfc09f70:	00000000 	nop
bfc09f74:	1600fff7 	bnez	s0,bfc09f54 <putstring+0x44>
bfc09f78:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:11
bfc09f7c:	8fbf001c 	lw	ra,28(sp)
bfc09f80:	00001021 	move	v0,zero
bfc09f84:	8fb20018 	lw	s2,24(sp)
bfc09f88:	8fb10014 	lw	s1,20(sp)
bfc09f8c:	8fb00010 	lw	s0,16(sp)
bfc09f90:	03e00008 	jr	ra
bfc09f94:	27bd0020 	addiu	sp,sp,32

bfc09f98 <puts>:
puts():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:15
bfc09f98:	27bdffe8 	addiu	sp,sp,-24
bfc09f9c:	afbf0014 	sw	ra,20(sp)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:16
bfc09fa0:	0ff027c4 	jal	bfc09f10 <putstring>
bfc09fa4:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:17
bfc09fa8:	0ff027b9 	jal	bfc09ee4 <putchar>
bfc09fac:	2404000d 	li	a0,13
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:18
bfc09fb0:	0ff027b9 	jal	bfc09ee4 <putchar>
bfc09fb4:	2404000a 	li	a0,10
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/puts.c:20
bfc09fb8:	8fbf0014 	lw	ra,20(sp)
bfc09fbc:	00001021 	move	v0,zero
bfc09fc0:	03e00008 	jr	ra
bfc09fc4:	27bd0018 	addiu	sp,sp,24
	...

bfc09fd0 <printbase>:
printbase():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:2
bfc09fd0:	27bdff98 	addiu	sp,sp,-104
bfc09fd4:	afb30060 	sw	s3,96(sp)
bfc09fd8:	afb2005c 	sw	s2,92(sp)
bfc09fdc:	afbf0064 	sw	ra,100(sp)
bfc09fe0:	afb10058 	sw	s1,88(sp)
bfc09fe4:	afb00054 	sw	s0,84(sp)
bfc09fe8:	00801821 	move	v1,a0
bfc09fec:	00a09821 	move	s3,a1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:7
bfc09ff0:	10e00003 	beqz	a3,bfc0a000 <printbase+0x30>
bfc09ff4:	00c09021 	move	s2,a2
bfc09ff8:	0480002f 	bltz	a0,bfc0a0b8 <printbase+0xe8>
bfc09ffc:	2404002d 	li	a0,45
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:12
bfc0a000:	00608021 	move	s0,v1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:14
bfc0a004:	1200000c 	beqz	s0,bfc0a038 <printbase+0x68>
bfc0a008:	00008821 	move	s1,zero
bfc0a00c:	27a50010 	addiu	a1,sp,16
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:16
bfc0a010:	16400002 	bnez	s2,bfc0a01c <printbase+0x4c>
bfc0a014:	0212001b 	divu	zero,s0,s2
bfc0a018:	0007000d 	break	0x7
bfc0a01c:	00b12021 	addu	a0,a1,s1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:14
bfc0a020:	26310001 	addiu	s1,s1,1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:16
bfc0a024:	00001010 	mfhi	v0
bfc0a028:	a0820000 	sb	v0,0(a0)
bfc0a02c:	00001812 	mflo	v1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:14
bfc0a030:	1460fff7 	bnez	v1,bfc0a010 <printbase+0x40>
bfc0a034:	00608021 	move	s0,v1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:22
bfc0a038:	0233102a 	slt	v0,s1,s3
bfc0a03c:	10400002 	beqz	v0,bfc0a048 <printbase+0x78>
bfc0a040:	02201821 	move	v1,s1
bfc0a044:	02601821 	move	v1,s3
bfc0a048:	1060000c 	beqz	v1,bfc0a07c <printbase+0xac>
bfc0a04c:	2470ffff 	addiu	s0,v1,-1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:2
bfc0a050:	27a20010 	addiu	v0,sp,16
bfc0a054:	00509021 	addu	s2,v0,s0
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:24
bfc0a058:	26020001 	addiu	v0,s0,1
bfc0a05c:	0222102a 	slt	v0,s1,v0
bfc0a060:	1040000e 	beqz	v0,bfc0a09c <printbase+0xcc>
bfc0a064:	24040030 	li	a0,48
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:25
bfc0a068:	02009821 	move	s3,s0
bfc0a06c:	0ff027b9 	jal	bfc09ee4 <putchar>
bfc0a070:	2610ffff 	addiu	s0,s0,-1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:22
bfc0a074:	1660fff8 	bnez	s3,bfc0a058 <printbase+0x88>
bfc0a078:	2652ffff 	addiu	s2,s2,-1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:28
bfc0a07c:	8fbf0064 	lw	ra,100(sp)
bfc0a080:	00001021 	move	v0,zero
bfc0a084:	8fb30060 	lw	s3,96(sp)
bfc0a088:	8fb2005c 	lw	s2,92(sp)
bfc0a08c:	8fb10058 	lw	s1,88(sp)
bfc0a090:	8fb00054 	lw	s0,84(sp)
bfc0a094:	03e00008 	jr	ra
bfc0a098:	27bd0068 	addiu	sp,sp,104
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:24
bfc0a09c:	82440000 	lb	a0,0(s2)
bfc0a0a0:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:25
bfc0a0a4:	2882000a 	slti	v0,a0,10
bfc0a0a8:	14400007 	bnez	v0,bfc0a0c8 <printbase+0xf8>
bfc0a0ac:	02009821 	move	s3,s0
bfc0a0b0:	0bf0281b 	j	bfc0a06c <printbase+0x9c>
bfc0a0b4:	24840057 	addiu	a0,a0,87
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:10
bfc0a0b8:	0ff027b9 	jal	bfc09ee4 <putchar>
bfc0a0bc:	00038023 	negu	s0,v1
bfc0a0c0:	0bf02801 	j	bfc0a004 <printbase+0x34>
bfc0a0c4:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/printbase.c:25
bfc0a0c8:	0bf0281a 	j	bfc0a068 <printbase+0x98>
bfc0a0cc:	24840030 	addiu	a0,a0,48

bfc0a0d0 <_get_count>:
_get_count():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:14
bfc0a0d0:	3c19bfb0 	lui	t9,0xbfb0
bfc0a0d4:	8f22e000 	lw	v0,-8192(t9)
bfc0a0d8:	03e00008 	jr	ra
bfc0a0dc:	00000000 	nop

bfc0a0e0 <get_count>:
get_count():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:19
bfc0a0e0:	3c19bfb0 	lui	t9,0xbfb0
bfc0a0e4:	8f22e000 	lw	v0,-8192(t9)
bfc0a0e8:	03e00008 	jr	ra
bfc0a0ec:	00000000 	nop

bfc0a0f0 <get_clock>:
get_clock():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:38
bfc0a0f0:	3c19bfb0 	lui	t9,0xbfb0
bfc0a0f4:	8f22e000 	lw	v0,-8192(t9)
bfc0a0f8:	03e00008 	jr	ra
bfc0a0fc:	00000000 	nop

bfc0a100 <get_ns>:
_get_count():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:6
bfc0a100:	3c19bfb0 	lui	t9,0xbfb0
bfc0a104:	8f22e000 	lw	v0,-8192(t9)
bfc0a108:	00000000 	nop
bfc0a10c:	000218c0 	sll	v1,v0,0x3
bfc0a110:	00021040 	sll	v0,v0,0x1
get_ns():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:46
bfc0a114:	03e00008 	jr	ra
bfc0a118:	00431021 	addu	v0,v0,v1

bfc0a11c <clock_gettime>:
clock_gettime():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:22
bfc0a11c:	27bdffe8 	addiu	sp,sp,-24
bfc0a120:	afbf0014 	sw	ra,20(sp)
bfc0a124:	00a05021 	move	t2,a1
_get_count():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:6
bfc0a128:	3c19bfb0 	lui	t9,0xbfb0
bfc0a12c:	8f26e000 	lw	a2,-8192(t9)
clock_gettime():
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:27
bfc0a130:	3c030001 	lui	v1,0x1
bfc0a134:	346386a0 	ori	v1,v1,0x86a0
bfc0a138:	14600002 	bnez	v1,bfc0a144 <clock_gettime+0x28>
bfc0a13c:	00c3001b 	divu	zero,a2,v1
bfc0a140:	0007000d 	break	0x7
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:26
bfc0a144:	24080064 	li	t0,100
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:28
bfc0a148:	3c054876 	lui	a1,0x4876
bfc0a14c:	34a5e800 	ori	a1,a1,0xe800
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:25
bfc0a150:	000610c0 	sll	v0,a2,0x3
bfc0a154:	00063840 	sll	a3,a2,0x1
bfc0a158:	00e23821 	addu	a3,a3,v0
bfc0a15c:	240203e8 	li	v0,1000
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:29
bfc0a160:	3c04bfc1 	lui	a0,0xbfc1
bfc0a164:	2484ab80 	addiu	a0,a0,-21632
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:27
bfc0a168:	00001812 	mflo	v1
bfc0a16c:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:26
bfc0a170:	15000002 	bnez	t0,bfc0a17c <clock_gettime+0x60>
bfc0a174:	00c8001b 	divu	zero,a2,t0
bfc0a178:	0007000d 	break	0x7
bfc0a17c:	00004012 	mflo	t0
bfc0a180:	00000000 	nop
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:28
bfc0a184:	14a00002 	bnez	a1,bfc0a190 <clock_gettime+0x74>
bfc0a188:	00c5001b 	divu	zero,a2,a1
bfc0a18c:	0007000d 	break	0x7
bfc0a190:	00003012 	mflo	a2
bfc0a194:	ad460000 	sw	a2,0(t2)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:27
bfc0a198:	14400002 	bnez	v0,bfc0a1a4 <clock_gettime+0x88>
bfc0a19c:	0062001b 	divu	zero,v1,v0
bfc0a1a0:	0007000d 	break	0x7
bfc0a1a4:	00004810 	mfhi	t1
bfc0a1a8:	ad49000c 	sw	t1,12(t2)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:25
bfc0a1ac:	14400002 	bnez	v0,bfc0a1b8 <clock_gettime+0x9c>
bfc0a1b0:	00e2001b 	divu	zero,a3,v0
bfc0a1b4:	0007000d 	break	0x7
bfc0a1b8:	00002810 	mfhi	a1
bfc0a1bc:	ad450004 	sw	a1,4(t2)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:26
bfc0a1c0:	14400002 	bnez	v0,bfc0a1cc <clock_gettime+0xb0>
bfc0a1c4:	0102001b 	divu	zero,t0,v0
bfc0a1c8:	0007000d 	break	0x7
bfc0a1cc:	00001810 	mfhi	v1
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:29
bfc0a1d0:	0ff02720 	jal	bfc09c80 <printf>
bfc0a1d4:	ad430008 	sw	v1,8(t2)
/media/sf_book/cpu_book_20200422/lab/lab19/perf_func/lib/time.c:31
bfc0a1d8:	8fbf0014 	lw	ra,20(sp)
bfc0a1dc:	00001021 	move	v0,zero
bfc0a1e0:	03e00008 	jr	ra
bfc0a1e4:	27bd0018 	addiu	sp,sp,24
	...

Disassembly of section .data:

bfc0a1f0 <list_known_crc-0x6a0>:
bfc0a1f0:	65726f63 	0x65726f63
bfc0a1f4:	6b72616d 	0x6b72616d
bfc0a1f8:	73657420 	0x73657420
bfc0a1fc:	65622074 	0x65622074
bfc0a200:	2e6e6967 	sltiu	t6,s3,26983
bfc0a204:	00000000 	nop
bfc0a208:	65726f63 	0x65726f63
bfc0a20c:	6b72616d 	0x6b72616d
bfc0a210:	53415020 	0x53415020
bfc0a214:	00002153 	0x2153
bfc0a218:	65726f63 	0x65726f63
bfc0a21c:	6b72616d 	0x6b72616d
bfc0a220:	52524520 	0x52524520
bfc0a224:	2121524f 	addi	at,t1,21071
bfc0a228:	00000021 	move	zero,zero
bfc0a22c:	20677261 	addi	a3,v1,29281
bfc0a230:	6c25203a 	0x6c25203a
bfc0a234:	25202c64 	addiu	zero,t1,11364
bfc0a238:	202c646c 	addi	t4,at,25708
bfc0a23c:	2c646c25 	sltiu	a0,v1,27685
bfc0a240:	646c2520 	0x646c2520
bfc0a244:	6c25202c 	0x6c25202c
bfc0a248:	25202c64 	addiu	zero,t1,11364
bfc0a24c:	202c646c 	addi	t4,at,25708
bfc0a250:	20646c25 	addi	a0,v1,27685
bfc0a254:	0000000a 	0xa
bfc0a258:	74736574 	jalx	b1cd95d0 <data_size+0xb1cd8bec>
bfc0a25c:	61747320 	0x61747320
bfc0a260:	00007472 	0x7472
bfc0a264:	5f746567 	0x5f746567
bfc0a268:	6520736e 	0x6520736e
bfc0a26c:	726f7272 	0x726f7272
bfc0a270:	00002021 	move	a0,zero
bfc0a274:	706d6f63 	0x706d6f63
bfc0a278:	74617475 	jalx	b185d1d4 <data_size+0xb185c7f0>
bfc0a27c:	206e6f69 	addi	t6,v1,28521
bfc0a280:	656e6f64 	0x656e6f64
bfc0a284:	00000020 	add	zero,zero,zero
bfc0a288:	70206b36 	0x70206b36
bfc0a28c:	6f667265 	0x6f667265
bfc0a290:	6e616d72 	0x6e616d72
bfc0a294:	72206563 	0x72206563
bfc0a298:	70206e75 	0x70206e75
bfc0a29c:	6d617261 	0x6d617261
bfc0a2a0:	72657465 	0x72657465
bfc0a2a4:	6f662073 	0x6f662073
bfc0a2a8:	6f632072 	0x6f632072
bfc0a2ac:	616d6572 	0x616d6572
bfc0a2b0:	002e6b72 	0x2e6b72
bfc0a2b4:	76206b36 	jalx	b881acd8 <data_size+0xb881a2f4>
bfc0a2b8:	64696c61 	0x64696c61
bfc0a2bc:	6f697461 	0x6f697461
bfc0a2c0:	7572206e 	jalx	b5c881b8 <data_size+0xb5c877d4>
bfc0a2c4:	6170206e 	0x6170206e
bfc0a2c8:	656d6172 	0x656d6172
bfc0a2cc:	73726574 	0x73726574
bfc0a2d0:	726f6620 	0x726f6620
bfc0a2d4:	726f6320 	0x726f6320
bfc0a2d8:	72616d65 	0x72616d65
bfc0a2dc:	00002e6b 	0x2e6b
bfc0a2e0:	666f7250 	0x666f7250
bfc0a2e4:	20656c69 	addi	a1,v1,27753
bfc0a2e8:	656e6567 	0x656e6567
bfc0a2ec:	69746172 	0x69746172
bfc0a2f0:	72206e6f 	0x72206e6f
bfc0a2f4:	70206e75 	0x70206e75
bfc0a2f8:	6d617261 	0x6d617261
bfc0a2fc:	72657465 	0x72657465
bfc0a300:	6f662073 	0x6f662073
bfc0a304:	6f632072 	0x6f632072
bfc0a308:	616d6572 	0x616d6572
bfc0a30c:	002e6b72 	0x2e6b72
bfc0a310:	70204b32 	0x70204b32
bfc0a314:	6f667265 	0x6f667265
bfc0a318:	6e616d72 	0x6e616d72
bfc0a31c:	72206563 	0x72206563
bfc0a320:	70206e75 	0x70206e75
bfc0a324:	6d617261 	0x6d617261
bfc0a328:	72657465 	0x72657465
bfc0a32c:	6f662073 	0x6f662073
bfc0a330:	6f632072 	0x6f632072
bfc0a334:	616d6572 	0x616d6572
bfc0a338:	002e6b72 	0x2e6b72
bfc0a33c:	76204b32 	jalx	b8812cc8 <data_size+0xb88122e4>
bfc0a340:	64696c61 	0x64696c61
bfc0a344:	6f697461 	0x6f697461
bfc0a348:	7572206e 	jalx	b5c881b8 <data_size+0xb5c877d4>
bfc0a34c:	6170206e 	0x6170206e
bfc0a350:	656d6172 	0x656d6172
bfc0a354:	73726574 	0x73726574
bfc0a358:	726f6620 	0x726f6620
bfc0a35c:	726f6320 	0x726f6320
bfc0a360:	72616d65 	0x72616d65
bfc0a364:	00002e6b 	0x2e6b
bfc0a368:	5d75255b 	0x5d75255b
bfc0a36c:	4f525245 	c3	0x1525245
bfc0a370:	6c202152 	0x6c202152
bfc0a374:	20747369 	addi	s4,v1,29545
bfc0a378:	20637263 	addi	v1,v1,29283
bfc0a37c:	30257830 	andi	a1,at,0x7830
bfc0a380:	2d207834 	sltiu	zero,t1,30772
bfc0a384:	6f687320 	0x6f687320
bfc0a388:	20646c75 	addi	a0,v1,27765
bfc0a38c:	30206562 	andi	zero,at,0x6562
bfc0a390:	34302578 	ori	s0,at,0x2578
bfc0a394:	00000a78 	0xa78
bfc0a398:	5d75255b 	0x5d75255b
bfc0a39c:	4f525245 	c3	0x1525245
bfc0a3a0:	6d202152 	0x6d202152
bfc0a3a4:	69727461 	0x69727461
bfc0a3a8:	72632078 	0x72632078
bfc0a3ac:	78302063 	0x78302063
bfc0a3b0:	78343025 	0x78343025
bfc0a3b4:	73202d20 	0x73202d20
bfc0a3b8:	6c756f68 	0x6c756f68
bfc0a3bc:	65622064 	0x65622064
bfc0a3c0:	25783020 	addiu	t8,t3,12320
bfc0a3c4:	0a783430 	j	b9e0d0c0 <data_size+0xb9e0c6dc>
bfc0a3c8:	00000000 	nop
bfc0a3cc:	5d75255b 	0x5d75255b
bfc0a3d0:	4f525245 	c3	0x1525245
bfc0a3d4:	73202152 	0x73202152
bfc0a3d8:	65746174 	0x65746174
bfc0a3dc:	63726320 	0x63726320
bfc0a3e0:	25783020 	addiu	t8,t3,12320
bfc0a3e4:	20783430 	addi	t8,v1,13360
bfc0a3e8:	6873202d 	0x6873202d
bfc0a3ec:	646c756f 	0x646c756f
bfc0a3f0:	20656220 	addi	a1,v1,25120
bfc0a3f4:	30257830 	andi	a1,at,0x7830
bfc0a3f8:	000a7834 	0xa7834
bfc0a3fc:	65726f43 	0x65726f43
bfc0a400:	6b72614d 	0x6b72614d
bfc0a404:	7a695320 	0x7a695320
bfc0a408:	20202065 	addi	zero,at,8293
bfc0a40c:	25203a20 	addiu	zero,t1,14880
bfc0a410:	000a756c 	0xa756c
bfc0a414:	61746f54 	0x61746f54
bfc0a418:	736e206c 	0x736e206c
bfc0a41c:	25203a20 	addiu	zero,t1,14880
bfc0a420:	000a756c 	0xa756c
bfc0a424:	72657449 	0x72657449
bfc0a428:	6f697461 	0x6f697461
bfc0a42c:	312f736e 	andi	t7,t1,0x736e
bfc0a430:	53303030 	0x53303030
bfc0a434:	3a206365 	xori	zero,s1,0x6365
bfc0a438:	756c2520 	jalx	b5b09480 <data_size+0xb5b08a9c>
bfc0a43c:	0000000a 	0xa
bfc0a440:	20656854 	addi	a1,v1,26708
bfc0a444:	20555043 	addi	s5,v0,20547
bfc0a448:	71657246 	0x71657246
bfc0a44c:	756f7920 	jalx	b5bde480 <data_size+0xb5bdda9c>
bfc0a450:	74657320 	jalx	b195cc80 <data_size+0xb195c29c>
bfc0a454:	20736920 	addi	s3,v1,26912
bfc0a458:	4d756c25 	0x4d756c25
bfc0a45c:	000a7a48 	0xa7a48
bfc0a460:	43206f53 	c0	0x1206f53
bfc0a464:	4d45524f 	0x4d45524f
bfc0a468:	2f4b5241 	sltiu	t3,k0,21057
bfc0a46c:	205a484d 	addi	k0,v0,18509
bfc0a470:	6c25203a 	0x6c25203a
bfc0a474:	30312f75 	andi	s1,at,0x2f75
bfc0a478:	000a3030 	0xa3030
bfc0a47c:	45524f43 	0x45524f43
bfc0a480:	4b52414d 	c2	0x152414d
bfc0a484:	5a484d2f 	0x5a484d2f
bfc0a488:	28203d20 	slti	zero,at,15648
bfc0a48c:	30303031 	andi	s0,at,0x3031
bfc0a490:	2e303030 	sltiu	s0,s1,12336
bfc0a494:	50432f30 	0x50432f30
bfc0a498:	4f435f55 	c3	0x1435f55
bfc0a49c:	5f544e55 	0x5f544e55
bfc0a4a0:	5f524550 	0x5f524550
bfc0a4a4:	2a295355 	slti	t1,s1,21333
bfc0a4a8:	4345534e 	c0	0x145534e
bfc0a4ac:	5245505f 	0x5245505f
bfc0a4b0:	4553555f 	0x4553555f
bfc0a4b4:	65722a43 	0x65722a43
bfc0a4b8:	746c7573 	jalx	b1b1d5cc <data_size+0xb1b1cbe8>
bfc0a4bc:	5d305b73 	0x5d305b73
bfc0a4c0:	6574692e 	0x6574692e
bfc0a4c4:	69746172 	0x69746172
bfc0a4c8:	2f736e6f 	sltiu	s3,k1,28271
bfc0a4cc:	61746f74 	0x61746f74
bfc0a4d0:	736e5f6c 	0x736e5f6c
bfc0a4d4:	00000000 	nop
bfc0a4d8:	65207449 	0x65207449
bfc0a4dc:	6c617571 	0x6c617571
bfc0a4e0:	6f742073 	0x6f742073
bfc0a4e4:	30303120 	andi	s0,at,0x3120
bfc0a4e8:	7a484d30 	0x7a484d30
bfc0a4ec:	5550432f 	0x5550432f
bfc0a4f0:	6572465f 	0x6572465f
bfc0a4f4:	484d2871 	0x484d2871
bfc0a4f8:	2a20297a 	slti	zero,s1,10618
bfc0a4fc:	30303120 	andi	s0,at,0x3120
bfc0a500:	30312a30 	andi	s1,at,0x2a30
bfc0a504:	692a3030 	0x692a3030
bfc0a508:	61726574 	0x61726574
bfc0a50c:	6e6f6974 	0x6e6f6974
bfc0a510:	746f742f 	jalx	b1bdd0bc <data_size+0xb1bdc6d8>
bfc0a514:	6e5f6c61 	0x6e5f6c61
bfc0a518:	00000073 	0x73
bfc0a51c:	61207449 	0x61207449
bfc0a520:	206f736c 	addi	t7,v1,29548
bfc0a524:	61757165 	0x61757165
bfc0a528:	7420736c 	jalx	b081cdb0 <data_size+0xb081c3cc>
bfc0a52c:	4928206f 	0x4928206f
bfc0a530:	61726574 	0x61726574
bfc0a534:	6e6f6974 	0x6e6f6974
bfc0a538:	30312f73 	andi	s1,at,0x2f73
bfc0a53c:	65533030 	0x65533030
bfc0a540:	432f2963 	c0	0x12f2963
bfc0a544:	465f5550 	c1	0x5f5550
bfc0a548:	28716572 	slti	s1,v1,25970
bfc0a54c:	297a484d 	slti	k0,t3,18509
bfc0a550:	3030312f 	andi	s0,at,0x312f
bfc0a554:	00000030 	0x30
bfc0a558:	74206e49 	jalx	b081b924 <data_size+0xb081af40>
bfc0a55c:	20736968 	addi	s3,v1,26984
bfc0a560:	2c6e7572 	sltiu	t6,v1,30066
bfc0a564:	65746920 	0x65746920
bfc0a568:	65746172 	0x65746172
bfc0a56c:	756c253d 	jalx	b5b094f4 <data_size+0xb5b08b10>
bfc0a570:	6f74202c 	0x6f74202c
bfc0a574:	5f6c6174 	0x5f6c6174
bfc0a578:	253d736e 	addiu	sp,t1,29550
bfc0a57c:	0a0a756c 	j	b829d5b0 <data_size+0xb829cbcc>
bfc0a580:	00000000 	nop
bfc0a584:	61746f54 	0x61746f54
bfc0a588:	6974206c 	0x6974206c
bfc0a58c:	20736b63 	addi	s3,v1,27491
bfc0a590:	20202020 	addi	zero,at,8224
bfc0a594:	25203a20 	addiu	zero,t1,14880
bfc0a598:	000a756c 	0xa756c
bfc0a59c:	6e697270 	0x6e697270
bfc0a5a0:	74206674 	jalx	b08199d0 <data_size+0xb0818fec>
bfc0a5a4:	6c61746f 	0x6c61746f
bfc0a5a8:	20736e5f 	addi	s3,v1,28255
bfc0a5ac:	6f727265 	0x6f727265
bfc0a5b0:	00202172 	0x202172
bfc0a5b4:	72657449 	0x72657449
bfc0a5b8:	6f697461 	0x6f697461
bfc0a5bc:	2020736e 	addi	zero,at,29550
bfc0a5c0:	20202020 	addi	zero,at,8224
bfc0a5c4:	25203a20 	addiu	zero,t1,14880
bfc0a5c8:	000a756c 	0xa756c
bfc0a5cc:	706d6f43 	0x706d6f43
bfc0a5d0:	72656c69 	0x72656c69
bfc0a5d4:	72657620 	0x72657620
bfc0a5d8:	6e6f6973 	0x6e6f6973
bfc0a5dc:	25203a20 	addiu	zero,t1,14880
bfc0a5e0:	00000a73 	0xa73
bfc0a5e4:	34434347 	ori	v1,v0,0x4347
bfc0a5e8:	302e332e 	andi	t6,at,0x332e
bfc0a5ec:	00000000 	nop
bfc0a5f0:	706d6f43 	0x706d6f43
bfc0a5f4:	72656c69 	0x72656c69
bfc0a5f8:	616c6620 	0x616c6620
bfc0a5fc:	20207367 	addi	zero,at,29543
bfc0a600:	25203a20 	addiu	zero,t1,14880
bfc0a604:	00000a73 	0xa73
bfc0a608:	334f2d20 	andi	t7,k0,0x2d20
bfc0a60c:	6e6d2d20 	0x6e6d2d20
bfc0a610:	62612d6f 	0x62612d6f
bfc0a614:	6c616369 	0x6c616369
bfc0a618:	2d20736c 	sltiu	zero,t1,29548
bfc0a61c:	726e7566 	0x726e7566
bfc0a620:	2d6c6c6f 	sltiu	t4,t3,27759
bfc0a624:	2d6c6c61 	sltiu	t4,t3,27745
bfc0a628:	706f6f6c 	0x706f6f6c
bfc0a62c:	662d2073 	0x662d2073
bfc0a630:	67696c61 	0x67696c61
bfc0a634:	756a2d6e 	jalx	b5a8b5b8 <data_size+0xb5a8abd4>
bfc0a638:	3d73706d 	0x3d73706d
bfc0a63c:	2d203631 	sltiu	zero,t1,13873
bfc0a640:	696c6166 	0x696c6166
bfc0a644:	662d6e67 	0x662d6e67
bfc0a648:	74636e75 	jalx	b18db9d4 <data_size+0xb18daff0>
bfc0a64c:	736e6f69 	0x736e6f69
bfc0a650:	2036313d 	addi	s6,at,12605
bfc0a654:	6367662d 	0x6367662d
bfc0a658:	732d6573 	0x732d6573
bfc0a65c:	662d206d 	0x662d206d
bfc0a660:	65736367 	0x65736367
bfc0a664:	73616c2d 	0x73616c2d
bfc0a668:	69662d20 	0x69662d20
bfc0a66c:	6e696c6e 	0x6e696c6e
bfc0a670:	75662d65 	jalx	b598b594 <data_size+0xb598abb0>
bfc0a674:	6974636e 	0x6974636e
bfc0a678:	20736e6f 	addi	s3,v1,28271
bfc0a67c:	6e69662d 	0x6e69662d
bfc0a680:	656e696c 	0x656e696c
bfc0a684:	6d696c2d 	0x6d696c2d
bfc0a688:	313d7469 	andi	sp,t1,0x7469
bfc0a68c:	20303030 	addi	s0,at,12336
bfc0a690:	6f736d2d 	0x6f736d2d
bfc0a694:	662d7466 	0x662d7466
bfc0a698:	74616f6c 	jalx	b185bdb0 <data_size+0xb185b3cc>
bfc0a69c:	4c452d20 	0x4c452d20
bfc0a6a0:	616d2d20 	0x616d2d20
bfc0a6a4:	3d686372 	0x3d686372
bfc0a6a8:	7370696d 	0x7370696d
bfc0a6ac:	6d2d2031 	0x6d2d2031
bfc0a6b0:	31737069 	andi	s3,t3,0x7069
bfc0a6b4:	00000000 	nop
bfc0a6b8:	6f6d654d 	0x6f6d654d
bfc0a6bc:	6c207972 	0x6c207972
bfc0a6c0:	7461636f 	jalx	b1858dbc <data_size+0xb18583d8>
bfc0a6c4:	206e6f69 	addi	t6,v1,28521
bfc0a6c8:	25203a20 	addiu	zero,t1,14880
bfc0a6cc:	00000a73 	0xa73
bfc0a6d0:	61656c50 	0x61656c50
bfc0a6d4:	70206573 	0x70206573
bfc0a6d8:	64207475 	0x64207475
bfc0a6dc:	20617461 	addi	at,v1,29793
bfc0a6e0:	6f6d656d 	0x6f6d656d
bfc0a6e4:	6c207972 	0x6c207972
bfc0a6e8:	7461636f 	jalx	b1858dbc <data_size+0xb18583d8>
bfc0a6ec:	206e6f69 	addi	t6,v1,28521
bfc0a6f0:	65726568 	0x65726568
bfc0a6f4:	0909090a 	j	b4242428 <data_size+0xb4241a44>
bfc0a6f8:	672e6528 	0x672e6528
bfc0a6fc:	6f63202e 	0x6f63202e
bfc0a700:	69206564 	0x69206564
bfc0a704:	6c66206e 	0x6c66206e
bfc0a708:	2c687361 	sltiu	t0,v1,29537
bfc0a70c:	74616420 	jalx	b1859080 <data_size+0xb185869c>
bfc0a710:	6e6f2061 	0x6e6f2061
bfc0a714:	61656820 	0x61656820
bfc0a718:	74652070 	jalx	b19481c0 <data_size+0xb19477dc>
bfc0a71c:	00002963 	0x2963
bfc0a720:	64656573 	0x64656573
bfc0a724:	20637263 	addi	v1,v1,29283
bfc0a728:	20202020 	addi	zero,at,8224
bfc0a72c:	20202020 	addi	zero,at,8224
bfc0a730:	30203a20 	andi	zero,at,0x3a20
bfc0a734:	34302578 	ori	s0,at,0x2578
bfc0a738:	00000a78 	0xa78
bfc0a73c:	5d64255b 	0x5d64255b
bfc0a740:	6c637263 	0x6c637263
bfc0a744:	20747369 	addi	s4,v1,29545
bfc0a748:	20202020 	addi	zero,at,8224
bfc0a74c:	203a2020 	addi	k0,at,8224
bfc0a750:	30257830 	andi	a1,at,0x7830
bfc0a754:	000a7834 	0xa7834
bfc0a758:	5d64255b 	0x5d64255b
bfc0a75c:	6d637263 	0x6d637263
bfc0a760:	69727461 	0x69727461
bfc0a764:	20202078 	addi	zero,at,8312
bfc0a768:	203a2020 	addi	k0,at,8224
bfc0a76c:	30257830 	andi	a1,at,0x7830
bfc0a770:	000a7834 	0xa7834
bfc0a774:	5d64255b 	0x5d64255b
bfc0a778:	73637263 	0x73637263
bfc0a77c:	65746174 	0x65746174
bfc0a780:	20202020 	addi	zero,at,8224
bfc0a784:	203a2020 	addi	k0,at,8224
bfc0a788:	30257830 	andi	a1,at,0x7830
bfc0a78c:	000a7834 	0xa7834
bfc0a790:	5d64255b 	0x5d64255b
bfc0a794:	66637263 	0x66637263
bfc0a798:	6c616e69 	0x6c616e69
bfc0a79c:	20202020 	addi	zero,at,8224
bfc0a7a0:	203a2020 	addi	k0,at,8224
bfc0a7a4:	30257830 	andi	a1,at,0x7830
bfc0a7a8:	000a7834 	0xa7834
bfc0a7ac:	72726f43 	0x72726f43
bfc0a7b0:	20746365 	addi	s4,v1,25445
bfc0a7b4:	7265706f 	0x7265706f
bfc0a7b8:	6f697461 	0x6f697461
bfc0a7bc:	6176206e 	0x6176206e
bfc0a7c0:	6164696c 	0x6164696c
bfc0a7c4:	2e646574 	sltiu	a0,s3,25972
bfc0a7c8:	65655320 	0x65655320
bfc0a7cc:	61657220 	0x61657220
bfc0a7d0:	2e656d64 	sltiu	a1,s3,28004
bfc0a7d4:	20747874 	addi	s4,v1,30836
bfc0a7d8:	20726f66 	addi	s2,v1,28518
bfc0a7dc:	206e7572 	addi	t6,v1,30066
bfc0a7e0:	20646e61 	addi	a0,v1,28257
bfc0a7e4:	6f706572 	0x6f706572
bfc0a7e8:	6e697472 	0x6e697472
bfc0a7ec:	75722067 	jalx	b5c8819c <data_size+0xb5c877b8>
bfc0a7f0:	2e73656c 	sltiu	s3,s3,25964
bfc0a7f4:	00000000 	nop
bfc0a7f8:	6f727245 	0x6f727245
bfc0a7fc:	64207372 	0x64207372
bfc0a800:	63657465 	0x63657465
bfc0a804:	00646574 	0x646574
bfc0a808:	6e6e6143 	0x6e6e6143
bfc0a80c:	7620746f 	jalx	b881d1bc <data_size+0xb881c7d8>
bfc0a810:	64696c61 	0x64696c61
bfc0a814:	20657461 	addi	a1,v1,29793
bfc0a818:	7265706f 	0x7265706f
bfc0a81c:	6f697461 	0x6f697461
bfc0a820:	6f66206e 	0x6f66206e
bfc0a824:	68742072 	0x68742072
bfc0a828:	20657365 	addi	a1,v1,29541
bfc0a82c:	64656573 	0x64656573
bfc0a830:	6c617620 	0x6c617620
bfc0a834:	2c736575 	sltiu	s3,v1,25973
bfc0a838:	656c7020 	0x656c7020
bfc0a83c:	20657361 	addi	a1,v1,29537
bfc0a840:	706d6f63 	0x706d6f63
bfc0a844:	20657261 	addi	a1,v1,29281
bfc0a848:	68746977 	0x68746977
bfc0a84c:	73657220 	0x73657220
bfc0a850:	73746c75 	0x73746c75
bfc0a854:	206e6f20 	addi	t6,v1,28448
bfc0a858:	6e6b2061 	0x6e6b2061
bfc0a85c:	206e776f 	addi	t6,v1,30575
bfc0a860:	74616c70 	jalx	b185b1c0 <data_size+0xb185a7dc>
bfc0a864:	6d726f66 	0x6d726f66
bfc0a868:	0000002e 	0x2e
bfc0a86c:	74617453 	jalx	b185d14c <data_size+0xb185c768>
bfc0a870:	00006369 	0x6369
bfc0a874:	70616548 	0x70616548
bfc0a878:	00000000 	nop
bfc0a87c:	63617453 	0x63617453
bfc0a880:	0000006b 	0x6b
	...

bfc0a890 <list_known_crc>:
bfc0a890:	3340d4b0 	andi	zero,k0,0xd4b0
bfc0a894:	e7146a79 	swc1	$f20,27257(t8)
bfc0a898:	0000e3c1 	0xe3c1

bfc0a89c <matrix_known_crc>:
bfc0a89c:	1199be52 	beq	t4,t9,bfbfa1e8 <data_size+0xbfbf9804>
bfc0a8a0:	1fd75608 	0x1fd75608
bfc0a8a4:	00000747 	0x747

bfc0a8a8 <state_known_crc>:
bfc0a8a8:	39bf5e47 	xori	ra,t5,0x5e47
bfc0a8ac:	8e3ae5a4 	lw	k0,-6748(s1)
bfc0a8b0:	00008d84 	0x8d84
	...
bfc0a8c0:	bfc070d0 	0xbfc070d0
bfc0a8c4:	bfc070d0 	0xbfc070d0
bfc0a8c8:	bfc070d0 	0xbfc070d0
bfc0a8cc:	bfc070b0 	0xbfc070b0
bfc0a8d0:	bfc070b0 	0xbfc070b0
bfc0a8d4:	bfc07090 	0xbfc07090
bfc0a8d8:	bfc07090 	0xbfc07090
bfc0a8dc:	bfc06f40 	0xbfc06f40
bfc0a8e0:	bfc07600 	0xbfc07600
bfc0a8e4:	bfc07624 	0xbfc07624
bfc0a8e8:	bfc07740 	0xbfc07740
bfc0a8ec:	bfc07770 	0xbfc07770
bfc0a8f0:	bfc07710 	0xbfc07710
bfc0a8f4:	bfc076d0 	0xbfc076d0
bfc0a8f8:	bfc076a0 	0xbfc076a0
bfc0a8fc:	bfc07670 	0xbfc07670
bfc0a900:	bfc07b50 	0xbfc07b50
bfc0a904:	bfc079a0 	0xbfc079a0
bfc0a908:	bfc07b80 	0xbfc07b80
bfc0a90c:	bfc07af0 	0xbfc07af0
bfc0a910:	bfc07ac0 	0xbfc07ac0
bfc0a914:	bfc07970 	0xbfc07970
bfc0a918:	bfc07b20 	0xbfc07b20
bfc0a91c:	bfc07a20 	0xbfc07a20
bfc0a920:	bfc07f50 	0xbfc07f50
bfc0a924:	bfc07d40 	0xbfc07d40
bfc0a928:	bfc07fe0 	0xbfc07fe0
bfc0a92c:	bfc07f80 	0xbfc07f80
bfc0a930:	bfc07fb0 	0xbfc07fb0
bfc0a934:	bfc07d10 	0xbfc07d10
bfc0a938:	bfc07f20 	0xbfc07f20
bfc0a93c:	bfc07dc0 	0xbfc07dc0

bfc0a940 <intpat>:
bfc0a940:	bfc0a980 	0xbfc0a980
bfc0a944:	bfc0a988 	0xbfc0a988
bfc0a948:	bfc0a990 	0xbfc0a990
bfc0a94c:	bfc0a998 	0xbfc0a998

bfc0a950 <floatpat>:
bfc0a950:	bfc0a9a0 	0xbfc0a9a0
bfc0a954:	bfc0a9ac 	0xbfc0a9ac
bfc0a958:	bfc0a9b8 	0xbfc0a9b8
bfc0a95c:	bfc0a9c4 	0xbfc0a9c4

bfc0a960 <scipat>:
bfc0a960:	bfc0a9d0 	0xbfc0a9d0
bfc0a964:	bfc0a9dc 	0xbfc0a9dc
bfc0a968:	bfc0a9e8 	0xbfc0a9e8
bfc0a96c:	bfc0a9f4 	0xbfc0a9f4

bfc0a970 <errpat>:
bfc0a970:	bfc0aa00 	0xbfc0aa00
bfc0a974:	bfc0aa0c 	0xbfc0aa0c
bfc0a978:	bfc0aa18 	0xbfc0aa18
bfc0a97c:	bfc0aa24 	0xbfc0aa24
bfc0a980:	32313035 	andi	s1,s1,0x3035
bfc0a984:	00000000 	nop
bfc0a988:	34333231 	ori	s3,at,0x3231
bfc0a98c:	00000000 	nop
bfc0a990:	3437382d 	ori	s7,at,0x382d
bfc0a994:	00000000 	nop
bfc0a998:	3232312b 	andi	s2,s1,0x312b
bfc0a99c:	00000000 	nop
bfc0a9a0:	352e3533 	ori	t6,t1,0x3533
bfc0a9a4:	30303434 	andi	s0,at,0x3434
bfc0a9a8:	00000000 	nop
bfc0a9ac:	3332312e 	andi	s2,t9,0x312e
bfc0a9b0:	30303534 	andi	s0,at,0x3534
bfc0a9b4:	00000000 	nop
bfc0a9b8:	3031312d 	andi	s1,at,0x312d
bfc0a9bc:	3030372e 	andi	s0,at,0x372e
bfc0a9c0:	00000000 	nop
bfc0a9c4:	362e302b 	ori	t6,s1,0x302b
bfc0a9c8:	30303434 	andi	s0,at,0x3434
bfc0a9cc:	00000000 	nop
bfc0a9d0:	30352e35 	andi	s5,at,0x2e35
bfc0a9d4:	332b6530 	andi	t3,t9,0x6530
bfc0a9d8:	00000000 	nop
bfc0a9dc:	32312e2d 	andi	s1,s1,0x2e2d
bfc0a9e0:	322d6533 	andi	t5,s1,0x6533
bfc0a9e4:	00000000 	nop
bfc0a9e8:	6537382d 	0x6537382d
bfc0a9ec:	3233382b 	andi	s3,s1,0x382b
bfc0a9f0:	00000000 	nop
bfc0a9f4:	362e302b 	ori	t6,s1,0x302b
bfc0a9f8:	32312d65 	andi	s1,s1,0x2d65
bfc0a9fc:	00000000 	nop
bfc0aa00:	332e3054 	andi	t6,t9,0x3054
bfc0aa04:	46312d65 	c1	0x312d65
bfc0aa08:	00000000 	nop
bfc0aa0c:	542e542d 	0x542e542d
bfc0aa10:	71542b2b 	0x71542b2b
bfc0aa14:	00000000 	nop
bfc0aa18:	2e335431 	sltiu	s3,s1,21553
bfc0aa1c:	7a346534 	0x7a346534
bfc0aa20:	00000000 	nop
bfc0aa24:	302e3433 	andi	t6,at,0x3433
bfc0aa28:	5e542d65 	0x5e542d65
bfc0aa2c:	00000000 	nop
bfc0aa30:	bfc09e84 	0xbfc09e84
bfc0aa34:	bfc09d54 	0xbfc09d54
bfc0aa38:	bfc09d54 	0xbfc09d54
bfc0aa3c:	bfc09d54 	0xbfc09d54
bfc0aa40:	bfc09d54 	0xbfc09d54
bfc0aa44:	bfc09d54 	0xbfc09d54
bfc0aa48:	bfc09d54 	0xbfc09d54
bfc0aa4c:	bfc09d54 	0xbfc09d54
bfc0aa50:	bfc09d54 	0xbfc09d54
bfc0aa54:	bfc09d54 	0xbfc09d54
bfc0aa58:	bfc09d54 	0xbfc09d54
bfc0aa5c:	bfc09d78 	0xbfc09d78
bfc0aa60:	bfc09d88 	0xbfc09d88
bfc0aa64:	bfc09d88 	0xbfc09d88
bfc0aa68:	bfc09d88 	0xbfc09d88
bfc0aa6c:	bfc09d88 	0xbfc09d88
bfc0aa70:	bfc09d88 	0xbfc09d88
bfc0aa74:	bfc09d88 	0xbfc09d88
bfc0aa78:	bfc09d88 	0xbfc09d88
bfc0aa7c:	bfc09d88 	0xbfc09d88
bfc0aa80:	bfc09d88 	0xbfc09d88
bfc0aa84:	bfc09d54 	0xbfc09d54
bfc0aa88:	bfc09d54 	0xbfc09d54
bfc0aa8c:	bfc09d54 	0xbfc09d54
bfc0aa90:	bfc09d54 	0xbfc09d54
bfc0aa94:	bfc09d54 	0xbfc09d54
bfc0aa98:	bfc09d54 	0xbfc09d54
bfc0aa9c:	bfc09d54 	0xbfc09d54
bfc0aaa0:	bfc09d54 	0xbfc09d54
bfc0aaa4:	bfc09d54 	0xbfc09d54
bfc0aaa8:	bfc09d54 	0xbfc09d54
bfc0aaac:	bfc09d54 	0xbfc09d54
bfc0aab0:	bfc09d54 	0xbfc09d54
bfc0aab4:	bfc09d54 	0xbfc09d54
bfc0aab8:	bfc09d54 	0xbfc09d54
bfc0aabc:	bfc09d54 	0xbfc09d54
bfc0aac0:	bfc09d54 	0xbfc09d54
bfc0aac4:	bfc09d54 	0xbfc09d54
bfc0aac8:	bfc09d54 	0xbfc09d54
bfc0aacc:	bfc09d54 	0xbfc09d54
bfc0aad0:	bfc09d54 	0xbfc09d54
bfc0aad4:	bfc09d54 	0xbfc09d54
bfc0aad8:	bfc09d54 	0xbfc09d54
bfc0aadc:	bfc09d54 	0xbfc09d54
bfc0aae0:	bfc09d54 	0xbfc09d54
bfc0aae4:	bfc09d54 	0xbfc09d54
bfc0aae8:	bfc09d54 	0xbfc09d54
bfc0aaec:	bfc09d54 	0xbfc09d54
bfc0aaf0:	bfc09d54 	0xbfc09d54
bfc0aaf4:	bfc09d54 	0xbfc09d54
bfc0aaf8:	bfc09d54 	0xbfc09d54
bfc0aafc:	bfc09d54 	0xbfc09d54
bfc0ab00:	bfc09d54 	0xbfc09d54
bfc0ab04:	bfc09d54 	0xbfc09d54
bfc0ab08:	bfc09d54 	0xbfc09d54
bfc0ab0c:	bfc09d54 	0xbfc09d54
bfc0ab10:	bfc09d54 	0xbfc09d54
bfc0ab14:	bfc09d54 	0xbfc09d54
bfc0ab18:	bfc09d54 	0xbfc09d54
bfc0ab1c:	bfc09d54 	0xbfc09d54
bfc0ab20:	bfc09d54 	0xbfc09d54
bfc0ab24:	bfc09e68 	0xbfc09e68
bfc0ab28:	bfc09e54 	0xbfc09e54
bfc0ab2c:	bfc09e38 	0xbfc09e38
bfc0ab30:	bfc09d54 	0xbfc09d54
bfc0ab34:	bfc09d54 	0xbfc09d54
bfc0ab38:	bfc09d54 	0xbfc09d54
bfc0ab3c:	bfc09d54 	0xbfc09d54
bfc0ab40:	bfc09d54 	0xbfc09d54
bfc0ab44:	bfc09d54 	0xbfc09d54
bfc0ab48:	bfc09d54 	0xbfc09d54
bfc0ab4c:	bfc09e1c 	0xbfc09e1c
bfc0ab50:	bfc09d54 	0xbfc09d54
bfc0ab54:	bfc09d54 	0xbfc09d54
bfc0ab58:	bfc09e00 	0xbfc09e00
bfc0ab5c:	bfc09de4 	0xbfc09de4
bfc0ab60:	bfc09d54 	0xbfc09d54
bfc0ab64:	bfc09d54 	0xbfc09d54
bfc0ab68:	bfc09dd0 	0xbfc09dd0
bfc0ab6c:	bfc09d54 	0xbfc09d54
bfc0ab70:	bfc09db4 	0xbfc09db4
bfc0ab74:	bfc09d54 	0xbfc09d54
bfc0ab78:	bfc09d54 	0xbfc09d54
bfc0ab7c:	bfc09de4 	0xbfc09de4
bfc0ab80:	636f6c63 	0x636f6c63
bfc0ab84:	736e206b 	0x736e206b
bfc0ab88:	2c64253d 	sltiu	a0,v1,9533
bfc0ab8c:	3d636573 	0x3d636573
bfc0ab90:	000a6425 	0xa6425
bfc0ab94:	b8007f00 	swr	zero,32512(zero)
	...

bfc0abac <_fdata>:
_fdata():
bfc0abac:	00000000 	nop

bfc0abb0 <mem_name>:
bfc0abb0:	bfc0a86c 	0xbfc0a86c
bfc0abb4:	bfc0a874 	0xbfc0a874
bfc0abb8:	bfc0a87c 	0xbfc0a87c
bfc0abbc:	00000000 	nop

bfc0abc0 <__CTOR_LIST__>:
	...

bfc0abc8 <__CTOR_END__>:
	...

bfc0abd0 <__DTOR_END__>:
__DTOR_END__():
bfc0abd0:	00000001 	0x1

Disassembly of section .sbss:

bfc0abd4 <stop_ns>:
bfc0abd4:	00000000 	nop

bfc0abd8 <total_ns>:
bfc0abd8:	00000000 	nop

bfc0abdc <int_tmp>:
bfc0abdc:	00000000 	nop

bfc0abe0 <start_ns>:
bfc0abe0:	00000000 	nop

Disassembly of section .bss:

bfc0abf0 <start_time_val>:
	...

bfc0ac00 <stop_time_val>:
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
  30:	bfc09c80 	0xbfc09c80
  34:	00000250 	0x250
	...
  40:	0000001c 	0x1c
  44:	01330002 	0x1330002
  48:	00040000 	sll	zero,a0,0x0
  4c:	00000000 	nop
  50:	bfc09ed0 	0xbfc09ed0
  54:	00000034 	0x34
	...
  60:	0000001c 	0x1c
  64:	01bf0002 	0x1bf0002
  68:	00040000 	sll	zero,a0,0x0
  6c:	00000000 	nop
  70:	bfc09f10 	0xbfc09f10
  74:	000000b8 	0xb8
	...
  80:	0000001c 	0x1c
  84:	026e0002 	0x26e0002
  88:	00040000 	sll	zero,a0,0x0
  8c:	00000000 	nop
  90:	bfc09fd0 	0xbfc09fd0
  94:	00000100 	sll	zero,zero,0x4
	...
  a0:	0000001c 	0x1c
  a4:	03690002 	0x3690002
  a8:	00040000 	sll	zero,a0,0x0
  ac:	00000000 	nop
  b0:	bfc0a0d0 	0xbfc0a0d0
  b4:	00000118 	0x118
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
  2c:	74000000 	jalx	0 <data_size-0x9e4>
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
  5c:	74757000 	jalx	1d5c000 <data_size+0x1d5b61c>
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
  94:	00000056 	0x56
  98:	03690002 	0x3690002
  9c:	01c50000 	0x1c50000
  a0:	00a70000 	0xa70000
  a4:	675f0000 	0x675f0000
  a8:	635f7465 	0x635f7465
  ac:	746e756f 	jalx	1b9d5bc <data_size+0x1b9cbd8>
  b0:	0000c400 	sll	t8,zero,0x10
  b4:	74656700 	jalx	1959c00 <data_size+0x195921c>
  b8:	756f635f 	jalx	5bd8d7c <data_size+0x5bd8398>
  bc:	de00746e 	0xde00746e
  c0:	67000000 	0x67000000
  c4:	635f7465 	0x635f7465
  c8:	6b636f6c 	0x6b636f6c
  cc:	00010600 	sll	zero,at,0x18
  d0:	74656700 	jalx	1959c00 <data_size+0x195921c>
  d4:	00736e5f 	0x736e5f
  d8:	00000152 	0x152
  dc:	636f6c63 	0x636f6c63
  e0:	65675f6b 	0x65675f6b
  e4:	6d697474 	0x6d697474
  e8:	00000065 	0x65
	...

Disassembly of section .pdr:

00000000 <.pdr>:
   0:	bfc00390 	0xbfc00390
   4:	80030000 	lb	v1,0(zero)
   8:	fffffffc 	0xfffffffc
	...
  14:	00000030 	0x30
  18:	0000001d 	0x1d
  1c:	0000001f 	0x1f
  20:	bfc00470 	0xbfc00470
  24:	800f0000 	lb	t7,0(zero)
  28:	fffffffc 	0xfffffffc
	...
  34:	00000028 	0x28
  38:	0000001d 	0x1d
  3c:	0000001f 	0x1f
  40:	bfc00600 	0xbfc00600
  44:	c0ff0000 	lwc0	$31,0(a3)
  48:	fffffffc 	0xfffffffc
	...
  54:	00000868 	0x868
  58:	0000001d 	0x1d
  5c:	0000001f 	0x1f
  60:	bfc01520 	0xbfc01520
  64:	003f0000 	0x3f0000
  68:	fffffffc 	0xfffffffc
	...
  74:	00000018 	mult	zero,zero
  78:	0000001d 	0x1d
  7c:	0000001f 	0x1f
  80:	bfc01910 	0xbfc01910
	...
  98:	0000001d 	0x1d
  9c:	0000001f 	0x1f
  a0:	bfc01c50 	0xbfc01c50
  a4:	00070000 	sll	zero,a3,0x0
  a8:	fffffffc 	0xfffffffc
	...
  b4:	00000010 	mfhi	zero
  b8:	0000001d 	0x1d
  bc:	0000001f 	0x1f
  c0:	bfc01e90 	0xbfc01e90
	...
  d8:	0000001d 	0x1d
  dc:	0000001f 	0x1f
  e0:	bfc02030 	0xbfc02030
  e4:	40ff0000 	0x40ff0000
  e8:	fffffffc 	0xfffffffc
	...
  f4:	00000028 	0x28
  f8:	0000001d 	0x1d
  fc:	0000001f 	0x1f
 100:	bfc022e0 	0xbfc022e0
 104:	40ff0000 	0x40ff0000
 108:	fffffffc 	0xfffffffc
	...
 114:	00000038 	0x38
 118:	0000001d 	0x1d
 11c:	0000001f 	0x1f
 120:	bfc025e0 	0xbfc025e0
 124:	40ff0000 	0x40ff0000
 128:	fffffffc 	0xfffffffc
	...
 134:	00000028 	0x28
 138:	0000001d 	0x1d
 13c:	0000001f 	0x1f
 140:	bfc02880 	0xbfc02880
 144:	c0ff0000 	lwc0	$31,0(a3)
 148:	fffffffc 	0xfffffffc
	...
 154:	00000060 	0x60
 158:	0000001d 	0x1d
 15c:	0000001f 	0x1f
 160:	bfc03fd0 	0xbfc03fd0
 164:	c0ff0000 	lwc0	$31,0(a3)
 168:	fffffffc 	0xfffffffc
	...
 174:	00000068 	0x68
 178:	0000001d 	0x1d
 17c:	0000001f 	0x1f
 180:	bfc05710 	0xbfc05710
	...
 198:	0000001d 	0x1d
 19c:	0000001f 	0x1f
 1a0:	bfc058b0 	0xbfc058b0
	...
 1b8:	0000001d 	0x1d
 1bc:	0000001f 	0x1f
 1c0:	bfc05ae0 	0xbfc05ae0
	...
 1d8:	0000001d 	0x1d
 1dc:	0000001f 	0x1f
 1e0:	bfc05af0 	0xbfc05af0
	...
 1f8:	0000001d 	0x1d
 1fc:	0000001f 	0x1f
 200:	bfc05f60 	0xbfc05f60
	...
 218:	0000001d 	0x1d
 21c:	0000001f 	0x1f
 220:	bfc063d0 	0xbfc063d0
	...
 238:	0000001d 	0x1d
 23c:	0000001f 	0x1f
 240:	bfc06cc0 	0xbfc06cc0
	...
 258:	0000001d 	0x1d
 25c:	0000001f 	0x1f
 260:	bfc06e80 	0xbfc06e80
 264:	00ff0000 	0xff0000
 268:	fffffffc 	0xfffffffc
	...
 274:	00000020 	add	zero,zero,zero
 278:	0000001d 	0x1d
 27c:	0000001f 	0x1f
 280:	bfc07570 	0xbfc07570
 284:	001f0000 	sll	zero,ra,0x0
 288:	fffffffc 	0xfffffffc
	...
 294:	00000018 	mult	zero,zero
 298:	0000001d 	0x1d
 29c:	0000001f 	0x1f
 2a0:	bfc078a0 	0xbfc078a0
 2a4:	801f0000 	lb	ra,0(zero)
 2a8:	fffffffc 	0xfffffffc
	...
 2b4:	00000068 	0x68
 2b8:	0000001d 	0x1d
 2bc:	0000001f 	0x1f
 2c0:	bfc08130 	0xbfc08130
	...
 2d8:	0000001d 	0x1d
 2dc:	0000001f 	0x1f
 2e0:	bfc081a0 	0xbfc081a0
	...
 2f8:	0000001d 	0x1d
 2fc:	0000001f 	0x1f
 300:	bfc081c0 	0xbfc081c0
	...
 318:	0000001d 	0x1d
 31c:	0000001f 	0x1f
 320:	bfc08240 	0xbfc08240
	...
 338:	0000001d 	0x1d
 33c:	0000001f 	0x1f
 340:	bfc08270 	0xbfc08270
	...
 358:	0000001d 	0x1d
 35c:	0000001f 	0x1f
 360:	bfc082a0 	0xbfc082a0
	...
 378:	0000001d 	0x1d
 37c:	0000001f 	0x1f
 380:	bfc08350 	0xbfc08350
	...
 398:	0000001d 	0x1d
 39c:	0000001f 	0x1f
 3a0:	bfc08400 	0xbfc08400
 3a4:	c0ff0000 	lwc0	$31,0(a3)
 3a8:	fffffffc 	0xfffffffc
	...
 3b4:	00000038 	0x38
 3b8:	0000001d 	0x1d
 3bc:	0000001f 	0x1f
 3c0:	bfc086c0 	0xbfc086c0
 3c4:	800f0000 	lb	t7,0(zero)
 3c8:	fffffffc 	0xfffffffc
	...
 3d4:	00000030 	0x30
 3d8:	0000001d 	0x1d
 3dc:	0000001f 	0x1f
 3e0:	bfc08820 	0xbfc08820
 3e4:	c0ff0000 	lwc0	$31,0(a3)
 3e8:	fffffffc 	0xfffffffc
	...
 3f4:	00000038 	0x38
 3f8:	0000001d 	0x1d
 3fc:	0000001f 	0x1f
 400:	bfc08ed0 	0xbfc08ed0
 404:	803f0000 	lb	ra,0(at)
 408:	fffffffc 	0xfffffffc
	...
 414:	00000038 	0x38
 418:	0000001d 	0x1d
 41c:	0000001f 	0x1f
 420:	bfc09110 	0xbfc09110
 424:	c0ff0000 	lwc0	$31,0(a3)
 428:	fffffffc 	0xfffffffc
	...
 434:	00000040 	sll	zero,zero,0x1
 438:	0000001d 	0x1d
 43c:	0000001f 	0x1f
 440:	bfc09ba0 	0xbfc09ba0
	...
 458:	0000001d 	0x1d
 45c:	0000001f 	0x1f
 460:	bfc09bb0 	0xbfc09bb0
	...
 478:	0000001d 	0x1d
 47c:	0000001f 	0x1f
 480:	bfc09bc0 	0xbfc09bc0
	...
 498:	0000001d 	0x1d
 49c:	0000001f 	0x1f
 4a0:	bfc09c20 	0xbfc09c20
	...
 4b8:	0000001d 	0x1d
 4bc:	0000001f 	0x1f
 4c0:	bfc09c40 	0xbfc09c40
	...
 4d8:	0000001d 	0x1d
 4dc:	0000001f 	0x1f
 4e0:	bfc09c50 	0xbfc09c50
	...
 4f8:	0000001d 	0x1d
 4fc:	0000001f 	0x1f
 500:	bfc09c60 	0xbfc09c60
	...
 518:	0000001d 	0x1d
 51c:	0000001f 	0x1f
 520:	bfc09c70 	0xbfc09c70
	...
 538:	0000001d 	0x1d
 53c:	0000001f 	0x1f
 540:	bfc09c80 	0xbfc09c80
 544:	807f0000 	lb	ra,0(v1)
 548:	fffffffc 	0xfffffffc
	...
 554:	00000038 	0x38
 558:	0000001d 	0x1d
 55c:	0000001f 	0x1f
 560:	bfc09ed0 	0xbfc09ed0
	...
 578:	0000001d 	0x1d
 57c:	0000001f 	0x1f
 580:	bfc09ee4 	0xbfc09ee4
 584:	80000000 	lb	zero,0(zero)
 588:	fffffffc 	0xfffffffc
	...
 594:	00000018 	mult	zero,zero
 598:	0000001d 	0x1d
 59c:	0000001f 	0x1f
 5a0:	bfc09f10 	0xbfc09f10
 5a4:	80070000 	lb	a3,0(zero)
 5a8:	fffffffc 	0xfffffffc
	...
 5b4:	00000020 	add	zero,zero,zero
 5b8:	0000001d 	0x1d
 5bc:	0000001f 	0x1f
 5c0:	bfc09f98 	0xbfc09f98
 5c4:	80000000 	lb	zero,0(zero)
 5c8:	fffffffc 	0xfffffffc
	...
 5d4:	00000018 	mult	zero,zero
 5d8:	0000001d 	0x1d
 5dc:	0000001f 	0x1f
 5e0:	bfc09fd0 	0xbfc09fd0
 5e4:	800f0000 	lb	t7,0(zero)
 5e8:	fffffffc 	0xfffffffc
	...
 5f4:	00000068 	0x68
 5f8:	0000001d 	0x1d
 5fc:	0000001f 	0x1f
 600:	bfc0a0d0 	0xbfc0a0d0
	...
 618:	0000001d 	0x1d
 61c:	0000001f 	0x1f
 620:	bfc0a0e0 	0xbfc0a0e0
	...
 638:	0000001d 	0x1d
 63c:	0000001f 	0x1f
 640:	bfc0a0f0 	0xbfc0a0f0
	...
 658:	0000001d 	0x1d
 65c:	0000001f 	0x1f
 660:	bfc0a100 	0xbfc0a100
	...
 678:	0000001d 	0x1d
 67c:	0000001f 	0x1f
 680:	bfc0a11c 	0xbfc0a11c
 684:	80000000 	lb	zero,0(zero)
 688:	fffffffc 	0xfffffffc
	...
 694:	00000018 	mult	zero,zero
 698:	0000001d 	0x1d
 69c:	0000001f 	0x1f

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
  68:	0efb0101 	jal	bec0404 <data_size+0xbebfa20>
  6c:	0101000d 	break	0x101
  70:	00000101 	0x101
  74:	00000100 	sll	zero,zero,0x4
  78:	72700001 	0x72700001
  7c:	66746e69 	0x66746e69
  80:	0000632e 	0x632e
  84:	00000000 	nop
  88:	9c800205 	0x9c800205
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
  b4:	0800ca03 	j	3280c <data_size+0x31e28>
  b8:	7fb90374 	0x7fb90374
  bc:	86012c02 	lh	at,11266(s0)
  c0:	3c083803 	lui	t0,0x3803
  c4:	89824103 	lwl	v0,16643(t4)
  c8:	3c083003 	lui	t0,0x3003
  cc:	084e03f4 	j	1380fd0 <data_size+0x13805ec>
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
  f8:	09034bf3 	j	40d2fcc <data_size+0x40d25e8>
  fc:	4b878382 	c2	0x1878382
 100:	08494bf1 	j	1252fc4 <data_size+0x12525e0>
 104:	00080275 	0x80275
 108:	003c0101 	0x3c0101
 10c:	00020000 	sll	zero,v0,0x0
 110:	00000020 	add	zero,zero,zero
 114:	0efb0101 	jal	bec0404 <data_size+0xbebfa20>
 118:	0101000d 	break	0x101
 11c:	00000101 	0x101
 120:	00000100 	sll	zero,zero,0x4
 124:	75700001 	jalx	5c00004 <data_size+0x5bff620>
 128:	61686374 	0x61686374
 12c:	00632e72 	0x632e72
 130:	00000000 	nop
 134:	d0020500 	0xd0020500
 138:	19bfc09e 	0x19bfc09e
 13c:	ba090313 	swr	t1,787(s0)
 140:	83827003 	lb	v0,28675(gp)
 144:	00100284 	0x100284
 148:	003f0101 	0x3f0101
 14c:	00020000 	sll	zero,v0,0x0
 150:	0000001d 	0x1d
 154:	0efb0101 	jal	bec0404 <data_size+0xbebfa20>
 158:	0101000d 	break	0x101
 15c:	00000101 	0x101
 160:	00000100 	sll	zero,zero,0x4
 164:	75700001 	jalx	5c00004 <data_size+0x5bff620>
 168:	632e7374 	0x632e7374
 16c:	00000000 	nop
 170:	02050000 	0x2050000
 174:	bfc09f10 	0xbfc09f10
 178:	f43e0813 	0xf43e0813
 17c:	f3f47f83 	0xf3f47f83
 180:	b008f97f 	0xb008f97f
 184:	84838383 	lh	v1,-31869(a0)
 188:	01001002 	0x1001002
 18c:	00005301 	0x5301
 190:	22000200 	addi	zero,s0,512
 194:	01000000 	0x1000000
 198:	0d0efb01 	jal	43bec04 <data_size+0x43be220>
 19c:	01010100 	0x1010100
 1a0:	00000001 	0x1
 1a4:	01000001 	0x1000001
 1a8:	69727000 	0x69727000
 1ac:	6162746e 	0x6162746e
 1b0:	632e6573 	0x632e6573
 1b4:	00000000 	nop
 1b8:	02050000 	0x2050000
 1bc:	bfc09fd0 	0xbfc09fd0
 1c0:	87740813 	lh	s4,2067(k1)
 1c4:	f0bc4cf7 	0xf0bc4cf7
 1c8:	038ab84c 	syscall	0xe2ae1
 1cc:	0374086c 	0x374086c
 1d0:	b7f38216 	0xb7f38216
 1d4:	83e00888 	lb	zero,2184(ra)
 1d8:	3c087103 	lui	t0,0x7103
 1dc:	02f20f03 	0x2f20f03
 1e0:	01010008 	0x1010008
 1e4:	00000071 	0x71
 1e8:	00320002 	0x320002
 1ec:	01010000 	0x1010000
 1f0:	000d0efb 	0xd0efb
 1f4:	01010101 	0x1010101
 1f8:	01000000 	0x1000000
 1fc:	2e010000 	sltiu	at,s0,0
 200:	6e692f2e 	0x6e692f2e
 204:	64756c63 	0x64756c63
 208:	74000065 	jalx	194 <data_size-0x850>
 20c:	2e656d69 	sltiu	a1,s3,28009
 210:	00000063 	0x63
 214:	6d697400 	0x6d697400
 218:	00682e65 	0x682e65
 21c:	00000001 	0x1
 220:	d0020500 	0xd0020500
 224:	15bfc0a0 	bne	t5,ra,ffff04a8 <_gp+0x403dd8e8>
 228:	f5010a03 	0xf5010a03
 22c:	f20f0314 	0xf20f0314
 230:	5d03f516 	0x5d03f516
 234:	08280301 	j	a00c04 <data_size+0xa00220>
 238:	8268033c 	lb	t0,828(s3)
 23c:	4a700382 	c2	0x700382
 240:	08821503 	j	208540c <data_size+0x2084a28>
 244:	f67f4c3b 	0xf67f4c3b
 248:	3e088180 	0x3e088180
 24c:	3a083b08 	xori	t0,s0,0x3b08
 250:	84f53d08 	lh	s5,15624(a3)
 254:	01001002 	0x1001002
 258:	Address 0x0000000000000258 is out of bounds.


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
  7c:	80000000 	lb	zero,0(zero)
  80:	d0bfc09c 	0xd0bfc09c
  84:	5ebfc09e 	0x5ebfc09e
  88:	02000000 	0x2000000
  8c:	07040304 	0x7040304
  90:	0000000b 	0xb
  94:	06070403 	0x6070403
  98:	04000000 	bltz	zero,9c <data_size-0x948>
  9c:	00006901 	0x6901
  a0:	01020100 	0x1020100
  a4:	000000ad 	0xad
  a8:	bfc09c80 	0xbfc09c80
  ac:	bfc09ed0 	0xbfc09ed0
  b0:	00000010 	mfhi	zero
  b4:	00000000 	nop
  b8:	000000ad 	0xad
  bc:	746d6605 	jalx	1b59814 <data_size+0x1b58e30>
  c0:	b4010100 	0xb4010100
  c4:	1f000000 	bgtz	t8,c8 <data_size-0x91c>
  c8:	06000000 	bltz	s0,cc <data_size-0x918>
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
  fc:	7707108d 	jalx	c1c4234 <data_size+0xc1c3850>
 100:	ad070100 	sw	a3,256(t0)
 104:	84000000 	lh	zero,0(zero)
 108:	0a000000 	j	8000000 <data_size+0x7fff61c>
 10c:	00000000 	nop
 110:	0b004501 	j	c011404 <data_size+0xc010a20>
 114:	6e690504 	0x6e690504
 118:	040c0074 	0x40c0074
 11c:	000000ba 	0xba
 120:	0000bf0d 	break	0x0,0x2fc
 124:	06010300 	bgez	s0,d28 <data_size+0x344>
 128:	00000077 	0x77
 12c:	0025040c 	syscall	0x9410
 130:	88000000 	lwl	zero,0(zero)
 134:	02000000 	0x2000000
 138:	0000bb00 	sll	s7,zero,0xc
 13c:	18010400 	0x18010400
 140:	01000000 	0x1000000
 144:	0000007c 	0x7c
 148:	00000030 	0x30
 14c:	bfc09ed0 	0xbfc09ed0
 150:	bfc09f04 	0xbfc09f04
 154:	0000010a 	0x10a
 158:	0b070402 	j	c1c1008 <data_size+0xc1c0624>
 15c:	02000000 	0x2000000
 160:	00060704 	0x60704
 164:	01030000 	0x1030000
 168:	00000070 	0x70
 16c:	9ed00801 	0x9ed00801
 170:	9ee4bfc0 	0x9ee4bfc0
 174:	0044bfc0 	0x44bfc0
 178:	6d010000 	0x6d010000
 17c:	00000059 	0x59
 180:	01006304 	0x1006304
 184:	00005908 	0x5908
 188:	00540100 	0x540100
 18c:	69050405 	0x69050405
 190:	0600746e 	bltz	s0,1d34c <data_size+0x1c968>
 194:	00007401 	0x7401
 198:	01020100 	0x1020100
 19c:	00000059 	0x59
 1a0:	bfc09ee4 	0xbfc09ee4
 1a4:	bfc09f04 	0xbfc09f04
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
 1d8:	bfc09f10 	0xbfc09f10
 1dc:	bfc09fc8 	0xbfc09fc8
 1e0:	0000014a 	0x14a
 1e4:	0b070402 	j	c1c1008 <data_size+0xc1c0624>
 1e8:	02000000 	0x2000000
 1ec:	00060704 	0x60704
 1f0:	01030000 	0x1030000
 1f4:	00000092 	0x92
 1f8:	6f010201 	0x6f010201
 1fc:	10000000 	b	200 <data_size-0x7e4>
 200:	98bfc09f 	lwr	ra,-16225(a1)
 204:	7cbfc09f 	0x7cbfc09f
 208:	42000000 	c0	0x0
 20c:	6f000001 	0x6f000001
 210:	04000000 	bltz	zero,214 <data_size-0x7d0>
 214:	01010073 	0x1010073
 218:	00000076 	0x76
 21c:	00000161 	0x161
 220:	01006305 	0x1006305
 224:	00007c03 	sra	t7,zero,0x10
 228:	00018a00 	sll	s1,at,0x8
 22c:	04060000 	0x4060000
 230:	746e6905 	jalx	1b9a414 <data_size+0x1b99a30>
 234:	7c040700 	0x7c040700
 238:	02000000 	0x2000000
 23c:	00770601 	0x770601
 240:	01080000 	0x1080000
 244:	0000008d 	break	0x0,0x2
 248:	6f010f01 	0x6f010f01
 24c:	98000000 	lwr	zero,0(zero)
 250:	c8bfc09f 	lwc2	$31,-16225(a1)
 254:	98bfc09f 	lwr	ra,-16225(a1)
 258:	9d000000 	0x9d000000
 25c:	04000001 	bltz	zero,264 <data_size-0x780>
 260:	0e010073 	jal	80401cc <data_size+0x803f7e8>
 264:	00000076 	0x76
 268:	000001bc 	0x1bc
 26c:	00f70000 	0xf70000
 270:	00020000 	sll	zero,v0,0x0
 274:	000001bc 	0x1bc
 278:	00180104 	0x180104
 27c:	9c010000 	0x9c010000
 280:	30000000 	andi	zero,zero,0x0
 284:	d0000000 	0xd0000000
 288:	d0bfc09f 	0xd0bfc09f
 28c:	8dbfc0a0 	lw	ra,-16224(t5)
 290:	02000001 	0x2000001
 294:	000b0704 	0xb0704
 298:	04020000 	0x4020000
 29c:	00000607 	0x607
 2a0:	bc010300 	0xbc010300
 2a4:	01000000 	0x1000000
 2a8:	00d20102 	0xd20102
 2ac:	9fd00000 	0x9fd00000
 2b0:	a0d0bfc0 	sb	s0,-16448(a2)
 2b4:	00c0bfc0 	0xc0bfc0
 2b8:	01cf0000 	0x1cf0000
 2bc:	00d20000 	0xd20000
 2c0:	76040000 	jalx	8100000 <data_size+0x80ff61c>
 2c4:	d9010100 	0xd9010100
 2c8:	ef000000 	swc3	$0,0(t8)
 2cc:	04000001 	bltz	zero,2d4 <data_size-0x710>
 2d0:	01010077 	0x1010077
 2d4:	000000d2 	0xd2
 2d8:	0000024f 	0x24f
 2dc:	0000c105 	0xc105
 2e0:	d2010100 	0xd2010100
 2e4:	ba000000 	swr	zero,0(s0)
 2e8:	05000002 	bltz	t0,2f4 <data_size-0x6f0>
 2ec:	000000b7 	0xb7
 2f0:	00d20101 	0xd20101
 2f4:	030f0000 	0x30f0000
 2f8:	69060000 	0x69060000
 2fc:	d2030100 	0xd2030100
 300:	38000000 	xori	zero,zero,0x0
 304:	06000003 	bltz	s0,314 <data_size-0x6d0>
 308:	0301006a 	0x301006a
 30c:	000000d2 	0xd2
 310:	00000361 	0x361
 314:	01006306 	0x1006306
 318:	0000d204 	0xd204
 31c:	00038a00 	sll	s1,v1,0x8
 320:	75620700 	jalx	5881c00 <data_size+0x588121c>
 324:	05010066 	bgez	t0,4c0 <data_size-0x524>
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
 354:	0b000000 	j	c000000 <data_size+0xbfff61c>
 358:	000000f0 	0xf0
 35c:	040c003f 	0x40c003f
 360:	06010207 	bgez	s0,b80 <data_size+0x19c>
 364:	00000077 	0x77
 368:	0001c100 	sll	t8,at,0x4
 36c:	68000200 	0x68000200
 370:	04000002 	bltz	zero,37c <data_size-0x668>
 374:	00001801 	0x1801
 378:	00f20100 	0xf20100
 37c:	00300000 	0x300000
 380:	a0d00000 	sb	s0,0(a2)
 384:	a1e8bfc0 	sb	t0,-16448(t7)
 388:	01e4bfc0 	0x1e4bfc0
 38c:	04020000 	0x4020000
 390:	00000b07 	0xb07
 394:	07040200 	0x7040200
 398:	00000006 	srlv	zero,zero,zero
 39c:	0000da03 	sra	k1,zero,0x8
 3a0:	2c030200 	sltiu	v1,zero,512
 3a4:	04000000 	bltz	zero,3a8 <data_size-0x63c>
 3a8:	6e690504 	0x6e690504
 3ac:	d1050074 	0xd1050074
 3b0:	10000000 	b	3b4 <data_size-0x630>
 3b4:	008a1f02 	0x8a1f02
 3b8:	14060000 	bne	zero,a2,3bc <data_size-0x628>
 3bc:	02000001 	0x2000001
 3c0:	00003320 	0x3320
 3c4:	00100200 	sll	zero,s0,0x8
 3c8:	00011b06 	0x11b06
 3cc:	33210200 	andi	at,t9,0x200
 3d0:	02000000 	0x2000000
 3d4:	0c060410 	jal	181040 <data_size+0x18065c>
 3d8:	02000001 	0x2000001
 3dc:	00003322 	0x3322
 3e0:	08100200 	j	400800 <data_size+0x3ffe1c>
 3e4:	0000e306 	0xe306
 3e8:	33230200 	andi	v1,t9,0x200
 3ec:	02000000 	0x2000000
 3f0:	07000c10 	bltz	t8,3434 <data_size+0x2a50>
 3f4:	0000c601 	0xc601
 3f8:	2c040100 	sltiu	a0,zero,256
 3fc:	00000000 	nop
 400:	000000a7 	0xa7
 404:	0000f908 	0xf908
 408:	2c050100 	sltiu	a1,zero,256
 40c:	00000000 	nop
 410:	00008a09 	0x8a09
 414:	c0a0d000 	lwc0	$0,-12288(a1)
 418:	c0a0e0bf 	lwc0	$0,-8001(a1)
 41c:	0000f0bf 	0xf0bf
 420:	c46d0100 	lwc1	$f13,256(v1)
 424:	0a000000 	j	8000000 <data_size+0x7fff61c>
 428:	0000009b 	0x9b
 42c:	c7010b00 	lwc1	$f1,2816(t8)
 430:	01000000 	0x1000000
 434:	00002c11 	0x2c11
 438:	c0a0e000 	lwc0	$0,-8192(a1)
 43c:	c0a0f0bf 	lwc0	$0,-3905(a1)
 440:	000100bf 	0x100bf
 444:	0c6d0100 	jal	1b40400 <data_size+0x1b3fa1c>
 448:	00010201 	0x10201
 44c:	2c220100 	sltiu	v0,at,256
 450:	f0000000 	0xf0000000
 454:	00bfc0a0 	0xbfc0a0
 458:	10bfc0a1 	beq	a1,ra,ffff06e0 <_gp+0x403ddb20>
 45c:	01000001 	0x1000001
 460:	0001066d 	0x1066d
 464:	006e0d00 	0x6e0d00
 468:	002c2301 	0x2c2301
 46c:	0e000000 	jal	8000000 <data_size+0x7fff61c>
 470:	0000eb01 	0xeb01
 474:	01290100 	0x1290100
 478:	0000002c 	0x2c
 47c:	bfc0a100 	0xbfc0a100
 480:	bfc0a11c 	0xbfc0a11c
 484:	00000120 	0x120
 488:	01526d01 	0x1526d01
 48c:	6e0f0000 	0x6e0f0000
 490:	2c2a0100 	sltiu	t2,at,256
 494:	d1000000 	0xd1000000
 498:	10000003 	b	4a8 <data_size-0x53c>
 49c:	0000008a 	0x8a
 4a0:	bfc0a100 	0xbfc0a100
 4a4:	bfc0a114 	0xbfc0a114
 4a8:	00112b01 	0x112b01
 4ac:	14bfc0a1 	bne	a1,ra,ffff0734 <_gp+0x403ddb74>
 4b0:	0abfc0a1 	j	aff0284 <data_size+0xafef8a0>
 4b4:	0000009b 	0x9b
 4b8:	12000000 	beqz	s0,4bc <data_size-0x528>
 4bc:	00012301 	0x12301
 4c0:	01160100 	0x1160100
 4c4:	0000002c 	0x2c
 4c8:	bfc0a11c 	0xbfc0a11c
 4cc:	bfc0a1e8 	0xbfc0a1e8
 4d0:	00000130 	0x130
 4d4:	000003e4 	0x3e4
 4d8:	000001be 	0x1be
 4dc:	6c657313 	0x6c657313
 4e0:	3e150100 	0x3e150100
 4e4:	03000000 	0x3000000
 4e8:	13000004 	beqz	t8,4fc <data_size-0x4e8>
 4ec:	00706d74 	0x706d74
 4f0:	01be1501 	0x1be1501
 4f4:	04160000 	0x4160000
 4f8:	6e0f0000 	0x6e0f0000
 4fc:	2c170100 	sltiu	s7,zero,256
 500:	34000000 	li	zero,0x0
 504:	10000004 	b	518 <data_size-0x4cc>
 508:	0000008a 	0x8a
 50c:	bfc0a128 	0xbfc0a128
 510:	bfc0a130 	0xbfc0a130
 514:	28111801 	slti	s1,zero,6145
 518:	30bfc0a1 	andi	ra,a1,0xc0a1
 51c:	0abfc0a1 	j	aff0284 <data_size+0xafef8a0>
 520:	0000009b 	0x9b
 524:	14000000 	bnez	zero,528 <data_size-0x4bc>
 528:	00004504 	0x4504
	...

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	10001101 	b	4408 <data_size+0x3a24>
   4:	12011106 	beq	s0,at,4420 <data_size+0x3a3c>
   8:	1b080301 	0x1b080301
   c:	13082508 	beq	t8,t0,9430 <data_size+0x8a4c>
  10:	00000005 	0x5
  14:	25011101 	addiu	at,t0,4353
  18:	030b130e 	0x30b130e
  1c:	110e1b0e 	beq	t0,t6,6c58 <data_size+0x6274>
  20:	10011201 	beq	zero,at,4828 <data_size+0x3e44>
  24:	02000006 	srlv	zero,zero,s0
  28:	0b0b000f 	j	c2c003c <data_size+0xc2bf658>
  2c:	24030000 	li	v1,0
  30:	3e0b0b00 	0x3e0b0b00
  34:	000e030b 	0xe030b
  38:	012e0400 	0x12e0400
  3c:	0e030c3f 	jal	80c30fc <data_size+0x80c2718>
  40:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec2304>
  44:	13490c27 	beq	k0,t1,30e4 <data_size+0x2700>
  48:	01120111 	0x1120111
  4c:	40064081 	0x40064081
  50:	00130106 	0x130106
  54:	00050500 	sll	zero,a1,0x14
  58:	0b3a0803 	j	ce8200c <data_size+0xce81628>
  5c:	13490b3b 	beq	k0,t1,2d4c <data_size+0x2368>
  60:	00000602 	srl	zero,zero,0x18
  64:	00001806 	srlv	v1,zero,zero
  68:	00340700 	0x340700
  6c:	0b3a0803 	j	ce8200c <data_size+0xce81628>
  70:	13490b3b 	beq	k0,t1,2d60 <data_size+0x237c>
  74:	00000602 	srl	zero,zero,0x18
  78:	03003408 	0x3003408
  7c:	3b0b3a08 	xori	t3,t8,0x3a08
  80:	0013490b 	0x13490b
  84:	00340900 	0x340900
  88:	0b3a0803 	j	ce8200c <data_size+0xce81628>
  8c:	13490b3b 	beq	k0,t1,2d7c <data_size+0x2398>
  90:	00000a02 	srl	at,zero,0x8
  94:	03000a0a 	0x3000a0a
  98:	3b0b3a0e 	xori	t3,t8,0x3a0e
  9c:	0b00000b 	j	c00002c <data_size+0xbfff648>
  a0:	0b0b0024 	j	c2c0090 <data_size+0xc2bf6ac>
  a4:	08030b3e 	j	c2cf8 <data_size+0xc2314>
  a8:	0f0c0000 	jal	c300000 <data_size+0xc2ff61c>
  ac:	490b0b00 	0x490b0b00
  b0:	0d000013 	jal	400004c <data_size+0x3fff668>
  b4:	13490026 	beq	k0,t1,150 <data_size-0x894>
  b8:	01000000 	0x1000000
  bc:	0e250111 	jal	8940444 <data_size+0x893fa60>
  c0:	0e030b13 	jal	80c2c4c <data_size+0x80c2268>
  c4:	01110e1b 	0x1110e1b
  c8:	06100112 	bltzal	s0,514 <data_size-0x4d0>
  cc:	24020000 	li	v0,0
  d0:	3e0b0b00 	0x3e0b0b00
  d4:	000e030b 	0xe030b
  d8:	012e0300 	0x12e0300
  dc:	0e030c3f 	jal	80c30fc <data_size+0x80c2718>
  e0:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec2304>
  e4:	01120111 	0x1120111
  e8:	40064081 	0x40064081
  ec:	0013010a 	0x13010a
  f0:	00050400 	sll	zero,a1,0x10
  f4:	0b3a0803 	j	ce8200c <data_size+0xce81628>
  f8:	13490b3b 	beq	k0,t1,2de8 <data_size+0x2404>
  fc:	00000a02 	srl	at,zero,0x8
 100:	0b002405 	j	c009014 <data_size+0xc008630>
 104:	030b3e0b 	0x30b3e0b
 108:	06000008 	bltz	s0,12c <data_size-0x8b8>
 10c:	0c3f012e 	jal	fc04b8 <data_size+0xfbfad4>
 110:	0b3a0e03 	j	ce8380c <data_size+0xce82e28>
 114:	0c270b3b 	jal	9c2cec <data_size+0x9c2308>
 118:	01111349 	0x1111349
 11c:	40810112 	0x40810112
 120:	00064006 	srlv	t0,a2,zero
 124:	00050700 	sll	zero,a1,0x1c
 128:	0b3a0803 	j	ce8200c <data_size+0xce81628>
 12c:	13490b3b 	beq	k0,t1,2e1c <data_size+0x2438>
 130:	00000602 	srl	zero,zero,0x18
 134:	01110100 	0x1110100
 138:	0b130e25 	j	c4c3894 <data_size+0xc4c2eb0>
 13c:	0e1b0e03 	jal	86c380c <data_size+0x86c2e28>
 140:	01120111 	0x1120111
 144:	00000610 	0x610
 148:	0b002402 	j	c009008 <data_size+0xc008624>
 14c:	030b3e0b 	0x30b3e0b
 150:	0300000e 	0x300000e
 154:	0c3f012e 	jal	fc04b8 <data_size+0xfbfad4>
 158:	0b3a0e03 	j	ce8380c <data_size+0xce82e28>
 15c:	0c270b3b 	jal	9c2cec <data_size+0x9c2308>
 160:	01111349 	0x1111349
 164:	40810112 	0x40810112
 168:	01064006 	srlv	t0,a2,t0
 16c:	04000013 	bltz	zero,1bc <data_size-0x828>
 170:	08030005 	j	c0014 <data_size+0xbf630>
 174:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec2304>
 178:	06021349 	0x6021349
 17c:	34050000 	li	a1,0x0
 180:	3a080300 	xori	t0,s0,0x300
 184:	490b3b0b 	0x490b3b0b
 188:	00060213 	0x60213
 18c:	00240600 	0x240600
 190:	0b3e0b0b 	j	cf82c2c <data_size+0xcf82248>
 194:	00000803 	sra	at,zero,0x0
 198:	0b000f07 	j	c003c1c <data_size+0xc003238>
 19c:	0013490b 	0x13490b
 1a0:	012e0800 	0x12e0800
 1a4:	0e030c3f 	jal	80c30fc <data_size+0x80c2718>
 1a8:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec2304>
 1ac:	13490c27 	beq	k0,t1,324c <data_size+0x2868>
 1b0:	01120111 	0x1120111
 1b4:	40064081 	0x40064081
 1b8:	00000006 	srlv	zero,zero,zero
 1bc:	25011101 	addiu	at,t0,4353
 1c0:	030b130e 	0x30b130e
 1c4:	110e1b0e 	beq	t0,t6,6e00 <data_size+0x641c>
 1c8:	10011201 	beq	zero,at,49d0 <data_size+0x3fec>
 1cc:	02000006 	srlv	zero,zero,s0
 1d0:	0b0b0024 	j	c2c0090 <data_size+0xc2bf6ac>
 1d4:	0e030b3e 	jal	80c2cf8 <data_size+0x80c2314>
 1d8:	2e030000 	sltiu	v1,s0,0
 1dc:	030c3f01 	0x30c3f01
 1e0:	3b0b3a0e 	xori	t3,t8,0x3a0e
 1e4:	490c270b 	0x490c270b
 1e8:	12011113 	beq	s0,at,4638 <data_size+0x3c54>
 1ec:	06408101 	bltz	s2,fffe05f4 <_gp+0x403cda34>
 1f0:	13010640 	beq	t8,at,1af4 <data_size+0x1110>
 1f4:	05040000 	0x5040000
 1f8:	3a080300 	xori	t0,s0,0x300
 1fc:	490b3b0b 	0x490b3b0b
 200:	00060213 	0x60213
 204:	00050500 	sll	zero,a1,0x14
 208:	0b3a0e03 	j	ce8380c <data_size+0xce82e28>
 20c:	13490b3b 	beq	k0,t1,2efc <data_size+0x2518>
 210:	00000602 	srl	zero,zero,0x18
 214:	03003406 	0x3003406
 218:	3b0b3a08 	xori	t3,t8,0x3a08
 21c:	0213490b 	0x213490b
 220:	07000006 	bltz	t8,23c <data_size-0x7a8>
 224:	08030034 	j	c00d0 <data_size+0xbf6ec>
 228:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec2304>
 22c:	0a021349 	j	8084d24 <data_size+0x8084340>
 230:	34080000 	li	t0,0x0
 234:	3a0e0300 	xori	t6,s0,0x300
 238:	490b3b0b 	0x490b3b0b
 23c:	00060213 	0x60213
 240:	00240900 	0x240900
 244:	0b3e0b0b 	j	cf82c2c <data_size+0xcf82248>
 248:	00000803 	sra	at,zero,0x0
 24c:	4901010a 	bc2t	678 <data_size-0x36c>
 250:	00130113 	0x130113
 254:	00210b00 	0x210b00
 258:	0b2f1349 	j	cbc4d24 <data_size+0xcbc4340>
 25c:	240c0000 	li	t4,0
 260:	3e0b0b00 	0x3e0b0b00
 264:	0000000b 	0xb
 268:	25011101 	addiu	at,t0,4353
 26c:	030b130e 	0x30b130e
 270:	110e1b0e 	beq	t0,t6,6eac <data_size+0x64c8>
 274:	10011201 	beq	zero,at,4a7c <data_size+0x4098>
 278:	02000006 	srlv	zero,zero,s0
 27c:	0b0b0024 	j	c2c0090 <data_size+0xc2bf6ac>
 280:	0e030b3e 	jal	80c2cf8 <data_size+0x80c2314>
 284:	16030000 	bne	s0,v1,288 <data_size-0x75c>
 288:	3a0e0300 	xori	t6,s0,0x300
 28c:	490b3b0b 	0x490b3b0b
 290:	04000013 	bltz	zero,2e0 <data_size-0x704>
 294:	0b0b0024 	j	c2c0090 <data_size+0xc2bf6ac>
 298:	08030b3e 	j	c2cf8 <data_size+0xc2314>
 29c:	13050000 	beq	t8,a1,2a0 <data_size-0x744>
 2a0:	0b0e0301 	j	c380c04 <data_size+0xc380220>
 2a4:	3b0b3a0b 	xori	t3,t8,0x3a0b
 2a8:	0013010b 	0x13010b
 2ac:	000d0600 	sll	zero,t5,0x18
 2b0:	0b3a0e03 	j	ce8380c <data_size+0xce82e28>
 2b4:	13490b3b 	beq	k0,t1,2fa4 <data_size+0x25c0>
 2b8:	00000a38 	0xa38
 2bc:	3f012e07 	0x3f012e07
 2c0:	3a0e030c 	xori	t6,s0,0x30c
 2c4:	490b3b0b 	0x490b3b0b
 2c8:	010b2013 	0x10b2013
 2cc:	08000013 	j	4c <data_size-0x998>
 2d0:	0e030034 	jal	80c00d0 <data_size+0x80bf6ec>
 2d4:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec2304>
 2d8:	00001349 	0x1349
 2dc:	31012e09 	andi	at,t0,0x2e09
 2e0:	12011113 	beq	s0,at,4730 <data_size+0x3d4c>
 2e4:	06408101 	bltz	s2,fffe06ec <_gp+0x403cdb2c>
 2e8:	13010a40 	beq	t8,at,2bec <data_size+0x2208>
 2ec:	340a0000 	li	t2,0x0
 2f0:	00133100 	sll	a2,s3,0x4
 2f4:	002e0b00 	0x2e0b00
 2f8:	0e030c3f 	jal	80c30fc <data_size+0x80c2718>
 2fc:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec2304>
 300:	01111349 	0x1111349
 304:	40810112 	0x40810112
 308:	000a4006 	srlv	t0,t2,zero
 30c:	012e0c00 	0x12e0c00
 310:	0e030c3f 	jal	80c30fc <data_size+0x80c2718>
 314:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec2304>
 318:	01111349 	0x1111349
 31c:	40810112 	0x40810112
 320:	010a4006 	srlv	t0,t2,t0
 324:	0d000013 	jal	400004c <data_size+0x3fff668>
 328:	08030034 	j	c00d0 <data_size+0xbf6ec>
 32c:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec2304>
 330:	00001349 	0x1349
 334:	3f012e0e 	0x3f012e0e
 338:	3a0e030c 	xori	t6,s0,0x30c
 33c:	270b3b0b 	addiu	t3,t8,15115
 340:	1113490c 	beq	t0,s3,12774 <data_size+0x11d90>
 344:	81011201 	lb	at,4609(t0)
 348:	0a400640 	j	9001900 <data_size+0x9000f1c>
 34c:	00001301 	0x1301
 350:	0300340f 	0x300340f
 354:	3b0b3a08 	xori	t3,t8,0x3a08
 358:	0213490b 	0x213490b
 35c:	10000006 	b	378 <data_size-0x66c>
 360:	1331011d 	beq	t9,s1,7d8 <data_size-0x20c>
 364:	01120111 	0x1120111
 368:	0b590b58 	j	d642d60 <data_size+0xd64237c>
 36c:	0b110000 	j	c440000 <data_size+0xc43f61c>
 370:	12011101 	beq	s0,at,4778 <data_size+0x3d94>
 374:	12000001 	beqz	s0,37c <data_size-0x668>
 378:	0c3f012e 	jal	fc04b8 <data_size+0xfbfad4>
 37c:	0b3a0e03 	j	ce8380c <data_size+0xce82e28>
 380:	0c270b3b 	jal	9c2cec <data_size+0x9c2308>
 384:	01111349 	0x1111349
 388:	40810112 	0x40810112
 38c:	01064006 	srlv	t0,a2,t0
 390:	13000013 	beqz	t8,3e0 <data_size-0x604>
 394:	08030005 	j	c0014 <data_size+0xbf630>
 398:	0b3b0b3a 	j	cec2ce8 <data_size+0xcec2304>
 39c:	06021349 	0x6021349
 3a0:	0f140000 	jal	c500000 <data_size+0xc4ff61c>
 3a4:	490b0b00 	0x490b0b00
 3a8:	00000013 	mtlo	zero

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
  a0:	47000030 	c1	0x1000030
  a4:	203a4343 	addi	k0,at,17219
  a8:	554e4728 	0x554e4728
  ac:	2e342029 	sltiu	s4,s1,8233
  b0:	00302e33 	0x302e33
  b4:	43434700 	c0	0x1434700
  b8:	4728203a 	c1	0x128203a
  bc:	2029554e 	addi	t1,at,21838
  c0:	2e332e34 	sltiu	s3,s1,11828
  c4:	47000030 	c1	0x1000030
  c8:	203a4343 	addi	k0,at,17219
  cc:	554e4728 	0x554e4728
  d0:	2e342029 	sltiu	s4,s1,8233
  d4:	00302e33 	0x302e33

Disassembly of section .gnu.attributes:

00000000 <.gnu.attributes>:
   0:	00000f41 	0xf41
   4:	756e6700 	jalx	5b99c00 <data_size+0x5b9921c>
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
  18:	bfc09c80 	0xbfc09c80
  1c:	00000250 	0x250
  20:	60380e44 	0x60380e44
  24:	07910890 	bgezal	gp,2268 <data_size+0x1884>
  28:	04940692 	0x4940692
  2c:	02960395 	0x2960395
  30:	0593019f 	0x593019f
  34:	0000000c 	syscall
  38:	ffffffff 	0xffffffff
  3c:	7c010001 	0x7c010001
  40:	001d0c1f 	0x1d0c1f
  44:	0000000c 	syscall
  48:	00000034 	0x34
  4c:	bfc09ed0 	0xbfc09ed0
  50:	00000014 	0x14
  54:	00000014 	0x14
  58:	00000034 	0x34
  5c:	bfc09ee4 	0xbfc09ee4
  60:	00000020 	add	zero,zero,zero
  64:	44180e44 	0x44180e44
  68:	0000019f 	0x19f
  6c:	0000000c 	syscall
  70:	ffffffff 	0xffffffff
  74:	7c010001 	0x7c010001
  78:	001d0c1f 	0x1d0c1f
  7c:	00000018 	mult	zero,zero
  80:	0000006c 	0x6c
  84:	bfc09f10 	0xbfc09f10
  88:	00000088 	0x88
  8c:	50200e44 	0x50200e44
  90:	02920490 	0x2920490
  94:	0391019f 	0x391019f
  98:	00000014 	0x14
  9c:	0000006c 	0x6c
  a0:	bfc09f98 	0xbfc09f98
  a4:	00000030 	0x30
  a8:	44180e44 	0x44180e44
  ac:	0000019f 	0x19f
  b0:	0000000c 	syscall
  b4:	ffffffff 	0xffffffff
  b8:	7c010001 	0x7c010001
  bc:	001d0c1f 	0x1d0c1f
  c0:	0000001c 	0x1c
  c4:	000000b0 	0xb0
  c8:	bfc09fd0 	0xbfc09fd0
  cc:	00000100 	sll	zero,zero,0x4
  d0:	54680e44 	0x54680e44
  d4:	04910590 	bgezal	a0,1718 <data_size+0xd34>
  d8:	0392019f 	0x392019f
  dc:	00000293 	0x293
  e0:	0000000c 	syscall
  e4:	ffffffff 	0xffffffff
  e8:	7c010001 	0x7c010001
  ec:	001d0c1f 	0x1d0c1f
  f0:	0000000c 	syscall
  f4:	000000e0 	0xe0
  f8:	bfc0a0d0 	0xbfc0a0d0
  fc:	00000010 	mfhi	zero
 100:	0000000c 	syscall
 104:	000000e0 	0xe0
 108:	bfc0a0e0 	0xbfc0a0e0
 10c:	00000010 	mfhi	zero
 110:	0000000c 	syscall
 114:	000000e0 	0xe0
 118:	bfc0a0f0 	0xbfc0a0f0
 11c:	00000010 	mfhi	zero
 120:	0000000c 	syscall
 124:	000000e0 	0xe0
 128:	bfc0a100 	0xbfc0a100
 12c:	0000001c 	0x1c
 130:	00000014 	0x14
 134:	000000e0 	0xe0
 138:	bfc0a11c 	0xbfc0a11c
 13c:	000000cc 	syscall	0x3
 140:	44180e44 	0x44180e44
 144:	0000019f 	0x19f

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
 12c:	14000000 	bnez	zero,130 <data_size-0x8b4>
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
 1d0:	04000000 	bltz	zero,1d4 <data_size-0x810>
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
 3cc:	00000000 	nop
 3d0:	00003c00 	sll	a3,zero,0x10
 3d4:	00004400 	sll	t0,zero,0x10
 3d8:	52000100 	0x52000100
	...
 3e4:	0000004c 	syscall	0x1
 3e8:	00000050 	0x50
 3ec:	506d0001 	0x506d0001
 3f0:	18000000 	blez	zero,3f4 <data_size-0x5f0>
 3f4:	02000001 	0x2000001
 3f8:	00188d00 	sll	s1,t8,0x14
 3fc:	00000000 	nop
 400:	4c000000 	mfc3	zero,$0
 404:	94000000 	lhu	zero,0(zero)
 408:	01000000 	0x1000000
 40c:	00005400 	sll	t2,zero,0x10
 410:	00000000 	nop
 414:	004c0000 	0x4c0000
 418:	007c0000 	0x7c0000
 41c:	00010000 	sll	zero,at,0x0
 420:	00007c55 	0x7c55
 424:	00010800 	sll	at,at,0x0
 428:	5a000100 	0x5a000100
	...
 434:	00000060 	0x60
 438:	000000c4 	0xc4
 43c:	00560001 	0x560001
 440:	00000000 	nop
 444:	Address 0x0000000000000444 is out of bounds.


Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	69616761 	0x69616761
   4:	6f6c006e 	0x6f6c006e
   8:	7520676e 	jalx	4819db8 <data_size+0x48193d4>
   c:	6769736e 	0x6769736e
  10:	2064656e 	addi	a0,v1,25966
  14:	00746e69 	0x746e69
  18:	20554e47 	addi	s5,v0,20039
  1c:	2e342043 	sltiu	s4,s1,8259
  20:	20302e33 	addi	s0,at,11827
  24:	7000672d 	0x7000672d
  28:	746e6972 	jalx	1b9a5c8 <data_size+0x1b99be4>
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
  84:	75700063 	jalx	5c0018c <data_size+0x5bff7a8>
  88:	632e7374 	0x632e7374
  8c:	74757000 	jalx	1d5c000 <data_size+0x1d5b61c>
  90:	75700073 	jalx	5c001cc <data_size+0x5bff7e8>
  94:	72747374 	0x72747374
  98:	00676e69 	0x676e69
  9c:	6e697270 	0x6e697270
  a0:	73616274 	0x73616274
  a4:	00632e65 	0x632e65
  a8:	756c6176 	jalx	5b185d8 <data_size+0x5b17bf4>
  ac:	6f6c0065 	0x6f6c0065
  b0:	6920676e 	0x6920676e
  b4:	7300746e 	0x7300746e
  b8:	006e6769 	0x6e6769
  bc:	6e697270 	0x6e697270
  c0:	73616274 	0x73616274
  c4:	675f0065 	0x675f0065
  c8:	635f7465 	0x635f7465
  cc:	746e756f 	jalx	1b9d5bc <data_size+0x1b9cbd8>
  d0:	6d697400 	0x6d697400
  d4:	65707365 	0x65707365
  d8:	635f0063 	0x635f0063
  dc:	6b636f6c 	0x6b636f6c
  e0:	7400745f 	jalx	1d17c <data_size+0x1c798>
  e4:	736d5f76 	0x736d5f76
  e8:	67006365 	0x67006365
  ec:	6e5f7465 	0x6e5f7465
  f0:	69740073 	0x69740073
  f4:	632e656d 	0x632e656d
  f8:	6f635f00 	0x6f635f00
  fc:	6176746e 	0x6176746e
 100:	6567006c 	0x6567006c
 104:	6c635f74 	0x6c635f74
 108:	006b636f 	0x6b636f
 10c:	755f7674 	jalx	57dd9d0 <data_size+0x57dcfec>
 110:	00636573 	0x636573
 114:	735f7674 	0x735f7674
 118:	74006365 	jalx	18d94 <data_size+0x183b0>
 11c:	736e5f76 	0x736e5f76
 120:	63006365 	0x63006365
 124:	6b636f6c 	0x6b636f6c
 128:	7465675f 	jalx	1959d7c <data_size+0x1959398>
 12c:	656d6974 	0x656d6974
	...

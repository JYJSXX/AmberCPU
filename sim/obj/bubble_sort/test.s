
obj/bubble_sort/main.elf：     文件格式 elf32-loongarch
obj/bubble_sort/main.elf


Disassembly of section .text:

1c000000 <_ftext>:
_ftext():
1c000000:	157f5f19 	lu12i.w	$r25,-263432(0xbfaf8)
1c000004:	03bff339 	ori	$r25,$r25,0xffc
1c000008:	29800320 	st.w	$r0,$r25,0
1c00000c:	157f5ff9 	lu12i.w	$r25,-263425(0xbfaff)
1c000010:	03bcc339 	ori	$r25,$r25,0xf30
1c000014:	29800320 	st.w	$r0,$r25,0
1c000018:	157f5f19 	lu12i.w	$r25,-263432(0xbfaf8)
1c00001c:	03bff339 	ori	$r25,$r25,0xffc
1c000020:	29800320 	st.w	$r0,$r25,0
1c000024:	157f5f19 	lu12i.w	$r25,-263432(0xbfaf8)
1c000028:	03bff339 	ori	$r25,$r25,0xffc
1c00002c:	29800320 	st.w	$r0,$r25,0
1c000030:	157f5ff9 	lu12i.w	$r25,-263425(0xbfaff)
1c000034:	03bd0339 	ori	$r25,$r25,0xf40
1c000038:	29800320 	st.w	$r0,$r25,0
1c00003c:	157f5f19 	lu12i.w	$r25,-263432(0xbfaf8)
1c000040:	03bff339 	ori	$r25,$r25,0xffc
1c000044:	29800320 	st.w	$r0,$r25,0
1c000048:	04060020 	csrwr	$r0,0x180
1c00004c:	04060420 	csrwr	$r0,0x181
1c000050:	0380640c 	ori	$r12,$r0,0x19
1c000054:	0406002c 	csrwr	$r12,0x180
1c000058:	1540000c 	lu12i.w	$r12,-393216(0xa0000)
1c00005c:	0380258c 	ori	$r12,$r12,0x9
1c000060:	0406042c 	csrwr	$r12,0x181
1c000064:	0380400c 	ori	$r12,$r0,0x10
1c000068:	0380600d 	ori	$r13,$r0,0x18
1c00006c:	040001ac 	csrxchg	$r12,$r13,0x0
1c000070:	1438000c 	lu12i.w	$r12,114688(0x1c000)
1c000074:	038e018c 	ori	$r12,$r12,0x380
1c000078:	0400302c 	csrwr	$r12,0xc
1c00007c:	1c000023 	pcaddu12i	$r3,1(0x1)
1c000080:	28993063 	ld.w	$r3,$r3,1612(0x64c)
1c000084:	50030800 	b	776(0x308) # 1c00038c <run_test>
	...

1c000100 <test_finish>:
test_finish():
1c000100:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c000104:	157f5fee 	lu12i.w	$r14,-263425(0xbfaff)
1c000108:	03bc41ce 	ori	$r14,$r14,0xf10
1c00010c:	298001c0 	st.w	$r0,$r14,0
1c000110:	157f5fec 	lu12i.w	$r12,-263425(0xbfaff)
1c000114:	0381818c 	ori	$r12,$r12,0x60
1c000118:	2880018c 	ld.w	$r12,$r12,0
1c00011c:	0342018c 	andi	$r12,$r12,0x80
1c000120:	5800180c 	beq	$r0,$r12,24(0x18) # 1c000138 <test_finish+0x38>
1c000124:	03400000 	andi	$r0,$r0,0x0
1c000128:	157f5f0c 	lu12i.w	$r12,-263432(0xbfaf8)
1c00012c:	2880018d 	ld.w	$r13,$r12,0
1c000130:	50001400 	b	20(0x14) # 1c000144 <test_finish+0x44>
1c000134:	03400000 	andi	$r0,$r0,0x0
1c000138:	157f5f0c 	lu12i.w	$r12,-263432(0xbfaf8)
1c00013c:	0380418c 	ori	$r12,$r12,0x10
1c000140:	2880018d 	ld.w	$r13,$r12,0
1c000144:	157f5fec 	lu12i.w	$r12,-263425(0xbfaff)
1c000148:	0381418c 	ori	$r12,$r12,0x50
1c00014c:	2980018d 	st.w	$r13,$r12,0
1c000150:	53ffc3ff 	b	-64(0xfffffc0) # 1c000110 <test_finish+0x10>
1c000154:	03400000 	andi	$r0,$r0,0x0
1c000158:	1500000c 	lu12i.w	$r12,-524288(0x80000)
1c00015c:	028005ad 	addi.w	$r13,$r13,1(0x1)
1c000160:	0015018e 	move	$r14,$r12
1c000164:	00104a2f 	add.w	$r15,$r17,$r18
1c000168:	28800190 	ld.w	$r16,$r12,0
	...
1c000380:	0280058c 	addi.w	$r12,$r12,1(0x1)
1c000384:	53ffffff 	b	-4(0xffffffc) # 1c000380 <test_finish+0x280>
1c000388:	03400000 	andi	$r0,$r0,0x0

1c00038c <run_test>:
run_test():
1c00038c:	54001400 	bl	20(0x14) # 1c0003a0 <shell2>
1c000390:	03400000 	andi	$r0,$r0,0x0

1c000394 <go_finish>:
go_finish():
1c000394:	53fd6fff 	b	-660(0xffffd6c) # 1c000100 <test_finish>
	...

1c0003a0 <shell2>:
shell2():
1c0003a0:	02bf8063 	addi.w	$r3,$r3,-32(0xfe0)
1c0003a4:	29807061 	st.w	$r1,$r3,28(0x1c)
1c0003a8:	157f5fcc 	lu12i.w	$r12,-263426(0xbfafe)
1c0003ac:	2980207b 	st.w	$r27,$r3,8(0x8)
1c0003b0:	2980107c 	st.w	$r28,$r3,4(0x4)
1c0003b4:	29806077 	st.w	$r23,$r3,24(0x18)
1c0003b8:	29805078 	st.w	$r24,$r3,20(0x14)
1c0003bc:	29804079 	st.w	$r25,$r3,16(0x10)
1c0003c0:	2980307a 	st.w	$r26,$r3,12(0xc)
1c0003c4:	2980007d 	st.w	$r29,$r3,0
1c0003c8:	29800180 	st.w	$r0,$r12,0
1c0003cc:	1c000024 	pcaddu12i	$r4,1(0x1)
1c0003d0:	02aae084 	addi.w	$r4,$r4,-1352(0xab8)
1c0003d4:	54089800 	bl	2200(0x898) # 1c000c6c <puts>
1c0003d8:	5409a800 	bl	2472(0x9a8) # 1c000d80 <get_count>
1c0003dc:	0015009b 	move	$r27,$r4
1c0003e0:	5409c000 	bl	2496(0x9c0) # 1c000da0 <get_count_my>
1c0003e4:	0015009c 	move	$r28,$r4
1c0003e8:	157f5fe4 	lu12i.w	$r4,-263425(0xbfaff)
1c0003ec:	03bc8085 	ori	$r5,$r4,0xf20
1c0003f0:	288000a6 	ld.w	$r6,$r5,0
1c0003f4:	5c01c0c0 	bne	$r6,$r0,448(0x1c0) # 1c0005b4 <shell2+0x214>
1c0003f8:	1c000039 	pcaddu12i	$r25,1(0x1)
1c0003fc:	02aca339 	addi.w	$r25,$r25,-1240(0xb28)
1c000400:	0280281d 	addi.w	$r29,$r0,10(0xa)
1c000404:	00150017 	move	$r23,$r0
1c000408:	028c8338 	addi.w	$r24,$r25,800(0x320)
1c00040c:	1c00003a 	pcaddu12i	$r26,1(0x1)
1c000410:	02be135a 	addi.w	$r26,$r26,-124(0xf84)
1c000414:	02832005 	addi.w	$r5,$r0,200(0xc8)
1c000418:	00150344 	move	$r4,$r26
1c00041c:	54025400 	bl	596(0x254) # 1c000670 <bubble_sort>
1c000420:	00116487 	sub.w	$r7,$r4,$r25
1c000424:	1c00002c 	pcaddu12i	$r12,1(0x1)
1c000428:	02abf18c 	addi.w	$r12,$r12,-1284(0xafc)
1c00042c:	001030ed 	add.w	$r13,$r7,$r12
1c000430:	2880018e 	ld.w	$r14,$r12,0
1c000434:	288001a8 	ld.w	$r8,$r13,0
1c000438:	001501af 	move	$r15,$r13
1c00043c:	001501b1 	move	$r17,$r13
1c000440:	001501b3 	move	$r19,$r13
1c000444:	001501a1 	move	$r1,$r13
1c000448:	5c015d0e 	bne	$r8,$r14,348(0x15c) # 1c0005a4 <shell2+0x204>
1c00044c:	28801189 	ld.w	$r9,$r12,4(0x4)
1c000450:	288011aa 	ld.w	$r10,$r13,4(0x4)
1c000454:	5c015149 	bne	$r10,$r9,336(0x150) # 1c0005a4 <shell2+0x204>
1c000458:	2880218b 	ld.w	$r11,$r12,8(0x8)
1c00045c:	288021a4 	ld.w	$r4,$r13,8(0x8)
1c000460:	5c01448b 	bne	$r4,$r11,324(0x144) # 1c0005a4 <shell2+0x204>
1c000464:	28803185 	ld.w	$r5,$r12,12(0xc)
1c000468:	288031a6 	ld.w	$r6,$r13,12(0xc)
1c00046c:	5c0138c5 	bne	$r6,$r5,312(0x138) # 1c0005a4 <shell2+0x204>
1c000470:	2880418d 	ld.w	$r13,$r12,16(0x10)
1c000474:	288041ef 	ld.w	$r15,$r15,16(0x10)
1c000478:	5c012ded 	bne	$r15,$r13,300(0x12c) # 1c0005a4 <shell2+0x204>
1c00047c:	28805190 	ld.w	$r16,$r12,20(0x14)
1c000480:	28805231 	ld.w	$r17,$r17,20(0x14)
1c000484:	5c012230 	bne	$r17,$r16,288(0x120) # 1c0005a4 <shell2+0x204>
1c000488:	28806192 	ld.w	$r18,$r12,24(0x18)
1c00048c:	28806273 	ld.w	$r19,$r19,24(0x18)
1c000490:	5c011672 	bne	$r19,$r18,276(0x114) # 1c0005a4 <shell2+0x204>
1c000494:	28807194 	ld.w	$r20,$r12,28(0x1c)
1c000498:	28807021 	ld.w	$r1,$r1,28(0x1c)
1c00049c:	0280818c 	addi.w	$r12,$r12,32(0x20)
1c0004a0:	5c010434 	bne	$r1,$r20,260(0x104) # 1c0005a4 <shell2+0x204>
1c0004a4:	5fff8b0c 	bne	$r24,$r12,-120(0x3ff88) # 1c00042c <shell2+0x8c>
1c0004a8:	02bfffbd 	addi.w	$r29,$r29,-1(0xfff)
1c0004ac:	5fff6ba0 	bne	$r29,$r0,-152(0x3ff68) # 1c000414 <shell2+0x74>
1c0004b0:	5408f000 	bl	2288(0x8f0) # 1c000da0 <get_count_my>
1c0004b4:	00150099 	move	$r25,$r4
1c0004b8:	5408c800 	bl	2248(0x8c8) # 1c000d80 <get_count>
1c0004bc:	00116c9b 	sub.w	$r27,$r4,$r27
1c0004c0:	0011733c 	sub.w	$r28,$r25,$r28
1c0004c4:	5c00aee0 	bne	$r23,$r0,172(0xac) # 1c000570 <shell2+0x1d0>
1c0004c8:	1c000024 	pcaddu12i	$r4,1(0x1)
1c0004cc:	02a75084 	addi.w	$r4,$r4,-1580(0x9d4)
1c0004d0:	54079c00 	bl	1948(0x79c) # 1c000c6c <puts>
1c0004d4:	157f5fe7 	lu12i.w	$r7,-263425(0xbfaff)
1c0004d8:	0280040b 	addi.w	$r11,$r0,1(0x1)
1c0004dc:	038100e4 	ori	$r4,$r7,0x40
1c0004e0:	2980008b 	st.w	$r11,$r4,0
1c0004e4:	0380c0e5 	ori	$r5,$r7,0x30
1c0004e8:	140001ef 	lu12i.w	$r15,15(0xf)
1c0004ec:	038080e6 	ori	$r6,$r7,0x20
1c0004f0:	298000ab 	st.w	$r11,$r5,0
1c0004f4:	03bffded 	ori	$r13,$r15,0xfff
1c0004f8:	298000cd 	st.w	$r13,$r6,0
1c0004fc:	157f5fe1 	lu12i.w	$r1,-263425(0xbfaff)
1c000500:	03814039 	ori	$r25,$r1,0x50
1c000504:	2980033c 	st.w	$r28,$r25,0
1c000508:	157f5f18 	lu12i.w	$r24,-263432(0xbfaf8)
1c00050c:	2980031c 	st.w	$r28,$r24,0
1c000510:	0380430e 	ori	$r14,$r24,0x10
1c000514:	00150365 	move	$r5,$r27
1c000518:	298001db 	st.w	$r27,$r14,0
1c00051c:	1c000024 	pcaddu12i	$r4,1(0x1)
1c000520:	02a6b084 	addi.w	$r4,$r4,-1620(0x9ac)
1c000524:	54045c00 	bl	1116(0x45c) # 1c000980 <printf>
1c000528:	28807061 	ld.w	$r1,$r3,28(0x1c)
1c00052c:	28806077 	ld.w	$r23,$r3,24(0x18)
1c000530:	28805078 	ld.w	$r24,$r3,20(0x14)
1c000534:	28804079 	ld.w	$r25,$r3,16(0x10)
1c000538:	2880307a 	ld.w	$r26,$r3,12(0xc)
1c00053c:	2880207b 	ld.w	$r27,$r3,8(0x8)
1c000540:	2880007d 	ld.w	$r29,$r3,0
1c000544:	00150385 	move	$r5,$r28
1c000548:	2880107c 	ld.w	$r28,$r3,4(0x4)
1c00054c:	1c000024 	pcaddu12i	$r4,1(0x1)
1c000550:	02a6a084 	addi.w	$r4,$r4,-1624(0x9a8)
1c000554:	02808063 	addi.w	$r3,$r3,32(0x20)
1c000558:	50042800 	b	1064(0x428) # 1c000980 <printf>
1c00055c:	54084400 	bl	2116(0x844) # 1c000da0 <get_count_my>
1c000560:	00150097 	move	$r23,$r4
1c000564:	54081c00 	bl	2076(0x81c) # 1c000d80 <get_count>
1c000568:	00116c9b 	sub.w	$r27,$r4,$r27
1c00056c:	001172fc 	sub.w	$r28,$r23,$r28
1c000570:	1c000024 	pcaddu12i	$r4,1(0x1)
1c000574:	02a50084 	addi.w	$r4,$r4,-1728(0x940)
1c000578:	5406f400 	bl	1780(0x6f4) # 1c000c6c <puts>
1c00057c:	157f5ff0 	lu12i.w	$r16,-263425(0xbfaff)
1c000580:	03810211 	ori	$r17,$r16,0x40
1c000584:	02800414 	addi.w	$r20,$r0,1(0x1)
1c000588:	29800234 	st.w	$r20,$r17,0
1c00058c:	0380c212 	ori	$r18,$r16,0x30
1c000590:	0280081d 	addi.w	$r29,$r0,2(0x2)
1c000594:	03808213 	ori	$r19,$r16,0x20
1c000598:	2980025d 	st.w	$r29,$r18,0
1c00059c:	29800260 	st.w	$r0,$r19,0
1c0005a0:	53ff5fff 	b	-164(0xfffff5c) # 1c0004fc <shell2+0x15c>
1c0005a4:	02bfffbd 	addi.w	$r29,$r29,-1(0xfff)
1c0005a8:	028006f7 	addi.w	$r23,$r23,1(0x1)
1c0005ac:	5ffe6ba0 	bne	$r29,$r0,-408(0x3fe68) # 1c000414 <shell2+0x74>
1c0005b0:	53ff03ff 	b	-256(0xfffff00) # 1c0004b0 <shell2+0x110>
1c0005b4:	02832005 	addi.w	$r5,$r0,200(0xc8)
1c0005b8:	1c000024 	pcaddu12i	$r4,1(0x1)
1c0005bc:	02b76084 	addi.w	$r4,$r4,-552(0xdd8)
1c0005c0:	1c000038 	pcaddu12i	$r24,1(0x1)
1c0005c4:	02a58318 	addi.w	$r24,$r24,-1696(0x960)
1c0005c8:	5400a800 	bl	168(0xa8) # 1c000670 <bubble_sort>
1c0005cc:	0015030c 	move	$r12,$r24
1c0005d0:	028c831a 	addi.w	$r26,$r24,800(0x320)
1c0005d4:	00116087 	sub.w	$r7,$r4,$r24
1c0005d8:	001030ee 	add.w	$r14,$r7,$r12
1c0005dc:	2880018f 	ld.w	$r15,$r12,0
1c0005e0:	288001cd 	ld.w	$r13,$r14,0
1c0005e4:	001501c8 	move	$r8,$r14
1c0005e8:	001501ca 	move	$r10,$r14
1c0005ec:	5fff71af 	bne	$r13,$r15,-144(0x3ff70) # 1c00055c <shell2+0x1bc>
1c0005f0:	28801190 	ld.w	$r16,$r12,4(0x4)
1c0005f4:	288011d1 	ld.w	$r17,$r14,4(0x4)
1c0005f8:	5fff6630 	bne	$r17,$r16,-156(0x3ff64) # 1c00055c <shell2+0x1bc>
1c0005fc:	28802192 	ld.w	$r18,$r12,8(0x8)
1c000600:	288021d3 	ld.w	$r19,$r14,8(0x8)
1c000604:	5fff5a72 	bne	$r19,$r18,-168(0x3ff58) # 1c00055c <shell2+0x1bc>
1c000608:	28803194 	ld.w	$r20,$r12,12(0xc)
1c00060c:	288031c1 	ld.w	$r1,$r14,12(0xc)
1c000610:	5fff4c34 	bne	$r1,$r20,-180(0x3ff4c) # 1c00055c <shell2+0x1bc>
1c000614:	28804197 	ld.w	$r23,$r12,16(0x10)
1c000618:	288041dd 	ld.w	$r29,$r14,16(0x10)
1c00061c:	5fff43b7 	bne	$r29,$r23,-192(0x3ff40) # 1c00055c <shell2+0x1bc>
1c000620:	28805199 	ld.w	$r25,$r12,20(0x14)
1c000624:	288051d8 	ld.w	$r24,$r14,20(0x14)
1c000628:	5fff3719 	bne	$r24,$r25,-204(0x3ff34) # 1c00055c <shell2+0x1bc>
1c00062c:	2880618e 	ld.w	$r14,$r12,24(0x18)
1c000630:	28806108 	ld.w	$r8,$r8,24(0x18)
1c000634:	5fff290e 	bne	$r8,$r14,-216(0x3ff28) # 1c00055c <shell2+0x1bc>
1c000638:	28807189 	ld.w	$r9,$r12,28(0x1c)
1c00063c:	2880714a 	ld.w	$r10,$r10,28(0x1c)
1c000640:	0280818c 	addi.w	$r12,$r12,32(0x20)
1c000644:	5fff1949 	bne	$r10,$r9,-232(0x3ff18) # 1c00055c <shell2+0x1bc>
1c000648:	5fff934c 	bne	$r26,$r12,-112(0x3ff90) # 1c0005d8 <shell2+0x238>
1c00064c:	54075400 	bl	1876(0x754) # 1c000da0 <get_count_my>
1c000650:	0015009a 	move	$r26,$r4
1c000654:	54072c00 	bl	1836(0x72c) # 1c000d80 <get_count>
1c000658:	00116c9b 	sub.w	$r27,$r4,$r27
1c00065c:	0011735c 	sub.w	$r28,$r26,$r28
1c000660:	53fe6bff 	b	-408(0xffffe68) # 1c0004c8 <shell2+0x128>
1c000664:	03400000 	andi	$r0,$r0,0x0
1c000668:	03400000 	andi	$r0,$r0,0x0
1c00066c:	03400000 	andi	$r0,$r0,0x0

1c000670 <bubble_sort>:
bubble_sort():
1c000670:	6002d8a0 	blt	$r5,$r0,728(0x2d8) # 1c000948 <bubble_sort+0x2d8>
1c000674:	02801091 	addi.w	$r17,$r4,4(0x4)
1c000678:	004088ae 	slli.w	$r14,$r5,0x2
1c00067c:	00103a26 	add.w	$r6,$r17,$r14
1c000680:	001110cd 	sub.w	$r13,$r6,$r4
1c000684:	02bff1a7 	addi.w	$r7,$r13,-4(0xffc)
1c000688:	004488e8 	srli.w	$r8,$r7,0x2
1c00068c:	02800509 	addi.w	$r9,$r8,1(0x1)
1c000690:	1c000030 	pcaddu12i	$r16,1(0x1)
1c000694:	2880d210 	ld.w	$r16,$r16,52(0x34)
1c000698:	03401d2a 	andi	$r10,$r9,0x7
1c00069c:	0015020c 	move	$r12,$r16
1c0006a0:	58009940 	beq	$r10,$r0,152(0x98) # 1c000738 <bubble_sort+0xc8>
1c0006a4:	0280040f 	addi.w	$r15,$r0,1(0x1)
1c0006a8:	58007d4f 	beq	$r10,$r15,124(0x7c) # 1c000724 <bubble_sort+0xb4>
1c0006ac:	0280080b 	addi.w	$r11,$r0,2(0x2)
1c0006b0:	5800654b 	beq	$r10,$r11,100(0x64) # 1c000714 <bubble_sort+0xa4>
1c0006b4:	02800c12 	addi.w	$r18,$r0,3(0x3)
1c0006b8:	58004d52 	beq	$r10,$r18,76(0x4c) # 1c000704 <bubble_sort+0x94>
1c0006bc:	02801013 	addi.w	$r19,$r0,4(0x4)
1c0006c0:	58003553 	beq	$r10,$r19,52(0x34) # 1c0006f4 <bubble_sort+0x84>
1c0006c4:	02801414 	addi.w	$r20,$r0,5(0x5)
1c0006c8:	58001d54 	beq	$r10,$r20,28(0x1c) # 1c0006e4 <bubble_sort+0x74>
1c0006cc:	0280180e 	addi.w	$r14,$r0,6(0x6)
1c0006d0:	5c02914e 	bne	$r10,$r14,656(0x290) # 1c000960 <bubble_sort+0x2f0>
1c0006d4:	28800091 	ld.w	$r17,$r4,0
1c0006d8:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c0006dc:	02801084 	addi.w	$r4,$r4,4(0x4)
1c0006e0:	29bff191 	st.w	$r17,$r12,-4(0xffc)
1c0006e4:	28800087 	ld.w	$r7,$r4,0
1c0006e8:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c0006ec:	02801084 	addi.w	$r4,$r4,4(0x4)
1c0006f0:	29bff187 	st.w	$r7,$r12,-4(0xffc)
1c0006f4:	28800088 	ld.w	$r8,$r4,0
1c0006f8:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c0006fc:	02801084 	addi.w	$r4,$r4,4(0x4)
1c000700:	29bff188 	st.w	$r8,$r12,-4(0xffc)
1c000704:	28800089 	ld.w	$r9,$r4,0
1c000708:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c00070c:	02801084 	addi.w	$r4,$r4,4(0x4)
1c000710:	29bff189 	st.w	$r9,$r12,-4(0xffc)
1c000714:	2880008a 	ld.w	$r10,$r4,0
1c000718:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c00071c:	02801084 	addi.w	$r4,$r4,4(0x4)
1c000720:	29bff18a 	st.w	$r10,$r12,-4(0xffc)
1c000724:	2880008f 	ld.w	$r15,$r4,0
1c000728:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c00072c:	02801084 	addi.w	$r4,$r4,4(0x4)
1c000730:	29bff18f 	st.w	$r15,$r12,-4(0xffc)
1c000734:	58005086 	beq	$r4,$r6,80(0x50) # 1c000784 <bubble_sort+0x114>
1c000738:	2880008b 	ld.w	$r11,$r4,0
1c00073c:	0280818c 	addi.w	$r12,$r12,32(0x20)
1c000740:	02808084 	addi.w	$r4,$r4,32(0x20)
1c000744:	29bf818b 	st.w	$r11,$r12,-32(0xfe0)
1c000748:	28bf9092 	ld.w	$r18,$r4,-28(0xfe4)
1c00074c:	29bf9192 	st.w	$r18,$r12,-28(0xfe4)
1c000750:	28bfa093 	ld.w	$r19,$r4,-24(0xfe8)
1c000754:	29bfa193 	st.w	$r19,$r12,-24(0xfe8)
1c000758:	28bfb094 	ld.w	$r20,$r4,-20(0xfec)
1c00075c:	29bfb194 	st.w	$r20,$r12,-20(0xfec)
1c000760:	28bfc08e 	ld.w	$r14,$r4,-16(0xff0)
1c000764:	29bfc18e 	st.w	$r14,$r12,-16(0xff0)
1c000768:	28bfd08d 	ld.w	$r13,$r4,-12(0xff4)
1c00076c:	29bfd18d 	st.w	$r13,$r12,-12(0xff4)
1c000770:	28bfe091 	ld.w	$r17,$r4,-8(0xff8)
1c000774:	29bfe191 	st.w	$r17,$r12,-8(0xff8)
1c000778:	28bff087 	ld.w	$r7,$r4,-4(0xffc)
1c00077c:	29bff187 	st.w	$r7,$r12,-4(0xffc)
1c000780:	5fffb886 	bne	$r4,$r6,-72(0x3ffb8) # 1c000738 <bubble_sort+0xc8>
1c000784:	6401c405 	bge	$r0,$r5,452(0x1c4) # 1c000948 <bubble_sort+0x2d8>
1c000788:	02bffcaf 	addi.w	$r15,$r5,-1(0xfff)
1c00078c:	004089e4 	slli.w	$r4,$r15,0x2
1c000790:	0010120e 	add.w	$r14,$r16,$r4
1c000794:	0015020c 	move	$r12,$r16
1c000798:	64019c0f 	bge	$r0,$r15,412(0x19c) # 1c000934 <bubble_sort+0x2c4>
1c00079c:	001141c5 	sub.w	$r5,$r14,$r16
1c0007a0:	02bff0a6 	addi.w	$r6,$r5,-4(0xffc)
1c0007a4:	004488c8 	srli.w	$r8,$r6,0x2
1c0007a8:	02800509 	addi.w	$r9,$r8,1(0x1)
1c0007ac:	03401d2a 	andi	$r10,$r9,0x7
1c0007b0:	5800d940 	beq	$r10,$r0,216(0xd8) # 1c000888 <bubble_sort+0x218>
1c0007b4:	0280040b 	addi.w	$r11,$r0,1(0x1)
1c0007b8:	5800b54b 	beq	$r10,$r11,180(0xb4) # 1c00086c <bubble_sort+0x1fc>
1c0007bc:	02800812 	addi.w	$r18,$r0,2(0x2)
1c0007c0:	58009552 	beq	$r10,$r18,148(0x94) # 1c000854 <bubble_sort+0x1e4>
1c0007c4:	02800c13 	addi.w	$r19,$r0,3(0x3)
1c0007c8:	58007553 	beq	$r10,$r19,116(0x74) # 1c00083c <bubble_sort+0x1cc>
1c0007cc:	02801014 	addi.w	$r20,$r0,4(0x4)
1c0007d0:	58005554 	beq	$r10,$r20,84(0x54) # 1c000824 <bubble_sort+0x1b4>
1c0007d4:	0280140d 	addi.w	$r13,$r0,5(0x5)
1c0007d8:	5800354d 	beq	$r10,$r13,52(0x34) # 1c00080c <bubble_sort+0x19c>
1c0007dc:	02801811 	addi.w	$r17,$r0,6(0x6)
1c0007e0:	58001551 	beq	$r10,$r17,20(0x14) # 1c0007f4 <bubble_sort+0x184>
1c0007e4:	2880020c 	ld.w	$r12,$r16,0
1c0007e8:	28801207 	ld.w	$r7,$r16,4(0x4)
1c0007ec:	600168ec 	blt	$r7,$r12,360(0x168) # 1c000954 <bubble_sort+0x2e4>
1c0007f0:	0280120c 	addi.w	$r12,$r16,4(0x4)
1c0007f4:	28800184 	ld.w	$r4,$r12,0
1c0007f8:	28801185 	ld.w	$r5,$r12,4(0x4)
1c0007fc:	64000ca4 	bge	$r5,$r4,12(0xc) # 1c000808 <bubble_sort+0x198>
1c000800:	29800185 	st.w	$r5,$r12,0
1c000804:	29801184 	st.w	$r4,$r12,4(0x4)
1c000808:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c00080c:	28800186 	ld.w	$r6,$r12,0
1c000810:	28801188 	ld.w	$r8,$r12,4(0x4)
1c000814:	64000d06 	bge	$r8,$r6,12(0xc) # 1c000820 <bubble_sort+0x1b0>
1c000818:	29800188 	st.w	$r8,$r12,0
1c00081c:	29801186 	st.w	$r6,$r12,4(0x4)
1c000820:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c000824:	28800189 	ld.w	$r9,$r12,0
1c000828:	2880118a 	ld.w	$r10,$r12,4(0x4)
1c00082c:	64000d49 	bge	$r10,$r9,12(0xc) # 1c000838 <bubble_sort+0x1c8>
1c000830:	2980018a 	st.w	$r10,$r12,0
1c000834:	29801189 	st.w	$r9,$r12,4(0x4)
1c000838:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c00083c:	2880018b 	ld.w	$r11,$r12,0
1c000840:	28801192 	ld.w	$r18,$r12,4(0x4)
1c000844:	64000e4b 	bge	$r18,$r11,12(0xc) # 1c000850 <bubble_sort+0x1e0>
1c000848:	29800192 	st.w	$r18,$r12,0
1c00084c:	2980118b 	st.w	$r11,$r12,4(0x4)
1c000850:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c000854:	28800193 	ld.w	$r19,$r12,0
1c000858:	28801194 	ld.w	$r20,$r12,4(0x4)
1c00085c:	64000e93 	bge	$r20,$r19,12(0xc) # 1c000868 <bubble_sort+0x1f8>
1c000860:	29800194 	st.w	$r20,$r12,0
1c000864:	29801193 	st.w	$r19,$r12,4(0x4)
1c000868:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c00086c:	2880018d 	ld.w	$r13,$r12,0
1c000870:	28801191 	ld.w	$r17,$r12,4(0x4)
1c000874:	64000e2d 	bge	$r17,$r13,12(0xc) # 1c000880 <bubble_sort+0x210>
1c000878:	29800191 	st.w	$r17,$r12,0
1c00087c:	2980118d 	st.w	$r13,$r12,4(0x4)
1c000880:	0280118c 	addi.w	$r12,$r12,4(0x4)
1c000884:	5800b18e 	beq	$r12,$r14,176(0xb0) # 1c000934 <bubble_sort+0x2c4>
1c000888:	28800187 	ld.w	$r7,$r12,0
1c00088c:	28801184 	ld.w	$r4,$r12,4(0x4)
1c000890:	64000c87 	bge	$r4,$r7,12(0xc) # 1c00089c <bubble_sort+0x22c>
1c000894:	29800184 	st.w	$r4,$r12,0
1c000898:	29801187 	st.w	$r7,$r12,4(0x4)
1c00089c:	02801185 	addi.w	$r5,$r12,4(0x4)
1c0008a0:	28801186 	ld.w	$r6,$r12,4(0x4)
1c0008a4:	288010a8 	ld.w	$r8,$r5,4(0x4)
1c0008a8:	64000d06 	bge	$r8,$r6,12(0xc) # 1c0008b4 <bubble_sort+0x244>
1c0008ac:	29801188 	st.w	$r8,$r12,4(0x4)
1c0008b0:	298010a6 	st.w	$r6,$r5,4(0x4)
1c0008b4:	288010ac 	ld.w	$r12,$r5,4(0x4)
1c0008b8:	288020a9 	ld.w	$r9,$r5,8(0x8)
1c0008bc:	64000d2c 	bge	$r9,$r12,12(0xc) # 1c0008c8 <bubble_sort+0x258>
1c0008c0:	298010a9 	st.w	$r9,$r5,4(0x4)
1c0008c4:	298020ac 	st.w	$r12,$r5,8(0x8)
1c0008c8:	288020aa 	ld.w	$r10,$r5,8(0x8)
1c0008cc:	288030ab 	ld.w	$r11,$r5,12(0xc)
1c0008d0:	64000d6a 	bge	$r11,$r10,12(0xc) # 1c0008dc <bubble_sort+0x26c>
1c0008d4:	298020ab 	st.w	$r11,$r5,8(0x8)
1c0008d8:	298030aa 	st.w	$r10,$r5,12(0xc)
1c0008dc:	288030b3 	ld.w	$r19,$r5,12(0xc)
1c0008e0:	288040b2 	ld.w	$r18,$r5,16(0x10)
1c0008e4:	64000e53 	bge	$r18,$r19,12(0xc) # 1c0008f0 <bubble_sort+0x280>
1c0008e8:	298030b2 	st.w	$r18,$r5,12(0xc)
1c0008ec:	298040b3 	st.w	$r19,$r5,16(0x10)
1c0008f0:	288040b4 	ld.w	$r20,$r5,16(0x10)
1c0008f4:	288050ad 	ld.w	$r13,$r5,20(0x14)
1c0008f8:	64000db4 	bge	$r13,$r20,12(0xc) # 1c000904 <bubble_sort+0x294>
1c0008fc:	298040ad 	st.w	$r13,$r5,16(0x10)
1c000900:	298050b4 	st.w	$r20,$r5,20(0x14)
1c000904:	288050b1 	ld.w	$r17,$r5,20(0x14)
1c000908:	288060a7 	ld.w	$r7,$r5,24(0x18)
1c00090c:	64000cf1 	bge	$r7,$r17,12(0xc) # 1c000918 <bubble_sort+0x2a8>
1c000910:	298050a7 	st.w	$r7,$r5,20(0x14)
1c000914:	298060b1 	st.w	$r17,$r5,24(0x18)
1c000918:	288060a4 	ld.w	$r4,$r5,24(0x18)
1c00091c:	288070a6 	ld.w	$r6,$r5,28(0x1c)
1c000920:	64000cc4 	bge	$r6,$r4,12(0xc) # 1c00092c <bubble_sort+0x2bc>
1c000924:	298060a6 	st.w	$r6,$r5,24(0x18)
1c000928:	298070a4 	st.w	$r4,$r5,28(0x1c)
1c00092c:	028070ac 	addi.w	$r12,$r5,28(0x1c)
1c000930:	5fff598e 	bne	$r12,$r14,-168(0x3ff58) # 1c000888 <bubble_sort+0x218>
1c000934:	02bffdef 	addi.w	$r15,$r15,-1(0xfff)
1c000938:	02bff1c5 	addi.w	$r5,$r14,-4(0xffc)
1c00093c:	58000e0e 	beq	$r16,$r14,12(0xc) # 1c000948 <bubble_sort+0x2d8>
1c000940:	001500ae 	move	$r14,$r5
1c000944:	53fe53ff 	b	-432(0xffffe50) # 1c000794 <bubble_sort+0x124>
1c000948:	1c000024 	pcaddu12i	$r4,1(0x1)
1c00094c:	28b5f084 	ld.w	$r4,$r4,-644(0xd7c)
1c000950:	4c000020 	jirl	$r0,$r1,0
1c000954:	29800207 	st.w	$r7,$r16,0
1c000958:	2980120c 	st.w	$r12,$r16,4(0x4)
1c00095c:	53fe97ff 	b	-364(0xffffe94) # 1c0007f0 <bubble_sort+0x180>
1c000960:	2880008d 	ld.w	$r13,$r4,0
1c000964:	0280120c 	addi.w	$r12,$r16,4(0x4)
1c000968:	00150224 	move	$r4,$r17
1c00096c:	2980020d 	st.w	$r13,$r16,0
1c000970:	53fd67ff 	b	-668(0xffffd64) # 1c0006d4 <bubble_sort+0x64>
1c000974:	03400000 	andi	$r0,$r0,0x0
1c000978:	03400000 	andi	$r0,$r0,0x0
1c00097c:	03400000 	andi	$r0,$r0,0x0

1c000980 <printf>:
printf():
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:2
1c000980:	02be8063 	addi.w	$r3,$r3,-96(0xfa0)
1c000984:	2980b07a 	st.w	$r26,$r3,44(0x2c)
1c000988:	2980f061 	st.w	$r1,$r3,60(0x3c)
1c00098c:	2980e077 	st.w	$r23,$r3,56(0x38)
1c000990:	2980d078 	st.w	$r24,$r3,52(0x34)
1c000994:	2980c079 	st.w	$r25,$r3,48(0x30)
1c000998:	2980a07b 	st.w	$r27,$r3,40(0x28)
1c00099c:	2980907c 	st.w	$r28,$r3,36(0x24)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:10
1c0009a0:	28000097 	ld.b	$r23,$r4,0
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:8
1c0009a4:	0281107a 	addi.w	$r26,$r3,68(0x44)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:2
1c0009a8:	29811065 	st.w	$r5,$r3,68(0x44)
1c0009ac:	29812066 	st.w	$r6,$r3,72(0x48)
1c0009b0:	29813067 	st.w	$r7,$r3,76(0x4c)
1c0009b4:	29814068 	st.w	$r8,$r3,80(0x50)
1c0009b8:	29815069 	st.w	$r9,$r3,84(0x54)
1c0009bc:	2981606a 	st.w	$r10,$r3,88(0x58)
1c0009c0:	2981706b 	st.w	$r11,$r3,92(0x5c)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:8
1c0009c4:	2980707a 	st.w	$r26,$r3,28(0x1c)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:10
1c0009c8:	580086e0 	beq	$r23,$r0,132(0x84) # 1c000a4c <printf+0xcc>
1c0009cc:	00150099 	move	$r25,$r4
1c0009d0:	00150018 	move	$r24,$r0
1c0009d4:	1c00003c 	pcaddu12i	$r28,1(0x1)
1c0009d8:	02a1b39c 	addi.w	$r28,$r28,-1940(0x86c)
1c0009dc:	0280201b 	addi.w	$r27,$r0,8(0x8)
1c0009e0:	50001c00 	b	28(0x1c) # 1c0009fc <printf+0x7c>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:80
1c0009e4:	001502e4 	move	$r4,$r23
1c0009e8:	5401c400 	bl	452(0x1c4) # 1c000bac <putchar>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:10 (discriminator 2)
1c0009ec:	02800718 	addi.w	$r24,$r24,1(0x1)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:10
1c0009f0:	0010632c 	add.w	$r12,$r25,$r24
1c0009f4:	28000197 	ld.b	$r23,$r12,0
1c0009f8:	580056e0 	beq	$r23,$r0,84(0x54) # 1c000a4c <printf+0xcc>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:13
1c0009fc:	0280940c 	addi.w	$r12,$r0,37(0x25)
1c000a00:	58001aec 	beq	$r23,$r12,24(0x18) # 1c000a18 <printf+0x98>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:79
1c000a04:	0280280c 	addi.w	$r12,$r0,10(0xa)
1c000a08:	5fffdeec 	bne	$r23,$r12,-36(0x3ffdc) # 1c0009e4 <printf+0x64>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:79 (discriminator 1)
1c000a0c:	02803404 	addi.w	$r4,$r0,13(0xd)
1c000a10:	54019c00 	bl	412(0x19c) # 1c000bac <putchar>
1c000a14:	53ffd3ff 	b	-48(0xfffffd0) # 1c0009e4 <printf+0x64>
1c000a18:	0010632c 	add.w	$r12,$r25,$r24
1c000a1c:	2800058d 	ld.b	$r13,$r12,1(0x1)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:15
1c000a20:	02800405 	addi.w	$r5,$r0,1(0x1)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:17
1c000a24:	02814c10 	addi.w	$r16,$r0,83(0x53)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:68
1c000a28:	0280280f 	addi.w	$r15,$r0,10(0xa)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:17
1c000a2c:	02bf6dac 	addi.w	$r12,$r13,-37(0xfdb)
1c000a30:	2980306c 	st.w	$r12,$r3,12(0xc)
1c000a34:	2a00306c 	ld.bu	$r12,$r3,12(0xc)
1c000a38:	68016a0c 	bltu	$r16,$r12,360(0x168) # 1c000ba0 <printf+0x220>
1c000a3c:	0040898c 	slli.w	$r12,$r12,0x2
1c000a40:	0010338c 	add.w	$r12,$r28,$r12
1c000a44:	2880018c 	ld.w	$r12,$r12,0
1c000a48:	4c000180 	jirl	$r0,$r12,0
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:84
1c000a4c:	2880f061 	ld.w	$r1,$r3,60(0x3c)
1c000a50:	2880e077 	ld.w	$r23,$r3,56(0x38)
1c000a54:	2880d078 	ld.w	$r24,$r3,52(0x34)
1c000a58:	2880c079 	ld.w	$r25,$r3,48(0x30)
1c000a5c:	2880b07a 	ld.w	$r26,$r3,44(0x2c)
1c000a60:	2880a07b 	ld.w	$r27,$r3,40(0x28)
1c000a64:	2880907c 	ld.w	$r28,$r3,36(0x24)
1c000a68:	00150004 	move	$r4,$r0
1c000a6c:	02818063 	addi.w	$r3,$r3,96(0x60)
1c000a70:	4c000020 	jirl	$r0,$r1,0
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:65
1c000a74:	0010632c 	add.w	$r12,$r25,$r24
1c000a78:	2800098d 	ld.b	$r13,$r12,2(0x2)
1c000a7c:	02800718 	addi.w	$r24,$r24,1(0x1)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:67 (discriminator 1)
1c000a80:	02bf3dac 	addi.w	$r12,$r13,-49(0xfcf)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:67
1c000a84:	2980306c 	st.w	$r12,$r3,12(0xc)
1c000a88:	2a00306c 	ld.bu	$r12,$r3,12(0xc)
1c000a8c:	00150005 	move	$r5,$r0
1c000a90:	6bff9f6c 	bltu	$r27,$r12,-100(0x3ff9c) # 1c000a2c <printf+0xac>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:68
1c000a94:	001c3ca5 	mul.w	$r5,$r5,$r15
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:67
1c000a98:	02800718 	addi.w	$r24,$r24,1(0x1)
1c000a9c:	0010632c 	add.w	$r12,$r25,$r24
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:68
1c000aa0:	02bf41ae 	addi.w	$r14,$r13,-48(0xfd0)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:67
1c000aa4:	2800058d 	ld.b	$r13,$r12,1(0x1)
1c000aa8:	02bf3dac 	addi.w	$r12,$r13,-49(0xfcf)
1c000aac:	2980306c 	st.w	$r12,$r3,12(0xc)
1c000ab0:	2a00306c 	ld.bu	$r12,$r3,12(0xc)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:68
1c000ab4:	001015c5 	add.w	$r5,$r14,$r5
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:67
1c000ab8:	6fffdf6c 	bgeu	$r27,$r12,-36(0x3ffdc) # 1c000a94 <printf+0x114>
1c000abc:	53ff73ff 	b	-144(0xfffff70) # 1c000a2c <printf+0xac>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:50
1c000ac0:	28800344 	ld.w	$r4,$r26,0
1c000ac4:	00150007 	move	$r7,$r0
1c000ac8:	02800806 	addi.w	$r6,$r0,2(0x2)
1c000acc:	5401cc00 	bl	460(0x1cc) # 1c000c98 <printbase>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:51
1c000ad0:	0280135a 	addi.w	$r26,$r26,4(0x4)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:52
1c000ad4:	02800718 	addi.w	$r24,$r24,1(0x1)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:53
1c000ad8:	53ff17ff 	b	-236(0xfffff14) # 1c0009ec <printf+0x6c>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:25
1c000adc:	28800344 	ld.w	$r4,$r26,0
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:27
1c000ae0:	02800718 	addi.w	$r24,$r24,1(0x1)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:26
1c000ae4:	0280135a 	addi.w	$r26,$r26,4(0x4)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:25
1c000ae8:	5400c400 	bl	196(0xc4) # 1c000bac <putchar>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:28
1c000aec:	53ff03ff 	b	-256(0xfffff00) # 1c0009ec <printf+0x6c>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:35
1c000af0:	28800344 	ld.w	$r4,$r26,0
1c000af4:	02800407 	addi.w	$r7,$r0,1(0x1)
1c000af8:	02802806 	addi.w	$r6,$r0,10(0xa)
1c000afc:	54019c00 	bl	412(0x19c) # 1c000c98 <printbase>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:36
1c000b00:	0280135a 	addi.w	$r26,$r26,4(0x4)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:37
1c000b04:	02800718 	addi.w	$r24,$r24,1(0x1)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:38
1c000b08:	53fee7ff 	b	-284(0xffffee4) # 1c0009ec <printf+0x6c>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:40
1c000b0c:	28800344 	ld.w	$r4,$r26,0
1c000b10:	00150007 	move	$r7,$r0
1c000b14:	02802806 	addi.w	$r6,$r0,10(0xa)
1c000b18:	54018000 	bl	384(0x180) # 1c000c98 <printbase>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:41
1c000b1c:	0280135a 	addi.w	$r26,$r26,4(0x4)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:42
1c000b20:	02800b18 	addi.w	$r24,$r24,2(0x2)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:43
1c000b24:	53fecbff 	b	-312(0xffffec8) # 1c0009ec <printf+0x6c>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:45
1c000b28:	28800344 	ld.w	$r4,$r26,0
1c000b2c:	00150007 	move	$r7,$r0
1c000b30:	02802006 	addi.w	$r6,$r0,8(0x8)
1c000b34:	54016400 	bl	356(0x164) # 1c000c98 <printbase>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:46
1c000b38:	0280135a 	addi.w	$r26,$r26,4(0x4)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:47
1c000b3c:	02800718 	addi.w	$r24,$r24,1(0x1)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:48
1c000b40:	53feafff 	b	-340(0xffffeac) # 1c0009ec <printf+0x6c>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:56
1c000b44:	28800344 	ld.w	$r4,$r26,0
1c000b48:	00150007 	move	$r7,$r0
1c000b4c:	02804006 	addi.w	$r6,$r0,16(0x10)
1c000b50:	54014800 	bl	328(0x148) # 1c000c98 <printbase>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:57
1c000b54:	0280135a 	addi.w	$r26,$r26,4(0x4)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:58
1c000b58:	02800718 	addi.w	$r24,$r24,1(0x1)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:59
1c000b5c:	53fe93ff 	b	-368(0xffffe90) # 1c0009ec <printf+0x6c>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:20
1c000b60:	28800344 	ld.w	$r4,$r26,0
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:22
1c000b64:	02800718 	addi.w	$r24,$r24,1(0x1)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:21
1c000b68:	0280135a 	addi.w	$r26,$r26,4(0x4)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:20
1c000b6c:	54008c00 	bl	140(0x8c) # 1c000bf8 <putstring>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:23
1c000b70:	53fe7fff 	b	-388(0xffffe7c) # 1c0009ec <printf+0x6c>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:30
1c000b74:	28800344 	ld.w	$r4,$r26,0
1c000b78:	00150007 	move	$r7,$r0
1c000b7c:	02802806 	addi.w	$r6,$r0,10(0xa)
1c000b80:	54011800 	bl	280(0x118) # 1c000c98 <printbase>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:31
1c000b84:	0280135a 	addi.w	$r26,$r26,4(0x4)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:32
1c000b88:	02800718 	addi.w	$r24,$r24,1(0x1)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:33
1c000b8c:	53fe63ff 	b	-416(0xffffe60) # 1c0009ec <printf+0x6c>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:61
1c000b90:	02809404 	addi.w	$r4,$r0,37(0x25)
1c000b94:	54001800 	bl	24(0x18) # 1c000bac <putchar>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:62
1c000b98:	02800718 	addi.w	$r24,$r24,1(0x1)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:63
1c000b9c:	53fe53ff 	b	-432(0xffffe50) # 1c0009ec <printf+0x6c>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:73
1c000ba0:	02809404 	addi.w	$r4,$r0,37(0x25)
1c000ba4:	54000800 	bl	8(0x8) # 1c000bac <putchar>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printf.c:74
1c000ba8:	53fe47ff 	b	-444(0xffffe44) # 1c0009ec <printf+0x6c>

1c000bac <putchar>:
putchar():
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/putchar.c:2
1c000bac:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c000bb0:	29803079 	st.w	$r25,$r3,12(0xc)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/putchar.c:9
1c000bb4:	157f5ff9 	lu12i.w	$r25,-263425(0xbfaff)
1c000bb8:	03bc4339 	ori	$r25,$r25,0xf10
1c000bbc:	29000324 	st.b	$r4,$r25,0
1c000bc0:	03400000 	andi	$r0,$r0,0x0
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/putchar.c:5
1c000bc4:	00150004 	move	$r4,$r0
1c000bc8:	28803079 	ld.w	$r25,$r3,12(0xc)
1c000bcc:	02804063 	addi.w	$r3,$r3,16(0x10)
1c000bd0:	4c000020 	jirl	$r0,$r1,0

1c000bd4 <tgt_putchar>:
tgt_putchar():
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/putchar.c:8
1c000bd4:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c000bd8:	29803079 	st.w	$r25,$r3,12(0xc)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/putchar.c:9
1c000bdc:	157f5ff9 	lu12i.w	$r25,-263425(0xbfaff)
1c000be0:	03bc4339 	ori	$r25,$r25,0xf10
1c000be4:	29000324 	st.b	$r4,$r25,0
1c000be8:	03400000 	andi	$r0,$r0,0x0
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/putchar.c:16
1c000bec:	28803079 	ld.w	$r25,$r3,12(0xc)
1c000bf0:	02804063 	addi.w	$r3,$r3,16(0x10)
1c000bf4:	4c000020 	jirl	$r0,$r1,0

1c000bf8 <putstring>:
putstring():
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/puts.c:2
1c000bf8:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c000bfc:	29803061 	st.w	$r1,$r3,12(0xc)
1c000c00:	29802077 	st.w	$r23,$r3,8(0x8)
1c000c04:	29801078 	st.w	$r24,$r3,4(0x4)
1c000c08:	29800079 	st.w	$r25,$r3,0
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/puts.c:4
1c000c0c:	28000097 	ld.b	$r23,$r4,0
1c000c10:	580042e0 	beq	$r23,$r0,64(0x40) # 1c000c50 <putstring+0x58>
1c000c14:	00150098 	move	$r24,$r4
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/puts.c:6
1c000c18:	02802819 	addi.w	$r25,$r0,10(0xa)
1c000c1c:	50001400 	b	20(0x14) # 1c000c30 <putstring+0x38>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/puts.c:7
1c000c20:	001502e4 	move	$r4,$r23
1c000c24:	57ff8bff 	bl	-120(0xfffff88) # 1c000bac <putchar>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/puts.c:4
1c000c28:	28000317 	ld.b	$r23,$r24,0
1c000c2c:	580026e0 	beq	$r23,$r0,36(0x24) # 1c000c50 <putstring+0x58>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/puts.c:8
1c000c30:	02800718 	addi.w	$r24,$r24,1(0x1)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/puts.c:6
1c000c34:	5fffeef9 	bne	$r23,$r25,-20(0x3ffec) # 1c000c20 <putstring+0x28>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/puts.c:6 (discriminator 1)
1c000c38:	02803404 	addi.w	$r4,$r0,13(0xd)
1c000c3c:	57ff73ff 	bl	-144(0xfffff70) # 1c000bac <putchar>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/puts.c:7
1c000c40:	001502e4 	move	$r4,$r23
1c000c44:	57ff6bff 	bl	-152(0xfffff68) # 1c000bac <putchar>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/puts.c:4
1c000c48:	28000317 	ld.b	$r23,$r24,0
1c000c4c:	5fffe6e0 	bne	$r23,$r0,-28(0x3ffe4) # 1c000c30 <putstring+0x38>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/puts.c:11
1c000c50:	28803061 	ld.w	$r1,$r3,12(0xc)
1c000c54:	28802077 	ld.w	$r23,$r3,8(0x8)
1c000c58:	28801078 	ld.w	$r24,$r3,4(0x4)
1c000c5c:	28800079 	ld.w	$r25,$r3,0
1c000c60:	00150004 	move	$r4,$r0
1c000c64:	02804063 	addi.w	$r3,$r3,16(0x10)
1c000c68:	4c000020 	jirl	$r0,$r1,0

1c000c6c <puts>:
puts():
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/puts.c:15
1c000c6c:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c000c70:	29803061 	st.w	$r1,$r3,12(0xc)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/puts.c:16
1c000c74:	57ff87ff 	bl	-124(0xfffff84) # 1c000bf8 <putstring>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/puts.c:17
1c000c78:	02803404 	addi.w	$r4,$r0,13(0xd)
1c000c7c:	57ff33ff 	bl	-208(0xfffff30) # 1c000bac <putchar>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/puts.c:18
1c000c80:	02802804 	addi.w	$r4,$r0,10(0xa)
1c000c84:	57ff2bff 	bl	-216(0xfffff28) # 1c000bac <putchar>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/puts.c:20
1c000c88:	28803061 	ld.w	$r1,$r3,12(0xc)
1c000c8c:	00150004 	move	$r4,$r0
1c000c90:	02804063 	addi.w	$r3,$r3,16(0x10)
1c000c94:	4c000020 	jirl	$r0,$r1,0

1c000c98 <printbase>:
printbase():
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printbase.c:2
1c000c98:	02be8063 	addi.w	$r3,$r3,-96(0xfa0)
1c000c9c:	29816077 	st.w	$r23,$r3,88(0x58)
1c000ca0:	29817061 	st.w	$r1,$r3,92(0x5c)
1c000ca4:	29815078 	st.w	$r24,$r3,84(0x54)
1c000ca8:	29814079 	st.w	$r25,$r3,80(0x50)
1c000cac:	00150097 	move	$r23,$r4
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printbase.c:7
1c000cb0:	580008e0 	beq	$r7,$r0,8(0x8) # 1c000cb8 <printbase+0x20>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printbase.c:7 (discriminator 1)
1c000cb4:	6000a080 	blt	$r4,$r0,160(0xa0) # 1c000d54 <printbase+0xbc>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printbase.c:14
1c000cb8:	5800bee0 	beq	$r23,$r0,188(0xbc) # 1c000d74 <printbase+0xdc>
1c000cbc:	0280406c 	addi.w	$r12,$r3,16(0x10)
1c000cc0:	0280040e 	addi.w	$r14,$r0,1(0x1)
1c000cc4:	001131ce 	sub.w	$r14,$r14,$r12
1c000cc8:	50000800 	b	8(0x8) # 1c000cd0 <printbase+0x38>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printbase.c:17
1c000ccc:	001501b7 	move	$r23,$r13
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printbase.c:16
1c000cd0:	00219aed 	mod.wu	$r13,$r23,$r6
1c000cd4:	5c0008c0 	bne	$r6,$r0,8(0x8) # 1c000cdc <printbase+0x44>
1c000cd8:	002a0007 	break	0x7
1c000cdc:	2900018d 	st.b	$r13,$r12,0
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printbase.c:17
1c000ce0:	001031d8 	add.w	$r24,$r14,$r12
1c000ce4:	00211aed 	div.wu	$r13,$r23,$r6
1c000ce8:	5c0008c0 	bne	$r6,$r0,8(0x8) # 1c000cf0 <printbase+0x58>
1c000cec:	002a0007 	break	0x7
1c000cf0:	0280058c 	addi.w	$r12,$r12,1(0x1)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printbase.c:14
1c000cf4:	6fffdae6 	bgeu	$r23,$r6,-40(0x3ffd8) # 1c000ccc <printbase+0x34>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printbase.c:22
1c000cf8:	600054b8 	blt	$r5,$r24,84(0x54) # 1c000d4c <printbase+0xb4>
1c000cfc:	001500b7 	move	$r23,$r5
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printbase.c:25
1c000d00:	02802419 	addi.w	$r25,$r0,9(0x9)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printbase.c:24
1c000d04:	0280406c 	addi.w	$r12,$r3,16(0x10)
1c000d08:	00105d8c 	add.w	$r12,$r12,$r23
1c000d0c:	0280c004 	addi.w	$r4,$r0,48(0x30)
1c000d10:	60001717 	blt	$r24,$r23,20(0x14) # 1c000d24 <printbase+0x8c>
1c000d14:	283ffd8c 	ld.b	$r12,$r12,-1(0xfff)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printbase.c:25 (discriminator 1)
1c000d18:	02815d84 	addi.w	$r4,$r12,87(0x57)
1c000d1c:	60000b2c 	blt	$r25,$r12,8(0x8) # 1c000d24 <printbase+0x8c>
1c000d20:	0280c184 	addi.w	$r4,$r12,48(0x30)
1c000d24:	02bffef7 	addi.w	$r23,$r23,-1(0xfff)
1c000d28:	57fe87ff 	bl	-380(0xffffe84) # 1c000bac <putchar>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printbase.c:22 (discriminator 4)
1c000d2c:	5fffdae0 	bne	$r23,$r0,-40(0x3ffd8) # 1c000d04 <printbase+0x6c>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printbase.c:28
1c000d30:	28817061 	ld.w	$r1,$r3,92(0x5c)
1c000d34:	28816077 	ld.w	$r23,$r3,88(0x58)
1c000d38:	28815078 	ld.w	$r24,$r3,84(0x54)
1c000d3c:	28814079 	ld.w	$r25,$r3,80(0x50)
1c000d40:	00150004 	move	$r4,$r0
1c000d44:	02818063 	addi.w	$r3,$r3,96(0x60)
1c000d48:	4c000020 	jirl	$r0,$r1,0
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printbase.c:22
1c000d4c:	00150305 	move	$r5,$r24
1c000d50:	53ffafff 	b	-84(0xfffffac) # 1c000cfc <printbase+0x64>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printbase.c:10
1c000d54:	0280b404 	addi.w	$r4,$r0,45(0x2d)
1c000d58:	29803066 	st.w	$r6,$r3,12(0xc)
1c000d5c:	29802065 	st.w	$r5,$r3,8(0x8)
1c000d60:	57fe4fff 	bl	-436(0xffffe4c) # 1c000bac <putchar>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printbase.c:9
1c000d64:	00115c17 	sub.w	$r23,$r0,$r23
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printbase.c:10
1c000d68:	28802065 	ld.w	$r5,$r3,8(0x8)
1c000d6c:	28803066 	ld.w	$r6,$r3,12(0xc)
1c000d70:	53ff4fff 	b	-180(0xfffff4c) # 1c000cbc <printbase+0x24>
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/printbase.c:22
1c000d74:	67ffbc05 	bge	$r0,$r5,-68(0x3ffbc) # 1c000d30 <printbase+0x98>
1c000d78:	00150018 	move	$r24,$r0
1c000d7c:	53ff83ff 	b	-128(0xfffff80) # 1c000cfc <printbase+0x64>

1c000d80 <get_count>:
get_count():
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:18
1c000d80:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c000d84:	29803079 	st.w	$r25,$r3,12(0xc)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:7
1c000d88:	157f5fd9 	lu12i.w	$r25,-263426(0xbfafe)
1c000d8c:	28800324 	ld.w	$r4,$r25,0
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:20
1c000d90:	28803079 	ld.w	$r25,$r3,12(0xc)
1c000d94:	02804063 	addi.w	$r3,$r3,16(0x10)
1c000d98:	4c000020 	jirl	$r0,$r1,0

1c000d9c <_get_count>:
_get_count():
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:20
1c000d9c:	53ffe7ff 	b	-28(0xfffffe4) # 1c000d80 <get_count>

1c000da0 <get_count_my>:
get_count_my():
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:25
1c000da0:	00006004 	rdtimel.w	$r4,$r0
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:30
1c000da4:	4c000020 	jirl	$r0,$r1,0

1c000da8 <clock_gettime>:
clock_gettime():
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:33
1c000da8:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c000dac:	29803079 	st.w	$r25,$r3,12(0xc)
_get_count():
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:7
1c000db0:	157f5fd9 	lu12i.w	$r25,-263426(0xbfafe)
1c000db4:	2880032f 	ld.w	$r15,$r25,0
clock_gettime():
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:36
1c000db8:	0280280d 	addi.w	$r13,$r0,10(0xa)
1c000dbc:	001c35ed 	mul.w	$r13,$r15,$r13
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:37
1c000dc0:	02819010 	addi.w	$r16,$r0,100(0x64)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:36
1c000dc4:	028fa00c 	addi.w	$r12,$r0,1000(0x3e8)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:37
1c000dc8:	002141ee 	div.wu	$r14,$r15,$r16
1c000dcc:	5c000a00 	bne	$r16,$r0,8(0x8) # 1c000dd4 <clock_gettime+0x2c>
1c000dd0:	002a0007 	break	0x7
1c000dd4:	0021b1d1 	mod.wu	$r17,$r14,$r12
1c000dd8:	5c000980 	bne	$r12,$r0,8(0x8) # 1c000de0 <clock_gettime+0x38>
1c000ddc:	002a0007 	break	0x7
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:38
1c000de0:	1400030e 	lu12i.w	$r14,24(0x18)
1c000de4:	039a81ce 	ori	$r14,$r14,0x6a0
1c000de8:	002139f0 	div.wu	$r16,$r15,$r14
1c000dec:	5c0009c0 	bne	$r14,$r0,8(0x8) # 1c000df4 <clock_gettime+0x4c>
1c000df0:	002a0007 	break	0x7
1c000df4:	0021b20e 	mod.wu	$r14,$r16,$r12
1c000df8:	5c000980 	bne	$r12,$r0,8(0x8) # 1c000e00 <clock_gettime+0x58>
1c000dfc:	002a0007 	break	0x7
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:37
1c000e00:	298020b1 	st.w	$r17,$r5,8(0x8)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:38
1c000e04:	298030ae 	st.w	$r14,$r5,12(0xc)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:39
1c000e08:	298000a0 	st.w	$r0,$r5,0
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:42
1c000e0c:	28803079 	ld.w	$r25,$r3,12(0xc)
1c000e10:	00150004 	move	$r4,$r0
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:36
1c000e14:	0021b1ae 	mod.wu	$r14,$r13,$r12
1c000e18:	5c000980 	bne	$r12,$r0,8(0x8) # 1c000e20 <clock_gettime+0x78>
1c000e1c:	002a0007 	break	0x7
1c000e20:	298010ae 	st.w	$r14,$r5,4(0x4)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:42
1c000e24:	02804063 	addi.w	$r3,$r3,16(0x10)
1c000e28:	4c000020 	jirl	$r0,$r1,0

1c000e2c <get_clock>:
get_clock():
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:42
1c000e2c:	53ff57ff 	b	-172(0xfffff54) # 1c000d80 <get_count>

1c000e30 <get_ns>:
get_ns():
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:52
1c000e30:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c000e34:	29803079 	st.w	$r25,$r3,12(0xc)
_get_count():
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:7
1c000e38:	157f5fd9 	lu12i.w	$r25,-263426(0xbfafe)
1c000e3c:	28800324 	ld.w	$r4,$r25,0
get_ns():
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:55
1c000e40:	0280280c 	addi.w	$r12,$r0,10(0xa)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:57
1c000e44:	28803079 	ld.w	$r25,$r3,12(0xc)
1c000e48:	001c3084 	mul.w	$r4,$r4,$r12
1c000e4c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c000e50:	4c000020 	jirl	$r0,$r1,0

1c000e54 <get_us>:
get_us():
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:61
1c000e54:	02bfc063 	addi.w	$r3,$r3,-16(0xff0)
1c000e58:	29803079 	st.w	$r25,$r3,12(0xc)
_get_count():
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:7
1c000e5c:	157f5fd9 	lu12i.w	$r25,-263426(0xbfafe)
1c000e60:	28800324 	ld.w	$r4,$r25,0
get_us():
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:64
1c000e64:	0281900c 	addi.w	$r12,$r0,100(0x64)
/home/yiran/Desktop/nscscc-team-la32r/perf_test/soft/perf_func/lib/time.c:66
1c000e68:	28803079 	ld.w	$r25,$r3,12(0xc)
1c000e6c:	0021308d 	div.wu	$r13,$r4,$r12
1c000e70:	5c000980 	bne	$r12,$r0,8(0x8) # 1c000e78 <get_us+0x24>
1c000e74:	002a0007 	break	0x7
1c000e78:	001501a4 	move	$r4,$r13
1c000e7c:	02804063 	addi.w	$r3,$r3,16(0x10)
1c000e80:	4c000020 	jirl	$r0,$r1,0

Disassembly of section .data:

1c000e84 <a_ref-0x9c>:
1c000e84:	62627562 	blt	$r11,$r2,-105868(0x26274) # 1bfe70f8 <data_size+0x1bfe68b0>
1c000e88:	7320656c 	0x7320656c
1c000e8c:	2074726f 	ll.w	$r15,$r19,29808(0x7470)
1c000e90:	74736574 	xvmin.w	$xr20,$xr11,$xr25
1c000e94:	67656220 	bge	$r17,$r0,-39584(0x36560) # 1bff73f4 <data_size+0x1bff6bac>
1c000e98:	002e6e69 	0x002e6e69
1c000e9c:	62627562 	blt	$r11,$r2,-105868(0x26274) # 1bfe7110 <data_size+0x1bfe68c8>
1c000ea0:	7320656c 	0x7320656c
1c000ea4:	2074726f 	ll.w	$r15,$r19,29808(0x7470)
1c000ea8:	53534150 	b	88298304(0x5435340) # 214361e8 <_stack+0x5424e78>
1c000eac:	00000021 	0x00000021
1c000eb0:	62627562 	blt	$r11,$r2,-105868(0x26274) # 1bfe7124 <data_size+0x1bfe68dc>
1c000eb4:	7320656c 	0x7320656c
1c000eb8:	2074726f 	ll.w	$r15,$r19,29808(0x7470)
1c000ebc:	4f525245 	jirl	$r5,$r18,-44464(0x35250)
1c000ec0:	21212152 	sc.w	$r18,$r10,8480(0x2120)
1c000ec4:	00000000 	0x00000000
1c000ec8:	62627562 	blt	$r11,$r2,-105868(0x26274) # 1bfe713c <data_size+0x1bfe68f4>
1c000ecc:	7320656c 	0x7320656c
1c000ed0:	3a74726f 	0x3a74726f
1c000ed4:	746f5420 	0x746f5420
1c000ed8:	43206c61 	beqz	$r3,467052(0x7206c) # 1c072f44 <_stack+0x61bd4>
1c000edc:	746e756f 	0x746e756f
1c000ee0:	436f5328 	beqz	$r25,2322256(0x236f50) # 1c237e30 <_stack+0x226ac0>
1c000ee4:	756f6320 	0x756f6320
1c000ee8:	2029746e 	ll.w	$r14,$r3,10612(0x2974)
1c000eec:	7830203d 	0x7830203d
1c000ef0:	000a7825 	0x000a7825
1c000ef4:	62627562 	blt	$r11,$r2,-105868(0x26274) # 1bfe7168 <data_size+0x1bfe6920>
1c000ef8:	7320656c 	0x7320656c
1c000efc:	3a74726f 	0x3a74726f
1c000f00:	746f5420 	0x746f5420
1c000f04:	43206c61 	beqz	$r3,467052(0x7206c) # 1c072f70 <_stack+0x61c00>
1c000f08:	746e756f 	0x746e756f
1c000f0c:	55504328 	bl	-56537024(0xca15040) # 18a15f4c <data_size+0x18a15704>
1c000f10:	756f6320 	0x756f6320
1c000f14:	2029746e 	ll.w	$r14,$r3,10612(0x2974)
1c000f18:	7830203d 	0x7830203d
1c000f1c:	000a7825 	0x000a7825

1c000f20 <a_ref>:
1c000f20:	0000001c 	0x0000001c
1c000f24:	0000002a 	0x0000002a
1c000f28:	0000021f 	0x0000021f
1c000f2c:	00000431 	0x00000431
1c000f30:	000004ae 	0x000004ae
1c000f34:	00000639 	0x00000639
1c000f38:	00000652 	0x00000652
1c000f3c:	00000772 	0x00000772
1c000f40:	00000783 	0x00000783
1c000f44:	000008af 	0x000008af
1c000f48:	000008c9 	0x000008c9
1c000f4c:	0000090e 	0x0000090e
1c000f50:	00000b33 	0x00000b33
1c000f54:	00000ca2 	0x00000ca2
1c000f58:	00000cc0 	0x00000cc0
1c000f5c:	00000d62 	0x00000d62
1c000f60:	00000f43 	0x00000f43
1c000f64:	00000faf 	0x00000faf
1c000f68:	00001019 	clo.w	$r25,$r0
1c000f6c:	00001039 	clo.w	$r25,$r1
1c000f70:	0000106a 	clo.w	$r10,$r3
1c000f74:	000010bc 	clo.w	$r28,$r5
1c000f78:	00001261 	clo.w	$r1,$r19
1c000f7c:	00001269 	clo.w	$r9,$r19
1c000f80:	00001274 	clo.w	$r20,$r19
1c000f84:	000012a0 	clo.w	$r0,$r21
1c000f88:	000013ed 	clo.w	$r13,$r31
1c000f8c:	0000140a 	clz.w	$r10,$r0
1c000f90:	00001460 	clz.w	$r0,$r3
1c000f94:	000014b5 	clz.w	$r21,$r5
1c000f98:	000014f3 	clz.w	$r19,$r7
1c000f9c:	0000154c 	clz.w	$r12,$r10
1c000fa0:	00001575 	clz.w	$r21,$r11
1c000fa4:	000017df 	clz.w	$r31,$r30
1c000fa8:	00001815 	cto.w	$r21,$r0
1c000fac:	00001903 	cto.w	$r3,$r8
1c000fb0:	0000191a 	cto.w	$r26,$r8
1c000fb4:	000019cd 	cto.w	$r13,$r14
1c000fb8:	000019d5 	cto.w	$r21,$r14
1c000fbc:	00001a98 	cto.w	$r24,$r20
1c000fc0:	00001a9d 	cto.w	$r29,$r20
1c000fc4:	00001d84 	ctz.w	$r4,$r12
1c000fc8:	00001dcf 	ctz.w	$r15,$r14
1c000fcc:	00001eed 	ctz.w	$r13,$r23
1c000fd0:	000020d5 	clo.d	$r21,$r6
1c000fd4:	00002156 	clo.d	$r22,$r10
1c000fd8:	00002179 	clo.d	$r25,$r11
1c000fdc:	00002236 	clo.d	$r22,$r17
1c000fe0:	00002275 	clo.d	$r21,$r19
1c000fe4:	000023d2 	clo.d	$r18,$r30
1c000fe8:	000023d5 	clo.d	$r21,$r30
1c000fec:	00002442 	clz.d	$r2,$r2
1c000ff0:	00002457 	clz.d	$r23,$r2
1c000ff4:	00002503 	clz.d	$r3,$r8
1c000ff8:	00002510 	clz.d	$r16,$r8
1c000ffc:	0000253a 	clz.d	$r26,$r9
1c001000:	0000263e 	clz.d	$r30,$r17
1c001004:	00002644 	clz.d	$r4,$r18
1c001008:	0000265d 	clz.d	$r29,$r18
1c00100c:	00002726 	clz.d	$r6,$r25
1c001010:	0000273f 	clz.d	$r31,$r25
1c001014:	0000285b 	cto.d	$r27,$r2
1c001018:	0000290a 	cto.d	$r10,$r8
1c00101c:	0000295c 	cto.d	$r28,$r10
1c001020:	00002a32 	cto.d	$r18,$r17
1c001024:	00002a5b 	cto.d	$r27,$r18
1c001028:	00002b7e 	cto.d	$r30,$r27
1c00102c:	00002c3d 	ctz.d	$r29,$r1
1c001030:	00002c93 	ctz.d	$r19,$r4
1c001034:	00002f95 	ctz.d	$r21,$r28
1c001038:	00003016 	revb.2h	$r22,$r0
1c00103c:	0000314b 	revb.2h	$r11,$r10
1c001040:	0000323f 	revb.2h	$r31,$r17
1c001044:	000032bc 	revb.2h	$r28,$r21
1c001048:	000032ec 	revb.2h	$r12,$r23
1c00104c:	0000347b 	revb.4h	$r27,$r3
1c001050:	000035d9 	revb.4h	$r25,$r14
1c001054:	000036d4 	revb.4h	$r20,$r22
1c001058:	000038bc 	revb.2w	$r28,$r5
1c00105c:	00003951 	revb.2w	$r17,$r10
1c001060:	000039eb 	revb.2w	$r11,$r15
1c001064:	00003a22 	revb.2w	$r2,$r17
1c001068:	00003a2d 	revb.2w	$r13,$r17
1c00106c:	00003a9a 	revb.2w	$r26,$r20
1c001070:	00003afe 	revb.2w	$r30,$r23
1c001074:	00003b77 	revb.2w	$r23,$r27
1c001078:	00003bb5 	revb.2w	$r21,$r29
1c00107c:	00003dd7 	revb.d	$r23,$r14
1c001080:	00003e6b 	revb.d	$r11,$r19
1c001084:	00003e78 	revb.d	$r24,$r19
1c001088:	00003e8f 	revb.d	$r15,$r20
1c00108c:	00003ec5 	revb.d	$r5,$r22
1c001090:	00003efe 	revb.d	$r30,$r23
1c001094:	00003fea 	revb.d	$r10,$r31
1c001098:	00004020 	revh.2w	$r0,$r1
1c00109c:	0000403e 	revh.2w	$r30,$r1
1c0010a0:	00004059 	revh.2w	$r25,$r2
1c0010a4:	00004107 	revh.2w	$r7,$r8
1c0010a8:	0000416e 	revh.2w	$r14,$r11
1c0010ac:	0000428a 	revh.2w	$r10,$r20
1c0010b0:	000042df 	revh.2w	$r31,$r22
1c0010b4:	0000447a 	revh.d	$r26,$r3
1c0010b8:	0000447f 	revh.d	$r31,$r3
1c0010bc:	00004487 	revh.d	$r7,$r4
1c0010c0:	0000449f 	revh.d	$r31,$r4
1c0010c4:	000046f1 	revh.d	$r17,$r23
1c0010c8:	0000476d 	revh.d	$r13,$r27
1c0010cc:	000047b9 	revh.d	$r25,$r29
1c0010d0:	000047e1 	revh.d	$r1,$r31
1c0010d4:	00004821 	bitrev.4b	$r1,$r1
1c0010d8:	0000487f 	bitrev.4b	$r31,$r3
1c0010dc:	000048b8 	bitrev.4b	$r24,$r5
1c0010e0:	00004902 	bitrev.4b	$r2,$r8
1c0010e4:	00004a83 	bitrev.4b	$r3,$r20
1c0010e8:	00004b89 	bitrev.4b	$r9,$r28
1c0010ec:	00004c21 	bitrev.8b	$r1,$r1
1c0010f0:	00004c4f 	bitrev.8b	$r15,$r2
1c0010f4:	00004c89 	bitrev.8b	$r9,$r4
1c0010f8:	00004c8f 	bitrev.8b	$r15,$r4
1c0010fc:	00004cae 	bitrev.8b	$r14,$r5
1c001100:	00004caf 	bitrev.8b	$r15,$r5
1c001104:	00004d3d 	bitrev.8b	$r29,$r9
1c001108:	00004dbc 	bitrev.8b	$r28,$r13
1c00110c:	00004f26 	bitrev.8b	$r6,$r25
1c001110:	00004f5a 	bitrev.8b	$r26,$r26
1c001114:	00004fa2 	bitrev.8b	$r2,$r29
1c001118:	00004fa6 	bitrev.8b	$r6,$r29
1c00111c:	00004fe1 	bitrev.8b	$r1,$r31
1c001120:	00005075 	bitrev.w	$r21,$r3
1c001124:	00005083 	bitrev.w	$r3,$r4
1c001128:	00005135 	bitrev.w	$r21,$r9
1c00112c:	00005198 	bitrev.w	$r24,$r12
1c001130:	000051a4 	bitrev.w	$r4,$r13
1c001134:	00005222 	bitrev.w	$r2,$r17
1c001138:	000052a6 	bitrev.w	$r6,$r21
1c00113c:	0000534c 	bitrev.w	$r12,$r26
1c001140:	000054c4 	bitrev.d	$r4,$r6
1c001144:	00005539 	bitrev.d	$r25,$r9
1c001148:	000056fc 	bitrev.d	$r28,$r23
1c00114c:	0000585a 	ext.w.h	$r26,$r2
1c001150:	00005899 	ext.w.h	$r25,$r4
1c001154:	000058b2 	ext.w.h	$r18,$r5
1c001158:	0000597e 	ext.w.h	$r30,$r11
1c00115c:	00005b21 	ext.w.h	$r1,$r25
1c001160:	00005ba5 	ext.w.h	$r5,$r29
1c001164:	00005c7f 	ext.w.b	$r31,$r3
1c001168:	00005d0c 	ext.w.b	$r12,$r8
1c00116c:	00005d23 	ext.w.b	$r3,$r9
1c001170:	00005e2e 	ext.w.b	$r14,$r17
1c001174:	00005e67 	ext.w.b	$r7,$r19
1c001178:	00005f20 	ext.w.b	$r0,$r25
1c00117c:	00005f4f 	ext.w.b	$r15,$r26
1c001180:	00005f75 	ext.w.b	$r21,$r27
1c001184:	00005fbc 	ext.w.b	$r28,$r29
1c001188:	00005fd7 	ext.w.b	$r23,$r30
1c00118c:	000060f0 	rdtimel.w	$r16,$r7
1c001190:	0000610c 	rdtimel.w	$r12,$r8
1c001194:	0000610e 	rdtimel.w	$r14,$r8
1c001198:	00006121 	rdtimel.w	$r1,$r9
1c00119c:	000061f1 	rdtimel.w	$r17,$r15
1c0011a0:	00006249 	rdtimel.w	$r9,$r18
1c0011a4:	0000628d 	rdtimel.w	$r13,$r20
1c0011a8:	00006346 	rdtimel.w	$r6,$r26
1c0011ac:	00006358 	rdtimel.w	$r24,$r26
1c0011b0:	000064b8 	rdtimeh.w	$r24,$r5
1c0011b4:	000065f8 	rdtimeh.w	$r24,$r15
1c0011b8:	0000664b 	rdtimeh.w	$r11,$r18
1c0011bc:	0000667c 	rdtimeh.w	$r28,$r19
1c0011c0:	00006747 	rdtimeh.w	$r7,$r26
1c0011c4:	000067de 	rdtimeh.w	$r30,$r30
1c0011c8:	00006a54 	rdtime.d	$r20,$r18
1c0011cc:	00006ad8 	rdtime.d	$r24,$r22
1c0011d0:	00006b07 	rdtime.d	$r7,$r24
1c0011d4:	00006b6a 	rdtime.d	$r10,$r27
1c0011d8:	00006b9d 	rdtime.d	$r29,$r28
1c0011dc:	00006b9d 	rdtime.d	$r29,$r28
1c0011e0:	00006bff 	rdtime.d	$r31,$r31
1c0011e4:	00006c91 	cpucfg	$r17,$r4
1c0011e8:	00006cbb 	cpucfg	$r27,$r5
1c0011ec:	00006d04 	cpucfg	$r4,$r8
1c0011f0:	00006d49 	cpucfg	$r9,$r10
1c0011f4:	00006f0e 	cpucfg	$r14,$r24
1c0011f8:	00006f66 	cpucfg	$r6,$r27
1c0011fc:	00006f6a 	cpucfg	$r10,$r27
1c001200:	00006fb6 	cpucfg	$r22,$r29
1c001204:	00007029 	0x00007029
1c001208:	0000717c 	0x0000717c
1c00120c:	000074c3 	0x000074c3
1c001210:	000074d9 	0x000074d9
1c001214:	00007595 	0x00007595
1c001218:	0000768b 	0x0000768b
1c00121c:	00007729 	0x00007729
1c001220:	00007773 	0x00007773
1c001224:	00007935 	0x00007935
1c001228:	00007b3f 	0x00007b3f
1c00122c:	00007b90 	0x00007b90
1c001230:	00007cca 	0x00007cca
1c001234:	00007e27 	0x00007e27
1c001238:	00007f98 	0x00007f98
1c00123c:	00007f9e 	0x00007f9e
1c001240:	1c000b90 	pcaddu12i	$r16,92(0x5c)
1c001244:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001248:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c00124c:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001250:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001254:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001258:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c00125c:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001260:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001264:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001268:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c00126c:	1c000a74 	pcaddu12i	$r20,83(0x53)
1c001270:	1c000a80 	pcaddu12i	$r0,84(0x54)
1c001274:	1c000a80 	pcaddu12i	$r0,84(0x54)
1c001278:	1c000a80 	pcaddu12i	$r0,84(0x54)
1c00127c:	1c000a80 	pcaddu12i	$r0,84(0x54)
1c001280:	1c000a80 	pcaddu12i	$r0,84(0x54)
1c001284:	1c000a80 	pcaddu12i	$r0,84(0x54)
1c001288:	1c000a80 	pcaddu12i	$r0,84(0x54)
1c00128c:	1c000a80 	pcaddu12i	$r0,84(0x54)
1c001290:	1c000a80 	pcaddu12i	$r0,84(0x54)
1c001294:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001298:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c00129c:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012a0:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012a4:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012a8:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012ac:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012b0:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012b4:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012b8:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012bc:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012c0:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012c4:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012c8:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012cc:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012d0:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012d4:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012d8:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012dc:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012e0:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012e4:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012e8:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012ec:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012f0:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012f4:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012f8:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c0012fc:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001300:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001304:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001308:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c00130c:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001310:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001314:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001318:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c00131c:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001320:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001324:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001328:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c00132c:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001330:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001334:	1c000ac0 	pcaddu12i	$r0,86(0x56)
1c001338:	1c000adc 	pcaddu12i	$r28,86(0x56)
1c00133c:	1c000af0 	pcaddu12i	$r16,87(0x57)
1c001340:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001344:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001348:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c00134c:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001350:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001354:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001358:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c00135c:	1c000b0c 	pcaddu12i	$r12,88(0x58)
1c001360:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001364:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001368:	1c000b28 	pcaddu12i	$r8,89(0x59)
1c00136c:	1c000b44 	pcaddu12i	$r4,90(0x5a)
1c001370:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001374:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001378:	1c000b60 	pcaddu12i	$r0,91(0x5b)
1c00137c:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001380:	1c000b74 	pcaddu12i	$r20,91(0x5b)
1c001384:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c001388:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
1c00138c:	1c000b44 	pcaddu12i	$r4,90(0x5a)

1c001390 <_fdata>:
_fdata():
1c001390:	000047b9 	revh.d	$r25,$r29
1c001394:	000064b8 	rdtimeh.w	$r24,$r5
1c001398:	000019cd 	cto.w	$r13,$r14
1c00139c:	000067de 	rdtimeh.w	$r30,$r30
1c0013a0:	0000585a 	ext.w.h	$r26,$r2
1c0013a4:	00003bb5 	revb.2w	$r21,$r29
1c0013a8:	00006bff 	rdtime.d	$r31,$r31
1c0013ac:	00005d23 	ext.w.b	$r3,$r9
1c0013b0:	00003fea 	revb.d	$r10,$r31
1c0013b4:	0000273f 	clz.d	$r31,$r25
1c0013b8:	0000416e 	revh.2w	$r14,$r11
1c0013bc:	0000295c 	cto.d	$r28,$r10
1c0013c0:	00006c91 	cpucfg	$r17,$r4
1c0013c4:	00005198 	bitrev.w	$r24,$r12
1c0013c8:	00006ad8 	rdtime.d	$r24,$r22
1c0013cc:	000019d5 	cto.w	$r21,$r14
1c0013d0:	0000191a 	cto.w	$r26,$r8
1c0013d4:	00002503 	clz.d	$r3,$r8
1c0013d8:	000004ae 	0x000004ae
1c0013dc:	0000447a 	revh.d	$r26,$r3
1c0013e0:	00005b21 	ext.w.h	$r1,$r25
1c0013e4:	00007cca 	0x00007cca
1c0013e8:	00004487 	revh.d	$r7,$r4
1c0013ec:	0000002a 	0x0000002a
1c0013f0:	000054c4 	bitrev.d	$r4,$r6
1c0013f4:	00002179 	clo.d	$r25,$r11
1c0013f8:	00003a9a 	revb.2w	$r26,$r20
1c0013fc:	00001261 	clo.w	$r1,$r19
1c001400:	000032bc 	revb.2h	$r28,$r21
1c001404:	00006b9d 	rdtime.d	$r29,$r28
1c001408:	00004a83 	bitrev.4b	$r3,$r20
1c00140c:	00005f20 	ext.w.b	$r0,$r25
1c001410:	00004c21 	bitrev.8b	$r1,$r1
1c001414:	0000449f 	revh.d	$r31,$r4
1c001418:	00003016 	revb.2h	$r22,$r0
1c00141c:	000014f3 	clz.w	$r19,$r7
1c001420:	0000768b 	0x0000768b
1c001424:	0000428a 	revh.2w	$r10,$r20
1c001428:	00007935 	0x00007935
1c00142c:	00002275 	clo.d	$r21,$r19
1c001430:	00006b07 	rdtime.d	$r7,$r24
1c001434:	00003951 	revb.2w	$r17,$r10
1c001438:	00001460 	clz.w	$r0,$r3
1c00143c:	00003e6b 	revb.d	$r11,$r19
1c001440:	00006747 	rdtimeh.w	$r7,$r26
1c001444:	000074c3 	0x000074c3
1c001448:	00006249 	rdtimel.w	$r9,$r18
1c00144c:	000038bc 	revb.2w	$r28,$r5
1c001450:	0000487f 	bitrev.4b	$r31,$r3
1c001454:	000032ec 	revb.2h	$r12,$r23
1c001458:	0000263e 	clz.d	$r30,$r17
1c00145c:	000047e1 	revh.d	$r1,$r31
1c001460:	000008af 	0x000008af
1c001464:	00003ec5 	revb.d	$r5,$r22
1c001468:	00001eed 	ctz.w	$r13,$r23
1c00146c:	000010bc 	clo.w	$r28,$r5
1c001470:	00002726 	clz.d	$r6,$r25
1c001474:	000065f8 	rdtimeh.w	$r24,$r15
1c001478:	000039eb 	revb.2w	$r11,$r15
1c00147c:	00000b33 	0x00000b33
1c001480:	0000476d 	revh.d	$r13,$r27
1c001484:	00000431 	0x00000431
1c001488:	0000667c 	rdtimeh.w	$r28,$r19
1c00148c:	00005e2e 	ext.w.b	$r14,$r17
1c001490:	0000290a 	cto.d	$r10,$r8
1c001494:	000060f0 	rdtimel.w	$r16,$r7
1c001498:	0000610e 	rdtimel.w	$r14,$r8
1c00149c:	00001a9d 	cto.w	$r29,$r20
1c0014a0:	00005222 	bitrev.w	$r2,$r17
1c0014a4:	00006b6a 	rdtime.d	$r10,$r27
1c0014a8:	00000652 	0x00000652
1c0014ac:	000023d5 	clo.d	$r21,$r30
1c0014b0:	00000cc0 	0x00000cc0
1c0014b4:	00004f26 	bitrev.8b	$r6,$r25
1c0014b8:	00006f6a 	cpucfg	$r10,$r27
1c0014bc:	00002644 	clz.d	$r4,$r18
1c0014c0:	000056fc 	bitrev.d	$r28,$r23
1c0014c4:	00005c7f 	ext.w.b	$r31,$r3
1c0014c8:	0000534c 	bitrev.w	$r12,$r26
1c0014cc:	00003a22 	revb.2w	$r2,$r17
1c0014d0:	00004c8f 	bitrev.8b	$r15,$r4
1c0014d4:	000052a6 	bitrev.w	$r6,$r21
1c0014d8:	00002f95 	ctz.d	$r21,$r28
1c0014dc:	000013ed 	clo.w	$r13,$r31
1c0014e0:	00006346 	rdtimel.w	$r6,$r26
1c0014e4:	00001a98 	cto.w	$r24,$r20
1c0014e8:	00002156 	clo.d	$r22,$r10
1c0014ec:	00002442 	clz.d	$r2,$r2
1c0014f0:	00002a32 	cto.d	$r18,$r17
1c0014f4:	00006cbb 	cpucfg	$r27,$r5
1c0014f8:	00006fb6 	cpucfg	$r22,$r29
1c0014fc:	0000285b 	cto.d	$r27,$r2
1c001500:	00000faf 	0x00000faf
1c001504:	00004cae 	bitrev.8b	$r14,$r5
1c001508:	00005135 	bitrev.w	$r21,$r9
1c00150c:	00007f98 	0x00007f98
1c001510:	00005899 	ext.w.h	$r25,$r4
1c001514:	00002c93 	ctz.d	$r19,$r4
1c001518:	000074d9 	0x000074d9
1c00151c:	0000628d 	rdtimel.w	$r13,$r20
1c001520:	00001815 	cto.w	$r21,$r0
1c001524:	00000d62 	0x00000d62
1c001528:	0000447f 	revh.d	$r31,$r3
1c00152c:	00007b90 	0x00007b90
1c001530:	00004c89 	bitrev.8b	$r9,$r4
1c001534:	00007729 	0x00007729
1c001538:	00003b77 	revb.2w	$r23,$r27
1c00153c:	0000090e 	0x0000090e
1c001540:	000036d4 	revb.4h	$r20,$r22
1c001544:	000051a4 	bitrev.w	$r4,$r13
1c001548:	00001d84 	ctz.w	$r4,$r12
1c00154c:	00006358 	rdtimel.w	$r24,$r26
1c001550:	00003e8f 	revb.d	$r15,$r20
1c001554:	00002236 	clo.d	$r22,$r17
1c001558:	00001269 	clo.w	$r9,$r19
1c00155c:	0000664b 	rdtimeh.w	$r11,$r18
1c001560:	00004dbc 	bitrev.8b	$r28,$r13
1c001564:	0000140a 	clz.w	$r10,$r0
1c001568:	00004059 	revh.2w	$r25,$r2
1c00156c:	00004caf 	bitrev.8b	$r15,$r5
1c001570:	00007f9e 	0x00007f9e
1c001574:	00005fbc 	ext.w.b	$r28,$r29
1c001578:	00004f5a 	bitrev.8b	$r26,$r26
1c00157c:	00001dcf 	ctz.w	$r15,$r14
1c001580:	000035d9 	revb.4h	$r25,$r14
1c001584:	00003efe 	revb.d	$r30,$r23
1c001588:	00004fe1 	bitrev.8b	$r1,$r31
1c00158c:	00006f66 	cpucfg	$r6,$r27
1c001590:	0000265d 	clz.d	$r29,$r18
1c001594:	00003dd7 	revb.d	$r23,$r14
1c001598:	00000ca2 	0x00000ca2
1c00159c:	00007773 	0x00007773
1c0015a0:	00004c4f 	bitrev.8b	$r15,$r2
1c0015a4:	000058b2 	ext.w.h	$r18,$r5
1c0015a8:	000012a0 	clo.w	$r0,$r21
1c0015ac:	00000783 	0x00000783
1c0015b0:	000048b8 	bitrev.4b	$r24,$r5
1c0015b4:	0000347b 	revb.4h	$r27,$r3
1c0015b8:	00007e27 	0x00007e27
1c0015bc:	00006f0e 	cpucfg	$r14,$r24
1c0015c0:	0000021f 	0x0000021f
1c0015c4:	00007595 	0x00007595
1c0015c8:	0000106a 	clo.w	$r10,$r3
1c0015cc:	00003e78 	revb.d	$r24,$r19
1c0015d0:	00007029 	0x00007029
1c0015d4:	00005075 	bitrev.w	$r21,$r3
1c0015d8:	00003a2d 	revb.2w	$r13,$r17
1c0015dc:	00006d04 	cpucfg	$r4,$r8
1c0015e0:	00004fa2 	bitrev.8b	$r2,$r29
1c0015e4:	00002510 	clz.d	$r16,$r8
1c0015e8:	00006d49 	cpucfg	$r9,$r10
1c0015ec:	00006b9d 	rdtime.d	$r29,$r28
1c0015f0:	00002457 	clz.d	$r23,$r2
1c0015f4:	00006121 	rdtimel.w	$r1,$r9
1c0015f8:	000061f1 	rdtimel.w	$r17,$r15
1c0015fc:	00004b89 	bitrev.4b	$r9,$r28
1c001600:	00002c3d 	ctz.d	$r29,$r1
1c001604:	000014b5 	clz.w	$r21,$r5
1c001608:	0000314b 	revb.2h	$r11,$r10
1c00160c:	00005e67 	ext.w.b	$r7,$r19
1c001610:	00005ba5 	ext.w.h	$r5,$r29
1c001614:	00005539 	bitrev.d	$r25,$r9
1c001618:	000020d5 	clo.d	$r21,$r6
1c00161c:	00001019 	clo.w	$r25,$r0
1c001620:	0000717c 	0x0000717c
1c001624:	000017df 	clz.w	$r31,$r30
1c001628:	0000610c 	rdtimel.w	$r12,$r8
1c00162c:	00005f75 	ext.w.b	$r21,$r27
1c001630:	00007b3f 	0x00007b3f
1c001634:	00000f43 	0x00000f43
1c001638:	000023d2 	clo.d	$r18,$r30
1c00163c:	00004107 	revh.2w	$r7,$r8
1c001640:	00006a54 	rdtime.d	$r20,$r18
1c001644:	00003afe 	revb.2w	$r30,$r23
1c001648:	0000253a 	clz.d	$r26,$r9
1c00164c:	000008c9 	0x000008c9
1c001650:	00005f4f 	ext.w.b	$r15,$r26
1c001654:	00004821 	bitrev.4b	$r1,$r1
1c001658:	00001575 	clz.w	$r21,$r11
1c00165c:	000042df 	revh.2w	$r31,$r22
1c001660:	00005083 	bitrev.w	$r3,$r4
1c001664:	00004fa6 	bitrev.8b	$r6,$r29
1c001668:	00004d3d 	bitrev.8b	$r29,$r9
1c00166c:	0000001c 	0x0000001c
1c001670:	000046f1 	revh.d	$r17,$r23
1c001674:	00001903 	cto.w	$r3,$r8
1c001678:	0000323f 	revb.2h	$r31,$r17
1c00167c:	00000639 	0x00000639
1c001680:	00002a5b 	cto.d	$r27,$r18
1c001684:	0000597e 	ext.w.h	$r30,$r11
1c001688:	00001274 	clo.w	$r20,$r19
1c00168c:	00002b7e 	cto.d	$r30,$r27
1c001690:	00001039 	clo.w	$r25,$r1
1c001694:	0000154c 	clz.w	$r12,$r10
1c001698:	00004902 	bitrev.4b	$r2,$r8
1c00169c:	00004020 	revh.2w	$r0,$r1
1c0016a0:	00000772 	0x00000772
1c0016a4:	00005fd7 	ext.w.b	$r23,$r30
1c0016a8:	0000403e 	revh.2w	$r30,$r1
1c0016ac:	00005d0c 	ext.w.b	$r12,$r8

1c0016b0 <__CTOR_LIST__>:
	...

1c0016b8 <__CTOR_END__>:
	...

1c0016c0 <__DTOR_END__>:
__DTOR_END__():
1c0016c0:	00000000 	0x00000000
1c0016c4:	1c0019b0 	pcaddu12i	$r16,205(0xcd)
1c0016c8:	1c011370 	pcaddu12i	$r16,2203(0x89b)

Disassembly of section .eh_frame:

1c0016cc <.eh_frame>:
1c0016cc:	0000000c 	0x0000000c
1c0016d0:	00000000 	0x00000000
1c0016d4:	7c010003 	0x7c010003
1c0016d8:	00030c01 	0x00030c01
1c0016dc:	00000068 	0x00000068
1c0016e0:	00000014 	0x00000014
1c0016e4:	1c0003a0 	pcaddu12i	$r0,29(0x1d)
1c0016e8:	000002c4 	0x000002c4
1c0016ec:	00000404 	0x00000404
1c0016f0:	04200e00 	csrxchg	$r0,$r16,0x803
1c0016f4:	00000024 	0x00000024
1c0016f8:	069b0181 	0x069b0181
1c0016fc:	0297079c 	addi.w	$r28,$r28,1473(0x5c1)
1c001700:	04990398 	csrxchg	$r24,$r28,0x2640
1c001704:	089d059a 	fnmadd.s	$f26,$f12,$f1,$f26
1c001708:	00016404 	0x00016404
1c00170c:	04c10a00 	csrxchg	$r0,$r16,0x3042
1c001710:	00000004 	0x00000004
1c001714:	000404d7 	alsl.w	$r23,$r6,$r1,0x1
1c001718:	04d80000 	csrrd	$r0,0x3600
1c00171c:	00000004 	0x00000004
1c001720:	000404d9 	alsl.w	$r25,$r6,$r1,0x1
1c001724:	04da0000 	csrrd	$r0,0x3680
1c001728:	00000004 	0x00000004
1c00172c:	000404db 	alsl.w	$r27,$r6,$r1,0x1
1c001730:	04dd0000 	csrrd	$r0,0x3740
1c001734:	00000008 	0x00000008
1c001738:	000c04dc 	bytepick.d	$r28,$r6,$r1,0x0
1c00173c:	000e0000 	bytepick.d	$r0,$r0,$r0,0x4
1c001740:	00000404 	0x00000404
1c001744:	00000b00 	0x00000b00
1c001748:	0000000c 	0x0000000c
1c00174c:	00000080 	0x00000080
1c001750:	1c000670 	pcaddu12i	$r16,51(0x33)
1c001754:	00000304 	0x00000304
1c001758:	00000060 	0x00000060
1c00175c:	00000090 	0x00000090
1c001760:	1c000980 	pcaddu12i	$r0,76(0x4c)
1c001764:	0000022c 	0x0000022c
1c001768:	00000404 	0x00000404
1c00176c:	04600e00 	csrxchg	$r0,$r16,0x1803
1c001770:	0000001c 	0x0000001c
1c001774:	09810d9a 	0x09810d9a
1c001778:	0b980a97 	0x0b980a97
1c00177c:	0e9b0c99 	0x0e9b0c99
1c001780:	b0040f9c 	0xb0040f9c
1c001784:	0a000000 	0x0a000000
1c001788:	000404c1 	alsl.w	$r1,$r6,$r1,0x1
1c00178c:	04d70000 	csrrd	$r0,0x35c0
1c001790:	00000004 	0x00000004
1c001794:	000404d8 	alsl.w	$r24,$r6,$r1,0x1
1c001798:	04d90000 	csrrd	$r0,0x3640
1c00179c:	00000004 	0x00000004
1c0017a0:	000404da 	alsl.w	$r26,$r6,$r1,0x1
1c0017a4:	04db0000 	csrrd	$r0,0x36c0
1c0017a8:	00000004 	0x00000004
1c0017ac:	000804dc 	bytepick.w	$r28,$r6,$r1,0x0
1c0017b0:	000e0000 	bytepick.d	$r0,$r0,$r0,0x4
1c0017b4:	00000404 	0x00000404
1c0017b8:	00000b00 	0x00000b00
1c0017bc:	00000028 	0x00000028
1c0017c0:	000000f4 	0x000000f4
1c0017c4:	1c000bac 	pcaddu12i	$r12,93(0x5d)
1c0017c8:	00000028 	0x00000028
1c0017cc:	00000404 	0x00000404
1c0017d0:	04100e00 	csrxchg	$r0,$r16,0x403
1c0017d4:	00000004 	0x00000004
1c0017d8:	18040199 	pcaddi	$r25,8204(0x200c)
1c0017dc:	d9000000 	0xd9000000
1c0017e0:	00000404 	0x00000404
1c0017e4:	00000e00 	0x00000e00
1c0017e8:	00000028 	0x00000028
1c0017ec:	00000120 	0x00000120
1c0017f0:	1c000bd4 	pcaddu12i	$r20,94(0x5e)
1c0017f4:	00000024 	0x00000024
1c0017f8:	00000404 	0x00000404
1c0017fc:	04100e00 	csrxchg	$r0,$r16,0x403
1c001800:	00000004 	0x00000004
1c001804:	14040199 	lu12i.w	$r25,8204(0x200c)
1c001808:	d9000000 	0xd9000000
1c00180c:	00000404 	0x00000404
1c001810:	00000e00 	0x00000e00
1c001814:	00000040 	0x00000040
1c001818:	0000014c 	0x0000014c
1c00181c:	1c000bf8 	pcaddu12i	$r24,95(0x5f)
1c001820:	00000074 	0x00000074
1c001824:	00000404 	0x00000404
1c001828:	04100e00 	csrxchg	$r0,$r16,0x403
1c00182c:	00000010 	0x00000010
1c001830:	02970181 	addi.w	$r1,$r12,1472(0x5c0)
1c001834:	04990398 	csrxchg	$r24,$r28,0x2640
1c001838:	00004804 	bitrev.4b	$r4,$r0
1c00183c:	0404c100 	csrxchg	$r0,$r8,0x130
1c001840:	d7000000 	0xd7000000
1c001844:	00000404 	0x00000404
1c001848:	0404d800 	csrrd	$r0,0x136
1c00184c:	d9000000 	0xd9000000
1c001850:	00000804 	0x00000804
1c001854:	00000e00 	0x00000e00
1c001858:	00000028 	0x00000028
1c00185c:	00000190 	0x00000190
1c001860:	1c000c6c 	pcaddu12i	$r12,99(0x63)
1c001864:	0000002c 	0x0000002c
1c001868:	00000404 	0x00000404
1c00186c:	04100e00 	csrxchg	$r0,$r16,0x403
1c001870:	00000004 	0x00000004
1c001874:	18040181 	pcaddi	$r1,8204(0x200c)
1c001878:	c1000000 	0xc1000000
1c00187c:	00000804 	0x00000804
1c001880:	00000e00 	0x00000e00
1c001884:	00000048 	0x00000048
1c001888:	000001bc 	0x000001bc
1c00188c:	1c000c98 	pcaddu12i	$r24,100(0x64)
1c001890:	000000e8 	0x000000e8
1c001894:	00000404 	0x00000404
1c001898:	04600e00 	csrxchg	$r0,$r16,0x1803
1c00189c:	00000010 	0x00000010
1c0018a0:	01810297 	0x01810297
1c0018a4:	04990398 	csrxchg	$r24,$r28,0x2640
1c0018a8:	00008804 	0x00008804
1c0018ac:	04c10a00 	csrxchg	$r0,$r16,0x3042
1c0018b0:	00000004 	0x00000004
1c0018b4:	000404d7 	alsl.w	$r23,$r6,$r1,0x1
1c0018b8:	04d80000 	csrrd	$r0,0x3600
1c0018bc:	00000004 	0x00000004
1c0018c0:	000804d9 	bytepick.w	$r25,$r6,$r1,0x0
1c0018c4:	000e0000 	bytepick.d	$r0,$r0,$r0,0x4
1c0018c8:	00000404 	0x00000404
1c0018cc:	00000b00 	0x00000b00
1c0018d0:	00000028 	0x00000028
1c0018d4:	00000208 	0x00000208
1c0018d8:	1c000d80 	pcaddu12i	$r0,108(0x6c)
1c0018dc:	0000001c 	0x0000001c
1c0018e0:	00000404 	0x00000404
1c0018e4:	04100e00 	csrxchg	$r0,$r16,0x403
1c0018e8:	00000004 	0x00000004
1c0018ec:	0c040199 	0x0c040199
1c0018f0:	d9000000 	0xd9000000
1c0018f4:	00000404 	0x00000404
1c0018f8:	00000e00 	0x00000e00
1c0018fc:	0000000c 	0x0000000c
1c001900:	00000234 	0x00000234
1c001904:	1c000d9c 	pcaddu12i	$r28,108(0x6c)
1c001908:	00000004 	0x00000004
1c00190c:	0000000c 	0x0000000c
1c001910:	00000244 	0x00000244
1c001914:	1c000da0 	pcaddu12i	$r0,109(0x6d)
1c001918:	00000008 	0x00000008
1c00191c:	00000028 	0x00000028
1c001920:	00000254 	0x00000254
1c001924:	1c000da8 	pcaddu12i	$r8,109(0x6d)
1c001928:	00000084 	0x00000084
1c00192c:	00000404 	0x00000404
1c001930:	04100e00 	csrxchg	$r0,$r16,0x403
1c001934:	00000004 	0x00000004
1c001938:	60040199 	blt	$r12,$r25,1024(0x400) # 1c001d38 <result+0x388>
1c00193c:	d9000000 	0xd9000000
1c001940:	00001804 	cto.w	$r4,$r0
1c001944:	00000e00 	0x00000e00
1c001948:	0000000c 	0x0000000c
1c00194c:	00000280 	0x00000280
1c001950:	1c000e2c 	pcaddu12i	$r12,113(0x71)
1c001954:	00000004 	0x00000004
1c001958:	00000028 	0x00000028
1c00195c:	00000290 	0x00000290
1c001960:	1c000e30 	pcaddu12i	$r16,113(0x71)
1c001964:	00000024 	0x00000024
1c001968:	00000404 	0x00000404
1c00196c:	04100e00 	csrxchg	$r0,$r16,0x403
1c001970:	00000004 	0x00000004
1c001974:	10040199 	addu16i.d	$r25,$r12,256(0x100)
1c001978:	d9000000 	0xd9000000
1c00197c:	00000804 	0x00000804
1c001980:	00000e00 	0x00000e00
1c001984:	00000028 	0x00000028
1c001988:	000002bc 	0x000002bc
1c00198c:	1c000e54 	pcaddu12i	$r20,114(0x72)
1c001990:	00000030 	0x00000030
1c001994:	00000404 	0x00000404
1c001998:	04100e00 	csrxchg	$r0,$r16,0x403
1c00199c:	00000004 	0x00000004
1c0019a0:	10040199 	addu16i.d	$r25,$r12,256(0x100)
1c0019a4:	d9000000 	0xd9000000
1c0019a8:	00001404 	clz.w	$r4,$r0
1c0019ac:	00000e00 	0x00000e00

Disassembly of section .bss:

1c0019b0 <result>:
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	0x0000001c
   4:	00000002 	0x00000002
   8:	00040000 	alsl.w	$r0,$r0,$r0,0x1
   c:	00000000 	0x00000000
  10:	1c000980 	pcaddu12i	$r0,76(0x4c)
  14:	0000022c 	0x0000022c
	...
  20:	0000001c 	0x0000001c
  24:	033c0002 	lu52i.d	$r2,$r0,-256(0xf00)
  28:	00040000 	alsl.w	$r0,$r0,$r0,0x1
  2c:	00000000 	0x00000000
  30:	1c000bac 	pcaddu12i	$r12,93(0x5d)
  34:	0000004c 	0x0000004c
	...
  40:	0000001c 	0x0000001c
  44:	04d20002 	csrrd	$r2,0x3480
  48:	00040000 	alsl.w	$r0,$r0,$r0,0x1
  4c:	00000000 	0x00000000
  50:	1c000bf8 	pcaddu12i	$r24,95(0x5f)
  54:	000000a0 	0x000000a0
	...
  60:	0000001c 	0x0000001c
  64:	07120002 	0x07120002
  68:	00040000 	alsl.w	$r0,$r0,$r0,0x1
  6c:	00000000 	0x00000000
  70:	1c000c98 	pcaddu12i	$r24,100(0x64)
  74:	000000e8 	0x000000e8
	...
  80:	0000001c 	0x0000001c
  84:	09520002 	vfmsub.s	$vr2,$vr0,$vr0,$vr4
  88:	00040000 	alsl.w	$r0,$r0,$r0,0x1
  8c:	00000000 	0x00000000
  90:	1c000d80 	pcaddu12i	$r0,108(0x6c)
  94:	00000104 	0x00000104
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	0x3a434347
   4:	4e472820 	jirl	$r0,$r1,-112856(0x24728)
   8:	38202955 	ldx.bu	$r21,$r10,$r10
   c:	302e332e 	vldrepl.w	$vr14,$r25,-464(0xe30)
	...

Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	0x0000000c
   4:	ffffffff 	0xffffffff
   8:	7c010003 	0x7c010003
   c:	00030c01 	0x00030c01
  10:	00000060 	0x00000060
  14:	00000000 	0x00000000
  18:	1c000980 	pcaddu12i	$r0,76(0x4c)
  1c:	0000022c 	0x0000022c
  20:	00000404 	0x00000404
  24:	04600e00 	csrxchg	$r0,$r16,0x1803
  28:	0000001c 	0x0000001c
  2c:	09810d9a 	0x09810d9a
  30:	0b980a97 	0x0b980a97
  34:	0e9b0c99 	0x0e9b0c99
  38:	b0040f9c 	0xb0040f9c
  3c:	0a000000 	0x0a000000
  40:	000404c1 	alsl.w	$r1,$r6,$r1,0x1
  44:	04d70000 	csrrd	$r0,0x35c0
  48:	00000004 	0x00000004
  4c:	000404d8 	alsl.w	$r24,$r6,$r1,0x1
  50:	04d90000 	csrrd	$r0,0x3640
  54:	00000004 	0x00000004
  58:	000404da 	alsl.w	$r26,$r6,$r1,0x1
  5c:	04db0000 	csrrd	$r0,0x36c0
  60:	00000004 	0x00000004
  64:	000804dc 	bytepick.w	$r28,$r6,$r1,0x0
  68:	000e0000 	bytepick.d	$r0,$r0,$r0,0x4
  6c:	00000404 	0x00000404
  70:	00000b00 	0x00000b00
  74:	0000000c 	0x0000000c
  78:	ffffffff 	0xffffffff
  7c:	7c010003 	0x7c010003
  80:	00030c01 	0x00030c01
  84:	00000028 	0x00000028
  88:	00000074 	0x00000074
  8c:	1c000bac 	pcaddu12i	$r12,93(0x5d)
  90:	00000028 	0x00000028
  94:	00000404 	0x00000404
  98:	04100e00 	csrxchg	$r0,$r16,0x403
  9c:	00000004 	0x00000004
  a0:	18040199 	pcaddi	$r25,8204(0x200c)
  a4:	d9000000 	0xd9000000
  a8:	00000404 	0x00000404
  ac:	00000e00 	0x00000e00
  b0:	00000028 	0x00000028
  b4:	00000074 	0x00000074
  b8:	1c000bd4 	pcaddu12i	$r20,94(0x5e)
  bc:	00000024 	0x00000024
  c0:	00000404 	0x00000404
  c4:	04100e00 	csrxchg	$r0,$r16,0x403
  c8:	00000004 	0x00000004
  cc:	14040199 	lu12i.w	$r25,8204(0x200c)
  d0:	d9000000 	0xd9000000
  d4:	00000404 	0x00000404
  d8:	00000e00 	0x00000e00
  dc:	0000000c 	0x0000000c
  e0:	ffffffff 	0xffffffff
  e4:	7c010003 	0x7c010003
  e8:	00030c01 	0x00030c01
  ec:	00000040 	0x00000040
  f0:	000000dc 	0x000000dc
  f4:	1c000bf8 	pcaddu12i	$r24,95(0x5f)
  f8:	00000074 	0x00000074
  fc:	00000404 	0x00000404
 100:	04100e00 	csrxchg	$r0,$r16,0x403
 104:	00000010 	0x00000010
 108:	02970181 	addi.w	$r1,$r12,1472(0x5c0)
 10c:	04990398 	csrxchg	$r24,$r28,0x2640
 110:	00004804 	bitrev.4b	$r4,$r0
 114:	0404c100 	csrxchg	$r0,$r8,0x130
 118:	d7000000 	0xd7000000
 11c:	00000404 	0x00000404
 120:	0404d800 	csrrd	$r0,0x136
 124:	d9000000 	0xd9000000
 128:	00000804 	0x00000804
 12c:	00000e00 	0x00000e00
 130:	00000028 	0x00000028
 134:	000000dc 	0x000000dc
 138:	1c000c6c 	pcaddu12i	$r12,99(0x63)
 13c:	0000002c 	0x0000002c
 140:	00000404 	0x00000404
 144:	04100e00 	csrxchg	$r0,$r16,0x403
 148:	00000004 	0x00000004
 14c:	18040181 	pcaddi	$r1,8204(0x200c)
 150:	c1000000 	0xc1000000
 154:	00000804 	0x00000804
 158:	00000e00 	0x00000e00
 15c:	0000000c 	0x0000000c
 160:	ffffffff 	0xffffffff
 164:	7c010003 	0x7c010003
 168:	00030c01 	0x00030c01
 16c:	00000048 	0x00000048
 170:	0000015c 	0x0000015c
 174:	1c000c98 	pcaddu12i	$r24,100(0x64)
 178:	000000e8 	0x000000e8
 17c:	00000404 	0x00000404
 180:	04600e00 	csrxchg	$r0,$r16,0x1803
 184:	00000010 	0x00000010
 188:	01810297 	0x01810297
 18c:	04990398 	csrxchg	$r24,$r28,0x2640
 190:	00008804 	0x00008804
 194:	04c10a00 	csrxchg	$r0,$r16,0x3042
 198:	00000004 	0x00000004
 19c:	000404d7 	alsl.w	$r23,$r6,$r1,0x1
 1a0:	04d80000 	csrrd	$r0,0x3600
 1a4:	00000004 	0x00000004
 1a8:	000804d9 	bytepick.w	$r25,$r6,$r1,0x0
 1ac:	000e0000 	bytepick.d	$r0,$r0,$r0,0x4
 1b0:	00000404 	0x00000404
 1b4:	00000b00 	0x00000b00
 1b8:	0000000c 	0x0000000c
 1bc:	ffffffff 	0xffffffff
 1c0:	7c010003 	0x7c010003
 1c4:	00030c01 	0x00030c01
 1c8:	00000028 	0x00000028
 1cc:	000001b8 	0x000001b8
 1d0:	1c000d80 	pcaddu12i	$r0,108(0x6c)
 1d4:	0000001c 	0x0000001c
 1d8:	00000404 	0x00000404
 1dc:	04100e00 	csrxchg	$r0,$r16,0x403
 1e0:	00000004 	0x00000004
 1e4:	0c040199 	0x0c040199
 1e8:	d9000000 	0xd9000000
 1ec:	00000404 	0x00000404
 1f0:	00000e00 	0x00000e00
 1f4:	0000000c 	0x0000000c
 1f8:	000001b8 	0x000001b8
 1fc:	1c000d9c 	pcaddu12i	$r28,108(0x6c)
 200:	00000004 	0x00000004
 204:	0000000c 	0x0000000c
 208:	000001b8 	0x000001b8
 20c:	1c000da0 	pcaddu12i	$r0,109(0x6d)
 210:	00000008 	0x00000008
 214:	00000028 	0x00000028
 218:	000001b8 	0x000001b8
 21c:	1c000da8 	pcaddu12i	$r8,109(0x6d)
 220:	00000084 	0x00000084
 224:	00000404 	0x00000404
 228:	04100e00 	csrxchg	$r0,$r16,0x403
 22c:	00000004 	0x00000004
 230:	60040199 	blt	$r12,$r25,1024(0x400) # 630 <data_size-0x218>
 234:	d9000000 	0xd9000000
 238:	00001804 	cto.w	$r4,$r0
 23c:	00000e00 	0x00000e00
 240:	0000000c 	0x0000000c
 244:	000001b8 	0x000001b8
 248:	1c000e2c 	pcaddu12i	$r12,113(0x71)
 24c:	00000004 	0x00000004
 250:	00000028 	0x00000028
 254:	000001b8 	0x000001b8
 258:	1c000e30 	pcaddu12i	$r16,113(0x71)
 25c:	00000024 	0x00000024
 260:	00000404 	0x00000404
 264:	04100e00 	csrxchg	$r0,$r16,0x403
 268:	00000004 	0x00000004
 26c:	10040199 	addu16i.d	$r25,$r12,256(0x100)
 270:	d9000000 	0xd9000000
 274:	00000804 	0x00000804
 278:	00000e00 	0x00000e00
 27c:	00000028 	0x00000028
 280:	000001b8 	0x000001b8
 284:	1c000e54 	pcaddu12i	$r20,114(0x72)
 288:	00000030 	0x00000030
 28c:	00000404 	0x00000404
 290:	04100e00 	csrxchg	$r0,$r16,0x403
 294:	00000004 	0x00000004
 298:	10040199 	addu16i.d	$r25,$r12,256(0x100)
 29c:	d9000000 	0xd9000000
 2a0:	00001404 	clz.w	$r4,$r0
 2a4:	00000e00 	0x00000e00

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	00000338 	0x00000338
   4:	00000004 	0x00000004
   8:	01040000 	0x01040000
   c:	20554e47 	ll.w	$r7,$r18,21836(0x554c)
  10:	20373143 	ll.w	$r3,$r10,14128(0x3730)
  14:	2e332e38 	0x2e332e38
  18:	6d2d2030 	bgeu	$r1,$r16,77088(0x12d20) # 12d38 <data_size+0x124f0>
  1c:	3d696261 	0x3d696261
  20:	33706c69 	xvstelm.h	$xr9,$r3,54(0x36),0xc
  24:	2d207332 	0x2d207332
  28:	6372616d 	blt	$r11,$r13,-36256(0x37260) # ffff7288 <_stack+0xe3fe5f18>
  2c:	6f6c3d68 	bgeu	$r11,$r8,-37828(0x36c3c) # ffff6c68 <_stack+0xe3fe58f8>
  30:	61676e6f 	blt	$r19,$r15,92012(0x1676c) # 1679c <data_size+0x15f54>
  34:	33686372 	xvstelm.h	$xr18,$r27,48(0x30),0xa
  38:	2d207232 	0x2d207232
  3c:	7570666d 	0x7570666d
  40:	6e6f6e3d 	bgeu	$r17,$r29,-102548(0x26f6c) # fffe6fac <_stack+0xe3fd5c3c>
  44:	6d2d2065 	bgeu	$r3,$r5,77088(0x12d20) # 12d64 <data_size+0x1251c>
  48:	646f6d63 	bge	$r11,$r3,28524(0x6f6c) # 6fb4 <data_size+0x676c>
  4c:	6e3d6c65 	bgeu	$r3,$r5,-115348(0x23d6c) # fffe3db8 <_stack+0xe3fd2a48>
  50:	616d726f 	blt	$r19,$r15,93552(0x16d70) # 16dc0 <data_size+0x16578>
  54:	6d2d206c 	bgeu	$r3,$r12,77088(0x12d20) # 12d74 <data_size+0x1252c>
  58:	656e7574 	bge	$r11,$r20,93812(0x16e74) # 16ecc <data_size+0x16684>
  5c:	6f6f6c3d 	bgeu	$r1,$r29,-37012(0x36f6c) # ffff6fc8 <_stack+0xe3fe5c58>
  60:	7261676e 	0x7261676e
  64:	32336863 	0x32336863
  68:	672d2072 	bge	$r3,$r18,-53984(0x32d20) # ffff2d88 <_stack+0xe3fe1a18>
  6c:	324f2d20 	xvldrepl.h	$xr0,$r9,1942(0x796)
  70:	6e662d20 	bgeu	$r9,$r0,-104916(0x2662c) # fffe669c <_stack+0xe3fd532c>
  74:	75622d6f 	0x75622d6f
  78:	69746c69 	bltu	$r3,$r9,95340(0x1746c) # 174e4 <data_size+0x16c9c>
  7c:	662d206e 	bge	$r3,$r14,-119520(0x22d20) # fffe2d9c <_stack+0xe3fd1a2c>
  80:	702d6f6e 	0x702d6f6e
  84:	0c006369 	0x0c006369
  88:	6e697270 	bgeu	$r19,$r16,-104080(0x26970) # fffe69f8 <_stack+0xe3fd5688>
  8c:	632e6674 	blt	$r19,$r20,-53660(0x32e64) # ffff2ef0 <_stack+0xe3fe1b80>
  90:	6f682f00 	bgeu	$r24,$r0,-38868(0x3682c) # ffff68bc <_stack+0xe3fe554c>
  94:	792f656d 	0x792f656d
  98:	6e617269 	bgeu	$r19,$r9,-106128(0x26170) # fffe6208 <_stack+0xe3fd4e98>
  9c:	7365442f 	vssrani.wu.d	$vr15,$vr1,0x11
  a0:	706f746b 	0x706f746b
  a4:	63736e2f 	blt	$r17,$r15,-35988(0x3736c) # ffff7410 <_stack+0xe3fe60a0>
  a8:	2d636373 	0x2d636373
  ac:	6d616574 	bgeu	$r11,$r20,90468(0x16164) # 16210 <data_size+0x159c8>
  b0:	33616c2d 	xvstelm.h	$xr13,$r1,182(0xb6),0x8
  b4:	702f7232 	vaddwev.d.wu	$vr18,$vr17,$vr28
  b8:	5f667265 	bne	$r19,$r5,-39312(0x36670) # ffff6728 <_stack+0xe3fe53b8>
  bc:	74736574 	xvmin.w	$xr20,$xr11,$xr25
  c0:	666f732f 	bge	$r25,$r15,-102544(0x26f70) # fffe7030 <_stack+0xe3fd5cc0>
  c4:	65702f74 	bge	$r27,$r20,94252(0x1702c) # 170f0 <data_size+0x168a8>
  c8:	665f6672 	bge	$r19,$r18,-106652(0x25f64) # fffe602c <_stack+0xe3fd4cbc>
  cc:	2f636e75 	0x2f636e75
  d0:	0062696c 	bstrins.w	$r12,$r11,0x2,0x1a
  d4:	1c000980 	pcaddu12i	$r0,76(0x4c)
  d8:	0000022c 	0x0000022c
  dc:	00000000 	0x00000000
  e0:	04030402 	csrrd	$r2,0xc1
  e4:	736e7507 	vssrarni.du.q	$vr7,$vr8,0x1d
  e8:	656e6769 	bge	$r27,$r9,93796(0x16e64) # 16f4c <data_size+0x16704>
  ec:	6e692064 	bgeu	$r3,$r4,-104160(0x26920) # fffe6a0c <_stack+0xe3fd569c>
  f0:	04030074 	csrxchg	$r20,$r3,0xc0
  f4:	6e6f6c07 	bgeu	$r0,$r7,-102548(0x26f6c) # fffe7060 <_stack+0xe3fd5cf0>
  f8:	6e752067 	bgeu	$r3,$r7,-101088(0x27520) # fffe7618 <_stack+0xe3fd62a8>
  fc:	6e676973 	bgeu	$r11,$r19,-104600(0x26768) # fffe6864 <_stack+0xe3fd54f4>
 100:	69206465 	bltu	$r3,$r5,73828(0x12064) # 12164 <data_size+0x1191c>
 104:	0400746e 	csrxchg	$r14,$r3,0x1d
 108:	6e697270 	bgeu	$r19,$r16,-104080(0x26970) # fffe6a78 <_stack+0xe3fd5708>
 10c:	01006674 	0x01006674
 110:	02f70501 	addi.d	$r1,$r8,-575(0xdc1)
 114:	09800000 	0x09800000
 118:	022c1c00 	slti	$r0,$r0,-1273(0xb07)
 11c:	9c010000 	0x9c010000
 120:	000002f7 	0x000002f7
 124:	746d6605 	0x746d6605
 128:	18010100 	pcaddi	$r0,2056(0x808)
 12c:	000002fe 	0x000002fe
 130:	00000000 	0x00000000
 134:	00690706 	bstrins.w	$r6,$r24,0x9,0x1
 138:	f7050301 	0xf7050301
 13c:	37000002 	0x37000002
 140:	07000000 	0x07000000
 144:	04010063 	csrxchg	$r3,$r3,0x40
 148:	00030406 	0x00030406
 14c:	0000b600 	0x0000b600
 150:	72610700 	0x72610700
 154:	05010067 	0x05010067
 158:	00031108 	0x00031108
 15c:	0000df00 	0x0000df00
 160:	70610800 	vabsd.w	$vr0,$vr0,$vr2
 164:	07060100 	0x07060100
 168:	000000e0 	0x000000e0
 16c:	7fbc9103 	0x7fbc9103
 170:	01007707 	0x01007707
 174:	02f70507 	addi.d	$r7,$r8,-575(0xdc1)
 178:	012d0000 	0x012d0000
 17c:	61090000 	blt	$r0,$r0,67840(0x10900) # 10a7c <data_size+0x10234>
 180:	6e696167 	bgeu	$r11,$r7,-104096(0x26960) # fffe6ae0 <_stack+0xe3fd5770>
 184:	01100100 	0x01100100
 188:	1c000a2c 	pcaddu12i	$r12,81(0x51)
 18c:	0000180a 	cto.w	$r10,$r0
 190:	00029f00 	0x00029f00
 194:	75700b00 	0x75700b00
 198:	72747374 	0x72747374
 19c:	00676e69 	bstrins.w	$r9,$r19,0x7,0x1b
 1a0:	f7051401 	0xf7051401
 1a4:	ad000002 	0xad000002
 1a8:	06000001 	cacop	0x1,$r0,0
 1ac:	00000c00 	0x00000c00
 1b0:	19010000 	pcaddi	$r0,-522240(0x80800)
 1b4:	0002f705 	0x0002f705
 1b8:	0001bf00 	asrtgt.d	$r24,$r15
 1bc:	0b000600 	0x0b000600
 1c0:	6e697270 	bgeu	$r19,$r16,-104080(0x26970) # fffe6b30 <_stack+0xe3fd57c0>
 1c4:	73616274 	vssrani.w.d	$vr20,$vr19,0x18
 1c8:	1e010065 	pcaddu18i	$r5,2051(0x803)
 1cc:	0002f705 	0x0002f705
 1d0:	0001d700 	asrtgt.d	$r24,$r21
 1d4:	0d000600 	fsel	$f0,$f16,$f1,$fcc0
 1d8:	1c000ad0 	pcaddu12i	$r16,86(0x56)
 1dc:	00000317 	0x00000317
 1e0:	000001ef 	0x000001ef
 1e4:	0156010e 	0x0156010e
 1e8:	57010e32 	bl	-120913652(0x8cb010c) # f8cb02f4 <_stack+0xdcc9ef84>
 1ec:	0f003001 	0x0f003001
 1f0:	1c000aec 	pcaddu12i	$r12,87(0x57)
 1f4:	00000323 	0x00000323
 1f8:	000b000d 	0x000b000d
 1fc:	0003171c 	0x0003171c
 200:	00021000 	0x00021000
 204:	56010e00 	bl	-134086388(0x802010c) # f8020310 <_stack+0xdc00efa0>
 208:	010e3a01 	0x010e3a01
 20c:	00310157 	0x00310157
 210:	000b1c0d 	0x000b1c0d
 214:	0003171c 	0x0003171c
 218:	00022800 	0x00022800
 21c:	56010e00 	bl	-134086388(0x802010c) # f8020328 <_stack+0xdc00efb8>
 220:	010e3a01 	0x010e3a01
 224:	00300157 	0x00300157
 228:	000b380d 	0x000b380d
 22c:	0003171c 	0x0003171c
 230:	00024100 	0x00024100
 234:	56010e00 	bl	-134086388(0x802010c) # f8020340 <_stack+0xdc00efd0>
 238:	0e008b02 	0x0e008b02
 23c:	30015701 	0x30015701
 240:	0b540d00 	0x0b540d00
 244:	03171c00 	lu52i.d	$r0,$r0,1479(0x5c7)
 248:	02590000 	sltui	$r0,$r0,1600(0x640)
 24c:	010e0000 	0x010e0000
 250:	0e400156 	0x0e400156
 254:	30015701 	0x30015701
 258:	0b700f00 	0x0b700f00
 25c:	032f1c00 	lu52i.d	$r0,$r0,-1081(0xbc7)
 260:	840d0000 	0x840d0000
 264:	171c000b 	lu32i.d	$r11,-466944(0x8e000)
 268:	7a000003 	0x7a000003
 26c:	0e000002 	0x0e000002
 270:	3a015601 	0x3a015601
 274:	0157010e 	0x0157010e
 278:	980d0030 	0x980d0030
 27c:	231c000b 	sc.d	$r11,$r0,7168(0x1c00)
 280:	8e000003 	0x8e000003
 284:	0e000002 	0x0e000002
 288:	08025401 	0x08025401
 28c:	a8100025 	0xa8100025
 290:	231c000b 	sc.d	$r11,$r0,7168(0x1c00)
 294:	0e000003 	0x0e000003
 298:	08025401 	0x08025401
 29c:	11000025 	addu16i.d	$r5,$r1,16384(0x4000)
 2a0:	00000000 	0x00000000
 2a4:	0000000c 	0x0000000c
 2a8:	05190100 	0x05190100
 2ac:	000002f7 	0x000002f7
 2b0:	000002b6 	0x000002b6
 2b4:	0c120006 	fcmp.ceq.s	$fcc6,$f0,$f0
 2b8:	141c000a 	lu12i.w	$r10,57344(0xe000)
 2bc:	e5000000 	0xe5000000
 2c0:	0c000002 	0x0c000002
 2c4:	00000000 	0x00000000
 2c8:	f7051901 	0xf7051901
 2cc:	d5000002 	0xd5000002
 2d0:	06000002 	cacop	0x2,$r0,0
 2d4:	0a141000 	xvfmadd.s	$xr0,$xr0,$xr4,$xr8
 2d8:	03231c00 	lu52i.d	$r0,$r0,-1849(0x8c7)
 2dc:	010e0000 	0x010e0000
 2e0:	003d0154 	0x003d0154
 2e4:	09ec1000 	vfnmsub.d	$vr0,$vr0,$vr4,$vr24
 2e8:	03231c00 	lu52i.d	$r0,$r0,-1849(0x8c7)
 2ec:	010e0000 	0x010e0000
 2f0:	00870254 	bstrins.d	$r20,$r18,0x7,0x0
 2f4:	03000000 	lu52i.d	$r0,$r0,0
 2f8:	6e690504 	bgeu	$r8,$r4,-104188(0x26904) # fffe6bfc <_stack+0xe3fd588c>
 2fc:	04130074 	csrxchg	$r20,$r3,0x4c0
 300:	0000030c 	0x0000030c
 304:	63060103 	blt	$r8,$r3,-64000(0x30600) # ffff0904 <_stack+0xe3fdf594>
 308:	00726168 	bstrins.w	$r8,$r11,0x12,0x18
 30c:	00030414 	0x00030414
 310:	e0041300 	0xe0041300
 314:	15000000 	lu12i.w	$r0,-524288(0x80000)
 318:	00000012 	0x00000012
 31c:	00000012 	0x00000012
 320:	15051e01 	lu12i.w	$r1,-513808(0x828f0)
	...
 32c:	15051901 	lu12i.w	$r1,-513848(0x828c8)
 330:	00000008 	0x00000008
 334:	00000008 	0x00000008
 338:	00051401 	alsl.w	$r1,$r0,$r5,0x3
 33c:	00000192 	0x00000192
 340:	01220004 	0x01220004
 344:	01040000 	0x01040000
 348:	20554e47 	ll.w	$r7,$r18,21836(0x554c)
 34c:	20373143 	ll.w	$r3,$r10,14128(0x3730)
 350:	2e332e38 	0x2e332e38
 354:	6d2d2030 	bgeu	$r1,$r16,77088(0x12d20) # 13074 <data_size+0x1282c>
 358:	3d696261 	0x3d696261
 35c:	33706c69 	xvstelm.h	$xr9,$r3,54(0x36),0xc
 360:	2d207332 	0x2d207332
 364:	6372616d 	blt	$r11,$r13,-36256(0x37260) # ffff75c4 <_stack+0xe3fe6254>
 368:	6f6c3d68 	bgeu	$r11,$r8,-37828(0x36c3c) # ffff6fa4 <_stack+0xe3fe5c34>
 36c:	61676e6f 	blt	$r19,$r15,92012(0x1676c) # 16ad8 <data_size+0x16290>
 370:	33686372 	xvstelm.h	$xr18,$r27,48(0x30),0xa
 374:	2d207232 	0x2d207232
 378:	7570666d 	0x7570666d
 37c:	6e6f6e3d 	bgeu	$r17,$r29,-102548(0x26f6c) # fffe72e8 <_stack+0xe3fd5f78>
 380:	6d2d2065 	bgeu	$r3,$r5,77088(0x12d20) # 130a0 <data_size+0x12858>
 384:	646f6d63 	bge	$r11,$r3,28524(0x6f6c) # 72f0 <data_size+0x6aa8>
 388:	6e3d6c65 	bgeu	$r3,$r5,-115348(0x23d6c) # fffe40f4 <_stack+0xe3fd2d84>
 38c:	616d726f 	blt	$r19,$r15,93552(0x16d70) # 170fc <data_size+0x168b4>
 390:	6d2d206c 	bgeu	$r3,$r12,77088(0x12d20) # 130b0 <data_size+0x12868>
 394:	656e7574 	bge	$r11,$r20,93812(0x16e74) # 17208 <data_size+0x169c0>
 398:	6f6f6c3d 	bgeu	$r1,$r29,-37012(0x36f6c) # ffff7304 <_stack+0xe3fe5f94>
 39c:	7261676e 	0x7261676e
 3a0:	32336863 	0x32336863
 3a4:	672d2072 	bge	$r3,$r18,-53984(0x32d20) # ffff30c4 <_stack+0xe3fe1d54>
 3a8:	324f2d20 	xvldrepl.h	$xr0,$r9,1942(0x796)
 3ac:	6e662d20 	bgeu	$r9,$r0,-104916(0x2662c) # fffe69d8 <_stack+0xe3fd5668>
 3b0:	75622d6f 	0x75622d6f
 3b4:	69746c69 	bltu	$r3,$r9,95340(0x1746c) # 17820 <data_size+0x16fd8>
 3b8:	662d206e 	bge	$r3,$r14,-119520(0x22d20) # fffe30d8 <_stack+0xe3fd1d68>
 3bc:	702d6f6e 	0x702d6f6e
 3c0:	0c006369 	0x0c006369
 3c4:	63747570 	blt	$r11,$r16,-35724(0x37474) # ffff7838 <_stack+0xe3fe64c8>
 3c8:	2e726168 	0x2e726168
 3cc:	682f0063 	bltu	$r3,$r3,12032(0x2f00) # 32cc <data_size+0x2a84>
 3d0:	2f656d6f 	0x2f656d6f
 3d4:	61726979 	blt	$r11,$r25,94824(0x17268) # 1763c <data_size+0x16df4>
 3d8:	65442f6e 	bge	$r27,$r14,82988(0x1442c) # 14804 <data_size+0x13fbc>
 3dc:	6f746b73 	bgeu	$r27,$r19,-35736(0x37468) # ffff7844 <_stack+0xe3fe64d4>
 3e0:	736e2f70 	vssrarni.du.q	$vr16,$vr27,0xb
 3e4:	63637363 	blt	$r27,$r3,-40080(0x36370) # ffff6754 <_stack+0xe3fe53e4>
 3e8:	6165742d 	blt	$r1,$r13,91508(0x16574) # 1695c <data_size+0x16114>
 3ec:	616c2d6d 	blt	$r11,$r13,93228(0x16c2c) # 17018 <data_size+0x167d0>
 3f0:	2f723233 	0x2f723233
 3f4:	66726570 	bge	$r11,$r16,-101788(0x27264) # fffe7658 <_stack+0xe3fd62e8>
 3f8:	7365745f 	vssrani.wu.d	$vr31,$vr2,0x1d
 3fc:	6f732f74 	bgeu	$r27,$r20,-36052(0x3732c) # ffff7728 <_stack+0xe3fe63b8>
 400:	702f7466 	vaddwev.d.wu	$vr6,$vr3,$vr29
 404:	5f667265 	bne	$r19,$r5,-39312(0x36670) # ffff6a74 <_stack+0xe3fe5704>
 408:	636e7566 	blt	$r11,$r6,-37260(0x36e74) # ffff727c <_stack+0xe3fe5f0c>
 40c:	62696c2f 	blt	$r1,$r15,-104084(0x2696c) # fffe6d78 <_stack+0xe3fd5a08>
 410:	000bac00 	0x000bac00
 414:	00004c1c 	bitrev.8b	$r28,$r0
 418:	00047500 	alsl.w	$r0,$r8,$r29,0x1
 41c:	07040200 	0x07040200
 420:	69736e75 	bltu	$r19,$r21,95084(0x1736c) # 1778c <data_size+0x16f44>
 424:	64656e67 	bge	$r19,$r7,25964(0x656c) # 6990 <data_size+0x6148>
 428:	746e6920 	0x746e6920
 42c:	07040200 	0x07040200
 430:	676e6f6c 	bge	$r27,$r12,-37268(0x36e6c) # ffff729c <_stack+0xe3fe5f2c>
 434:	736e7520 	vssrarni.du.q	$vr0,$vr9,0x1d
 438:	656e6769 	bge	$r27,$r9,93796(0x16e64) # 1729c <data_size+0x16a54>
 43c:	6e692064 	bgeu	$r3,$r4,-104160(0x26920) # fffe6d5c <_stack+0xe3fd59ec>
 440:	1c030074 	pcaddu12i	$r20,6147(0x1803)
 444:	01000000 	0x01000000
 448:	1e010607 	pcaddu18i	$r7,2096(0x830)
 44c:	04000001 	csrrd	$r1,0x0
 450:	07010063 	0x07010063
 454:	00011e06 	0x00011e06
 458:	04020000 	csrrd	$r0,0x80
 45c:	746e6905 	0x746e6905
 460:	75700500 	0x75700500
 464:	61686374 	blt	$r27,$r20,92256(0x16860) # 16cc4 <data_size+0x1647c>
 468:	01010072 	fadd.d	$f18,$f3,$f0
 46c:	00011e05 	0x00011e05
 470:	000bac00 	0x000bac00
 474:	0000281c 	cto.d	$r28,$r0
 478:	7e9c0100 	0x7e9c0100
 47c:	06000001 	cacop	0x1,$r0,0
 480:	01010063 	fadd.d	$f3,$f3,$f0
 484:	00011e11 	0x00011e11
 488:	0001d000 	asrtgt.d	$r0,$r20
 48c:	001c0700 	mul.w	$r0,$r24,$r1
 490:	03010000 	lu52i.d	$r0,$r0,64(0x40)
 494:	00011e01 	0x00011e01
 498:	00016300 	asrtle.d	$r24,$r24
 49c:	09000800 	0x09000800
 4a0:	00000106 	0x00000106
 4a4:	1c000bac 	pcaddu12i	$r12,93(0x5d)
 4a8:	00000030 	0x00000030
 4ac:	0a010301 	0x0a010301
 4b0:	00000113 	0x00000113
 4b4:	000001f1 	0x000001f1
 4b8:	060b0000 	cacop	0x0,$r0,704(0x2c0)
 4bc:	d4000001 	0xd4000001
 4c0:	241c000b 	ldptr.w	$r11,$r0,7168(0x1c00)
 4c4:	01000000 	0x01000000
 4c8:	01130c9c 	fcopysign.d	$f28,$f4,$f3
 4cc:	54010000 	bl	256(0x100) # 5cc <data_size-0x27c>
 4d0:	023c0000 	slti	$r0,$r0,-256(0xf00)
 4d4:	00040000 	alsl.w	$r0,$r0,$r0,0x1
 4d8:	000001df 	0x000001df
 4dc:	4e470104 	jirl	$r4,$r8,-112896(0x24700)
 4e0:	31432055 	vstelm.h	$vr21,$r2,-112(0x190),0x0
 4e4:	2e382037 	0x2e382037
 4e8:	20302e33 	ll.w	$r19,$r17,12332(0x302c)
 4ec:	62616d2d 	blt	$r9,$r13,-106132(0x2616c) # fffe6658 <_stack+0xe3fd52e8>
 4f0:	6c693d69 	bgeu	$r11,$r9,26940(0x693c) # 6e2c <data_size+0x65e4>
 4f4:	73323370 	0x73323370
 4f8:	616d2d20 	blt	$r9,$r0,93484(0x16d2c) # 17224 <data_size+0x169dc>
 4fc:	3d686372 	0x3d686372
 500:	6e6f6f6c 	bgeu	$r27,$r12,-102548(0x26f6c) # fffe746c <_stack+0xe3fd60fc>
 504:	63726167 	blt	$r11,$r7,-36256(0x37260) # ffff7764 <_stack+0xe3fe63f4>
 508:	72323368 	0x72323368
 50c:	666d2d20 	bge	$r9,$r0,-103124(0x26d2c) # fffe7238 <_stack+0xe3fd5ec8>
 510:	6e3d7570 	bgeu	$r11,$r16,-115340(0x23d74) # fffe4284 <_stack+0xe3fd2f14>
 514:	20656e6f 	ll.w	$r15,$r19,25964(0x656c)
 518:	6d636d2d 	bgeu	$r9,$r13,90988(0x1636c) # 16884 <data_size+0x1603c>
 51c:	6c65646f 	bgeu	$r3,$r15,25956(0x6564) # 6a80 <data_size+0x6238>
 520:	726f6e3d 	0x726f6e3d
 524:	206c616d 	ll.w	$r13,$r11,27744(0x6c60)
 528:	75746d2d 	0x75746d2d
 52c:	6c3d656e 	bgeu	$r11,$r14,15716(0x3d64) # 4290 <data_size+0x3a48>
 530:	676e6f6f 	bge	$r27,$r15,-37268(0x36e6c) # ffff739c <_stack+0xe3fe602c>
 534:	68637261 	bltu	$r19,$r1,25456(0x6370) # 68a4 <data_size+0x605c>
 538:	20723233 	ll.w	$r19,$r17,29232(0x7230)
 53c:	2d20672d 	0x2d20672d
 540:	2d20324f 	0x2d20324f
 544:	2d6f6e66 	0x2d6f6e66
 548:	6c697562 	bgeu	$r11,$r2,26996(0x6974) # 6ebc <data_size+0x6674>
 54c:	206e6974 	ll.w	$r20,$r11,28264(0x6e68)
 550:	6f6e662d 	bgeu	$r17,$r13,-37276(0x36e64) # ffff73b4 <_stack+0xe3fe6044>
 554:	6369702d 	blt	$r1,$r13,-38544(0x36970) # ffff6ec4 <_stack+0xe3fe5b54>
 558:	75700c00 	0x75700c00
 55c:	632e7374 	blt	$r27,$r20,-53648(0x32e70) # ffff33cc <_stack+0xe3fe205c>
 560:	6f682f00 	bgeu	$r24,$r0,-38868(0x3682c) # ffff6d8c <_stack+0xe3fe5a1c>
 564:	792f656d 	0x792f656d
 568:	6e617269 	bgeu	$r19,$r9,-106128(0x26170) # fffe66d8 <_stack+0xe3fd5368>
 56c:	7365442f 	vssrani.wu.d	$vr15,$vr1,0x11
 570:	706f746b 	0x706f746b
 574:	63736e2f 	blt	$r17,$r15,-35988(0x3736c) # ffff78e0 <_stack+0xe3fe6570>
 578:	2d636373 	0x2d636373
 57c:	6d616574 	bgeu	$r11,$r20,90468(0x16164) # 166e0 <data_size+0x15e98>
 580:	33616c2d 	xvstelm.h	$xr13,$r1,182(0xb6),0x8
 584:	702f7232 	vaddwev.d.wu	$vr18,$vr17,$vr28
 588:	5f667265 	bne	$r19,$r5,-39312(0x36670) # ffff6bf8 <_stack+0xe3fe5888>
 58c:	74736574 	xvmin.w	$xr20,$xr11,$xr25
 590:	666f732f 	bge	$r25,$r15,-102544(0x26f70) # fffe7500 <_stack+0xe3fd6190>
 594:	65702f74 	bge	$r27,$r20,94252(0x1702c) # 175c0 <data_size+0x16d78>
 598:	665f6672 	bge	$r19,$r18,-106652(0x25f64) # fffe64fc <_stack+0xe3fd518c>
 59c:	2f636e75 	0x2f636e75
 5a0:	0062696c 	bstrins.w	$r12,$r11,0x2,0x1a
 5a4:	1c000bf8 	pcaddu12i	$r24,95(0x5f)
 5a8:	000000a0 	0x000000a0
 5ac:	00000527 	0x00000527
 5b0:	75070402 	xvssran.hu.w	$xr2,$xr0,$xr1
 5b4:	6769736e 	bge	$r27,$r14,-38544(0x36970) # ffff6f24 <_stack+0xe3fe5bb4>
 5b8:	2064656e 	ll.w	$r14,$r11,25700(0x6464)
 5bc:	00746e69 	bstrins.w	$r9,$r19,0x14,0x1b
 5c0:	6c070402 	bgeu	$r0,$r2,1796(0x704) # cc4 <data_size+0x47c>
 5c4:	20676e6f 	ll.w	$r15,$r19,26476(0x676c)
 5c8:	69736e75 	bltu	$r19,$r21,95084(0x1736c) # 17934 <data_size+0x170ec>
 5cc:	64656e67 	bge	$r19,$r7,25964(0x656c) # 6b38 <data_size+0x62f0>
 5d0:	746e6920 	0x746e6920
 5d4:	75700300 	0x75700300
 5d8:	01007374 	0x01007374
 5dc:	0176050e 	0x0176050e
 5e0:	0c6c0000 	vfcmp.cune.d	$vr0,$vr0,$vr0
 5e4:	002c1c00 	alsl.d	$r0,$r0,$r7,0x1
 5e8:	9c010000 	0x9c010000
 5ec:	00000176 	0x00000176
 5f0:	01007304 	0x01007304
 5f4:	017d100e 	0x017d100e
 5f8:	02040000 	slti	$r0,$r0,256(0x100)
 5fc:	28050000 	ld.b	$r0,$r0,320(0x140)
 600:	01000000 	0x01000000
 604:	01761006 	0x01761006
 608:	013e0000 	0x013e0000
 60c:	00060000 	alsl.wu	$r0,$r0,$r0,0x1
 610:	000c7807 	bytepick.d	$r7,$r0,$r30,0x0
 614:	00018b1c 	0x00018b1c
 618:	00015300 	asrtle.d	$r24,$r20
 61c:	54010800 	bl	264(0x108) # 724 <data_size-0x124>
 620:	5401f303 	bl	-66321936(0xc0c01f0) # fc0c0810 <_stack+0xe00af4a0>
 624:	0c800700 	0x0c800700
 628:	02331c00 	slti	$r0,$r0,-825(0xcc7)
 62c:	01660000 	0x01660000
 630:	01080000 	0x01080000
 634:	003d0154 	0x003d0154
 638:	000c8809 	bytepick.d	$r9,$r0,$r2,0x1
 63c:	0002331c 	0x0002331c
 640:	54010800 	bl	264(0x108) # 748 <data_size-0x100>
 644:	00003a01 	revb.2w	$r1,$r16
 648:	69050402 	bltu	$r0,$r2,66820(0x10504) # 10b4c <data_size+0x10304>
 64c:	0a00746e 	0x0a00746e
 650:	00018304 	0x00018304
 654:	06010200 	cacop	0x0,$r16,64(0x40)
 658:	72616863 	0x72616863
 65c:	75700300 	0x75700300
 660:	72747374 	0x72747374
 664:	00676e69 	bstrins.w	$r9,$r19,0x7,0x1b
 668:	76050101 	0x76050101
 66c:	f8000001 	0xf8000001
 670:	741c000b 	0x741c000b
 674:	01000000 	0x01000000
 678:	0002339c 	0x0002339c
 67c:	00730400 	bstrins.w	$r0,$r0,0x13,0x1
 680:	7d150101 	0x7d150101
 684:	25000001 	stptr.w	$r1,$r0,0
 688:	0b000002 	0x0b000002
 68c:	03010063 	lu52i.d	$r3,$r3,64(0x40)
 690:	00018306 	0x00018306
 694:	00026800 	0x00026800
 698:	00480c00 	0x00480c00
 69c:	28050000 	ld.b	$r0,$r0,320(0x140)
 6a0:	01000000 	0x01000000
 6a4:	01761006 	0x01761006
 6a8:	01de0000 	0x01de0000
 6ac:	00060000 	alsl.wu	$r0,$r0,$r0,0x1
 6b0:	000c380d 	bytepick.d	$r13,$r0,$r14,0x0
 6b4:	0000081c 	0x0000081c
 6b8:	00020d00 	0x00020d00
 6bc:	00280500 	0x00280500
 6c0:	06010000 	cacop	0x0,$r0,64(0x40)
 6c4:	00017610 	0x00017610
 6c8:	0001fd00 	asrtgt.d	$r8,$r31
 6cc:	09000600 	0x09000600
 6d0:	1c000c40 	pcaddu12i	$r0,98(0x62)
 6d4:	00000233 	0x00000233
 6d8:	01540108 	0x01540108
 6dc:	0700003d 	0x0700003d
 6e0:	1c000c28 	pcaddu12i	$r8,97(0x61)
 6e4:	00000233 	0x00000233
 6e8:	00000221 	0x00000221
 6ec:	02540108 	sltui	$r8,$r8,1280(0x500)
 6f0:	09000087 	0x09000087
 6f4:	1c000c48 	pcaddu12i	$r8,98(0x62)
 6f8:	00000233 	0x00000233
 6fc:	02540108 	sltui	$r8,$r8,1280(0x500)
 700:	00000087 	0x00000087
 704:	00280e00 	0x00280e00
 708:	00280000 	0x00280000
 70c:	06010000 	cacop	0x0,$r0,64(0x40)
 710:	023c0010 	slti	$r16,$r0,-256(0xf00)
 714:	00040000 	alsl.w	$r0,$r0,$r0,0x1
 718:	000002aa 	0x000002aa
 71c:	4e470104 	jirl	$r4,$r8,-112896(0x24700)
 720:	31432055 	vstelm.h	$vr21,$r2,-112(0x190),0x0
 724:	2e382037 	0x2e382037
 728:	20302e33 	ll.w	$r19,$r17,12332(0x302c)
 72c:	62616d2d 	blt	$r9,$r13,-106132(0x2616c) # fffe6898 <_stack+0xe3fd5528>
 730:	6c693d69 	bgeu	$r11,$r9,26940(0x693c) # 706c <data_size+0x6824>
 734:	73323370 	0x73323370
 738:	616d2d20 	blt	$r9,$r0,93484(0x16d2c) # 17464 <data_size+0x16c1c>
 73c:	3d686372 	0x3d686372
 740:	6e6f6f6c 	bgeu	$r27,$r12,-102548(0x26f6c) # fffe76ac <_stack+0xe3fd633c>
 744:	63726167 	blt	$r11,$r7,-36256(0x37260) # ffff79a4 <_stack+0xe3fe6634>
 748:	72323368 	0x72323368
 74c:	666d2d20 	bge	$r9,$r0,-103124(0x26d2c) # fffe7478 <_stack+0xe3fd6108>
 750:	6e3d7570 	bgeu	$r11,$r16,-115340(0x23d74) # fffe44c4 <_stack+0xe3fd3154>
 754:	20656e6f 	ll.w	$r15,$r19,25964(0x656c)
 758:	6d636d2d 	bgeu	$r9,$r13,90988(0x1636c) # 16ac4 <data_size+0x1627c>
 75c:	6c65646f 	bgeu	$r3,$r15,25956(0x6564) # 6cc0 <data_size+0x6478>
 760:	726f6e3d 	0x726f6e3d
 764:	206c616d 	ll.w	$r13,$r11,27744(0x6c60)
 768:	75746d2d 	0x75746d2d
 76c:	6c3d656e 	bgeu	$r11,$r14,15716(0x3d64) # 44d0 <data_size+0x3c88>
 770:	676e6f6f 	bge	$r27,$r15,-37268(0x36e6c) # ffff75dc <_stack+0xe3fe626c>
 774:	68637261 	bltu	$r19,$r1,25456(0x6370) # 6ae4 <data_size+0x629c>
 778:	20723233 	ll.w	$r19,$r17,29232(0x7230)
 77c:	2d20672d 	0x2d20672d
 780:	2d20324f 	0x2d20324f
 784:	2d6f6e66 	0x2d6f6e66
 788:	6c697562 	bgeu	$r11,$r2,26996(0x6974) # 70fc <data_size+0x68b4>
 78c:	206e6974 	ll.w	$r20,$r11,28264(0x6e68)
 790:	6f6e662d 	bgeu	$r17,$r13,-37276(0x36e64) # ffff75f4 <_stack+0xe3fe6284>
 794:	6369702d 	blt	$r1,$r13,-38544(0x36970) # ffff7104 <_stack+0xe3fe5d94>
 798:	72700c00 	0x72700c00
 79c:	62746e69 	blt	$r19,$r9,-101268(0x2746c) # fffe7c08 <_stack+0xe3fd6898>
 7a0:	2e657361 	0x2e657361
 7a4:	682f0063 	bltu	$r3,$r3,12032(0x2f00) # 36a4 <data_size+0x2e5c>
 7a8:	2f656d6f 	0x2f656d6f
 7ac:	61726979 	blt	$r11,$r25,94824(0x17268) # 17a14 <data_size+0x171cc>
 7b0:	65442f6e 	bge	$r27,$r14,82988(0x1442c) # 14bdc <data_size+0x14394>
 7b4:	6f746b73 	bgeu	$r27,$r19,-35736(0x37468) # ffff7c1c <_stack+0xe3fe68ac>
 7b8:	736e2f70 	vssrarni.du.q	$vr16,$vr27,0xb
 7bc:	63637363 	blt	$r27,$r3,-40080(0x36370) # ffff6b2c <_stack+0xe3fe57bc>
 7c0:	6165742d 	blt	$r1,$r13,91508(0x16574) # 16d34 <data_size+0x164ec>
 7c4:	616c2d6d 	blt	$r11,$r13,93228(0x16c2c) # 173f0 <data_size+0x16ba8>
 7c8:	2f723233 	0x2f723233
 7cc:	66726570 	bge	$r11,$r16,-101788(0x27264) # fffe7a30 <_stack+0xe3fd66c0>
 7d0:	7365745f 	vssrani.wu.d	$vr31,$vr2,0x1d
 7d4:	6f732f74 	bgeu	$r27,$r20,-36052(0x3732c) # ffff7b00 <_stack+0xe3fe6790>
 7d8:	702f7466 	vaddwev.d.wu	$vr6,$vr3,$vr29
 7dc:	5f667265 	bne	$r19,$r5,-39312(0x36670) # ffff6e4c <_stack+0xe3fe5adc>
 7e0:	636e7566 	blt	$r11,$r6,-37260(0x36e74) # ffff7654 <_stack+0xe3fe62e4>
 7e4:	62696c2f 	blt	$r1,$r15,-104084(0x2696c) # fffe7150 <_stack+0xe3fd5de0>
 7e8:	000c9800 	bytepick.d	$r0,$r0,$r6,0x1
 7ec:	0000e81c 	0x0000e81c
 7f0:	00069000 	alsl.wu	$r0,$r0,$r4,0x2
 7f4:	07040200 	0x07040200
 7f8:	69736e75 	bltu	$r19,$r21,95084(0x1736c) # 17b64 <data_size+0x1731c>
 7fc:	64656e67 	bge	$r19,$r7,25964(0x656c) # 6d68 <data_size+0x6520>
 800:	746e6920 	0x746e6920
 804:	07040200 	0x07040200
 808:	676e6f6c 	bge	$r27,$r12,-37268(0x36e6c) # ffff7674 <_stack+0xe3fe6304>
 80c:	736e7520 	vssrarni.du.q	$vr0,$vr9,0x1d
 810:	656e6769 	bge	$r27,$r9,93796(0x16e64) # 17674 <data_size+0x16e2c>
 814:	6e692064 	bgeu	$r3,$r4,-104160(0x26920) # fffe7134 <_stack+0xe3fd5dc4>
 818:	70030074 	vsle.w	$vr20,$vr3,$vr0
 81c:	746e6972 	0x746e6972
 820:	65736162 	bge	$r11,$r2,95072(0x17360) # 17b80 <data_size+0x17338>
 824:	05010100 	0x05010100
 828:	00000208 	0x00000208
 82c:	1c000c98 	pcaddu12i	$r24,100(0x64)
 830:	000000e8 	0x000000e8
 834:	02089c01 	slti	$r1,$r0,551(0x227)
 838:	76040000 	0x76040000
 83c:	14010100 	lu12i.w	$r0,2056(0x808)
 840:	0000020f 	0x0000020f
 844:	0000027b 	0x0000027b
 848:	01007704 	0x01007704
 84c:	02081a01 	slti	$r1,$r16,518(0x206)
 850:	02cb0000 	addi.d	$r0,$r0,704(0x2c0)
 854:	62040000 	blt	$r0,$r0,-130048(0x20400) # fffe0c54 <_stack+0xe3fcf8e4>
 858:	00657361 	bstrins.w	$r1,$r27,0x5,0x1c
 85c:	08200101 	fmadd.d	$f1,$f8,$f0,$f0
 860:	0f000002 	0x0f000002
 864:	04000003 	csrrd	$r3,0x0
 868:	6e676973 	bgeu	$r11,$r19,-104600(0x26768) # fffe6fd0 <_stack+0xe3fd5c60>
 86c:	29010100 	st.b	$r0,$r8,64(0x40)
 870:	00000208 	0x00000208
 874:	00000353 	0x00000353
 878:	01006905 	0x01006905
 87c:	02080603 	slti	$r3,$r16,513(0x201)
 880:	03980000 	ori	$r0,$r0,0x600
 884:	6a050000 	bltu	$r0,$r0,-129792(0x20500) # fffe0d84 <_stack+0xe3fcfa14>
 888:	08030100 	0x08030100
 88c:	00000208 	0x00000208
 890:	000003eb 	0x000003eb
 894:	01006305 	0x01006305
 898:	02080604 	slti	$r4,$r16,513(0x201)
 89c:	04380000 	csrrd	$r0,0xe00
 8a0:	62060000 	blt	$r0,$r0,-129536(0x20600) # fffe0ea0 <_stack+0xe3fcfb30>
 8a4:	01006675 	0x01006675
 8a8:	021b0705 	slti	$r5,$r24,1729(0x6c1)
 8ac:	91030000 	0x91030000
 8b0:	76057fb0 	0x76057fb0
 8b4:	65756c61 	bge	$r3,$r1,95596(0x1756c) # 17e20 <data_size+0x175d8>
 8b8:	10060100 	addu16i.d	$r0,$r8,384(0x180)
 8bc:	000000f3 	0x000000f3
 8c0:	0000044b 	0x0000044b
 8c4:	000d5407 	bytepick.d	$r7,$r0,$r21,0x2
 8c8:	0000201c 	clo.d	$r28,$r0
 8cc:	0001e200 	asrtgt.d	$r16,$r24
 8d0:	00300800 	0x00300800
 8d4:	0a010000 	0x0a010000
 8d8:	00020802 	0x00020802
 8dc:	0001d100 	asrtgt.d	$r8,$r20
 8e0:	0a000900 	0x0a000900
 8e4:	1c000d64 	pcaddu12i	$r4,107(0x6b)
 8e8:	00000233 	0x00000233
 8ec:	0254010b 	sltui	$r11,$r8,1280(0x500)
 8f0:	00002d08 	ctz.d	$r8,$r8
 8f4:	000d000c 	bytepick.d	$r12,$r0,$r0,0x2
 8f8:	00002c1c 	ctz.d	$r28,$r0
 8fc:	00300800 	0x00300800
 900:	0a010000 	0x0a010000
 904:	00020802 	0x00020802
 908:	0001fd00 	asrtgt.d	$r8,$r31
 90c:	0d000900 	fsel	$f0,$f8,$f2,$fcc0
 910:	1c000d2c 	pcaddu12i	$r12,105(0x69)
 914:	00000233 	0x00000233
 918:	04020000 	csrrd	$r0,0x80
 91c:	746e6905 	0x746e6905
 920:	05040200 	0x05040200
 924:	676e6f6c 	bge	$r27,$r12,-37268(0x36e6c) # ffff7790 <_stack+0xe3fe6420>
 928:	746e6920 	0x746e6920
 92c:	022b0e00 	slti	$r0,$r16,-1341(0xac3)
 930:	022b0000 	slti	$r0,$r0,-1344(0xac0)
 934:	e30f0000 	0xe30f0000
 938:	3f000000 	0x3f000000
 93c:	06010200 	cacop	0x0,$r16,64(0x40)
 940:	72616863 	0x72616863
 944:	00301000 	0x00301000
 948:	00300000 	0x00300000
 94c:	0a010000 	0x0a010000
 950:	03250002 	lu52i.d	$r2,$r0,-1728(0x940)
 954:	00040000 	alsl.w	$r0,$r0,$r0,0x1
 958:	0000038f 	0x0000038f
 95c:	4e470104 	jirl	$r4,$r8,-112896(0x24700)
 960:	31432055 	vstelm.h	$vr21,$r2,-112(0x190),0x0
 964:	2e382037 	0x2e382037
 968:	20302e33 	ll.w	$r19,$r17,12332(0x302c)
 96c:	62616d2d 	blt	$r9,$r13,-106132(0x2616c) # fffe6ad8 <_stack+0xe3fd5768>
 970:	6c693d69 	bgeu	$r11,$r9,26940(0x693c) # 72ac <data_size+0x6a64>
 974:	73323370 	0x73323370
 978:	616d2d20 	blt	$r9,$r0,93484(0x16d2c) # 176a4 <data_size+0x16e5c>
 97c:	3d686372 	0x3d686372
 980:	6e6f6f6c 	bgeu	$r27,$r12,-102548(0x26f6c) # fffe78ec <_stack+0xe3fd657c>
 984:	63726167 	blt	$r11,$r7,-36256(0x37260) # ffff7be4 <_stack+0xe3fe6874>
 988:	72323368 	0x72323368
 98c:	666d2d20 	bge	$r9,$r0,-103124(0x26d2c) # fffe76b8 <_stack+0xe3fd6348>
 990:	6e3d7570 	bgeu	$r11,$r16,-115340(0x23d74) # fffe4704 <_stack+0xe3fd3394>
 994:	20656e6f 	ll.w	$r15,$r19,25964(0x656c)
 998:	6d636d2d 	bgeu	$r9,$r13,90988(0x1636c) # 16d04 <data_size+0x164bc>
 99c:	6c65646f 	bgeu	$r3,$r15,25956(0x6564) # 6f00 <data_size+0x66b8>
 9a0:	726f6e3d 	0x726f6e3d
 9a4:	206c616d 	ll.w	$r13,$r11,27744(0x6c60)
 9a8:	75746d2d 	0x75746d2d
 9ac:	6c3d656e 	bgeu	$r11,$r14,15716(0x3d64) # 4710 <data_size+0x3ec8>
 9b0:	676e6f6f 	bge	$r27,$r15,-37268(0x36e6c) # ffff781c <_stack+0xe3fe64ac>
 9b4:	68637261 	bltu	$r19,$r1,25456(0x6370) # 6d24 <data_size+0x64dc>
 9b8:	20723233 	ll.w	$r19,$r17,29232(0x7230)
 9bc:	2d20672d 	0x2d20672d
 9c0:	2d20324f 	0x2d20324f
 9c4:	2d6f6e66 	0x2d6f6e66
 9c8:	6c697562 	bgeu	$r11,$r2,26996(0x6974) # 733c <data_size+0x6af4>
 9cc:	206e6974 	ll.w	$r20,$r11,28264(0x6e68)
 9d0:	6f6e662d 	bgeu	$r17,$r13,-37276(0x36e64) # ffff7834 <_stack+0xe3fe64c4>
 9d4:	6369702d 	blt	$r1,$r13,-38544(0x36970) # ffff7344 <_stack+0xe3fe5fd4>
 9d8:	69740c00 	bltu	$r0,$r0,95244(0x1740c) # 17de4 <data_size+0x1759c>
 9dc:	632e656d 	blt	$r11,$r13,-53660(0x32e64) # ffff3840 <_stack+0xe3fe24d0>
 9e0:	6f682f00 	bgeu	$r24,$r0,-38868(0x3682c) # ffff720c <_stack+0xe3fe5e9c>
 9e4:	792f656d 	0x792f656d
 9e8:	6e617269 	bgeu	$r19,$r9,-106128(0x26170) # fffe6b58 <_stack+0xe3fd57e8>
 9ec:	7365442f 	vssrani.wu.d	$vr15,$vr1,0x11
 9f0:	706f746b 	0x706f746b
 9f4:	63736e2f 	blt	$r17,$r15,-35988(0x3736c) # ffff7d60 <_stack+0xe3fe69f0>
 9f8:	2d636373 	0x2d636373
 9fc:	6d616574 	bgeu	$r11,$r20,90468(0x16164) # 16b60 <data_size+0x16318>
 a00:	33616c2d 	xvstelm.h	$xr13,$r1,182(0xb6),0x8
 a04:	702f7232 	vaddwev.d.wu	$vr18,$vr17,$vr28
 a08:	5f667265 	bne	$r19,$r5,-39312(0x36670) # ffff7078 <_stack+0xe3fe5d08>
 a0c:	74736574 	xvmin.w	$xr20,$xr11,$xr25
 a10:	666f732f 	bge	$r25,$r15,-102544(0x26f70) # fffe7980 <_stack+0xe3fd6610>
 a14:	65702f74 	bge	$r27,$r20,94252(0x1702c) # 17a40 <data_size+0x171f8>
 a18:	665f6672 	bge	$r19,$r18,-106652(0x25f64) # fffe697c <_stack+0xe3fd560c>
 a1c:	2f636e75 	0x2f636e75
 a20:	0062696c 	bstrins.w	$r12,$r11,0x2,0x1a
 a24:	1c000d80 	pcaddu12i	$r0,108(0x6c)
 a28:	00000104 	0x00000104
 a2c:	00000853 	0x00000853
 a30:	75070402 	xvssran.hu.w	$xr2,$xr0,$xr1
 a34:	6769736e 	bge	$r27,$r14,-38544(0x36970) # ffff73a4 <_stack+0xe3fe6034>
 a38:	2064656e 	ll.w	$r14,$r11,25700(0x6464)
 a3c:	00746e69 	bstrins.w	$r9,$r19,0x14,0x1b
 a40:	6c070402 	bgeu	$r0,$r2,1796(0x704) # 1144 <data_size+0x8fc>
 a44:	20676e6f 	ll.w	$r15,$r19,26476(0x676c)
 a48:	69736e75 	bltu	$r19,$r21,95084(0x1736c) # 17db4 <data_size+0x1756c>
 a4c:	64656e67 	bge	$r19,$r7,25964(0x656c) # 6fb8 <data_size+0x6770>
 a50:	746e6920 	0x746e6920
 a54:	635f0300 	blt	$r24,$r0,-41216(0x35f00) # ffff6954 <_stack+0xe3fe55e4>
 a58:	6b636f6c 	bltu	$r27,$r12,-40084(0x3636c) # ffff6dc4 <_stack+0xe3fe5a54>
 a5c:	0200745f 	slti	$r31,$r2,29(0x1d)
 a60:	00ee1703 	bstrpick.d	$r3,$r24,0x2e,0x5
 a64:	04020000 	csrrd	$r0,0x80
 a68:	746e6905 	0x746e6905
 a6c:	69740400 	bltu	$r0,$r0,95236(0x17404) # 17e70 <data_size+0x17628>
 a70:	7073656d 	vmin.w	$vr13,$vr11,$vr25
 a74:	10006365 	addu16i.d	$r5,$r27,24(0x18)
 a78:	71081f02 	0x71081f02
 a7c:	05000001 	0x05000001
 a80:	735f7674 	vsrarni.d.q	$vr20,$vr19,0x5d
 a84:	02006365 	slti	$r5,$r27,24(0x18)
 a88:	01030b20 	fsub.d	$f0,$f25,$f2
 a8c:	05000000 	0x05000000
 a90:	6e5f7674 	bgeu	$r19,$r20,-106636(0x25f74) # fffe6a04 <_stack+0xe3fd5694>
 a94:	00636573 	bstrins.w	$r19,$r11,0x3,0x19
 a98:	030b2102 	lu52i.d	$r2,$r8,712(0x2c8)
 a9c:	04000001 	csrrd	$r1,0x0
 aa0:	5f767405 	bne	$r0,$r5,-35212(0x37674) # ffff8114 <_stack+0xe3fe6da4>
 aa4:	63657375 	blt	$r27,$r21,-39568(0x36570) # ffff7014 <_stack+0xe3fe5ca4>
 aa8:	0b220200 	0x0b220200
 aac:	00000103 	0x00000103
 ab0:	76740508 	0x76740508
 ab4:	65736d5f 	bge	$r10,$r31,95084(0x1736c) # 17e20 <data_size+0x175d8>
 ab8:	23020063 	sc.d	$r3,$r3,512(0x200)
 abc:	0001030b 	0x0001030b
 ac0:	06000c00 	cacop	0x0,$r0,3(0x3)
 ac4:	5f746567 	bne	$r11,$r7,-35740(0x37464) # ffff7f28 <_stack+0xe3fe6bb8>
 ac8:	01007375 	0x01007375
 acc:	00ee0f3c 	bstrpick.d	$r28,$r25,0x2e,0x3
 ad0:	0e540000 	0x0e540000
 ad4:	00301c00 	0x00301c00
 ad8:	9c010000 	0x9c010000
 adc:	000001b9 	0x000001b9
 ae0:	01006e07 	0x01006e07
 ae4:	00ee133e 	bstrpick.d	$r30,$r25,0x2e,0x4
 ae8:	04ab0000 	csrrd	$r0,0x2ac0
 aec:	02080000 	slti	$r0,$r0,512(0x200)
 af0:	54000003 	bl	786432(0xc0000) # c0af0 <data_size+0xc02a8>
 af4:	a81c000e 	0xa81c000e
 af8:	01000000 	0x01000000
 afc:	a809093f 	0xa809093f
 b00:	0a000000 	0x0a000000
 b04:	00000316 	0x00000316
 b08:	06000000 	cacop	0x0,$r0,0
 b0c:	5f746567 	bne	$r11,$r7,-35740(0x37464) # ffff7f70 <_stack+0xe3fe6c00>
 b10:	0100736e 	0x0100736e
 b14:	00ee0f33 	bstrpick.d	$r19,$r25,0x2e,0x3
 b18:	0e300000 	0x0e300000
 b1c:	00241c00 	crc.w.b.w	$r0,$r0,$r7
 b20:	9c010000 	0x9c010000
 b24:	00000201 	0x00000201
 b28:	01006e07 	0x01006e07
 b2c:	00ee1335 	bstrpick.d	$r21,$r25,0x2e,0x4
 b30:	04e20000 	csrrd	$r0,0x3880
 b34:	02080000 	slti	$r0,$r0,512(0x200)
 b38:	30000003 	0x30000003
 b3c:	901c000e 	0x901c000e
 b40:	01000000 	0x01000000
 b44:	90090936 	0x90090936
 b48:	0a000000 	0x0a000000
 b4c:	00000316 	0x00000316
 b50:	0b000000 	0x0b000000
 b54:	5f746567 	bne	$r11,$r7,-35740(0x37464) # ffff7fb8 <_stack+0xe3fe6c48>
 b58:	636f6c63 	blt	$r3,$r3,-37012(0x36f6c) # ffff7ac4 <_stack+0xe3fe6754>
 b5c:	2c01006b 	vld	$vr11,$r3,64(0x40)
 b60:	0000ee0f 	0x0000ee0f
 b64:	00022200 	0x00022200
 b68:	006e0c00 	bstrins.w	$r0,$r0,0xe,0x3
 b6c:	ee132e01 	0xee132e01
 b70:	00000000 	0x00000000
 b74:	6f6c6306 	bgeu	$r24,$r6,-37792(0x36c60) # ffff77d4 <_stack+0xe3fe6464>
 b78:	675f6b63 	bge	$r27,$r3,-41112(0x35f68) # ffff6ae0 <_stack+0xe3fe5770>
 b7c:	69747465 	bltu	$r3,$r5,95348(0x17474) # 17ff0 <data_size+0x177a8>
 b80:	0100656d 	0x0100656d
 b84:	00ee0f20 	bstrpick.d	$r0,$r25,0x2e,0x3
 b88:	0da80000 	0x0da80000
 b8c:	00841c00 	bstrins.d	$r0,$r0,0x4,0x7
 b90:	9c010000 	0x9c010000
 b94:	0000028f 	0x0000028f
 b98:	6c65730d 	bgeu	$r24,$r13,25968(0x6570) # 7108 <data_size+0x68c0>
 b9c:	21200100 	sc.w	$r0,$r8,8192(0x2000)
 ba0:	00000114 	0x00000114
 ba4:	00000510 	0x00000510
 ba8:	706d740e 	0x706d740e
 bac:	36200100 	0x36200100
 bb0:	0000028f 	0x0000028f
 bb4:	6e075501 	bgeu	$r8,$r1,-129196(0x20754) # fffe1308 <_stack+0xe3fcff98>
 bb8:	13220100 	addu16i.d	$r0,$r8,-14208(0xc880)
 bbc:	000000ee 	0x000000ee
 bc0:	00000531 	0x00000531
 bc4:	00030208 	0x00030208
 bc8:	000da800 	bytepick.d	$r0,$r0,$r10,0x3
 bcc:	0000781c 	0x0000781c
 bd0:	09230100 	vfmadd.d	$vr0,$vr8,$vr0,$vr6
 bd4:	00007809 	0x00007809
 bd8:	03160a00 	lu52i.d	$r0,$r16,1410(0x582)
 bdc:	00000000 	0x00000000
 be0:	1b040f00 	pcalau12i	$r0,-515976(0x82078)
 be4:	10000001 	addu16i.d	$r1,$r0,0
 be8:	5f746567 	bne	$r11,$r7,-35740(0x37464) # ffff804c <_stack+0xe3fe6cdc>
 bec:	6e756f63 	bgeu	$r27,$r3,-101012(0x2756c) # fffe8158 <_stack+0xe3fd6de8>
 bf0:	796d5f74 	0x796d5f74
 bf4:	0f160100 	0x0f160100
 bf8:	000000ee 	0x000000ee
 bfc:	1c000da0 	pcaddu12i	$r0,109(0x6d)
 c00:	00000008 	0x00000008
 c04:	02c59c01 	addi.d	$r1,$r0,359(0x167)
 c08:	6e110000 	bgeu	$r0,$r0,-126720(0x21100) # fffe1d08 <_stack+0xe3fd0998>
 c0c:	13180100 	addu16i.d	$r0,$r8,-14848(0xc600)
 c10:	000000ee 	0x000000ee
 c14:	10005401 	addu16i.d	$r1,$r0,21(0x15)
 c18:	5f746567 	bne	$r11,$r7,-35740(0x37464) # ffff807c <_stack+0xe3fe6d0c>
 c1c:	6e756f63 	bgeu	$r27,$r3,-101012(0x2756c) # fffe8188 <_stack+0xe3fd6e18>
 c20:	11010074 	addu16i.d	$r20,$r3,16448(0x4040)
 c24:	0000ee0f 	0x0000ee0f
 c28:	000d8000 	bytepick.d	$r0,$r0,$r0,0x3
 c2c:	00001c1c 	ctz.w	$r28,$r0
 c30:	029c0100 	addi.w	$r0,$r8,1792(0x700)
 c34:	08000003 	0x08000003
 c38:	00000302 	0x00000302
 c3c:	1c000d80 	pcaddu12i	$r0,108(0x6c)
 c40:	00000060 	0x00000060
 c44:	090d1301 	0x090d1301
 c48:	00000060 	0x00000060
 c4c:	0003160a 	0x0003160a
 c50:	00000000 	0x00000000
 c54:	65675f12 	bge	$r24,$r18,91996(0x1675c) # 173b0 <data_size+0x16b68>
 c58:	6f635f74 	bgeu	$r27,$r20,-40100(0x3635c) # ffff6fb4 <_stack+0xe3fe5c44>
 c5c:	00746e75 	bstrins.w	$r21,$r19,0x14,0x1b
 c60:	ee0f0401 	0xee0f0401
 c64:	01000000 	0x01000000
 c68:	6f635f0c 	bgeu	$r24,$r12,-40100(0x3635c) # ffff6fc4 <_stack+0xe3fe5c54>
 c6c:	6176746e 	blt	$r3,$r14,95860(0x17674) # 182e0 <data_size+0x17a98>
 c70:	0601006c 	cacop	0xc,$r3,64(0x40)
 c74:	0000ee13 	0x0000ee13
 c78:	地址 0x0000000000000c78 越界。


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	25011101 	stptr.w	$r1,$r8,272(0x110)
   4:	030b1308 	lu52i.d	$r8,$r24,708(0x2c4)
   8:	11081b08 	addu16i.d	$r8,$r24,16902(0x4206)
   c:	10061201 	addu16i.d	$r1,$r16,388(0x184)
  10:	02000017 	slti	$r23,$r0,0
  14:	0b0b000f 	0x0b0b000f
  18:	24030000 	ldptr.w	$r0,$r0,768(0x300)
  1c:	3e0b0b00 	0x3e0b0b00
  20:	0008030b 	bytepick.w	$r11,$r24,$r0,0x0
  24:	012e0400 	0x012e0400
  28:	0803193f 	0x0803193f
  2c:	0b3b0b3a 	0x0b3b0b3a
  30:	19270b39 	pcaddi	$r25,-444327(0x93859)
  34:	01111349 	fscaleb.d	$f9,$f26,$f4
  38:	18400612 	pcaddi	$r18,131120(0x20030)
  3c:	01194297 	0x01194297
  40:	05000013 	0x05000013
  44:	08030005 	0x08030005
  48:	0b3b0b3a 	0x0b3b0b3a
  4c:	13490b39 	addu16i.d	$r25,$r25,-11710(0xd242)
  50:	00001702 	clz.w	$r2,$r24
  54:	00001806 	cto.w	$r6,$r0
  58:	00340700 	0x00340700
  5c:	0b3a0803 	0x0b3a0803
  60:	0b390b3b 	0x0b390b3b
  64:	17021349 	lu32i.d	$r9,-520038(0x8109a)
  68:	34080000 	0x34080000
  6c:	3a080300 	0x3a080300
  70:	390b3b0b 	0x390b3b0b
  74:	0213490b 	slti	$r11,$r8,1234(0x4d2)
  78:	09000018 	0x09000018
  7c:	0803000a 	0x0803000a
  80:	0b3b0b3a 	0x0b3b0b3a
  84:	01110b39 	fscaleb.d	$f25,$f25,$f2
  88:	0b0a0000 	0x0b0a0000
  8c:	01175501 	0x01175501
  90:	0b000013 	0x0b000013
  94:	193f012e 	pcaddi	$r14,-395255(0x9f809)
  98:	0b3a0803 	0x0b3a0803
  9c:	0b390b3b 	0x0b390b3b
  a0:	193c1349 	pcaddi	$r9,-401254(0x9e09a)
  a4:	00001301 	clo.w	$r1,$r24
  a8:	3f012e0c 	0x3f012e0c
  ac:	3a0e0319 	0x3a0e0319
  b0:	390b3b0b 	0x390b3b0b
  b4:	3c13490b 	0x3c13490b
  b8:	00130119 	maskeqz	$r25,$r8,$r0
  bc:	82890d00 	0x82890d00
  c0:	01110101 	fscaleb.d	$f1,$f8,$f0
  c4:	13011331 	addu16i.d	$r17,$r25,-16316(0xc044)
  c8:	8a0e0000 	0x8a0e0000
  cc:	02000182 	slti	$r2,$r12,0
  d0:	18429118 	pcaddi	$r24,136328(0x21488)
  d4:	890f0000 	0x890f0000
  d8:	11000182 	addu16i.d	$r2,$r12,16384(0x4000)
  dc:	00133101 	maskeqz	$r1,$r8,$r12
  e0:	82891000 	0x82891000
  e4:	01110101 	fscaleb.d	$f1,$f8,$f0
  e8:	00001331 	clo.w	$r17,$r25
  ec:	55010b11 	bl	-62586616(0xc450108) # fc4501f4 <_stack+0xe043ee84>
  f0:	12000017 	addu16i.d	$r23,$r0,-32768(0x8000)
  f4:	0111010b 	fscaleb.d	$f11,$f8,$f0
  f8:	13010612 	addu16i.d	$r18,$r16,-16319(0xc041)
  fc:	0f130000 	0x0f130000
 100:	490b0b00 	0x490b0b00
 104:	14000013 	lu12i.w	$r19,0
 108:	13490026 	addu16i.d	$r6,$r1,-11712(0xd240)
 10c:	2e150000 	0x2e150000
 110:	3c193f00 	0x3c193f00
 114:	030e6e19 	lu52i.d	$r25,$r16,923(0x39b)
 118:	3b0b3a0e 	0x3b0b3a0e
 11c:	000b390b 	0x000b390b
 120:	11010000 	addu16i.d	$r0,$r0,16448(0x4040)
 124:	13082501 	addu16i.d	$r1,$r8,-15863(0xc209)
 128:	1b08030b 	pcalau12i	$r11,-507880(0x84018)
 12c:	12011108 	addu16i.d	$r8,$r8,-32700(0x8044)
 130:	00171006 	sll.w	$r6,$r0,$r4
 134:	00240200 	crc.w.b.w	$r0,$r16,$r0
 138:	0b3e0b0b 	0x0b3e0b0b
 13c:	00000803 	0x00000803
 140:	3f012e03 	0x3f012e03
 144:	3a0e0319 	0x3a0e0319
 148:	390b3b0b 	0x390b3b0b
 14c:	010b200b 	fmin.d	$f11,$f0,$f8
 150:	04000013 	csrrd	$r19,0x0
 154:	08030005 	0x08030005
 158:	0b3b0b3a 	0x0b3b0b3a
 15c:	13490b39 	addu16i.d	$r25,$r25,-11710(0xd242)
 160:	2e050000 	0x2e050000
 164:	03193f01 	lu52i.d	$r1,$r24,1615(0x64f)
 168:	3b0b3a08 	0x3b0b3a08
 16c:	270b390b 	stptr.d	$r11,$r8,2872(0xb38)
 170:	11134919 	addu16i.d	$r25,$r8,17618(0x44d2)
 174:	40061201 	beqz	$r16,263696(0x40610) # 40784 <data_size+0x3ff3c>
 178:	19429718 	pcaddi	$r24,-387912(0xa14b8)
 17c:	00001301 	clo.w	$r1,$r24
 180:	03000506 	lu52i.d	$r6,$r8,1(0x1)
 184:	3b0b3a08 	0x3b0b3a08
 188:	490b390b 	bcnez	$fcc0,2951992(0x2d0b38) # 2d0cc0 <data_size+0x2d0478>
 18c:	00170213 	sll.w	$r19,$r16,$r0
 190:	012e0700 	0x012e0700
 194:	0e03193f 	0x0e03193f
 198:	0b3b0b3a 	0x0b3b0b3a
 19c:	13490b39 	addu16i.d	$r25,$r25,-11710(0xd242)
 1a0:	1301193c 	addu16i.d	$r28,$r9,-16314(0xc046)
 1a4:	18080000 	pcaddi	$r0,16384(0x4000)
 1a8:	09000000 	0x09000000
 1ac:	1331011d 	addu16i.d	$r29,$r8,-13248(0xcc40)
 1b0:	17550152 	lu32i.d	$r18,-350198(0xaa80a)
 1b4:	0b590b58 	0x0b590b58
 1b8:	00000b57 	0x00000b57
 1bc:	3100050a 	0x3100050a
 1c0:	00170213 	sll.w	$r19,$r16,$r0
 1c4:	012e0b00 	0x012e0b00
 1c8:	01111331 	fscaleb.d	$f17,$f25,$f4
 1cc:	18400612 	pcaddi	$r18,131120(0x20030)
 1d0:	00194297 	srl.d	$r23,$r20,$r16
 1d4:	00050c00 	alsl.w	$r0,$r0,$r3,0x3
 1d8:	18021331 	pcaddi	$r17,4249(0x1099)
 1dc:	01000000 	0x01000000
 1e0:	08250111 	fmadd.d	$f17,$f8,$f0,$f10
 1e4:	08030b13 	0x08030b13
 1e8:	0111081b 	fscaleb.d	$f27,$f0,$f2
 1ec:	17100612 	lu32i.d	$r18,-491472(0x88030)
 1f0:	24020000 	ldptr.w	$r0,$r0,512(0x200)
 1f4:	3e0b0b00 	0x3e0b0b00
 1f8:	0008030b 	bytepick.w	$r11,$r24,$r0,0x0
 1fc:	012e0300 	0x012e0300
 200:	0803193f 	0x0803193f
 204:	0b3b0b3a 	0x0b3b0b3a
 208:	19270b39 	pcaddi	$r25,-444327(0x93859)
 20c:	01111349 	fscaleb.d	$f9,$f26,$f4
 210:	18400612 	pcaddi	$r18,131120(0x20030)
 214:	01194297 	0x01194297
 218:	04000013 	csrrd	$r19,0x0
 21c:	08030005 	0x08030005
 220:	0b3b0b3a 	0x0b3b0b3a
 224:	13490b39 	addu16i.d	$r25,$r25,-11710(0xd242)
 228:	00001702 	clz.w	$r2,$r24
 22c:	3f012e05 	0x3f012e05
 230:	3a0e0319 	0x3a0e0319
 234:	390b3b0b 	0x390b3b0b
 238:	3c13490b 	0x3c13490b
 23c:	00130119 	maskeqz	$r25,$r8,$r0
 240:	00180600 	sra.w	$r0,$r16,$r1
 244:	89070000 	0x89070000
 248:	11010182 	addu16i.d	$r2,$r12,16448(0x4040)
 24c:	01133101 	fcopysign.d	$f1,$f8,$f12
 250:	08000013 	0x08000013
 254:	0001828a 	0x0001828a
 258:	42911802 	beqz	$r0,692504(0xa9118) # a9370 <data_size+0xa8b28>
 25c:	09000018 	0x09000018
 260:	01018289 	0x01018289
 264:	13310111 	addu16i.d	$r17,$r8,-13248(0xcc40)
 268:	0f0a0000 	0x0f0a0000
 26c:	490b0b00 	0x490b0b00
 270:	0b000013 	0x0b000013
 274:	08030034 	0x08030034
 278:	0b3b0b3a 	0x0b3b0b3a
 27c:	13490b39 	addu16i.d	$r25,$r25,-11710(0xd242)
 280:	00001702 	clz.w	$r2,$r24
 284:	55010b0c 	bl	-63897336(0xc310108) # fc31038c <_stack+0xe02ff01c>
 288:	0d000017 	fsel	$f23,$f0,$f0,$fcc0
 28c:	0111010b 	fscaleb.d	$f11,$f8,$f0
 290:	13010612 	addu16i.d	$r18,$r16,-16319(0xc041)
 294:	2e0e0000 	0x2e0e0000
 298:	3c193f00 	0x3c193f00
 29c:	030e6e19 	lu52i.d	$r25,$r16,923(0x39b)
 2a0:	3b0b3a0e 	0x3b0b3a0e
 2a4:	000b390b 	0x000b390b
 2a8:	11010000 	addu16i.d	$r0,$r0,16448(0x4040)
 2ac:	13082501 	addu16i.d	$r1,$r8,-15863(0xc209)
 2b0:	1b08030b 	pcalau12i	$r11,-507880(0x84018)
 2b4:	12011108 	addu16i.d	$r8,$r8,-32700(0x8044)
 2b8:	00171006 	sll.w	$r6,$r0,$r4
 2bc:	00240200 	crc.w.b.w	$r0,$r16,$r0
 2c0:	0b3e0b0b 	0x0b3e0b0b
 2c4:	00000803 	0x00000803
 2c8:	3f012e03 	0x3f012e03
 2cc:	3a080319 	0x3a080319
 2d0:	390b3b0b 	0x390b3b0b
 2d4:	4919270b 	0x4919270b
 2d8:	12011113 	addu16i.d	$r19,$r8,-32700(0x8044)
 2dc:	97184006 	0x97184006
 2e0:	13011942 	addu16i.d	$r2,$r10,-16314(0xc046)
 2e4:	05040000 	0x05040000
 2e8:	3a080300 	0x3a080300
 2ec:	390b3b0b 	0x390b3b0b
 2f0:	0213490b 	slti	$r11,$r8,1234(0x4d2)
 2f4:	05000017 	0x05000017
 2f8:	08030034 	0x08030034
 2fc:	0b3b0b3a 	0x0b3b0b3a
 300:	13490b39 	addu16i.d	$r25,$r25,-11710(0xd242)
 304:	00001702 	clz.w	$r2,$r24
 308:	03003406 	lu52i.d	$r6,$r0,13(0xd)
 30c:	3b0b3a08 	0x3b0b3a08
 310:	490b390b 	bcnez	$fcc0,2951992(0x2d0b38) # 2d0e48 <data_size+0x2d0600>
 314:	00180213 	sra.w	$r19,$r16,$r0
 318:	010b0700 	fmin.d	$f0,$f24,$f1
 31c:	06120111 	cacop	0x11,$r8,1152(0x480)
 320:	00001301 	clo.w	$r1,$r24
 324:	3f012e08 	0x3f012e08
 328:	3a0e0319 	0x3a0e0319
 32c:	390b3b0b 	0x390b3b0b
 330:	3c13490b 	0x3c13490b
 334:	00130119 	maskeqz	$r25,$r8,$r0
 338:	00180900 	sra.w	$r0,$r8,$r2
 33c:	890a0000 	0x890a0000
 340:	11010182 	addu16i.d	$r2,$r12,16448(0x4040)
 344:	00133101 	maskeqz	$r1,$r8,$r12
 348:	828a0b00 	0x828a0b00
 34c:	18020001 	pcaddi	$r1,4096(0x1000)
 350:	00184291 	sra.w	$r17,$r20,$r16
 354:	010b0c00 	fmin.d	$f0,$f0,$f3
 358:	06120111 	cacop	0x11,$r8,1152(0x480)
 35c:	890d0000 	0x890d0000
 360:	11000182 	addu16i.d	$r2,$r12,16384(0x4000)
 364:	00133101 	maskeqz	$r1,$r8,$r12
 368:	01010e00 	fadd.d	$f0,$f16,$f3
 36c:	13011349 	addu16i.d	$r9,$r26,-16316(0xc044)
 370:	210f0000 	sc.w	$r0,$r0,3840(0xf00)
 374:	2f134900 	0x2f134900
 378:	1000000b 	addu16i.d	$r11,$r0,0
 37c:	193f002e 	pcaddi	$r14,-395263(0x9f801)
 380:	0e6e193c 	0x0e6e193c
 384:	0b3a0e03 	0x0b3a0e03
 388:	0b390b3b 	0x0b390b3b
 38c:	01000000 	0x01000000
 390:	08250111 	fmadd.d	$f17,$f8,$f0,$f10
 394:	08030b13 	0x08030b13
 398:	0111081b 	fscaleb.d	$f27,$f0,$f2
 39c:	17100612 	lu32i.d	$r18,-491472(0x88030)
 3a0:	24020000 	ldptr.w	$r0,$r0,512(0x200)
 3a4:	3e0b0b00 	0x3e0b0b00
 3a8:	0008030b 	bytepick.w	$r11,$r24,$r0,0x0
 3ac:	00160300 	orn	$r0,$r24,$r0
 3b0:	0b3a0803 	0x0b3a0803
 3b4:	0b390b3b 	0x0b390b3b
 3b8:	00001349 	clo.w	$r9,$r26
 3bc:	03011304 	lu52i.d	$r4,$r24,68(0x44)
 3c0:	3a0b0b08 	0x3a0b0b08
 3c4:	390b3b0b 	0x390b3b0b
 3c8:	0013010b 	maskeqz	$r11,$r8,$r0
 3cc:	000d0500 	bytepick.d	$r0,$r8,$r1,0x2
 3d0:	0b3a0803 	0x0b3a0803
 3d4:	0b390b3b 	0x0b390b3b
 3d8:	0b381349 	0x0b381349
 3dc:	2e060000 	0x2e060000
 3e0:	03193f01 	lu52i.d	$r1,$r24,1615(0x64f)
 3e4:	3b0b3a08 	0x3b0b3a08
 3e8:	270b390b 	stptr.d	$r11,$r8,2872(0xb38)
 3ec:	11134919 	addu16i.d	$r25,$r8,17618(0x44d2)
 3f0:	40061201 	beqz	$r16,263696(0x40610) # 40a00 <data_size+0x401b8>
 3f4:	19429718 	pcaddi	$r24,-387912(0xa14b8)
 3f8:	00001301 	clo.w	$r1,$r24
 3fc:	03003407 	lu52i.d	$r7,$r0,13(0xd)
 400:	3b0b3a08 	0x3b0b3a08
 404:	490b390b 	bcnez	$fcc0,2951992(0x2d0b38) # 2d0f3c <data_size+0x2d06f4>
 408:	00170213 	sll.w	$r19,$r16,$r0
 40c:	011d0800 	0x011d0800
 410:	01521331 	0x01521331
 414:	0b581755 	0x0b581755
 418:	0b570b59 	0x0b570b59
 41c:	0b090000 	0x0b090000
 420:	00175501 	sll.w	$r1,$r8,$r21
 424:	00340a00 	0x00340a00
 428:	00001331 	clo.w	$r17,$r25
 42c:	3f012e0b 	0x3f012e0b
 430:	3a080319 	0x3a080319
 434:	390b3b0b 	0x390b3b0b
 438:	0113490b 	fcopysign.d	$f11,$f8,$f18
 43c:	0c000013 	0x0c000013
 440:	08030034 	0x08030034
 444:	0b3b0b3a 	0x0b3b0b3a
 448:	13490b39 	addu16i.d	$r25,$r25,-11710(0xd242)
 44c:	050d0000 	0x050d0000
 450:	3a080300 	0x3a080300
 454:	390b3b0b 	0x390b3b0b
 458:	0213490b 	slti	$r11,$r8,1234(0x4d2)
 45c:	0e000017 	0x0e000017
 460:	08030005 	0x08030005
 464:	0b3b0b3a 	0x0b3b0b3a
 468:	13490b39 	addu16i.d	$r25,$r25,-11710(0xd242)
 46c:	00001802 	cto.w	$r2,$r0
 470:	0b000f0f 	0x0b000f0f
 474:	0013490b 	maskeqz	$r11,$r8,$r18
 478:	012e1000 	0x012e1000
 47c:	0803193f 	0x0803193f
 480:	0b3b0b3a 	0x0b3b0b3a
 484:	13490b39 	addu16i.d	$r25,$r25,-11710(0xd242)
 488:	06120111 	cacop	0x11,$r8,1152(0x480)
 48c:	42971840 	beqz	$r2,169752(0x29718) # 29ba4 <data_size+0x2935c>
 490:	00130119 	maskeqz	$r25,$r8,$r0
 494:	00341100 	0x00341100
 498:	0b3a0803 	0x0b3a0803
 49c:	0b390b3b 	0x0b390b3b
 4a0:	18021349 	pcaddi	$r9,4250(0x109a)
 4a4:	2e120000 	0x2e120000
 4a8:	03193f01 	lu52i.d	$r1,$r24,1615(0x64f)
 4ac:	3b0b3a08 	0x3b0b3a08
 4b0:	490b390b 	bcnez	$fcc0,2951992(0x2d0b38) # 2d0fe8 <data_size+0x2d07a0>
 4b4:	000b2013 	0x000b2013
	...

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
   0:	00000000 	0x00000000
   4:	00000064 	0x00000064
   8:	64540001 	bge	$r0,$r1,21504(0x5400) # 5408 <data_size+0x4bc0>
   c:	cc000000 	0xcc000000
  10:	01000000 	0x01000000
  14:	00cc6900 	bstrpick.d	$r0,$r8,0xc,0x1a
  18:	00f40000 	bstrpick.d	$r0,$r0,0x34,0x0
  1c:	00040000 	alsl.w	$r0,$r0,$r0,0x1
  20:	9f5401f3 	0x9f5401f3
  24:	000000f4 	0x000000f4
  28:	0000022c 	0x0000022c
  2c:	00690001 	bstrins.w	$r1,$r0,0x9,0x0
  30:	00000000 	0x00000000
  34:	48000000 	bceqz	$fcc0,0 # 34 <data_size-0x814>
  38:	64000000 	bge	$r0,$r0,0 # 38 <data_size-0x810>
  3c:	02000000 	slti	$r0,$r0,0
  40:	649f3000 	bge	$r0,$r0,40752(0x9f30) # 9f70 <data_size+0x9728>
  44:	cc000000 	0xcc000000
  48:	01000000 	0x01000000
  4c:	00f46800 	bstrpick.d	$r0,$r0,0x34,0x1a
  50:	01000000 	0x01000000
  54:	00030000 	0x00030000
  58:	009f0188 	bstrins.d	$r8,$r12,0x1f,0x0
  5c:	1c000001 	pcaddu12i	$r1,0
  60:	01000001 	0x01000001
  64:	011c6800 	0x011c6800
  68:	01380000 	0x01380000
  6c:	00030000 	0x00030000
  70:	389f7f88 	0x389f7f88
  74:	64000001 	bge	$r0,$r1,0 # 74 <data_size-0x7d4>
  78:	01000001 	0x01000001
  7c:	01646800 	0x01646800
  80:	016c0000 	0x016c0000
  84:	00030000 	0x00030000
  88:	6c9f7f88 	bgeu	$r28,$r8,40828(0x9f7c) # a004 <data_size+0x97bc>
  8c:	e8000001 	0xe8000001
  90:	01000001 	0x01000001
  94:	01e86800 	0x01e86800
  98:	01f00000 	0x01f00000
  9c:	00030000 	0x00030000
  a0:	f09f7f88 	0xf09f7f88
  a4:	2c000001 	vld	$vr1,$r0,0
  a8:	01000002 	0x01000002
  ac:	00006800 	rdtime.d	$r0,$r0
  b0:	00000000 	0x00000000
  b4:	00640000 	bstrins.w	$r0,$r0,0x4,0x0
  b8:	00780000 	bstrins.w	$r0,$r0,0x18,0x0
  bc:	00010000 	asrtle.d	$r0,$r0
  c0:	00007c67 	0x00007c67
  c4:	0000cc00 	0x0000cc00
  c8:	67000100 	bge	$r8,$r0,-65536(0x30000) # ffff00c8 <_stack+0xe3fded58>
  cc:	000000f4 	0x000000f4
  d0:	0000022c 	0x0000022c
  d4:	00670001 	bstrins.w	$r1,$r0,0x7,0x0
  d8:	00000000 	0x00000000
  dc:	48000000 	bceqz	$fcc0,0 # dc <data_size-0x76c>
  e0:	cc000000 	0xcc000000
  e4:	01000000 	0x01000000
  e8:	00f46a00 	bstrpick.d	$r0,$r16,0x34,0x1a
  ec:	01680000 	0x01680000
  f0:	00010000 	asrtle.d	$r0,$r0
  f4:	0001686a 	0x0001686a
  f8:	00016c00 	asrtle.d	$r0,$r27
  fc:	8a000300 	0x8a000300
 100:	016c9f7c 	0x016c9f7c
 104:	01ec0000 	0x01ec0000
 108:	00010000 	asrtle.d	$r0,$r0
 10c:	0001ec6a 	0x0001ec6a
 110:	0001f000 	asrtgt.d	$r0,$r28
 114:	8a000300 	0x8a000300
 118:	01f09f7c 	0x01f09f7c
 11c:	022c0000 	slti	$r0,$r0,-1280(0xb00)
 120:	00010000 	asrtle.d	$r0,$r0
 124:	0000006a 	0x0000006a
 128:	00000000 	0x00000000
 12c:	0000ac00 	0x0000ac00
 130:	0000cc00 	0x0000cc00
 134:	55000100 	bl	67174400(0x4010000) # 4010134 <data_size+0x400f8ec>
 138:	000000f4 	0x000000f4
 13c:	00000100 	0x00000100
 140:	00550001 	0x00550001
 144:	14000001 	lu12i.w	$r1,0
 148:	02000001 	slti	$r1,$r0,0
 14c:	149f3000 	lu12i.w	$r0,326016(0x4f980)
 150:	18000001 	pcaddi	$r1,0
 154:	01000001 	0x01000001
 158:	01385500 	0x01385500
 15c:	014f0000 	0x014f0000
 160:	00010000 	asrtle.d	$r0,$r0
 164:	00015c55 	0x00015c55
 168:	00016b00 	asrtle.d	$r24,$r26
 16c:	55000100 	bl	67174400(0x4010000) # 401016c <data_size+0x400f924>
 170:	00000170 	0x00000170
 174:	0000017f 	0x0000017f
 178:	8c550001 	0x8c550001
 17c:	9b000001 	0x9b000001
 180:	01000001 	0x01000001
 184:	01a85500 	0x01a85500
 188:	01b70000 	0x01b70000
 18c:	00010000 	asrtle.d	$r0,$r0
 190:	0001c455 	0x0001c455
 194:	0001d300 	asrtgt.d	$r24,$r20
 198:	55000100 	bl	67174400(0x4010000) # 4010198 <data_size+0x400f950>
 19c:	000001e0 	0x000001e0
 1a0:	000001ef 	0x000001ef
 1a4:	f4550001 	0xf4550001
 1a8:	03000001 	lu52i.d	$r1,$r0,0
 1ac:	01000002 	0x01000002
 1b0:	02105500 	slti	$r0,$r8,1045(0x415)
 1b4:	02170000 	slti	$r0,$r0,1472(0x5c0)
 1b8:	00010000 	asrtle.d	$r0,$r0
 1bc:	00022055 	0x00022055
 1c0:	00022700 	0x00022700
 1c4:	55000100 	bl	67174400(0x4010000) # 40101c4 <data_size+0x400f97c>
	...
 1d4:	0000001c 	0x0000001c
 1d8:	1c540001 	pcaddu12i	$r1,172032(0x2a000)
 1dc:	28000000 	ld.b	$r0,$r0,0
 1e0:	04000000 	csrrd	$r0,0x0
 1e4:	5401f300 	bl	-67108368(0xc0001f0) # fc0003d4 <_stack+0xdffef064>
 1e8:	0000009f 	0x0000009f
	...
 1f4:	00001800 	cto.w	$r0,$r0
 1f8:	54000100 	bl	67108864(0x4000000) # 40001f8 <data_size+0x3fff9b0>
	...
 204:	00000074 	0x00000074
 208:	0000007f 	0x0000007f
 20c:	7f540001 	0x7f540001
 210:	a0000000 	0xa0000000
 214:	04000000 	csrrd	$r0,0x0
 218:	5401f300 	bl	-67108368(0xc0001f0) # fc000408 <_stack+0xdffef098>
 21c:	0000009f 	0x0000009f
	...
 228:	00002800 	cto.d	$r0,$r0
 22c:	54000100 	bl	67108864(0x4000000) # 400022c <data_size+0x3fff9e4>
 230:	00000028 	0x00000028
 234:	00000030 	0x00000030
 238:	7f880003 	0x7f880003
 23c:	0000309f 	revb.2h	$r31,$r4
 240:	00003c00 	revb.d	$r0,$r0
 244:	68000100 	bltu	$r8,$r0,0 # 244 <data_size-0x604>
 248:	0000003c 	0x0000003c
 24c:	00000050 	0x00000050
 250:	7f880003 	0x7f880003
 254:	0000509f 	bitrev.w	$r31,$r4
 258:	00005800 	ext.w.h	$r0,$r0
 25c:	68000100 	bltu	$r8,$r0,0 # 25c <data_size-0x5ec>
	...
 268:	00000018 	0x00000018
 26c:	00000060 	0x00000060
 270:	00670001 	bstrins.w	$r1,$r0,0x7,0x0
	...
 27c:	24000000 	ldptr.w	$r0,$r0,0
 280:	01000000 	0x01000000
 284:	00245400 	crc.w.b.w	$r0,$r0,$r21
 288:	00bc0000 	bstrins.d	$r0,$r0,0x3c,0x0
 28c:	00040000 	alsl.w	$r0,$r0,$r0,0x1
 290:	9f5401f3 	0x9f5401f3
 294:	000000bc 	0x000000bc
 298:	000000c0 	0x000000c0
 29c:	c0540001 	0xc0540001
 2a0:	d0000000 	0xd0000000
 2a4:	01000000 	0x01000000
 2a8:	00d06700 	bstrpick.d	$r0,$r24,0x10,0x19
 2ac:	00dc0000 	bstrpick.d	$r0,$r0,0x1c,0x0
 2b0:	00040000 	alsl.w	$r0,$r0,$r0,0x1
 2b4:	9f1f0087 	0x9f1f0087
 2b8:	000000dc 	0x000000dc
 2bc:	000000e8 	0x000000e8
 2c0:	00540001 	0x00540001
	...
 2cc:	24000000 	ldptr.w	$r0,$r0,0
 2d0:	01000000 	0x01000000
 2d4:	00245500 	crc.w.b.w	$r0,$r8,$r21
 2d8:	00bc0000 	bstrins.d	$r0,$r0,0x3c,0x0
 2dc:	00040000 	alsl.w	$r0,$r0,$r0,0x1
 2e0:	9f5501f3 	0x9f5501f3
 2e4:	000000bc 	0x000000bc
 2e8:	000000cb 	0x000000cb
 2ec:	cb550001 	0xcb550001
 2f0:	dc000000 	0xdc000000
 2f4:	03000000 	lu52i.d	$r0,$r0,0
 2f8:	7fa89100 	0x7fa89100
 2fc:	000000dc 	0x000000dc
 300:	000000e8 	0x000000e8
 304:	00550001 	0x00550001
	...
 310:	24000000 	ldptr.w	$r0,$r0,0
 314:	01000000 	0x01000000
 318:	00245600 	crc.w.b.w	$r0,$r16,$r21
 31c:	00bc0000 	bstrins.d	$r0,$r0,0x3c,0x0
 320:	00040000 	alsl.w	$r0,$r0,$r0,0x1
 324:	9f5601f3 	0x9f5601f3
 328:	000000bc 	0x000000bc
 32c:	000000cb 	0x000000cb
 330:	cb560001 	0xcb560001
 334:	dc000000 	0xdc000000
 338:	03000000 	lu52i.d	$r0,$r0,0
 33c:	7fac9100 	0x7fac9100
 340:	000000dc 	0x000000dc
 344:	000000e8 	0x000000e8
 348:	00560001 	0x00560001
	...
 354:	24000000 	ldptr.w	$r0,$r0,0
 358:	01000000 	0x01000000
 35c:	00245700 	crc.w.b.w	$r0,$r24,$r21
 360:	00bc0000 	bstrins.d	$r0,$r0,0x3c,0x0
 364:	00040000 	alsl.w	$r0,$r0,$r0,0x1
 368:	9f5701f3 	0x9f5701f3
 36c:	000000bc 	0x000000bc
 370:	000000cb 	0x000000cb
 374:	cb570001 	0xcb570001
 378:	dc000000 	0xdc000000
 37c:	04000000 	csrrd	$r0,0x0
 380:	5701f300 	bl	-66911760(0xc0301f0) # fc030570 <_stack+0xe001f200>
 384:	0000dc9f 	0x0000dc9f
 388:	0000e800 	0x0000e800
 38c:	57000100 	bl	67305472(0x4030000) # 403038c <data_size+0x402fb44>
	...
 398:	00000020 	0x00000020
 39c:	00000034 	0x00000034
 3a0:	9f300002 	0x9f300002
 3a4:	00000034 	0x00000034
 3a8:	00000038 	0x00000038
 3ac:	38680001 	ammin.wu	$r1,$r0,$r0
 3b0:	58000000 	beq	$r0,$r0,0 # 3b0 <data_size-0x498>
 3b4:	08000000 	0x08000000
 3b8:	91007c00 	0x91007c00
 3bc:	50231c00 	b	8988(0x231c) # 26d8 <data_size+0x1e90>
 3c0:	0000589f 	ext.w.h	$r31,$r4
 3c4:	00006400 	rdtimeh.w	$r0,$r0
 3c8:	68000100 	bltu	$r8,$r0,0 # 3c8 <data_size-0x480>
 3cc:	000000b4 	0x000000b4
 3d0:	000000bc 	0x000000bc
 3d4:	d0680001 	0xd0680001
 3d8:	e8000000 	0xe8000000
 3dc:	02000000 	slti	$r0,$r0,0
 3e0:	009f3000 	bstrins.d	$r0,$r0,0x1f,0xc
 3e4:	00000000 	0x00000000
 3e8:	6c000000 	bgeu	$r0,$r0,0 # 3e8 <data_size-0x460>
 3ec:	90000000 	0x90000000
 3f0:	01000000 	0x01000000
 3f4:	00906700 	bstrins.d	$r0,$r24,0x10,0x19
 3f8:	00940000 	bstrins.d	$r0,$r0,0x14,0x0
 3fc:	00030000 	0x00030000
 400:	949f0187 	0x949f0187
 404:	98000000 	0x98000000
 408:	01000000 	0x01000000
 40c:	00b86700 	bstrins.d	$r0,$r24,0x38,0x19
 410:	00bc0000 	bstrins.d	$r0,$r0,0x3c,0x0
 414:	00010000 	asrtle.d	$r0,$r0
 418:	0000dc55 	0x0000dc55
 41c:	0000e800 	0x0000e800
 420:	75000d00 	0x75000d00
 424:	16301200 	lu32i.d	$r0,98448(0x18090)
 428:	01282b14 	0x01282b14
 42c:	9f131600 	0x9f131600
	...
 438:	00000080 	0x00000080
 43c:	0000008c 	0x0000008c
 440:	005c0001 	0x005c0001
 444:	00000000 	0x00000000
 448:	20000000 	ll.w	$r0,$r0,0
 44c:	24000000 	ldptr.w	$r0,$r0,0
 450:	01000000 	0x01000000
 454:	00245400 	crc.w.b.w	$r0,$r0,$r21
 458:	00340000 	0x00340000
 45c:	00010000 	asrtle.d	$r0,$r0
 460:	00003467 	revb.4h	$r7,$r3
 464:	00003800 	revb.2w	$r0,$r0
 468:	5d000100 	bne	$r8,$r0,65536(0x10000) # 10468 <data_size+0xfc20>
 46c:	00000038 	0x00000038
 470:	00000058 	0x00000058
 474:	58670001 	beq	$r0,$r1,26368(0x6700) # 6b74 <data_size+0x632c>
 478:	64000000 	bge	$r0,$r0,0 # 478 <data_size-0x3d0>
 47c:	01000000 	0x01000000
 480:	00b45d00 	bstrins.d	$r0,$r8,0x34,0x17
 484:	00bc0000 	bstrins.d	$r0,$r0,0x3c,0x0
 488:	00010000 	asrtle.d	$r0,$r0
 48c:	0000d05d 	0x0000d05d
 490:	0000dc00 	0x0000dc00
 494:	67000100 	bge	$r8,$r0,-65536(0x30000) # ffff0494 <_stack+0xe3fdf124>
 498:	000000dc 	0x000000dc
 49c:	000000e8 	0x000000e8
 4a0:	00540001 	0x00540001
 4a4:	00000000 	0x00000000
 4a8:	d4000000 	0xd4000000
 4ac:	e4000000 	0xe4000000
 4b0:	02000000 	slti	$r0,$r0,0
 4b4:	e49f3000 	0xe49f3000
 4b8:	f8000000 	0xf8000000
 4bc:	0e000000 	0x0e000000
 4c0:	f7007400 	0xf7007400
 4c4:	640801de 	bge	$r14,$r30,2048(0x800) # cc4 <data_size+0x47c>
 4c8:	1b01def7 	pcalau12i	$r23,-520457(0x80ef7)
 4cc:	f89f00f7 	0xf89f00f7
 4d0:	04000000 	csrrd	$r0,0x0
 4d4:	01000001 	0x01000001
 4d8:	00005d00 	ext.w.b	$r0,$r8
 4dc:	00000000 	0x00000000
 4e0:	00b00000 	bstrins.d	$r0,$r0,0x30,0x0
 4e4:	00c00000 	bstrpick.d	$r0,$r0,0x0,0x0
 4e8:	00020000 	0x00020000
 4ec:	00c09f30 	bstrpick.d	$r16,$r25,0x0,0x27
 4f0:	00cc0000 	bstrpick.d	$r0,$r0,0xc,0x0
 4f4:	00050000 	alsl.w	$r0,$r0,$r0,0x3
 4f8:	1e3a0074 	pcaddu18i	$r20,118787(0x1d003)
 4fc:	0000cc9f 	0x0000cc9f
 500:	0000d400 	0x0000d400
 504:	54000100 	bl	67108864(0x4000000) # 4000504 <data_size+0x3fffcbc>
	...
 510:	00000028 	0x00000028
 514:	00000094 	0x00000094
 518:	94540001 	0x94540001
 51c:	ac000000 	0xac000000
 520:	04000000 	csrrd	$r0,0x0
 524:	5401f300 	bl	-67108368(0xc0001f0) # fc000714 <_stack+0xdffef3a4>
 528:	0000009f 	0x0000009f
 52c:	00000000 	0x00000000
 530:	00002800 	cto.d	$r0,$r0
 534:	00003800 	revb.2w	$r0,$r0
 538:	30000200 	0x30000200
 53c:	0000389f 	revb.2w	$r31,$r4
 540:	0000ac00 	0x0000ac00
 544:	5f000100 	bne	$r8,$r0,-65536(0x30000) # ffff0544 <_stack+0xe3fdf1d4>
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	00000064 	0x00000064
   4:	0000006c 	0x0000006c
   8:	00000084 	0x00000084
   c:	000000a0 	0x000000a0
	...
  18:	000000a8 	0x000000a8
  1c:	000000ac 	0x000000ac
  20:	000000f4 	0x000000f4
  24:	0000022c 	0x0000022c
	...
  38:	00000008 	0x00000008
  3c:	00000018 	0x00000018
	...
  48:	00000020 	0x00000020
  4c:	00000030 	0x00000030
  50:	00000038 	0x00000038
  54:	00000050 	0x00000050
	...
  68:	00000008 	0x00000008
  6c:	00000010 	0x00000010
	...
  78:	00000028 	0x00000028
  7c:	00000028 	0x00000028
  80:	00000030 	0x00000030
  84:	00000038 	0x00000038
	...
  90:	000000b0 	0x000000b0
  94:	000000b0 	0x000000b0
  98:	000000b8 	0x000000b8
  9c:	000000c0 	0x000000c0
	...
  a8:	000000d4 	0x000000d4
  ac:	000000d4 	0x000000d4
  b0:	000000dc 	0x000000dc
  b4:	000000e4 	0x000000e4
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	00000471 	0x00000471
   4:	00200004 	div.w	$r4,$r0,$r0
   8:	01010000 	fadd.d	$f0,$f0,$f0
   c:	0df2f601 	0x0df2f601
  10:	01010100 	fadd.d	$f0,$f8,$f0
  14:	00000001 	0x00000001
  18:	01000001 	0x01000001
  1c:	69727000 	bltu	$r0,$r0,94832(0x17270) # 1728c <data_size+0x16a44>
  20:	2e66746e 	0x2e66746e
  24:	00000063 	0x00000063
  28:	05000000 	0x05000000
  2c:	00098002 	bytepick.w	$r2,$r0,$r0,0x3
  30:	0105181c 	fmul.d	$f28,$f0,$f6
  34:	80020500 	0x80020500
  38:	181c0009 	pcaddi	$r9,57344(0xe000)
  3c:	05000105 	0x05000105
  40:	00098002 	bytepick.w	$r2,$r0,$r0,0x3
  44:	0105181c 	fmul.d	$f28,$f0,$f6
  48:	80020500 	0x80020500
  4c:	181c0009 	pcaddi	$r9,57344(0xe000)
  50:	05000105 	0x05000105
  54:	00098002 	bytepick.w	$r2,$r0,$r0,0x3
  58:	0105181c 	fmul.d	$f28,$f0,$f6
  5c:	80020500 	0x80020500
  60:	181c0009 	pcaddi	$r9,57344(0xe000)
  64:	05000105 	0x05000105
  68:	00098002 	bytepick.w	$r2,$r0,$r0,0x3
  6c:	0105181c 	fmul.d	$f28,$f0,$f6
  70:	80020500 	0x80020500
  74:	061c0009 	cacop	0x9,$r0,1792(0x700)
  78:	00010511 	0x00010511
  7c:	09a00205 	vfnmadd.d	$vr5,$vr16,$vr0,$vr0
  80:	051f1c00 	0x051f1c00
  84:	0205000c 	slti	$r12,$r0,320(0x140)
  88:	1c0009a4 	pcaddu12i	$r4,77(0x4d)
  8c:	00010515 	0x00010515
  90:	09a80205 	vfnmadd.d	$vr5,$vr16,$vr0,$vr16
  94:	05111c00 	0x05111c00
  98:	02050001 	slti	$r1,$r0,320(0x140)
  9c:	1c0009c4 	pcaddu12i	$r4,78(0x4e)
  a0:	0001051d 	0x0001051d
  a4:	09c80205 	0x09c80205
  a8:	18061c00 	pcaddi	$r0,12512(0x30e0)
  ac:	05000105 	0x05000105
  b0:	0009c802 	bytepick.w	$r2,$r0,$r18,0x3
  b4:	0105181c 	fmul.d	$f28,$f0,$f6
  b8:	e4020500 	0xe4020500
  bc:	5d1c0009 	bne	$r0,$r9,72704(0x11c00) # 11cbc <data_size+0x11474>
  c0:	05000305 	0x05000305
  c4:	0009ec02 	bytepick.w	$r2,$r0,$r27,0x3
  c8:	0402001c 	csrrd	$r28,0x80
  cc:	ba030602 	0xba030602
  d0:	1105017f 	addu16i.d	$r31,$r11,16704(0x4140)
  d4:	f0020500 	0xf0020500
  d8:	011c0009 	0x011c0009
  dc:	05000c05 	0x05000c05
  e0:	0009f802 	bytepick.w	$r2,$r0,$r30,0x3
  e4:	0105011c 	fmul.d	$f28,$f8,$f0
  e8:	fc020500 	0xfc020500
  ec:	001c0009 	mul.w	$r9,$r0,$r0
  f0:	06000402 	cacop	0x2,$r0,1(0x1)
  f4:	00020519 	0x00020519
  f8:	09fc0205 	0x09fc0205
  fc:	05181c00 	0x05181c00
 100:	02050002 	slti	$r2,$r0,320(0x140)
 104:	1c0009fc 	pcaddu12i	$r28,79(0x4f)
 108:	04050106 	csrxchg	$r6,$r8,0x140
 10c:	04020500 	csrxchg	$r0,$r8,0x81
 110:	061c000a 	cacop	0xa,$r0,1792(0x700)
 114:	00030559 	0x00030559
 118:	0a040205 	0x0a040205
 11c:	01061c00 	0x01061c00
 120:	05000505 	0x05000505
 124:	000a0c02 	0x000a0c02
 128:	0402001c 	csrrd	$r28,0x80
 12c:	05010601 	0x05010601
 130:	0205000f 	slti	$r15,$r0,320(0x140)
 134:	1c000a20 	pcaddu12i	$r0,81(0x51)
 138:	00040200 	alsl.w	$r0,$r16,$r0,0x1
 13c:	01400306 	0x01400306
 140:	05000405 	0x05000405
 144:	000a2402 	0x000a2402
 148:	0305191c 	lu52i.d	$r28,$r8,326(0x146)
 14c:	28020500 	ld.b	$r0,$r8,129(0x81)
 150:	4a1c000a 	bceqz	$fcc0,2759680(0x2a1c00) # 2a1d50 <data_size+0x2a1508>
 154:	05000905 	0x05000905
 158:	000a2c02 	0x000a2c02
 15c:	4d03061c 	jirl	$r28,$r16,66308(0x10304)
 160:	00030501 	0x00030501
 164:	0a4c0205 	0x0a4c0205
 168:	5a061c00 	beq	$r0,$r0,-129508(0x2061c) # fffe0784 <_stack+0xe3fcf414>
 16c:	05000105 	0x05000105
 170:	000a7402 	0x000a7402
 174:	6d03061c 	bgeu	$r16,$r28,66308(0x10304) # 10478 <data_size+0xfc30>
 178:	00050501 	alsl.w	$r1,$r8,$r1,0x3
 17c:	0a7c0205 	0x0a7c0205
 180:	01061c00 	0x01061c00
 184:	05000605 	0x05000605
 188:	000a8002 	0x000a8002
 18c:	0402001c 	csrrd	$r28,0x80
 190:	1a051901 	pcalau12i	$r1,10440(0x28c8)
 194:	84020500 	0x84020500
 198:	011c000a 	0x011c000a
 19c:	05000505 	0x05000505
 1a0:	000a9402 	0x000a9402
 1a4:	0402001c 	csrrd	$r28,0x80
 1a8:	05180603 	0x05180603
 1ac:	02050006 	slti	$r6,$r0,320(0x140)
 1b0:	1c000a94 	pcaddu12i	$r20,84(0x54)
 1b4:	09050106 	0x09050106
 1b8:	98020500 	0x98020500
 1bc:	161c000a 	lu32i.d	$r10,57344(0xe000)
 1c0:	05002c05 	0x05002c05
 1c4:	000a9c02 	0x000a9c02
 1c8:	1005011c 	addu16i.d	$r28,$r8,320(0x140)
 1cc:	a0020500 	0xa0020500
 1d0:	181c000a 	pcaddi	$r10,57344(0xe000)
 1d4:	05001605 	0x05001605
 1d8:	000aa402 	0x000aa402
 1dc:	1005161c 	addu16i.d	$r28,$r16,325(0x145)
 1e0:	a8020500 	0xa8020500
 1e4:	011c000a 	0x011c000a
 1e8:	05001a05 	0x05001a05
 1ec:	000aac02 	0x000aac02
 1f0:	0505011c 	0x0505011c
 1f4:	b4020500 	0xb4020500
 1f8:	181c000a 	pcaddi	$r10,57344(0xe000)
 1fc:	05000705 	0x05000705
 200:	000ab802 	0x000ab802
 204:	0505161c 	0x0505161c
 208:	c0020500 	0xc0020500
 20c:	001c000a 	mul.w	$r10,$r0,$r0
 210:	06000402 	cacop	0x2,$r0,1(0x1)
 214:	05016f03 	0x05016f03
 218:	02050005 	slti	$r5,$r0,320(0x140)
 21c:	1c000ad0 	pcaddu12i	$r16,86(0x56)
 220:	00050518 	alsl.w	$r24,$r8,$r1,0x3
 224:	0ad00205 	xvfnmsub.s	$xr5,$xr16,$xr0,$xr0
 228:	01061c00 	0x01061c00
 22c:	05000805 	0x05000805
 230:	000ad402 	0x000ad402
 234:	0518061c 	0x0518061c
 238:	02050005 	slti	$r5,$r0,320(0x140)
 23c:	1c000ad4 	pcaddu12i	$r20,86(0x56)
 240:	06050106 	cacop	0x6,$r8,320(0x140)
 244:	d8020500 	0xd8020500
 248:	061c000a 	cacop	0xa,$r0,1792(0x700)
 24c:	00050518 	alsl.w	$r24,$r8,$r1,0x3
 250:	0adc0205 	xvfnmsub.s	$xr5,$xr16,$xr0,$xr24
 254:	64031c00 	bge	$r0,$r0,796(0x31c) # 570 <data_size-0x2d8>
 258:	00050501 	alsl.w	$r1,$r8,$r1,0x3
 25c:	0ae00205 	xvfnmsub.d	$xr5,$xr16,$xr0,$xr0
 260:	19061c00 	pcaddi	$r0,-511776(0x830e0)
 264:	05000605 	0x05000605
 268:	000ae402 	0x000ae402
 26c:	0805161c 	0x0805161c
 270:	e8020500 	0xe8020500
 274:	161c000a 	lu32i.d	$r10,57344(0xe000)
 278:	05000505 	0x05000505
 27c:	000aec02 	0x000aec02
 280:	0518061c 	0x0518061c
 284:	02050005 	slti	$r5,$r0,320(0x140)
 288:	1c000aec 	pcaddu12i	$r12,87(0x57)
 28c:	00050518 	alsl.w	$r24,$r8,$r1,0x3
 290:	0aec0205 	xvfnmsub.d	$xr5,$xr16,$xr0,$xr24
 294:	05181c00 	0x05181c00
 298:	02050005 	slti	$r5,$r0,320(0x140)
 29c:	1c000af0 	pcaddu12i	$r16,87(0x57)
 2a0:	0005051e 	alsl.w	$r30,$r8,$r1,0x3
 2a4:	0b000205 	0x0b000205
 2a8:	05181c00 	0x05181c00
 2ac:	02050005 	slti	$r5,$r0,320(0x140)
 2b0:	1c000b00 	pcaddu12i	$r0,88(0x58)
 2b4:	08050106 	0x08050106
 2b8:	04020500 	csrxchg	$r0,$r8,0x81
 2bc:	061c000b 	cacop	0xb,$r0,1792(0x700)
 2c0:	00050518 	alsl.w	$r24,$r8,$r1,0x3
 2c4:	0b040205 	0x0b040205
 2c8:	01061c00 	0x01061c00
 2cc:	05000605 	0x05000605
 2d0:	000b0802 	0x000b0802
 2d4:	0518061c 	0x0518061c
 2d8:	02050005 	slti	$r5,$r0,320(0x140)
 2dc:	1c000b0c 	pcaddu12i	$r12,88(0x58)
 2e0:	00110519 	sub.w	$r25,$r8,$r1
 2e4:	0b1c0205 	0x0b1c0205
 2e8:	05181c00 	0x05181c00
 2ec:	02050011 	slti	$r17,$r0,320(0x140)
 2f0:	1c000b1c 	pcaddu12i	$r28,88(0x58)
 2f4:	14050106 	lu12i.w	$r6,10248(0x2808)
 2f8:	20020500 	ll.w	$r0,$r8,516(0x204)
 2fc:	061c000b 	cacop	0xb,$r0,1792(0x700)
 300:	00110518 	sub.w	$r24,$r8,$r1
 304:	0b200205 	0x0b200205
 308:	01061c00 	0x01061c00
 30c:	05001205 	0x05001205
 310:	000b2402 	0x000b2402
 314:	0518061c 	0x0518061c
 318:	02050011 	slti	$r17,$r0,320(0x140)
 31c:	1c000b28 	pcaddu12i	$r8,89(0x59)
 320:	00050519 	alsl.w	$r25,$r8,$r1,0x3
 324:	0b380205 	0x0b380205
 328:	05181c00 	0x05181c00
 32c:	02050005 	slti	$r5,$r0,320(0x140)
 330:	1c000b38 	pcaddu12i	$r24,89(0x59)
 334:	08050106 	0x08050106
 338:	3c020500 	0x3c020500
 33c:	061c000b 	cacop	0xb,$r0,1792(0x700)
 340:	00050518 	alsl.w	$r24,$r8,$r1,0x3
 344:	0b3c0205 	0x0b3c0205
 348:	01061c00 	0x01061c00
 34c:	05000605 	0x05000605
 350:	000b4002 	0x000b4002
 354:	0518061c 	0x0518061c
 358:	02050005 	slti	$r5,$r0,320(0x140)
 35c:	1c000b44 	pcaddu12i	$r4,90(0x5a)
 360:	0005051f 	alsl.w	$r31,$r8,$r1,0x3
 364:	0b540205 	0x0b540205
 368:	05181c00 	0x05181c00
 36c:	02050005 	slti	$r5,$r0,320(0x140)
 370:	1c000b54 	pcaddu12i	$r20,90(0x5a)
 374:	08050106 	0x08050106
 378:	58020500 	beq	$r8,$r0,516(0x204) # 57c <data_size-0x2cc>
 37c:	061c000b 	cacop	0xb,$r0,1792(0x700)
 380:	00050518 	alsl.w	$r24,$r8,$r1,0x3
 384:	0b580205 	0x0b580205
 388:	01061c00 	0x01061c00
 38c:	05000605 	0x05000605
 390:	000b5c02 	0x000b5c02
 394:	0518061c 	0x0518061c
 398:	02050005 	slti	$r5,$r0,320(0x140)
 39c:	1c000b60 	pcaddu12i	$r0,91(0x5b)
 3a0:	05015903 	0x05015903
 3a4:	02050005 	slti	$r5,$r0,320(0x140)
 3a8:	1c000b64 	pcaddu12i	$r4,91(0x5b)
 3ac:	06051906 	cacop	0x6,$r8,326(0x146)
 3b0:	68020500 	bltu	$r8,$r0,516(0x204) # 5b4 <data_size-0x294>
 3b4:	161c000b 	lu32i.d	$r11,57344(0xe000)
 3b8:	05000805 	0x05000805
 3bc:	000b6c02 	0x000b6c02
 3c0:	0505161c 	0x0505161c
 3c4:	70020500 	vsle.b	$vr0,$vr8,$vr1
 3c8:	061c000b 	cacop	0xb,$r0,1792(0x700)
 3cc:	00050518 	alsl.w	$r24,$r8,$r1,0x3
 3d0:	0b700205 	0x0b700205
 3d4:	05181c00 	0x05181c00
 3d8:	02050005 	slti	$r5,$r0,320(0x140)
 3dc:	1c000b70 	pcaddu12i	$r16,91(0x5b)
 3e0:	00050518 	alsl.w	$r24,$r8,$r1,0x3
 3e4:	0b740205 	0x0b740205
 3e8:	051e1c00 	0x051e1c00
 3ec:	02050005 	slti	$r5,$r0,320(0x140)
 3f0:	1c000b84 	pcaddu12i	$r4,92(0x5c)
 3f4:	00050518 	alsl.w	$r24,$r8,$r1,0x3
 3f8:	0b840205 	0x0b840205
 3fc:	01061c00 	0x01061c00
 400:	05000805 	0x05000805
 404:	000b8802 	0x000b8802
 408:	0518061c 	0x0518061c
 40c:	02050005 	slti	$r5,$r0,320(0x140)
 410:	1c000b88 	pcaddu12i	$r8,92(0x5c)
 414:	06050106 	cacop	0x6,$r8,320(0x140)
 418:	8c020500 	0x8c020500
 41c:	061c000b 	cacop	0xb,$r0,1792(0x700)
 420:	00050518 	alsl.w	$r24,$r8,$r1,0x3
 424:	0b900205 	0x0b900205
 428:	05331c00 	0x05331c00
 42c:	02050005 	slti	$r5,$r0,320(0x140)
 430:	1c000b98 	pcaddu12i	$r24,92(0x5c)
 434:	00050518 	alsl.w	$r24,$r8,$r1,0x3
 438:	0b980205 	0x0b980205
 43c:	01061c00 	0x01061c00
 440:	05000605 	0x05000605
 444:	000b9c02 	0x000b9c02
 448:	0518061c 	0x0518061c
 44c:	02050005 	slti	$r5,$r0,320(0x140)
 450:	1c000ba0 	pcaddu12i	$r0,93(0x5d)
 454:	0006051e 	alsl.wu	$r30,$r8,$r1,0x1
 458:	0ba00205 	0x0ba00205
 45c:	051a1c00 	0x051a1c00
 460:	02050005 	slti	$r5,$r0,320(0x140)
 464:	1c000ba8 	pcaddu12i	$r8,93(0x5d)
 468:	00050518 	alsl.w	$r24,$r8,$r1,0x3
 46c:	0bac0205 	0x0bac0205
 470:	01001c00 	0x01001c00
 474:	0000ae01 	0x0000ae01
 478:	21000400 	sc.w	$r0,$r0,4(0x4)
 47c:	01000000 	0x01000000
 480:	f2f60101 	0xf2f60101
 484:	0101000d 	fadd.d	$f13,$f0,$f0
 488:	00000101 	0x00000101
 48c:	00000100 	0x00000100
 490:	75700001 	0x75700001
 494:	61686374 	blt	$r27,$r20,92256(0x16860) # 16cf4 <data_size+0x164ac>
 498:	00632e72 	bstrins.w	$r18,$r19,0x3,0xb
 49c:	00000000 	0x00000000
 4a0:	ac020500 	0xac020500
 4a4:	181c000b 	pcaddi	$r11,57344(0xe000)
 4a8:	05000105 	0x05000105
 4ac:	000bac02 	0x000bac02
 4b0:	0105181c 	fmul.d	$f28,$f0,$f6
 4b4:	ac020500 	0xac020500
 4b8:	1d1c000b 	pcaddu12i	$r11,-466944(0x8e000)
 4bc:	05000505 	0x05000505
 4c0:	000bac02 	0x000bac02
 4c4:	0510061c 	0x0510061c
 4c8:	02050001 	slti	$r1,$r0,320(0x140)
 4cc:	1c000bb4 	pcaddu12i	$r20,93(0x5d)
 4d0:	0005051e 	alsl.w	$r30,$r8,$r1,0x3
 4d4:	0bc40205 	0x0bc40205
 4d8:	12061c00 	addu16i.d	$r0,$r0,-32377(0x8187)
 4dc:	05000105 	0x05000105
 4e0:	000bc402 	0x000bc402
 4e4:	0518061c 	0x0518061c
 4e8:	02050001 	slti	$r1,$r0,320(0x140)
 4ec:	1c000bd4 	pcaddu12i	$r20,94(0x5e)
 4f0:	01051a06 	fmul.d	$f6,$f16,$f6
 4f4:	d4020500 	0xd4020500
 4f8:	181c000b 	pcaddi	$r11,57344(0xe000)
 4fc:	05000505 	0x05000505
 500:	000bd402 	0x000bd402
 504:	0516061c 	0x0516061c
 508:	02050001 	slti	$r1,$r0,320(0x140)
 50c:	1c000bdc 	pcaddu12i	$r28,94(0x5e)
 510:	00050518 	alsl.w	$r24,$r8,$r1,0x3
 514:	0bec0205 	0x0bec0205
 518:	051e1c00 	0x051e1c00
 51c:	02050001 	slti	$r1,$r0,320(0x140)
 520:	1c000bf8 	pcaddu12i	$r24,95(0x5f)
 524:	65010100 	bge	$r8,$r0,65792(0x10100) # 10624 <data_size+0xfddc>
 528:	04000001 	csrrd	$r1,0x0
 52c:	00001e00 	ctz.w	$r0,$r16
 530:	01010100 	fadd.d	$f0,$f8,$f0
 534:	000df2f6 	bytepick.d	$r22,$r23,$r28,0x3
 538:	01010101 	fadd.d	$f1,$f8,$f0
 53c:	01000000 	0x01000000
 540:	00010000 	asrtle.d	$r0,$r0
 544:	73747570 	0x73747570
 548:	0000632e 	rdtimel.w	$r14,$r25
 54c:	00000000 	0x00000000
 550:	0bf80205 	0x0bf80205
 554:	05181c00 	0x05181c00
 558:	02050001 	slti	$r1,$r0,320(0x140)
 55c:	1c000bf8 	pcaddu12i	$r24,95(0x5f)
 560:	00010518 	0x00010518
 564:	0bf80205 	0x0bf80205
 568:	05181c00 	0x05181c00
 56c:	02050001 	slti	$r1,$r0,320(0x140)
 570:	1c000bf8 	pcaddu12i	$r24,95(0x5f)
 574:	01051506 	fmul.d	$f6,$f8,$f5
 578:	0c020500 	0x0c020500
 57c:	191c000c 	pcaddi	$r12,-466944(0x8e000)
 580:	05000905 	0x05000905
 584:	000c1002 	bytepick.d	$r2,$r0,$r4,0x0
 588:	0605011c 	cacop	0x1c,$r8,320(0x140)
 58c:	18020500 	pcaddi	$r0,4136(0x1028)
 590:	191c000c 	pcaddi	$r12,-466944(0x8e000)
 594:	05000405 	0x05000405
 598:	000c2002 	bytepick.d	$r2,$r0,$r8,0x0
 59c:	0518061c 	0x0518061c
 5a0:	02050002 	slti	$r2,$r0,320(0x140)
 5a4:	1c000c28 	pcaddu12i	$r8,97(0x61)
 5a8:	00020518 	0x00020518
 5ac:	0c280205 	fcmp.cne.d	$fcc5,$f16,$f0
 5b0:	13061c00 	addu16i.d	$r0,$r0,-15993(0xc187)
 5b4:	05000905 	0x05000905
 5b8:	000c2c02 	bytepick.d	$r2,$r0,$r11,0x0
 5bc:	0605011c 	cacop	0x1c,$r8,320(0x140)
 5c0:	30020500 	0x30020500
 5c4:	061c000c 	cacop	0xc,$r0,1792(0x700)
 5c8:	00020519 	0x00020519
 5cc:	0c300205 	0x0c300205
 5d0:	19061c00 	pcaddi	$r0,-511776(0x830e0)
 5d4:	05000305 	0x05000305
 5d8:	000c3402 	bytepick.d	$r2,$r0,$r13,0x0
 5dc:	0405151c 	csrxchg	$r28,$r8,0x145
 5e0:	38020500 	0x38020500
 5e4:	001c000c 	mul.w	$r12,$r0,$r0
 5e8:	06010402 	cacop	0x2,$r0,65(0x41)
 5ec:	00100501 	add.w	$r1,$r8,$r1
 5f0:	0c400205 	0x0c400205
 5f4:	05181c00 	0x05181c00
 5f8:	02050002 	slti	$r2,$r0,320(0x140)
 5fc:	1c000c48 	pcaddu12i	$r8,98(0x62)
 600:	00020518 	0x00020518
 604:	0c480205 	0x0c480205
 608:	13061c00 	addu16i.d	$r0,$r0,-15993(0xc187)
 60c:	05000905 	0x05000905
 610:	000c4c02 	bytepick.d	$r2,$r0,$r19,0x0
 614:	0605011c 	cacop	0x1c,$r8,320(0x140)
 618:	50020500 	b	67109380(0x4000204) # 400081c <data_size+0x3ffffd4>
 61c:	001c000c 	mul.w	$r12,$r0,$r0
 620:	06000402 	cacop	0x2,$r0,1(0x1)
 624:	0001051d 	0x0001051d
 628:	0c500205 	vfcmp.caf.s	$vr5,$vr16,$vr0
 62c:	18061c00 	pcaddi	$r0,12512(0x30e0)
 630:	05000105 	0x05000105
 634:	000c6c02 	bytepick.d	$r2,$r0,$r27,0x0
 638:	051b061c 	0x051b061c
 63c:	02050001 	slti	$r1,$r0,320(0x140)
 640:	1c000c6c 	pcaddu12i	$r12,99(0x63)
 644:	00010518 	0x00010518
 648:	0c6c0205 	vfcmp.cune.d	$vr5,$vr16,$vr0
 64c:	16061c00 	lu32i.d	$r0,12512(0x30e0)
 650:	05000105 	0x05000105
 654:	000c7402 	bytepick.d	$r2,$r0,$r29,0x0
 658:	0105181c 	fmul.d	$f28,$f0,$f6
 65c:	78020500 	0x78020500
 660:	061c000c 	cacop	0xc,$r0,1792(0x700)
 664:	00010518 	0x00010518
 668:	0c800205 	0x0c800205
 66c:	05181c00 	0x05181c00
 670:	02050001 	slti	$r1,$r0,320(0x140)
 674:	1c000c88 	pcaddu12i	$r8,100(0x64)
 678:	00010518 	0x00010518
 67c:	0c880205 	0x0c880205
 680:	18061c00 	pcaddi	$r0,12512(0x30e0)
 684:	05000105 	0x05000105
 688:	000c9802 	bytepick.d	$r2,$r0,$r6,0x1
 68c:	0101001c 	fadd.d	$f28,$f0,$f0
 690:	000001bf 	0x000001bf
 694:	00230004 	div.du	$r4,$r0,$r0
 698:	01010000 	fadd.d	$f0,$f0,$f0
 69c:	0df2f601 	0x0df2f601
 6a0:	01010100 	fadd.d	$f0,$f8,$f0
 6a4:	00000001 	0x00000001
 6a8:	01000001 	0x01000001
 6ac:	69727000 	bltu	$r0,$r0,94832(0x17270) # 1791c <data_size+0x170d4>
 6b0:	6162746e 	blt	$r3,$r14,90740(0x16274) # 16924 <data_size+0x160dc>
 6b4:	632e6573 	blt	$r11,$r19,-53660(0x32e64) # ffff3518 <_stack+0xe3fe21a8>
 6b8:	00000000 	0x00000000
 6bc:	02050000 	slti	$r0,$r0,320(0x140)
 6c0:	1c000c98 	pcaddu12i	$r24,100(0x64)
 6c4:	00010518 	0x00010518
 6c8:	0c980205 	xvfcmp.cne.s	$xr5,$xr16,$xr0
 6cc:	05181c00 	0x05181c00
 6d0:	02050002 	slti	$r2,$r0,320(0x140)
 6d4:	1c000c98 	pcaddu12i	$r24,100(0x64)
 6d8:	00020518 	0x00020518
 6dc:	0c980205 	xvfcmp.cne.s	$xr5,$xr16,$xr0
 6e0:	05181c00 	0x05181c00
 6e4:	02050002 	slti	$r2,$r0,320(0x140)
 6e8:	1c000c98 	pcaddu12i	$r24,100(0x64)
 6ec:	00020518 	0x00020518
 6f0:	0c980205 	xvfcmp.cne.s	$xr5,$xr16,$xr0
 6f4:	05181c00 	0x05181c00
 6f8:	02050002 	slti	$r2,$r0,320(0x140)
 6fc:	1c000c98 	pcaddu12i	$r24,100(0x64)
 700:	01051206 	fmul.d	$f6,$f16,$f4
 704:	ac020500 	0xac020500
 708:	011c000c 	0x011c000c
 70c:	05000105 	0x05000105
 710:	000cb002 	bytepick.d	$r2,$r0,$r12,0x1
 714:	04051c1c 	csrrd	$r28,0x147
 718:	b4020500 	0xb4020500
 71c:	001c000c 	mul.w	$r12,$r0,$r0
 720:	01010402 	fadd.d	$f2,$f0,$f1
 724:	05000a05 	0x05000a05
 728:	000cb802 	bytepick.d	$r2,$r0,$r14,0x1
 72c:	0402001c 	csrrd	$r28,0x80
 730:	051c0600 	0x051c0600
 734:	02050007 	slti	$r7,$r0,320(0x140)
 738:	1c000cb8 	pcaddu12i	$r24,101(0x65)
 73c:	02051906 	slti	$r6,$r8,326(0x146)
 740:	cc020500 	0xcc020500
 744:	1a1c000c 	pcalau12i	$r12,57344(0xe000)
 748:	05000705 	0x05000705
 74c:	000cd002 	bytepick.d	$r2,$r0,$r20,0x1
 750:	0402001c 	csrrd	$r28,0x80
 754:	05160603 	0x05160603
 758:	02050002 	slti	$r2,$r0,320(0x140)
 75c:	1c000cd0 	pcaddu12i	$r16,102(0x66)
 760:	0e050106 	0x0e050106
 764:	dc020500 	0xdc020500
 768:	011c000c 	0x011c000c
 76c:	05000805 	0x05000805
 770:	000ce002 	bytepick.d	$r2,$r0,$r24,0x1
 774:	0518061c 	0x0518061c
 778:	02050002 	slti	$r2,$r0,320(0x140)
 77c:	1c000ce4 	pcaddu12i	$r4,103(0x67)
 780:	07050106 	0x07050106
 784:	f4020500 	0xf4020500
 788:	141c000c 	lu12i.w	$r12,57344(0xe000)
 78c:	05000205 	0x05000205
 790:	000cf802 	bytepick.d	$r2,$r0,$r30,0x1
 794:	0402001c 	csrrd	$r28,0x80
 798:	051f0600 	0x051f0600
 79c:	02050002 	slti	$r2,$r0,320(0x140)
 7a0:	1c000cf8 	pcaddu12i	$r24,103(0x67)
 7a4:	07050106 	0x07050106
 7a8:	00020500 	0x00020500
 7ac:	1a1c000d 	pcalau12i	$r13,57344(0xe000)
 7b0:	05000305 	0x05000305
 7b4:	000d0402 	bytepick.d	$r2,$r0,$r1,0x2
 7b8:	0516061c 	0x0516061c
 7bc:	02050003 	slti	$r3,$r0,320(0x140)
 7c0:	1c000d04 	pcaddu12i	$r4,104(0x68)
 7c4:	0e050106 	0x0e050106
 7c8:	10020500 	addu16i.d	$r0,$r8,129(0x81)
 7cc:	011c000d 	0x011c000d
 7d0:	05000a05 	0x05000a05
 7d4:	000d1802 	bytepick.d	$r2,$r0,$r6,0x2
 7d8:	0402001c 	csrrd	$r28,0x80
 7dc:	05180601 	0x05180601
 7e0:	02050003 	slti	$r3,$r0,320(0x140)
 7e4:	1c000d2c 	pcaddu12i	$r12,105(0x69)
 7e8:	04040200 	csrxchg	$r0,$r16,0x100
 7ec:	02051406 	slti	$r6,$r0,325(0x145)
 7f0:	30020500 	0x30020500
 7f4:	001c000d 	mul.w	$r13,$r0,$r0
 7f8:	1d000402 	pcaddu12i	$r2,-524256(0x80020)
 7fc:	05000105 	0x05000105
 800:	000d4c02 	bytepick.d	$r2,$r0,$r19,0x2
 804:	0705111c 	0x0705111c
 808:	54020500 	bl	67109380(0x4000204) # 4000a0c <data_size+0x40001c4>
 80c:	031c000d 	lu52i.d	$r13,$r0,1792(0x700)
 810:	02050174 	slti	$r20,$r11,320(0x140)
 814:	60020500 	blt	$r8,$r0,516(0x204) # a18 <data_size+0x1d0>
 818:	061c000d 	cacop	0xd,$r0,1792(0x700)
 81c:	00020516 	0x00020516
 820:	0d600205 	xvshuf.b	$xr5,$xr16,$xr0,$xr0
 824:	18061c00 	pcaddi	$r0,12512(0x30e0)
 828:	05000205 	0x05000205
 82c:	000d6402 	bytepick.d	$r2,$r0,$r25,0x2
 830:	0a05161c 	0x0a05161c
 834:	68020500 	bltu	$r8,$r0,516(0x204) # a38 <data_size+0x1f0>
 838:	061c000d 	cacop	0xd,$r0,1792(0x700)
 83c:	00020518 	0x00020518
 840:	0d740205 	0x0d740205
 844:	05231c00 	0x05231c00
 848:	02050002 	slti	$r2,$r0,320(0x140)
 84c:	1c000d80 	pcaddu12i	$r0,108(0x6c)
 850:	e6010100 	0xe6010100
 854:	04000002 	csrrd	$r2,0x0
 858:	00003300 	revb.2h	$r0,$r24
 85c:	01010100 	fadd.d	$f0,$f8,$f0
 860:	000df2f6 	bytepick.d	$r22,$r23,$r28,0x3
 864:	01010101 	fadd.d	$f1,$f8,$f0
 868:	01000000 	0x01000000
 86c:	2e010000 	0x2e010000
 870:	6e692f2e 	bgeu	$r25,$r14,-104148(0x2692c) # fffe719c <_stack+0xe3fd5e2c>
 874:	64756c63 	bge	$r3,$r3,30060(0x756c) # 7de0 <data_size+0x7598>
 878:	74000065 	xvseq.b	$xr5,$xr3,$xr0
 87c:	2e656d69 	0x2e656d69
 880:	00000063 	0x00000063
 884:	6d697400 	bgeu	$r0,$r0,92532(0x16974) # 171f8 <data_size+0x169b0>
 888:	00682e65 	bstrins.w	$r5,$r19,0x8,0xb
 88c:	00000001 	0x00000001
 890:	80020500 	0x80020500
 894:	281c000d 	ld.b	$r13,$r0,1792(0x700)
 898:	05000105 	0x05000105
 89c:	000d8002 	bytepick.d	$r2,$r0,$r0,0x3
 8a0:	0505181c 	0x0505181c
 8a4:	80020500 	0x80020500
 8a8:	031c000d 	lu52i.d	$r13,$r0,1792(0x700)
 8ac:	05050173 	0x05050173
 8b0:	80020500 	0x80020500
 8b4:	181c000d 	pcaddi	$r13,57344(0xe000)
 8b8:	05000505 	0x05000505
 8bc:	000d8002 	bytepick.d	$r2,$r0,$r0,0x3
 8c0:	0522061c 	0x0522061c
 8c4:	02050001 	slti	$r1,$r0,320(0x140)
 8c8:	1c000d88 	pcaddu12i	$r8,108(0x6c)
 8cc:	05017503 	0x05017503
 8d0:	02050005 	slti	$r5,$r0,320(0x140)
 8d4:	1c000d90 	pcaddu12i	$r16,108(0x6c)
 8d8:	05051e06 	0x05051e06
 8dc:	90020500 	0x90020500
 8e0:	061c000d 	cacop	0xd,$r0,1792(0x700)
 8e4:	0001051d 	0x0001051d
 8e8:	0da00205 	0x0da00205
 8ec:	1a061c00 	pcalau12i	$r0,12512(0x30e0)
 8f0:	05000105 	0x05000105
 8f4:	000da002 	bytepick.d	$r2,$r0,$r8,0x3
 8f8:	0505181c 	0x0505181c
 8fc:	a0020500 	0xa0020500
 900:	181c000d 	pcaddi	$r13,57344(0xe000)
 904:	05000505 	0x05000505
 908:	000da402 	bytepick.d	$r2,$r0,$r9,0x3
 90c:	05051b1c 	0x05051b1c
 910:	a4020500 	0xa4020500
 914:	061c000d 	cacop	0xd,$r0,1792(0x700)
 918:	00010518 	0x00010518
 91c:	0da80205 	0x0da80205
 920:	1a061c00 	pcalau12i	$r0,12512(0x30e0)
 924:	05000105 	0x05000105
 928:	000da802 	bytepick.d	$r2,$r0,$r10,0x3
 92c:	0505181c 	0x0505181c
 930:	a8020500 	0xa8020500
 934:	181c000d 	pcaddi	$r13,57344(0xe000)
 938:	05000505 	0x05000505
 93c:	000da802 	bytepick.d	$r2,$r0,$r10,0x3
 940:	0163031c 	0x0163031c
 944:	05000505 	0x05000505
 948:	000da802 	bytepick.d	$r2,$r0,$r10,0x3
 94c:	0505181c 	0x0505181c
 950:	a8020500 	0xa8020500
 954:	061c000d 	cacop	0xd,$r0,1792(0x700)
 958:	00010531 	0x00010531
 95c:	0db00205 	0x0db00205
 960:	66031c00 	bge	$r0,$r0,-130276(0x2031c) # fffe0c7c <_stack+0xe3fcf90c>
 964:	00050501 	alsl.w	$r1,$r8,$r1,0x3
 968:	0db80205 	0x0db80205
 96c:	1e061c00 	pcaddu18i	$r0,12512(0x30e0)
 970:	05000505 	0x05000505
 974:	000db802 	bytepick.d	$r2,$r0,$r14,0x3
 978:	05052d1c 	0x05052d1c
 97c:	b8020500 	0xb8020500
 980:	061c000d 	cacop	0xd,$r0,1792(0x700)
 984:	00150501 	or	$r1,$r8,$r1
 988:	0dc00205 	0x0dc00205
 98c:	05181c00 	0x05181c00
 990:	02050016 	slti	$r22,$r0,320(0x140)
 994:	1c000dc4 	pcaddu12i	$r4,110(0x6e)
 998:	00360516 	0x00360516
 99c:	0dc80205 	0x0dc80205
 9a0:	05181c00 	0x05181c00
 9a4:	02050016 	slti	$r22,$r0,320(0x140)
 9a8:	1c000dd4 	pcaddu12i	$r20,110(0x6e)
 9ac:	00280501 	0x00280501
 9b0:	0de00205 	0x0de00205
 9b4:	05181c00 	0x05181c00
 9b8:	02050027 	slti	$r7,$r1,320(0x140)
 9bc:	1c000df4 	pcaddu12i	$r20,111(0x6f)
 9c0:	00360501 	0x00360501
 9c4:	0e000205 	0x0e000205
 9c8:	05161c00 	0x05161c00
 9cc:	02050012 	slti	$r18,$r0,320(0x140)
 9d0:	1c000e04 	pcaddu12i	$r4,112(0x70)
 9d4:	00120518 	slt	$r24,$r8,$r1
 9d8:	0e080205 	0x0e080205
 9dc:	05181c00 	0x05181c00
 9e0:	02050012 	slti	$r18,$r0,320(0x140)
 9e4:	1c000e0c 	pcaddu12i	$r12,112(0x70)
 9e8:	0001051a 	0x0001051a
 9ec:	0e140205 	0x0e140205
 9f0:	05111c00 	0x05111c00
 9f4:	02050036 	slti	$r22,$r1,320(0x140)
 9f8:	1c000e20 	pcaddu12i	$r0,113(0x71)
 9fc:	00120501 	slt	$r1,$r8,$r1
 a00:	0e240205 	0x0e240205
 a04:	18061c00 	pcaddi	$r0,12512(0x30e0)
 a08:	05000505 	0x05000505
 a0c:	000e2402 	bytepick.d	$r2,$r0,$r9,0x4
 a10:	0505181c 	0x0505181c
 a14:	24020500 	ldptr.w	$r0,$r8,516(0x204)
 a18:	181c000e 	pcaddi	$r14,57344(0xe000)
 a1c:	05000505 	0x05000505
 a20:	000e2402 	bytepick.d	$r2,$r0,$r9,0x4
 a24:	0505191c 	0x0505191c
 a28:	24020500 	ldptr.w	$r0,$r8,516(0x204)
 a2c:	061c000e 	cacop	0xe,$r0,1792(0x700)
 a30:	00010518 	0x00010518
 a34:	0e300205 	0x0e300205
 a38:	21061c00 	sc.w	$r0,$r0,1564(0x61c)
 a3c:	05000105 	0x05000105
 a40:	000e3002 	bytepick.d	$r2,$r0,$r12,0x4
 a44:	0505181c 	0x0505181c
 a48:	30020500 	0x30020500
 a4c:	181c000e 	pcaddi	$r14,57344(0xe000)
 a50:	05000505 	0x05000505
 a54:	000e3002 	bytepick.d	$r2,$r0,$r12,0x4
 a58:	0150031c 	0x0150031c
 a5c:	05000505 	0x05000505
 a60:	000e3002 	bytepick.d	$r2,$r0,$r12,0x4
 a64:	0505181c 	0x0505181c
 a68:	30020500 	0x30020500
 a6c:	061c000e 	cacop	0xe,$r0,1792(0x700)
 a70:	00010544 	0x00010544
 a74:	0e380205 	0x0e380205
 a78:	53031c00 	b	197404(0x3031c) # 30d94 <data_size+0x3054c>
 a7c:	00050501 	alsl.w	$r1,$r8,$r1,0x3
 a80:	0e400205 	0x0e400205
 a84:	1e061c00 	pcaddu18i	$r0,12512(0x30e0)
 a88:	05000505 	0x05000505
 a8c:	000e4002 	bytepick.d	$r2,$r0,$r16,0x4
 a90:	0505401c 	0x0505401c
 a94:	40020500 	beqz	$r8,516(0x204) # c98 <data_size+0x450>
 a98:	181c000e 	pcaddi	$r14,57344(0xe000)
 a9c:	05000505 	0x05000505
 aa0:	000e4002 	bytepick.d	$r2,$r0,$r16,0x4
 aa4:	0516061c 	0x0516061c
 aa8:	02050006 	slti	$r6,$r0,320(0x140)
 aac:	1c000e44 	pcaddu12i	$r4,114(0x72)
 ab0:	00010519 	0x00010519
 ab4:	0e540205 	0x0e540205
 ab8:	1b061c00 	pcalau12i	$r0,-511776(0x830e0)
 abc:	05000105 	0x05000105
 ac0:	000e5402 	bytepick.d	$r2,$r0,$r21,0x4
 ac4:	0505181c 	0x0505181c
 ac8:	54020500 	bl	67109380(0x4000204) # 4000ccc <data_size+0x4000484>
 acc:	181c000e 	pcaddi	$r14,57344(0xe000)
 ad0:	05000505 	0x05000505
 ad4:	000e5402 	bytepick.d	$r2,$r0,$r21,0x4
 ad8:	0147031c 	0x0147031c
 adc:	05000505 	0x05000505
 ae0:	000e5402 	bytepick.d	$r2,$r0,$r21,0x4
 ae4:	0505181c 	0x0505181c
 ae8:	54020500 	bl	67109380(0x4000204) # 4000cec <data_size+0x40004a4>
 aec:	061c000e 	cacop	0xe,$r0,1792(0x700)
 af0:	0001054d 	0x0001054d
 af4:	0e5c0205 	0x0e5c0205
 af8:	4a031c00 	bceqz	$fcc0,131868(0x2031c) # 20e14 <data_size+0x205cc>
 afc:	00050501 	alsl.w	$r1,$r8,$r1,0x3
 b00:	0e640205 	0x0e640205
 b04:	1e061c00 	pcaddu18i	$r0,12512(0x30e0)
 b08:	05000505 	0x05000505
 b0c:	000e6402 	bytepick.d	$r2,$r0,$r25,0x4
 b10:	0505491c 	0x0505491c
 b14:	64020500 	bge	$r8,$r0,516(0x204) # d18 <data_size+0x4d0>
 b18:	181c000e 	pcaddi	$r14,57344(0xe000)
 b1c:	05000505 	0x05000505
 b20:	000e6402 	bytepick.d	$r2,$r0,$r25,0x4
 b24:	0516061c 	0x0516061c
 b28:	02050006 	slti	$r6,$r0,320(0x140)
 b2c:	1c000e68 	pcaddu12i	$r8,115(0x73)
 b30:	00010519 	0x00010519
 b34:	0e840205 	0x0e840205
 b38:	01001c00 	0x01001c00
 b3c:	地址 0x0000000000000b3c 越界。


Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	63747570 	blt	$r11,$r16,-35724(0x37474) # ffff7474 <_stack+0xe3fe6104>
   4:	00726168 	bstrins.w	$r8,$r11,0x12,0x18
   8:	73747570 	0x73747570
   c:	6e697274 	bgeu	$r19,$r20,-104080(0x26970) # fffe697c <_stack+0xe3fd560c>
  10:	72700067 	0x72700067
  14:	62746e69 	blt	$r19,$r9,-101268(0x2746c) # fffe7480 <_stack+0xe3fd6110>
  18:	00657361 	bstrins.w	$r1,$r27,0x5,0x1c
  1c:	5f746774 	bne	$r27,$r20,-35740(0x37464) # ffff7480 <_stack+0xe3fe6110>
  20:	63747570 	blt	$r11,$r16,-35724(0x37474) # ffff7494 <_stack+0xe3fe6124>
  24:	00726168 	bstrins.w	$r8,$r11,0x12,0x18
  28:	63747570 	blt	$r11,$r16,-35724(0x37474) # ffff749c <_stack+0xe3fe612c>
  2c:	00726168 	bstrins.w	$r8,$r11,0x12,0x18
  30:	63747570 	blt	$r11,$r16,-35724(0x37474) # ffff74a4 <_stack+0xe3fe6134>
  34:	00726168 	bstrins.w	$r8,$r11,0x12,0x18

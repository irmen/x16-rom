REM 0 GOSUB3000:END

REM DETECT DRIVE
REM 0 = 1541 FEATURE SET (BASE)
REM 1 = 1571 EXTRA FEATURES
REM 2 = CMD FD/HD EXTRA FEATURES
REM 4 = C65 DRIVE EXTRA FEATURES
REM 8 = CMDR-DOS EXTRA FEATURES

1 DOS"UI":OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15
2 IFRIGHT$(S$,4)="1541"THENF=0:GOTO8
3 IFRIGHT$(S$,4)="1571"THENF=1:GOTO8
4 IFLEFT$(S$,4)="CMD "THENF=2+1:GOTO8
5 IFLEFT$(S$,12)="CBM C65 1565"THENF=4+2+1:GOTO8
6 IFLEFT$(S$,8)="CMDR-DOS"THENF=8+4+2+1:GOTO8
7 PRINT"UNKNOWN DRIVE":STOP

REM DETECT SECOND PARTITION

8 OPEN15,8,15,"G-P"+CHR$(2):GET#15,T$:FORI=0TO29:GET#15,A$:NEXT:CLOSE15
9 T=ASC(T$+CHR$(0)):P2=T=11ORT=12

10 :

11 GOSUB100
12 GOSUB200
13 GOSUB300
14 GOSUB400
15 GOSUB500
16 GOSUB600
17 GOSUB700
18 GOSUB800
19 GOSUB900
20 GOSUB1000
21 GOSUB1100
22 GOSUB1200
23 GOSUB1300
24 GOSUB1400
25 GOSUB1500
26 GOSUB1600
27 GOSUB1700
28 GOSUB1800
29 GOSUB1900
30 GOSUB2000
31 GOSUB2100
32 GOSUB2200
33 GOSUB2300
34 GOSUB2400
35 GOSUB2500
36 GOSUB2600
37 GOSUB2700
38 GOSUB2800
39 GOSUB2900
40 GOSUB3000
41 GOSUB3100
42 GOSUB3200
43 GOSUB3300
44 GOSUB3400
45 GOSUB3500
46 GOSUB3600
47 GOSUB3700
48 GOSUB3800
49 GOSUB3900
50 GOSUB4000
51 GOSUB4100
52 GOSUB4200
53 GOSUB4300
54 GOSUB4400
55 GOSUB4500
56 GOSUB4600
57 GOSUB4700
58 GOSUB4800
59 GOSUB4900
60 GOSUB5000

98 END
99 PRINT:GOTO10

100 PRINT"01 CREATE/READ FILE, ',P,X'",;
110 OPEN1,8,2,"FILE,P,W"
120 PRINT#1,"HELLO WORLD!"
130 CLOSE1
140 OPEN1,8,2,"FILE,P,R"
150 INPUT#1,A$
160 IFA$<>"HELLO WORLD!"THENSTOP
170 IFST<>64THENSTOP
180 CLOSE1
190 DOS"S:FILE"
199 DOS"U0>T":PRINT"OK":RETURN

200 PRINT"02 CREATE/READ FILE, CHAN 1/0",;
210 OPEN1,8,1,"FILE"
220 PRINT#1,"HELLO WORLD!"
230 CLOSE1
240 OPEN1,8,0,"FILE"
250 INPUT#1,A$
260 IFA$<>"HELLO WORLD!"THENSTOP
270 IFST<>64THENSTOP
280 CLOSE1
290 DOS"S:FILE"
299 DOS"U0>T":PRINT"OK":RETURN

300 PRINT"03 CREATE/READ FILE, CHAN 1/2",;
310 OPEN1,8,1,"FILE"
320 PRINT#1,"HELLO WORLD!"
330 CLOSE1
340 OPEN1,8,2,"FILE"
350 INPUT#1,A$
360 IFA$<>"HELLO WORLD!"THENSTOP
370 IFST<>64THENSTOP
380 CLOSE1
390 DOS"S:FILE"
399 DOS"U0>T":PRINT"OK":RETURN

400 PRINT"04 R/W MULT. LISTEN/TALK SESS",;
410 OPEN1,8,2,"FILE,P,W":PRINT#1,"ONE":PRINT#1,"TWO":CLOSE1
420 OPEN1,8,2,"FILE"
430 INPUT#1,A$:IFA$<>"ONE"THENSTOP
440 INPUT#1,A$:IFA$<>"TWO"THENSTOP
450 IFST<>64THENSTOP
460 CLOSE1
470 DOS"S:FILE"
499 DOS"U0>T":PRINT"OK":RETURN

500 PRINT"05 TWO FILES OPEN FOR WRITING",;
510 OPEN1,8,2,"FILE1,P,W":OPEN2,8,3,"FILE2,P,W"
515 PRINT#1,"ONE":PRINT#2,"TWO":PRINT#1,"THREE":PRINT#2,"FOUR"
520 CLOSE1:CLOSE2
525 OPEN1,8,2,"FILE1"
530 INPUT#1,A$:IFA$<>"ONE"THENSTOP
535 INPUT#1,A$:IFA$<>"THREE"THENSTOP
540 IFST<>64THENSTOP
545 CLOSE1
550 OPEN1,8,2,"FILE2"
555 INPUT#1,A$:IFA$<>"TWO"THENSTOP
560 INPUT#1,A$:IFA$<>"FOUR"THENSTOP
565 IFST<>64THENSTOP
570 CLOSE1
580 DOS"S:FILE1,FILE2"
599 DOS"U0>T":PRINT"OK":RETURN

600 PRINT"06 TWO FILES OPEN FOR READING",;
610 OPEN1,8,2,"FILE1,P,W":PRINT#1,"ONE":PRINT#1,"THREE":CLOSE1
615 OPEN1,8,2,"FILE2,P,W":PRINT#1,"TWO":PRINT#1,"FOUR":CLOSE1
625 OPEN1,8,2,"FILE1":OPEN2,8,3,"FILE2"
630 INPUT#1,A$:IFA$<>"ONE"THENSTOP
635 INPUT#2,A$:IFA$<>"TWO"THENSTOP
640 INPUT#1,A$:IFA$<>"THREE"THENSTOP
645 INPUT#2,A$:IFA$<>"FOUR"THENSTOP
650 IFST<>64THENSTOP
655 IFST<>64THENSTOP
660 CLOSE1:CLOSE2
665 DOS"S:FILE1,FILE2"
699 DOS"U0>T":PRINT"OK":RETURN

700 PRINT"07 C: COPY FILE",,;
710 OPEN1,8,2,"FILE1,P,W":PRINT#1,"HELLO WORLD!":CLOSE1
720 DOS"C:FILE2=FILE1
730 OPEN1,8,2,"FILE2"
740 INPUT#1,A$:IFA$<>"HELLO WORLD!"THENSTOP
750 IFST<>64THENSTOP
760 CLOSE1
770 DOS"S:FILE1,FILE2"
799 DOS"U0>T":PRINT"OK":RETURN

800 PRINT"08 C: CONCATENATE FILES",;
805 OPEN1,8,2,"FILE1,P,W":PRINT#1,"ONE":PRINT#1,"TWO":CLOSE1
810 OPEN1,8,2,"FILE2,P,W":PRINT#1,"THREE":PRINT#1,"FOUR":CLOSE1
815 OPEN1,8,2,"FILE3,P,W":PRINT#1,"FIVE":PRINT#1,"SIX":CLOSE1
820 DOS"C:FILE4=FILE1,FILE2,FILE3
825 OPEN1,8,2,"FILE4"
830 INPUT#1,A$:IFA$<>"ONE"THENSTOP
835 INPUT#1,A$:IFA$<>"TWO"THENSTOP
840 INPUT#1,A$:IFA$<>"THREE"THENSTOP
845 INPUT#1,A$:IFA$<>"FOUR"THENSTOP
850 INPUT#1,A$:IFA$<>"FIVE"THENSTOP
855 INPUT#1,A$:IFA$<>"SIX"THENSTOP
860 IFST<>64THENSTOP
865 CLOSE1
870 DOS"S:FILE1,FILE2,FILE3,FILE4"
899 DOS"U0>T":PRINT"OK":RETURN

900 PRINT"09 LOAD NON-EXISTENT FILE",;
910 OPEN1,8,2,"NONEXIST"
920 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>62THENSTOP
930 CLOSE1
999 DOS"U0>T":PRINT"OK":RETURN

1000 PRINT"10 RENAME FILE",,;
1005 OPEN1,8,2,"FILE1,P,W":PRINT#1,"HELLO":CLOSE1
1010 DOS"R:FILE2=FILE1"
1015 OPEN1,8,2,"FILE2"
1020 INPUT#1,A$:IFA$<>"HELLO"THENSTOP
1025 IFST<>64THENSTOP
1030 CLOSE1
1035 OPEN1,8,2,"FILE1"
1040 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>62THENSTOP
1045 CLOSE1
1050 DOS"S:FILE2"
1099 DOS"U0>T":PRINT"OK":RETURN

1100 PRINT"11 RENAME TO FILE THAT EXISTS",;
1105 OPEN1,8,2,"FILE1,P,W":PRINT#1,"HELLO":CLOSE1
1110 OPEN1,8,2,"FILE2,P,W":PRINT#1,"HELLO":CLOSE1
1120 DOS"R:FILE2=FILE1"
1130 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>63THENSTOP
1140 DOS"S:FILE1,FILE2"
1199 DOS"U0>T":PRINT"OK":RETURN

1200 PRINT"12 COPY TO FILE THAT EXISTS",;
1205 OPEN1,8,2,"FILE1,P,W":PRINT#1,"HELLO":CLOSE1
1210 OPEN1,8,2,"FILE2,P,W":PRINT#1,"HELLO":CLOSE1
1220 DOS"C:FILE2=FILE1"
1230 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>63THENSTOP
1240 DOS"S:FILE1,FILE2"
1299 DOS"U0>T":PRINT"OK":RETURN

1300 PRINT"13 UI",,,;
1310 DOS"UI"
1320 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>73THENSTOP
1399 DOS"U0>T":PRINT"OK":RETURN

1400 PRINT"14 SCRATCH NON-EXISTENT FILE",;
1410 DOS"S:NONEXIST"
1420 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>1THENSTOP
1425 IFX<>0THENSTOP
1499 DOS"U0>T":PRINT"OK":RETURN

1500 PRINT"15 SCRATCH TWO FILES",;
1505 OPEN1,8,2,"FILE1,P,W":PRINT#1,"HELLO":CLOSE1
1510 OPEN1,8,2,"FILE2,P,W":PRINT#1,"HELLO":CLOSE1
1515 DOS"S:FILE1,FILE2"
1520 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>1THENSTOP
1525 IFX<>2THENSTOP
1599 DOS"U0>T":PRINT"OK":RETURN

1600 PRINT"16 LOCK FILE (L)",,;
1601 IFNOTFAND1THENPRINT"SKIPPED":RETURN
1605 OPEN1,8,2,"FILE,P,W":PRINT#1,"HELLO":CLOSE1
1610 OPEN15,8,15,"L:FILE":CLOSE15
1615 DOS"S:FILE"
1620 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>1THENSTOP
1625 IFX<>0THENSTOP
1630 OPEN15,8,15,"L:FILE":CLOSE15
1635 DOS"S:FILE"
1640 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>1THENSTOP
1645 IFX<>1THENSTOP
1699 DOS"U0>T":PRINT"OK":RETURN

1700 PRINT"17 LOCK FILE (F-L/F-U)",;
1701 IFNOTFAND4THENPRINT"SKIPPED":RETURN
1705 OPEN1,8,2,"FILE,P,W":PRINT#1,"HELLO":CLOSE1
1710 OPEN15,8,15,"F-L:FILE":CLOSE15
1715 DOS"S:FILE"
1720 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>1THENSTOP
1725 IFX<>0THENSTOP
1730 OPEN15,8,15,"F-U:FILE":CLOSE15
1735 DOS"S:FILE"
1740 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>1THENSTOP
1745 IFX<>1THENSTOP
1799 DOS"U0>T":PRINT"OK":RETURN

1800 PRINT"18 CREATE FILE, ILL. DIR",;
1801 IFNOTFAND2THENPRINT"SKIPPED":RETURN
1802 IFFAND8THENPRINT"KNOWN BAD":RETURN:REM TODO: SHOULD RETURN STATUS 39
1810 OPEN1,8,2,"//DIR/:FILE,P,W":
1820 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>39THENSTOP
1830 CLOSE1
1899 DOS"U0>T":PRINT"OK":RETURN

1900 PRINT"19 MAKE/REMOVE DIRECTORY",;
1901 IFNOTFAND2THENPRINT"SKIPPED":RETURN
1905 DOS"MD:DIR"
1915 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>0THENSTOP
1920 DOS"RD:DIR
1925 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>1THENSTOP
1930 IFX<>1THENSTOP
1999 DOS"U0>T":PRINT"OK":RETURN

2000 PRINT"20 CREATE/READ FILE IN SUBDIR",;
2001 IFNOTFAND2THENPRINT"SKIPPED":RETURN
2002 IFNOTFAND8THENPRINT"SKIPPED":RETURN:REM TODO: PROBLEM ON CMD
2005 DOS"MD:DIR"
2020 OPEN1,8,2,"//DIR/:FILE,P,W"
2025 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>0THENSTOP
2030 PRINT#1,"HELLO":CLOSE1
2035 OPEN1,8,2,"//DIR/:FILE"
2037 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>0THENSTOP
2040 INPUT#1,A$:IFA$<>"HELLO"THENSTOP
2045 IFST<>64THENSTOP
2050 CLOSE1
2060 DOS"S//DIR/:FILE"
2065 DOS"RD:DIR
2099 DOS"U0>T":PRINT"OK":RETURN

2100 PRINT"21 CHANGE DIR, READ FILE",;
2101 IFNOTFAND2THENPRINT"SKIPPED":RETURN
2105 DOS"MD:DIR"
2110 OPEN1,8,2,"FILE1,P,W":PRINT#1,"ONE":CLOSE1
2115 OPEN1,8,2,"//DIR/:FILE2,P,W":PRINT#1,"TWO":CLOSE1
2120 DOS"CD:DIR"
2135 OPEN1,8,2,"FILE2"
2140 INPUT#1,A$:IFA$<>"TWO"THENSTOP
2145 CLOSE1
2150 OPEN1,8,2,"//:FILE1"
2155 INPUT#1,A$:IFA$<>"ONE"THENSTOP
2160 CLOSE1
2165 DOS"CD:_"
2170 DOS"S//DIR/:FILE2,FILE1"
2175 DOS"RD:DIR
2199 DOS"U0>T":PRINT"OK":RETURN

2200 PRINT"22 MEMORY WRITE/READ",;
2201 IFNOTFAND8THENPRINT"SKIPPED":RETURN:REM DISABLED ON NON-CMDR-DOS
2205 B=$0200
2210 OPEN15,8,15,"M-W"+CHR$(BAND255)+CHR$(INT(B/256))+CHR$(5)+"HELLO":CLOSE15
2215 OPEN15,8,15,"M-R"+CHR$((B+1)AND255)+CHR$(INT((B+1)/256))+CHR$(4):CLOSE15
2220 A$="":OPEN1,8,15
2225 FORI=1TO4:GET#1,C$:A$=A$+C$:NEXT:IFA$<>"ELLO"THENSTOP
2230 GET#1,A$:IFA$<>CHR$(13)THENSTOP
2235 IFST<>64THENSTOP
2240 CLOSE1
2245 DOS"UI"
2299 DOS"U0>T":PRINT"OK":RETURN

2300 PRINT"23 CHANGE TO NON-EXISTENT DIR",;
2301 IFNOTFAND2THENPRINT"SKIPPED":RETURN
2302 IFFAND8THENPRINT"KNOWN BAD":RETURN:REM TODO: SHOULD RETURN STATUS 39
2310 DOS"CD:NONEXIST
2320 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>39THENSTOP
2399 DOS"U0>T":PRINT"OK":RETURN

2400 PRINT"24 CHANGE PARTITION",,;
2401 IFNOTFAND2THENPRINT"SKIPPED":RETURN
2410 DOS"CP1
2420 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>2THENSTOP
2430 IFX<>1THENSTOP
2499 DOS"U0>T":PRINT"OK":RETURN

2500 PRINT"25 CHANGE TO NON-EXIST. PART",;
2501 IFNOTFAND2THENPRINT"SKIPPED":RETURN
2510 DOS"CP200
2520 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>77THENSTOP
2530 IFX<>200THENSTOP
2599 DOS"U0>T":PRINT"OK":RETURN

2600 PRINT"26 MEMORY EXECUTE",,;
2601 IFNOTFAND8THENPRINT"SKIPPED":RETURN:REM DISABLED ON NON-CMDS-DOS
2605 B=$0200:BL=BAND255:BH=INT(B/256)
2610 A$="M-W"+CHR$(BL)+CHR$(BH)+CHR$(11)+CHR$(169)+CHR$(77)+CHR$(141)
2615 A$=A$+CHR$(BL)+CHR$(BH)+CHR$(169)+CHR$(83)+CHR$(141)+CHR$(BL+1)
2620 A$=A$+CHR$(BH)+CHR$(96)
2625 OPEN15,8,15,A$:CLOSE15
2630 OPEN15,8,15,"M-E"+CHR$(BL)+CHR$(BH):CLOSE15
2635 OPEN15,8,15,"M-R"+CHR$(BL)+CHR$(BH)+CHR$(2):CLOSE15
2640 OPEN1,8,15
2645 GET#1,A$:IFA$<>CHR$($4D)THENSTOP
2650 GET#1,A$:IFA$<>CHR$($53)THENSTOP
2655 GET#1,A$:IFA$<>CHR$(13)THENSTOP
2660 IFST<>64THENSTOP
2670 CLOSE1
2699 DOS"U0>T":PRINT"OK":RETURN

2700 PRINT"27 INITIALIZE",,;
2710 DOS"I
2720 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>0THENSTOP
2799 DOS"U0>T":PRINT"OK":RETURN

2800 PRINT"28 INITIALIZE NON-EXIST. PART",;
2801 IFNOTFAND2THENPRINT"SKIPPED":RETURN
2810 DOS"I200
2820 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>74THENSTOP
2899 DOS"U0>T":PRINT"OK":RETURN

2900 PRINT"29 RENAME, WILDCARD SOURCE",;
2901 IFNOTFAND8THENPRINT"SKIPPED":RETURN:REM ONLY SUPPORTED ON CMDR-DOS
2905 OPEN1,8,2,"FILE1,P,W":PRINT#1,"HELLO":CLOSE1
2910 OPEN1,8,2,"FILE2,P,W":PRINT#1,"HELLO":CLOSE1
2920 DOS"R:FILE2=?ILE1"
2930 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>63THENSTOP
2940 DOS"S:FILE1,FILE2"
2999 DOS"U0>T":PRINT"OK":RETURN

3000 PRINT"30 READ PAST EOF",,;
3005 OPEN1,8,1,"FILE":PRINT#1,"HI!":CLOSE1
3010 OPEN1,8,0,"FILE"
3015 GET#1,A$:IFA$<>"H"THENSTOP
3020 IFSTTHENSTOP
3025 GET#1,A$:IFA$<>"I"THENSTOP
3030 IFSTTHENSTOP
3035 GET#1,A$:IFA$<>"!"THENSTOP
3040 IFSTTHENSTOP
3045 GET#1,A$:IFA$<>CHR$(13)THENSTOP
3050 IFST<>64THENSTOP
3055 GET#1,A$:IFA$<>CHR$(199)THENSTOP
3060 IFST<>66THENSTOP
3065 CLOSE1
3070 DOS"S:FILE"
3099 DOS"U0>T":PRINT"OK":RETURN

3100 PRINT"31 READ FROM FNF CHANNEL",;
3110 OPEN1,8,0,"NONEXIST"
3120 IFST<>0THENSTOP
3130 GET#1,A$:IFA$<>CHR$(199)THENSTOP
3140 IFST<>66THENSTOP
3150 GET#1,A$:IFA$<>CHR$(199)THENSTOP
3160 IFST<>66THENSTOP
3170 CLOSE1
3199 DOS"U0>T":PRINT"OK":RETURN

3200 PRINT"32 READ FROM CHANNEL W/O FN",;
3210 OPEN1,8,02
3220 IFST<>0THENSTOP
3230 GET#1,A$:IFA$<>CHR$(199)THENSTOP
3240 IFST<>66THENSTOP
3250 GET#1,A$:IFA$<>CHR$(199)THENSTOP
3260 IFST<>66THENSTOP
3270 CLOSE1
3299 DOS"U0>T":PRINT"OK":RETURN

3300 PRINT"33 STATUS STRING",,;
3305 DOS"I":OPEN15,8,15
3310 FORJ=0TO10
3315 S$="":FORI=1TO12:GET#15,A$:S$=S$+A$
3320 IFSTTHENSTOP
3325 NEXT
3330 IFS$<>"00, OK,00,00"THENSTOP
3335 GET#15,A$:IFA$<>CHR$(13)THENSTOP
3340 IFST<>64THENSTOP
3345 NEXT
3350 CLOSE15
3399 DOS"U0>T":PRINT"OK":RETURN

3400 PRINT"34 WRITE TO FNF CHANNEL",;
3410 OPEN1,8,1,"*"
3420 IFSTTHENSTOP
3430 PRINT#1,"A";
3440 IFST<>-128THENSTOP
3450 PRINT#1,"A";
3460 IFST<>-128THENSTOP
3470 CLOSE1
3499 DOS"U0>T":PRINT"OK":RETURN

3500 PRINT"35 WRITE TO CHANNEL W/O FN",;
3510 OPEN1,8,1
3520 IFSTTHENSTOP
3530 PRINT#1,"A";
3540 IFST<>-128THENSTOP
3550 PRINT#1,"A";
3560 IFST<>-128THENSTOP
3570 CLOSE1
3599 DOS"U0>T":PRINT"OK":RETURN

3600 PRINT"36 GET DISKCHANGE",,;
3601 IFNOTFAND2THENPRINT"SKIPPED":RETURN
3610 DOS"G-D"
3620 OPEN15,8,15
3630 GET#15,A$:IFA$<>""ANDA$<>CHR$(1)THENSTOP
3640 IFSTTHENSTOP
3650 IFF=3GOTO3699 : REM CMD FD/HD IS BUGGY
3660 GET#15,A$:IFA$<>CHR$(13)THENSTOP
3670 IFST<>64THENSTOP
3680 CLOSE15
3699 DOS"U0>T":PRINT"OK":RETURN

3700 PRINT"37 GET PARTITION INFO",;
3701 IFNOTFAND8THENPRINT"SKIPPED":RETURN:REM BUGGY ON CMD
3710 OPEN15,8,15,"G-P"+CHR$(1):CLOSE15
3720 OPEN15,8,15
3730 FORI=0TO29:GET#15,A$:IFSTTHENSTOP
3740 NEXT
3750 GET#15,A$:IFA$<>CHR$(13)THENSTOP
3760 IFST<>64THENSTOP
3770 CLOSE15
3799 DOS"U0>T":PRINT"OK":RETURN

3800 PRINT"38 RE-SEND NAME TO CHANNEL",;
3805 OPEN1,8,2,"FILE1,P,W":PRINT#1,"ONE":CLOSE1
3810 OPEN1,8,2,"FILE2,P,W":PRINT#1,"TWO":CLOSE1
3815 OPEN1,8,2,"FILE1"
3825 OPEN2,8,2,"FILE2"
3840 INPUT#1,A$:IFA$<>"TWO"THENSTOP
3845 OPEN3,8,2,"FILE1"
3855 INPUT#1,A$:IFA$<>"ONE"THENSTOP
3860 CLOSE1:CLOSE2:CLOSE3
3865 DOS"S:FILE1,FILE2
3899 DOS"U0>T":PRINT"OK":RETURN

3900 PRINT"39 SCRATCH WITH WILDCARDS",;
3901 IFNOTFAND2THENPRINT"SKIPPED":RETURN
3905 OPEN1,8,2,"NOMATCH1,P,W":PRINT#1,"HELLO":CLOSE1
3910 DOS"C:FILE1=NOMATCH1
3915 DOS"MD:FILE2
3920 DOS"C:FILE3=NOMATCH1
3925 DOS"L:FILE3
3930 DOS"C:NOMATCH2=NOMATCH1
3935 DOS"C:FILE4=NOMATCH1
3940 DOS"S:FILE?
3945 OPEN1,8,2,"FILE1":CLOSE1
3950 CLOSE15:OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>62THENSTOP
3955 DOS"RD:FILE2
3960 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>1ANDX<>1THENSTOP
3965 OPEN1,8,2,"FILE3":CLOSE1
3970 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFSTHENSTOP
3972 OPEN1,8,2,"FILE4":CLOSE1
3974 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>62THENSTOP
3976 OPEN1,8,2,"NOMATCH1":CLOSE1
3978 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFSTHENSTOP
3980 OPEN1,8,2,"NOMATCH2":CLOSE1
3982 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFSTHENSTOP
3984 DOS"L:FILE3
3986 DOS"S:NOMATCH?,FILE3
3999 DOS"U0>T":PRINT"OK":RETURN

4000 PRINT"40 OVERFLOW BUFFERS",,;
4005 OPEN1,8,2,"FILE1,P,W":PRINT#1,"ONE":CLOSE1:DOS"MD:DIR1
4010 OPEN15,8,15:FORI=0TO8
4015 OPENI+1,8,I+2,MID$(STR$(I),2)+",P,W"
4020 INPUT#15,S,S$,X,Y:IFS=0THENNEXT
4022 IFS=0GOTO4060 : REM COULDN'T OVERFLOW BUFFERS!
4025 IFFAND2THEN:DOS"L:FILE1":INPUT#15,S,S$,X,Y:IFS<>1ANDS<>70THENSTOP
4030 IFFAND4THEN:DOS"F-L:FILE1":INPUT#15,S,S$,X,Y:IFS<>1ANDS<>70THENSTOP
4035 IFFAND4THEN:DOS"F-U:FILE1":INPUT#15,S,S$,X,Y:IFS<>1ANDS<>70THENSTOP
4040 DOS"R:FILE2=FILE1":INPUT#15,S,S$,X,Y:IFS<>0ANDS<>70THENSTOP
4045 DOS"S:FILE1,FILE2":INPUT#15,S,S$,X,Y:IFS<>1ANDS<>70THENSTOP
4050 IFFAND2THEN:DOS"MD:DIR2":INPUT#15,S,S$,X,Y:IFS<>1ANDS<>70THENSTOP
4055 IFFAND2THEN:DOS"RD:DIR1":INPUT#15,S,S$,X,Y:IFS<>1ANDS<>70THENSTOP
4060 FORI=0TO11:CLOSEI+1:NEXT:CLOSE15
4070 DOS"S:FILE1":DOS"RD:DIR1"
4080 DOS"S:0,1,2,3,4":DOS"S:5,6,7,8":REM CMD CAN ONLY SCRATCH 5 AT A TIME
4099 DOS"U0>T":PRINT"OK":RETURN

4100 PRINT"41 CREATE EXISTING FILE",;
4110 OPEN1,8,2,"FILE,P,W":PRINT#1,"HELLO WORLD!":CLOSE1
4140 OPEN1,8,2,"FILE,P,W":PRINT#1,"HELLO WORLD!":CLOSE1
4150 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>63THENSTOP
4160 DOS"S:FILE
4199 DOS"U0>T":PRINT"OK":RETURN

4200 PRINT"42 OVERWRITE EXISTING FILE",;
4210 OPEN1,8,2,"FILE,P,W":PRINT#1,"HELLO":CLOSE1
4240 OPEN1,8,2,"@:FILE,P,W":PRINT#1,"WORLD!":CLOSE1
4250 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFSTHENSTOP
4260 OPEN1,8,2,"FILE":INPUT#1,A$:CLOSE1:IFA$<>"WORLD!"THENSTOP
4260 DOS"S:FILE
4299 DOS"U0>T":PRINT"OK":RETURN

4300 PRINT"43 CREATE/READ ON TWO PART",;
4301 IFNOTP2THENPRINT"SKIPPED":RETURN
4310 OPEN1,8,2,"1:FILE1,P,W":PRINT#1,"ONE":CLOSE1
4320 OPEN1,8,2,"2:FILE2,P,W":PRINT#1,"TWO":CLOSE1
4330 OPEN1,8,2,"1:FILE1,P,R":INPUT#1,A$:CLOSE1:IFA$<>"ONE"THENSTOP
4340 IFST<>64THENSTOP
4350 OPEN1,8,2,"2:FILE2,P,R":INPUT#1,A$:CLOSE1:IFA$<>"TWO"THENSTOP
4360 IFST<>64THENSTOP
4370 DOS"S1:FILE1":OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFX<>1THENSTOP
4380 DOS"S2:FILE2":OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFX<>1THENSTOP
4399 DOS"U0>T":PRINT"OK":RETURN

4400 PRINT"44 COPY BETWEEN PARTITIONS",;
4401 IFNOTP2THENPRINT"SKIPPED":RETURN
4410 OPEN1,8,2,"1:FILE1,P,W":PRINT#1,"HELLO WORLD!":CLOSE1
4420 DOS"C2:FILE2=1:FILE1
4430 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFSTHENSTOP
4440 OPEN1,8,2,"2:FILE2,P,R":INPUT#1,A$:CLOSE1:IFA$<>"HELLO WORLD!"THENSTOP
4450 DOS"S1:FILE1":OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFX<>1THENSTOP
4460 DOS"S2:FILE2":OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFX<>1THENSTOP
4499 DOS"U0>T":PRINT"OK":RETURN

4500 PRINT"45 C: COPY NON-EXISTENT FILE",;
4502 IFFAND8THENPRINT"KNOWN BAD":RETURN:REM SHOULD NOT CREATE FILE
4510 DOS"C:FILE=NONEXIST
4520 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>62THENSTOP
4530 OPEN1,8,2,"FILE":CLOSE1
4540 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>62THENSTOP
4599 DOS"U0>T":PRINT"OK":RETURN

4600 PRINT"46 SOFTWARE WRITE PROTECT",;
4601 IFNOTP2THENPRINT"SKIPPED":RETURN
4610 DOS"W-1
4620 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFSTHENSTOP
4630 OPEN1,8,2,"1:FILE,P,W":CLOSE1
4640 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>26THENSTOP
4650 DOS"W-0
4660 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFSTHENSTOP
4699 DOS"U0>T":PRINT"OK":RETURN

4700 PRINT"47 COMMAND CHANNEL ECHO",;
4701 IFNOTFAND8THENPRINT"SKIPPED":RETURN
4710 DOSCHR$(255)+"HELLO"+CHR$(0)
4720 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>79ORS$<>"HELLO"THENSTOP
4730 DOSCHR$(66)+CHR$(45)+CHR$(63)+TI$
4740 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>79ORLEN(S$)<>25THENSTOP
4750 DOSCHR$(66)+CHR$(45)+CHR$(42)+TI$
4760 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>79ORLEN(S$)<>28THENSTOP
4799 DOS"U0>T":PRINT"OK":RETURN

4800 PRINT"48 SET POSITION (1)",,;
4801 IFNOTFAND8THENPRINT"SKIPPED":RETURN
4804 OPEN2,8,2,"SEEKFILE,P,R":CLOSE2
4805 REM REQUIRES 50 MB FILE CONTAINING 32 BIT BIG ENDIAN: 0,4,8,12,...
4806 OPEN15,8,15:INPUT#15,S,S$,X,Y:CLOSE15:IFS<>0THENPRINT"SKIPPED":RETURN
4808 OPEN2,8,2,"SEEKFILE,P,R"
4809 REM LOW OFFSET
4810 O(3)=$00:O(2)=$01:O(1)=$23:O(0)=$44:T=1:GOSUB4850
4811 REM HIGH OFFSET
4812 O(3)=$00:O(2)=$3A:O(1)=$0E:O(0)=$B0:T=1:GOSUB4850
4820 REM BACK TO FIRST SECTOR
4824 O(3)=$00:O(2)=$00:O(1)=$01:O(0)=$58:T=1:GOSUB4850
4825 REM READ LAST 4 BYTES OF FILE
4826 O(3)=$00:O(2)=$4F:O(1)=$FF:O(0)=$FC:T=1:GOSUB4850:IFST<>64THENSTOP
4827 REM READ UNTIL EOI MAKES IT IMPOSSIBLE TO READ AGAIN, SO RE-OPEN
4828 CLOSE2:OPEN2,8,2,"SEEKFILE,P,R"
2829 REM WAY PAST EOF
4830 O(3)=$FF:O(2)=$00:O(1)=$00:O(0)=$00:T=0:GOSUB4850:IFST<>66THENSTOP
4832 CLOSE2
4849 DOS"U0>T":PRINT"OK":RETURN
4850 O$=CHR$(O(0))+CHR$(O(1))+CHR$(O(2))+CHR$(O(3))
4852 OPEN15,8,15,"P"+CHR$(2)+O$:CLOSE15
4854 FORI=0TO3:GET#2,A$:A=ASC(A$+CHR$(0)):IFA<>O(3-I)ANDTTHENSTOP
4856 NEXT:RETURN

4900 PRINT"49 SET POSITION (2)",,;
4901 IFNOTFAND8THENPRINT"SKIPPED":RETURN
4904 OPEN1,8,2,"FILE,P,W":FORI=0TO255
4908 PRINT#1,LEFT$(MID$(STR$(I),2)+" THIS IS A TEST STRING!         ",31)
4909 NEXT:CLOSE1
4910 OPEN1,8,2,"FILE,P,A"
4912 FORI=0TO127
4913 PRINT#1,LEFT$(MID$(STR$(I),2)+" APPENDED TEXT AT THE END       ",31)
4914 NEXT:CLOSE1
4915 OPEN1,8,2,"FILE,P,A"
4916 OPEN15,8,15,"P"+CHR$(2)+CHR$($00)+CHR$($10)+CHR$(0)+CHR$(0):CLOSE15
4918 PRINT#1,"OVERWRITTEN USING SET-POSITION!"
4920 CLOSE1
4922 OPEN1,8,2,"FILE,P,A"
4924 OPEN15,8,15,"P"+CHR$(2)+CHR$($F0)+CHR$($2F)+CHR$(0)+CHR$(0):CLOSE15
4926 PRINT#1,"OVERWRITING ACROSS EOF!12345678"
4928 CLOSE1
4945 OPEN1,8,2,"FILE,P,R":FORI=0TO127:INPUT#1,A$
4950 IFA$<>LEFT$(MID$(STR$(I),2)+" THIS IS A TEST STRING!         ",31)THENSTOP
4955 NEXT
4960 INPUT#1,A$:IFA$<>"OVERWRITTEN USING SET-POSITION!"THENSTOP
4965 FORI=129TO255:INPUT#1,A$
4970 IFA$<>LEFT$(MID$(STR$(I),2)+" THIS IS A TEST STRING!         ",31)THENSTOP
4975 NEXT
4980 FORI=0TO126:INPUT#1,A$
4982 IFA$<>LEFT$(MID$(STR$(I),2)+" APPENDED TEXT AT THE END       ",31)THENSTOP
4984 NEXT:INPUT#1,A$
4986 IFA$<>"127 APPENDED TEXOVERWRITING ACROSS EOF!12345678"THENSTOP
4988 CLOSE1
4990 DOS"S:FILE
4999 DOS"U0>T":PRINT"OK":RETURN

5000 PRINT"50 MODIFY FILE ',P,M'",;
5001 IFNOTFAND8THENPRINT"SKIPPED":RETURN
5005 OPEN1,8,2,"FILE,P,M":FORI=0TO255
5010 PRINT#1,LEFT$(MID$(STR$(I),2)+" THIS IS A TEST STRING!         ",31)
5015 NEXT
5020 O(0)=115:O(1)=188:O(2)=28:O(3)=116:O(4)=138:O(5)=57:O(6)=90:O(7)=202
5025 O(8)=197:O(9)=22
5030 FORI=0TO9:O=O(I):A=O*32:H=INT(A/256):L=A-(H*256)
5035 OPEN15,8,15,"P"+CHR$(2)+CHR$(L)+CHR$(H)+CHR$(0)+CHR$(0):CLOSE15
5040 PRINT#1,LEFT$(MID$(STR$(O),2)+" THIS IS OVERWRITTEN!           ",31)
5045 NEXT
5050 FORI=0TO9:O=O(I):A=O*32:H=INT(A/256):L=A-(H*256)
5055 OPEN15,8,15,"P"+CHR$(2)+CHR$(L)+CHR$(H)+CHR$(0)+CHR$(0):CLOSE15
5060 INPUT#1,A$
5065 IFA$<>LEFT$(MID$(STR$(O),2)+" THIS IS OVERWRITTEN!           ",31)THENSTOP
5070 NEXT
5072 OPEN15,8,15,"P"+CHR$(2)+CHR$(0)+CHR$(0)+CHR$(0)+CHR$(0):CLOSE15
5074 FORI=0TO255:INPUT#1,A$
5076 IFA$=LEFT$(MID$(STR$(I),2)+" THIS IS A TEST STRING!         ",31)GOTO5080
5078 IFA$<>LEFT$(MID$(STR$(I),2)+" THIS IS OVERWRITTEN!           ",31)THENSTOP
5080 NEXT:CLOSE1
5090 DOS"S:FILE
5099 DOS"U0>T":PRINT"OK":RETURN

RUN
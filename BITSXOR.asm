BITSXOR AMODE 31 
BITSXOR RMODE ANY 
BITSXOR CSECT 
____ SAVE (14,12) 
____ USING BITSXOR,15 
____ LM _ 2,3,0(1) __ R2 -> TARGET, R3 -> MASK 
____ SR _ 4,4 _______ R4 = 0 (DEFAULT LENGTH OF 1 FOR EXECUTE) 
____ LTR 3,3 _______ MASK = LAST PARM? 
____ BM _ GO _________ YES: GO 
____ L __ 4,8(,1) _____ NO: R4 -> LENGTH 
____ LH _ 4,0(,4) ___ R4 = LENGTH 
____ BCTR 4,0 _______ MINUS 1 FOR EXEC 
GO _ EX _ 4,XC ______ EXECUTE "XC" INSTRUCTION 
____ RETURN (14,12),RC=0 RETURN 
XC _ XC _ 0(0,2),0(3) XC INSTRUCTION FOR EXECUTE 
____ END

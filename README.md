# BITSXOR
 **Flip Bits in Memory**
 
 As Mainframe Experts know, Enterprise COBOL and its predecessors have long lacked the capability for true Boolean operations
 at the bit level: AND, OR, eXclusive OR.
 
 http://publibz.boulder.ibm.com/cgi-bin/bookmgr_OS390/BOOKS/ceea31c0/2.3 - Language Environment offers the rather clumsy
 CEESISET (Bit set) and CEESICLR (Bit clear) functions, but these only work on one bit at a time.

This repository will be specific callable Assembler subroutines which give COBOL this ability.

## COBOL Usage Examples: 
Examples (1) and (2) are "Type 1" usage, with 3 parameters: 
* variable length "target" field; 
* variable length bitmask; 
* field length (applies to both target and bitmask) 

Example (3) is "Type 2" usage, with default length = 1 and 2 parameters: 
* one byte "target" field; 
* one byte bitmask

### Example 1: Change Upper Case Characters to Lower Case: 
After first call, characters in CHG-CASE-DEMO are changed to lower case. <br>
After second call, characters in CHG-CASE-DEMO are changed back to upper case.

```
WORKING-STORAGE_SECTION. 
01. 05 LEN _________ PIC 9(4) COMP. 
___ 05 CHG-CASE-DEMO PIC X(04) VALUE 'CASE'. 
___ 05 BLANKS ______ PIC X(04) VALUE SPACES. 
PROCEDURE_DIVISION. 
___ MOVE 4 TO LEN 
___ CALL 'BITSXOR' USING CHG-CASE-DEMO, BLANKS, LEN 
___ CALL 'BITSXOR' USING CHG-CASE-DEMO, BLANKS, LEN
```

### Example 2: Exchange Values Between Two Fields Without Using an Intermediate Work Area. 
The classic "Wow!" usage for Boolean Exclusive Or, once a common "how to" interview question.

```
WORKING-STORAGE_SECTION. 
01. 05 LEN _________ PIC 9(4) COMP. 
___ 05 FLD-XCHG-DEM1 PIC X(03) VALUE 'ABC'. 
___ 05 FLD-XCHG-DEM2 PIC X(03) VALUE 'XYZ'. 
PROCEDURE_DIVISION. 
___ MOVE 3 TO LEN 
___ CALL 'BITSXOR' USING FLD-XCHG-DEM1, FLD-XCHG-DEM2, LEN 
___ CALL 'BITSXOR' USING FLD-XCHG-DEM2, FLD-XCHG-DEM1, LEN 
___ CALL 'BITSXOR' USING FLD-XCHG-DEM1, FLD-XCHG-DEM2, LEN
```

### Example 3: Set "On" Bits to "Off" (i.e. set a bit with value = 1 to value = 0). 
Will also set "Off" Bits "On" (i.e. set a bit with value = 0 to value = 1)

```
WORKING-STORAGE_SECTION. 
01. 05 BIT-FLIP-DEMO PIC X(01) VALUE X'81'. 
___ 05 HEX-80 ______ PIC X(01) VALUE X'80'. 
PROCEDURE_DIVISION. 
___ CALL 'BITSXOR' USING BIT-FLIP-DEMO, HEX-80 
___ CALL 'BITSXOR' USING BIT-FLIP-DEMO, HEX-80 
```

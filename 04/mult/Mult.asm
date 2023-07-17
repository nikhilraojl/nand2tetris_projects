// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.
(SETUP)
    @2 // set initial result value to zero
    M=0
    @temp // set iteration tracker value to zero
    M=0

(OPERAND_CHECK_ZERO)
    @1
    D=M
    @END
    D; JEQ

    @0
    D=M
    @END
    D; JEQ

(ADD)
    @0
    D=M
    @2
    M=D+M

    @temp // keep track of number of iterations
    M=M+1

(MUL_LOOP)
    @ADD // Add RAM[0] with RAM[2]

    @1
    D=M
    @temp
    D=M-D // value to determine to end loop or continue
    @END
    D; JEQ // if D=0, final iteration reached, quit
    @ADD
    0; JMP

(END)
    @END
    0; JMP
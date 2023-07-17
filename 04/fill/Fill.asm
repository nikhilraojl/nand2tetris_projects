// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
(KEY_CHECK)
    @SCREEN
    D=A
    @tmp
    M=D

    @KBD
    D=M
    @KEY_PRESSED
    D; JNE
    @NO_KEY
    D; JEQ

    @KEY_CHECK
    0; JMP

(KEY_PRESSED)
    @0
    M=-1
    @FILL
    0; JMP

(NO_KEY)
    @0
    M=0
    @FILL
    0; JMP

(FILL)
    @0
    D=M
    @tmp
    A=M
    M=D

    @tmp
    D=M
    @KBD
    A=A-1
    D=D-A
    @KEY_CHECK
    D; JEQ

    @tmp
    M=M+1
    @FILL
    0; JMP

Hanoi
=====

Hanoi Tower Instruction Program written in Assembler using Recursion.

When you call the procedure it asks you how many disks you have to move. 
The instruction given will tell you how to move N disks from Peg 1 to Peg 2.

The Procedure works in this way:

  - move N-1 disks from peg source to peg extra
  - move  disk N   from peg source to peg destination
  - move N-1 disk  from peg extra  to peg destination
  
It uses recursion, and only 4 register plus the Register Address to make it done.




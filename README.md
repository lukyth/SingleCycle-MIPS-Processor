# Single-Cycle MIPS Processor

## Require
  
  * [Icarus Verilog](http://iverilog.icarus.com/)
  * [GTKWave](http://gtkwave.sourceforge.net/)

## Installation
  
  Clone the SingleCycle-MIPS-Processor repo:

    $ git clone https://github.com/Lukyth/SingleCycle-MIPS-Processor.git
    $ cd SingleCycle-MIPS-Processor

  Install requirement:

    $ brew install icarus-verilog
    $ brew install gtkwave

## Quick Start
  
    $ iverilog -o processor testbench.v
    $ vvp processor -lxt2
    $ gtkwave testbench.vcd
    
## Contributors

  https://github.com/Lukyth/SingleCycle-MIPS-Processor/graphs/contributors

# Single-Cycle MIPS Processor
  Single-Cycle MIPS CPU using verilog.  
  Computer Architecture's Final project. 2nd year, Computer Engineering.

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
    
## Team

  ![Kanitkorn Sujautra avatar](https://avatars0.githubusercontent.com/u/7040242?v=3&s=60) | ![vuun avatar](https://avatars3.githubusercontent.com/u/8774760?v=3&s=60)
---|---
[Kanitkorn Sujautra](https://github.com/lukyth) | [vuun](https://github.com/vuun)


module controller(opcode,ALU_control,RegDst,MemRead,MemtoReg,ALUOp,MemWrite,ALUSrc,RegWrite);
    input   [5:0]   opcode, ALU_control;
    output          RegDst, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
    output  [5:0]   ALUOp;
    reg             RegDst, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
    reg     [5:0]   ALUOp;

    localparam R_DEFAULT  = 6'b000000;
    localparam LW        = 6'b100011;
    localparam SW        = 6'b101011;
    localparam ADDI      = 6'b001000;
    localparam ANDI      = 6'b001100;
    localparam ORI       = 6'b001101;
    localparam XORI      = 6'b001110;
    localparam SLTI      = 6'b001010;
    localparam SLTIU     = 6'b001001;
    //func
    localparam ADD       = 6'b100000;
    localparam SUB       = 6'b100010;
    localparam AND       = 6'b100100;
    localparam OR        = 6'b100101;
    localparam XOR       = 6'b100110;
    localparam SLT       = 6'b101010;
    localparam SLTU      = 6'b101001;

    always @(*) begin
        case (opcode)
            R_DEFAULT: begin
                RegDst      = 1'b1;
                ALUSrc      = 1'b0;
                MemtoReg    = 1'b0;
                RegWrite    = 1'b1;
                MemRead     = 1'b0;
                MemWrite    = 1'b0;
                ALUOp       = ALU_control;
            end
            LW: begin
                RegDst      = 1'b0;
                ALUSrc      = 1'b1;
                MemtoReg    = 1'b1;
                RegWrite    = 1'b1;
                MemRead     = 1'b1;
                MemWrite    = 1'b0;
                ALUOp       = ADD;
            end
            SW: begin
                RegDst      = 1'bx;
                ALUSrc      = 1'b1;
                MemtoReg    = 1'bx;
                RegWrite    = 1'b0;
                MemRead     = 1'b0;
                MemWrite    = 1'b1;
                ALUOp       = ADD;
            end
            // Immediate function
            default: begin
                RegDst      = 1'b0;
                ALUSrc      = 1'b1;
                MemtoReg    = 1'b0;
                RegWrite    = 1'b1;
                MemRead     = 1'b0;
                MemWrite    = 1'b0;
                case (opcode)
                    ADDI:   ALUOp = ADD;
                    ANDI:   ALUOp = AND;
                    ORI:    ALUOp = OR;
                    XORI:   ALUOp = XOR;
                    SLTI:   ALUOp = SLT;
                    SLTIU:  ALUOp = SLTU;
                endcase
            end
        endcase
    end

endmodule

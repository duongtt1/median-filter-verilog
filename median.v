module expand_16bit (
    a, out
);
    input [7:0]a;
    output reg [15:0]out;

    always @* begin
        out[15]=1'b0;
        out[14]=1'b0;
        out[13]=1'b0;
        out[12]=1'b0;
        out[11]=1'b0;
        out[10]=1'b0;
        out[9]=1'b0;
        out[8]=1'b0;
        out[7:0]=a;
    end
endmodule

module conv16to8 (
    a, out
);
    input [15:0]a;
    output [7:0]out;
    assign out=a[7:0];
endmodule

module sum9(
    s1, s2, s3, s4, s5, s6, s7, s8, s9, out
);
    input [7:0]s1, s2, s3, s4, s5, s6, s7, s8, s9;
    output [7:0]out;

    reg [15:0]sum;
    reg [15:0]d;
    wire [15:0]s116,s216,s316,s416,s516,s616,s716,s816,s916;

    expand_16bit e1(.a(s1), .out(s116));
    expand_16bit e2(.a(s2), .out(s216));
    expand_16bit e3(.a(s3), .out(s316));
    expand_16bit e4(.a(s4), .out(s416));
    expand_16bit e5(.a(s5), .out(s516));
    expand_16bit e6(.a(s6), .out(s616));
    expand_16bit e7(.a(s7), .out(s716));
    expand_16bit e8(.a(s8), .out(s816));
    expand_16bit e9(.a(s9), .out(s916));
    
    always @* begin
        sum = s116 + s216 + s316 + s416 + s516 + s616 + s716 + s816 + s916;
        d =sum/9;
    end

    conv16to8 conv(d, out);
endmodule

module median (
    s1, s2, s3, s4, s5, s6, s7, s8, s9, out
);
    input [7:0]s1, s2, s3, s4, s5, s6, s7, s8, s9;
    output [7:0]out;
    sum9 a1(s1, s2, s3, s4, s5, s6, s7, s8, s9, out);
endmodule
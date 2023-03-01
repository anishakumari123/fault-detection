module faultfree(a,b,c,d,e,f);
input a,b,c,d;
output e,f;
wire w1,w2,w3,w4,w5,w6,w7,w8;
and a1(w1,a,a);
not a2(w2,w1);
or a3(w3,b,b);
not a4(w4,w3);
nand a5(w6,w2,w4);
nor a6(w7,w6,w6);
not a7(w5,c);
xor a8(w8,w7,w5);
xnor a9(f,d,d);
not a10(e,w8);
endmodule

//fault 1
module fault1(a,b,c,d,e_1,f_1);
input a,b,c,d;
output e_1,f_1;
wire w1,w2,w3,w4,w5,w6,w7,w8,k1;
and a1(w1,a,a);
not a2(w2,w1);
or a3(w3,b,b);
not a4(w4,w3);
nand a5(w6,w2,w4);
nor a6(w7,w6,w6);
not a7(w5,c);
xor a8(w8,w7,w5);
xnor a9(f,d,d);
not a10(e,w8);

or f1(k1,w1,1'b1); //sa1
endmodule

//fault 2
module fault2(a,b,c,d,e_2,f_2);
input a,b,c,d;
output e_2,f_2;
wire w1,w2,w3,w4,w5,w6,w7,w8,k2;
and a1(w1,a,a);
not a2(w2,w1);
or a3(w3,b,b);
not a4(w4,w3);
nand a5(w6,w2,w4);
nor a6(w7,w6,w6);
not a7(w5,c);
xor a8(w8,w7,w5);
xnor a9(f,d,d);
not a10(e,w8);

or f1(k2,w3,1'b1); //sa1
endmodule


//fault 3
module fault3(a,b,c,d,e_3,f_3);
input a,b,c,d;
output e_3,f_3;
wire w1,w2,w3,w4,w5,w6,w7,w8,k3;
and a1(w1,a,a);
not a2(w2,w1);
or a3(w3,b,b);
not a4(w4,w3);
nand a5(w6,w2,w4);
nor a6(w7,w6,w6);
not a7(w5,c);
xor a8(w8,w7,w5);
xnor a9(f,d,d);
not a10(e,w8);

or f1(k3,w4,1'b1); //sa1
endmodule


//fault 4
module fault4(a,b,c,d,e_4,f_4);
input a,b,c,d;
output e_4,f_4;
wire w1,w2,w3,w4,w5,w6,w7,w8,k4;
and a1(w1,a,a);
not a2(w2,w1);
or a3(w3,b,b);
not a4(w4,w3);
nand a5(w6,w2,w4);
nor a6(w7,w6,w6);
not a7(w5,c);
xor a8(w8,w7,w5);
xnor a9(f,d,d);
not a10(e,w8);

and f1(k4,w7,1'b0); //sa0
endmodule

//fault 5
module fault5(a,b,c,d,e_5,f_5);
input a,b,c,d;
output e_5,f_5;
wire w1,w2,w3,w4,w5,w6,w7,w8,k5;
and a1(w1,a,a);
not a2(w2,w1);
or a3(w3,b,b);
not a4(w4,w3);
nand a5(w6,w2,w4);
nor a6(w7,w6,w6);
not a7(w5,c);
xor a8(w8,w7,w5);
xnor a9(f,d,d);
not a10(e,w8);

and f1(k5,w5,1'b0); //sa0
endmodule

//fault 6
module fault6(a,b,c,d,e_6,f_6);
input a,b,c,d;
output e_6,f_6;
wire w1,w2,w3,w4,w5,w6,w7,w8,k6;
and a1(w1,a,a);
not a2(w2,w1);
or a3(w3,b,b);
not a4(w4,w3);
nand a5(w6,w2,w4);
nor a6(w7,w6,w6);
not a7(w5,c);
xor a8(w8,w7,w5);
xnor a9(f,d,d);
not a10(e,w8);

and f1(f,k6,1'b0); //sa0
endmodule

//testbench
module tst;
reg a,b,c,d;
wire e,f,e_1,f_1,e_2,f_2,e_3,f_3,e_4,f_4,e_5,f_5,e_6,f_6;
integer i;
faultfree h1(a,b,c,d,e,f);
fault1 h2(a,b,c,d,e_1,f_1);
fault2 h3(a,b,c,d,e_2,f_2);
fault3 h4(a,b,c,d,e_3,f_3);
fault4 h5(a,b,c,d,e_4,f_4);
fault5 h6(a,b,c,d,e_5,f_5);
fault6 h7(a,b,c,d,e_6,f_6);
initial begin
$monitor("abcd=%b%b%b%b \t ef=%b%b",a,b,c,d,e,f);
#100 $stop;
end
for (i=0;i=15;i=i+1)
begin
#2 {a,b,c,d}=i;
if(e!=e_1 || f!=f_1)

$display("sa0 fault is detected");
else
$display("No Fault");
end
endmodule
`timescale 1 ns/10 ps 
module mediantb();
    reg unsigned [7:0]img[160000:1];
    wire unsigned [7:0]out;
    integer i, file_id, j, k;
    reg clk;

initial begin
    begin
        file_id=$fopen("output.txt");
        $readmemb("img.txt", img);
    end
end

initial begin
    i=0;
    j=0;
    k=1;
    clk=1'b0;
end

always begin
    #10
    clk=~clk;
end

always @(posedge clk ) begin
    i=i+1;
    j=j+1;
    #10 $fdisplay(file_id,"%d",out);
end

always @(i, j) begin
    if (j==399) begin
        i=400*k+1;
        j=1;
        k=k+1;
        if (k==399) begin
            $fclose(file_id);
            $stop;
        end
    end
end
median ma(img[i], img[i+1],img[i+2],img[i+400],img[i+401],img[i+402],img[i+800],img[i+801],img[i+802],out);
endmodule
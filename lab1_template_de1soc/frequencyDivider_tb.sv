module frequencyDivider_tb (); 
  
  //inputs to frequencyDivider
  logic clk_in ;
  logic[31:0] divisor; 	

  //output of frequencyDivider
  logic clk_out; 

  frequencyDivider dut(.clk_in(clk_in), .clk_out(clk_out), .divisor(divisor)) ; 


   initial begin 
      //initially set clk to 0
      clk_in = 0 ; #5;
      
      //keep the clock cycling back and forth between 1 and 0
      forever begin 
         clk_in = 1; #5;
         clk_in = 0; #5; 
      end
   end

  initial begin 
       divisor = 2;
       #100;

       $stop;
  end
endmodule 

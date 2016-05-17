module counter_tb (); 
  
  //inputs to frequencyDivider
  logic reset, clk ;
  logic[31:0] out; 	


  counter dut(.clk(clk), .counter(out), .reset(reset)) ; 


   initial begin 
      //initially set clk to 0
      clk = 0 ; #5;
      
      //keep the clock cycling back and forth between 1 and 0
      forever begin 
         clk = 1; #5;
         clk = 0; #5; 
      end
   end

  initial begin 

       #100;

       $stop;
  end
endmodule 

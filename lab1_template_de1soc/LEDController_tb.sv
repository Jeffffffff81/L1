module LEDController_tb();
  logic clock;
  logic[7:0] out;
  
  LEDController dut(clock, out);
  
  initial begin 
      //initially set clk to 0
      clock = 0 ; #1;
      
      //keep the clock cycling back and forth between 1 and 0
      forever begin 
         clock = 1; #1;
         clock = 0; #1; 
      end
   end
   
   initial begin 
     #50;
     $stop;
   end
endmodule
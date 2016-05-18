module frequencyDivider_tb (); 
  
  //inputs to frequencyDivider
  logic clk_in ;
  logic div; 	

  //output of frequencyDivider
  logic clk_out; 

  //call counter to test it  
  frequencyDivider dut(.clk(clk), .reset(reset), .counter(counter)) ; 

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
       reset = 1; 
	#5;
	reset = 0; 
	#50;
	reset = 1; 
	#10
	reset = 0; 
	#100

       $stop;
  end
endmodule 

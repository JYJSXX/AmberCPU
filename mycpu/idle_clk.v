module idle_clk
(
    input aclk,
    input aresetn,
    output clk,
    input block_clock,
    input idle_over
);
    // reg block_clock_reg;
    // always @(posedge aclk)
    //     if(~aresetn) block_clock_reg<=0;
    //     else block_clock_reg <= block_clock;
    // wire clear_ps = block_clock&~block_clock_reg;
    // reg pause;
    // always @(posedge aclk)
    //     if(~aresetn) pause<=0;
    //     else if(clear_ps) pause <= 1;
    //     else if(idle_over) pause <= 0;
    // reg l_pause=0;
    // //always @(aclk,pause)
    // always @(posedge aclk)
    //     if(~aclk) l_pause <= pause;
    
    // assign clk = aclk&~l_pause; //pause=0时，clk=aclk
    assign clk = aclk;
    
endmodule

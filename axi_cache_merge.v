module axi_cache_merge
(
	//ar
	input 	      inst_ren			,
    input  [3 :0] inst_arid         ,
    input  [31:0] inst_araddr       ,
    input  [7 :0] inst_arlen        ,
    input  [2 :0] inst_arsize       ,
    input  [1 :0] inst_arburst      ,
    input  [1 :0] inst_arlock       ,
    input  [3 :0] inst_arcache      ,
    input  [2 :0] inst_arprot       ,
    input         inst_arvalid      ,
    output        inst_arready      ,
    //r           
    output [31:0] inst_rdata        ,
    output        inst_rlast        ,
    output        inst_rready
	
	//ar
    input  	      data_ren			,
	input  [3 :0] data_arid         ,
    input  [31:0] data_araddr       ,
    input  [7 :0] data_arlen        ,
    input  [2 :0] data_arsize       ,
    input  [1 :0] data_arburst      ,
    input  [1 :0] data_arlock       ,
    input  [3 :0] data_arcache      ,
    input  [2 :0] data_arprot       ,
    input         data_arvalid      ,
    output        data_arready      ,
    //r           
    output [31:0] data_rdata        ,
    output        data_rlast        ,
    output        data_rready
	
	
    //ar
	output [3 :0] arid         ,
    output [31:0] araddr       ,
    output [7 :0] arlen        ,
    output [2 :0] arsize       ,
    output [1 :0] arburst      ,
    output [1 :0] arlock       ,
    output [3 :0] arcache      ,
    output [2 :0] arprot       ,
    output        arvalid      ,
    input         arready      ,
    //r           
    input  [3 :0] rid          ,
    input  [31:0] rdata        ,
    input  [1 :0] rresp        ,
    input         rlast        ,
    input         rvalid       ,
    output        rready       ,

);

assign arvalid = data_arvalid | inst_arvalid;
assign arlen = 8'0f;
assign arid = 4'b0000;
assign arsize = ;
assign arburst = ;
assign arlock = ;
assign arcache = ;
assign arprot = ;
assign rready = ;

assign araddr = inst_ren? inst_araddr : data_araddr;

assign inst_arready = inst_ren ? arready : 1'b0;
assign data_arready = data_ren ? arready : 1'b0;

assign inst_rready = inst_ren ? rvalid : 1'b0; 
assign data_rready = data_ren ? rvalid : 1'b0;

assign inst_rlast = inst_ren ? rlast : 1'b0;
assign data_rlast = data_ren ? rlast : 1'b0;

assign inst_rdata = rdata;
assign data_rdata = rdata;

endmodule

//S1-T12:DDS Project
//DSWB:District Sewage and Water Board
//Members:
/*
1.Jeferson Pravalto , 231CS131 , jeferson.231cs131@nitk.edu.in
2.Maley Srijan , 231CS133 , srijan.231cs133@nitk.edu.in
3.Vamshi Chethan A M , 231CS162 , vamshichethanam.231cs162@nitk.edu.in
*/
module water_management_system (
    input wire clk,
    input wire reset,
    input wire city_add_pop,
    input wire city_sub_pop,
    input wire town_add_pop,
    input wire town_sub_pop,
    input wire rain_add,
    input wire [7:0] city_pop_rate,
    input wire [7:0] town_pop_rate,
    input wire [5:0] water_collection_rate,
    output wire overflow,
    output wire underflow,
    output wire [8:0] city_population,
    output wire [8:0] town_population,
    output wire [9:0] reservoir_level,
    output wire [17:0] mult_result,  
    output wire [8:0] quotient,      
    output wire [8:0] remainder      
);

    reg [8:0] city_pop, town_pop;
    reg [9:0] water_reservoir;
    wire [17:0] mult_result_internal;
    wire [8:0] quotient_internal, remainder_internal;

    parameter MAX_RESERVOIR = 1000;

    
    wire [7:0] city_add_result, city_sub_result, town_add_result, town_sub_result;
    wire city_overflow, city_underflow, town_overflow, town_underflow;

    // City population update logic
    full_adder_8bit city_adder(.a(city_pop), .b(city_pop_rate), .cin(1'b0), .sum(city_add_result), .cout(city_overflow));
    full_subtractor_8bit city_subtractor(.a(city_pop), .b(city_pop_rate), .bin(1'b0), .diff(city_sub_result), .bout(city_underflow));

    // Town population update logic
    full_adder_8bit town_adder(.a(town_pop), .b(town_pop_rate), .cin(1'b0), .sum(town_add_result), .cout(town_overflow));
    full_subtractor_8bit town_subtractor(.a(town_pop), .b(town_pop_rate), .bin(1'b0), .diff(town_sub_result), .bout(town_underflow));

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            city_pop <= 8'd50;  // Default city population
            town_pop <= 8'd30;  // Default town population
        end else begin
            if (city_add_pop) city_pop <= city_add_result;
            if (city_sub_pop && city_pop > 0) city_pop <= city_sub_result;
            if (town_add_pop) town_pop <= town_add_result;
            if (town_sub_pop && town_pop > 0) town_pop <= town_sub_result;
        end
    end

    // Water reservoir control
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            water_reservoir <= 10'd500;  // Initial water reservoir level
        end else begin
            if (rain_add && water_reservoir + water_collection_rate <= MAX_RESERVOIR)
                water_reservoir <= water_reservoir + water_collection_rate;
            if (water_reservoir > city_pop + town_pop)
                water_reservoir <= water_reservoir - (city_pop + town_pop);
        end
    end

    assign overflow = (water_reservoir > MAX_RESERVOIR);
    assign underflow = (water_reservoir < total_demand);

    // Outputs
    assign city_population = city_pop;
    assign town_population = town_pop;
    assign reservoir_level = water_reservoir;
    assign total_demand=city_pop+town_pop
    // Instantiate 9-bit multiplier and divider
    multiplier_9bit_gate multiplier (
        .a(total_demand), 
        .b(9'b000001001), 
        .product(mult_result_internal)
    );

    divider_9bit_gate divider (
        .numerator(mult_result_internal), 
        .denominator(9'b00001000), 
        .quotient(quotient_internal), 
        .remainder(remainder_internal)
    );

    assign mult_result = mult_result_internal;
    assign quotient = quotient_internal;
    assign remainder = remainder_internal;

endmodule

// 9-bit Multiplier 
module multiplier_9bit_gate (
    input [8:0] a,  // 9-bit input
    input [8:0] b,  // 9-bit input
    output [17:0] product  // 18-bit output
);
    wire [17:0] partial_products [8:0];

    // Generate partial products using AND gates
    genvar i, j;
    generate
        for (i = 0; i < 9; i = i + 1) begin
            for (j = 0; j < 9; j = j + 1) begin
                assign partial_products[i][i + j] = a[i] & b[j];
            end
        end
    endgenerate

    // Sum partial products using full adders
    wire [17:0] sum1, sum2, sum3, sum4, sum5;

    adder_18bit add1 (.a(partial_products[0]), .b(partial_products[1]), .sum(sum1));
    adder_18bit add2 (.a(partial_products[2]), .b(partial_products[3]), .sum(sum2));
    adder_18bit add3 (.a(partial_products[4]), .b(partial_products[5]), .sum(sum3));
    adder_18bit add4 (.a(partial_products[6]), .b(partial_products[7]), .sum(sum4));

    adder_18bit add5 (.a(sum1), .b(sum2), .sum(sum5));
    adder_18bit add6 (.a(sum3), .b(sum4), .sum(product));

endmodule

// 9-bit Divider using gates
module divider_9bit_gate (
    input [8:0] numerator,
    input [8:0] denominator,
    output [8:0] quotient,
    output [8:0] remainder
);
    reg [17:0] dividend;
    reg [8:0] quotient_reg;
    reg [8:0] remainder_reg;

    integer i;

    always @(*) begin
        dividend = {9'b0, numerator};  // Initialize dividend
        quotient_reg = 0;
        remainder_reg = 0;

        for (i = 8; i >= 0; i = i - 1) begin
            remainder_reg = {remainder_reg[7:0], dividend[17]};  // Shift remainder
            dividend = {dividend[16:0], 1'b0};  // Shift dividend

            if (remainder_reg >= denominator) begin
                remainder_reg = remainder_reg - denominator;
                quotient_reg[i] = 1'b1;
            end
        end
    end

    assign quotient = quotient_reg;
    assign remainder = remainder_reg;
endmodule

// 18-bit Adder for partial products summation
module adder_18bit (
    input [17:0] a,
    input [17:0] b,
    output [17:0] sum
);
    assign sum = a + b;
endmodule

// 8-bit Full Adder for population control
module full_adder_8bit (
    input [7:0] a,
    input [7:0] b,
    input cin,
    output [7:0] sum,
    output cout
);
    assign {cout, sum} = a + b + cin;
endmodule

// 8-bit Full Subtractor for population control
module full_subtractor_8bit (
    input [7:0] a,
    input [7:0] b,
    input bin,
    output [7:0] diff,
    output bout
);
    assign {bout, diff} = a - b - bin;
endmodule

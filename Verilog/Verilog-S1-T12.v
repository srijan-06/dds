module water_management_system (
    input wire clk,
    input wire reset,
    input wire city_add_pop,
    input wire city_sub_pop,
    input wire town_add_pop,
    input wire town_sub_pop,
    input wire rain_add,
    input wire [3:0]city_pop_rate,
    input wire [2:0]town_pop_rate,
    input wire [5:0] water_collection_rate, 
    output wire overflow,
    output wire underflow,
    output wire [7:0] city_population,
    output wire [7:0] town_population,
    output wire [9:0] reservoir_level 
);

   
    reg [7:0] city_pop, town_pop;
    wire [8:0] city_demand, town_demand, total_demand;
    reg [9:0] water_reservoir; 
   
   
    parameter MAX_RESERVOIR = 1000;
    parameter SEWAGE_WATER_RATIO = 2;
    parameter TREATED_WATER_RETURN = 3;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            city_pop <= 8'd50; 
        end else if (city_add_pop) begin
            city_pop <= city_pop + city_pop_rate;
        end else if (city_sub_pop && city_pop > 0) begin
            city_pop <= city_pop - city_pop_rate;
        end
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            town_pop <= 8'd30; 
        end else if (town_add_pop) begin
            town_pop <= town_pop + town_pop_rate;
        end else if (town_sub_pop && town_pop > 0) begin
            town_pop <= town_pop - town_pop_rate;
        end
    end

    assign city_demand = city_pop * 2;
    assign town_demand = town_pop * 2;
    assign total_demand = city_demand + town_demand;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            water_reservoir <= 10'd500; 
        end else begin
            if (water_reservoir >= total_demand) begin
                water_reservoir <= water_reservoir - total_demand+(9*total_demand)/16;
            end else begin
                water_reservoir <= water_reservoir; 
            end

            if (rain_add && water_reservoir < MAX_RESERVOIR) begin
                water_reservoir <= water_reservoir + 2*water_collection_rate;
                if (water_reservoir > MAX_RESERVOIR) begin
                    water_reservoir <= MAX_RESERVOIR; 
                end
            end
        end
    end

    assign overflow = (water_reservoir >= MAX_RESERVOIR);
    assign underflow = (water_reservoir <= total_demand);
    assign city_population = city_pop;
    assign town_population = town_pop;
    assign reservoir_level = water_reservoir;

endmodule




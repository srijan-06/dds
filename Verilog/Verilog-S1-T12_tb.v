module tb_water_management_system;

   
    reg clk;
    reg reset;
    reg city_add_pop;
    reg city_sub_pop;
    reg town_add_pop;
    reg town_sub_pop;
    reg rain_add;
    reg [5:0] water_collection_rate; 
    reg[3:0]city_pop_rate;
    reg[2:0]town_pop_rate;

    wire overflow;
    wire underflow;
    wire [7:0] city_population;
    wire [7:0] town_population;
    wire [9:0] reservoir_level;

   
    water_management_system uut (
        .clk(clk),
        .reset(reset),
        .city_add_pop(city_add_pop),
        .city_sub_pop(city_sub_pop),
        .town_add_pop(town_add_pop),
        .town_sub_pop(town_sub_pop),
        .rain_add(rain_add),
        .city_pop_rate(city_pop_rate),
        .town_pop_rate(town_pop_rate),
        .water_collection_rate(water_collection_rate),
        .overflow(overflow),
        .underflow(underflow),
        .city_population(city_population),
        .town_population(town_population),
        .reservoir_level(reservoir_level)
    );

    always begin
        #5 clk = ~clk;
    end
    

    initial begin
        clk = 1;
        reset = 1;
        city_add_pop = 0;
        city_sub_pop = 0;
        town_add_pop = 0;
        town_sub_pop = 0;
        rain_add = 0;
        water_collection_rate = 6'd20; 
        town_pop_rate=3'd2;
        city_pop_rate=4'd3;
        #10 reset = 0;

        #10 city_add_pop = 1; #10 city_add_pop = 0;
        #10 city_add_pop = 1; #10 city_add_pop = 0;
         #10 rain_add = 1; #10 rain_add = 0;
        #10 town_add_pop = 1; #10 town_add_pop = 0; 
        #10 town_add_pop = 1; #10 town_add_pop = 0; 
        #10 rain_add = 1; #10 rain_add = 0;
        #10 rain_add = 1; #10 rain_add = 0;
        #10 rain_add = 1; #10 rain_add = 0; 
        #10 rain_add = 1; #10 rain_add = 0; 

        

        #10 city_sub_pop = 1; #10 city_sub_pop = 0; 

        #10 water_collection_rate = 6'd40;
        #10 rain_add = 1; #10 rain_add = 0; 

        
        

        
        #100 $finish;
    end

    initial begin
        $monitor("Time:%d, City Pop:%d, Town Pop:%d,Pump:%d ,Water Input:%d ,Reservoir:%d, Overflow:%b, Underflow:%b",
            $time, city_population, town_population,rain_add,water_collection_rate, reservoir_level, overflow, underflow);
    end

endmodule


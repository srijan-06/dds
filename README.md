# DSWB: District Sewage and Water Board

<!-- First Section -->
## Team Information
<details>
  <summary>Details</summary>
  <br/>
  <p>
    <b>Semester:</b> 3rd Sem B. Tech. CSE<br/>
    <b>Section:</b> S1<br/>
    <b>Team - ID:</b> S1 - T12<br/>
    <b>Members:</b>
    <ol>
      <li>Jeferson Pravalto , 231CS131 , jeferson.231cs131@nitk.edu.in</li>
      <li>Maley Srijan , 231CS133 , srijan.231cs133@nitk.edu.in</li>
      <li>Vamshi Chethan A M , 231CS162 , vamshichethanam.231cs162@nitk.edu.in</li>
    </ol>
  </p>
</details>

<!-- Second Section -->
## Abstract
<details>
  <summary>Know More</summary>
  <h3>Motivation: </h3>
<pre>  Water is vital for life and the well-being of our communities, yet rapid population growth and urbanization pose 
  significant challenges to its management. The increasing demand for clean water and effective sewage treatment 
  necessitates a coordinated approach to resource oversight. Establishing a District Sewage and Water Board is essential 
  for ensuring efficient water distribution, proper sewage management, and adherence to environmental standards. By 
  centralizing these responsibilities, we can improve service delivery, promote sustainable practices, and safeguard 
  public health. A proactive approach to managing water resources will not only enhance community resilience but also 
  foster a healthier environment for current and future generations.</pre>
  <h3>Problem Statement: </h3>
<pre>  As urbanization and population density increase, effective management of water resources and sewage systems has 
  become a critical challenge for communities. Inadequate oversight can lead to inefficient water distribution, inadequate 
  sewage treatment, and negative environmental impacts, jeopardizing public health and sustainability. The absence of a 
  centralized authority hampers planning and infrastructure development, resulting in unreliable access to clean water and 
  waste management services. To address these issues, a District Sewage and Water Board is needed to streamline operations, 
  enhance service delivery, and ensure that all residents benefit from efficient, sustainable water and sewage management 
  systems.</pre>
  <h3> Features:</h3><pre>
  1. Water is collectively stored in Water Reservoir from where the City and the Town receive Water.
  2. Treatment of Sewage Water from the City and Town:
     a. The Sewage from the Town & City Directly goes to the Water Treatment Board
     b. The Treated Water then is sent to the City's Water Reservoir
  3. City & Town Water Management with Dynamic Population Variation:
     a. Town and City's population can be dynamically altered using User's input affecting the Water Intake and Sewage 
        Production
     b. This in turn alters the Load on Water Treatment and Reservoir</pre>

</details>

<!--Third Section -->
## Functional Block Diagram
<details>
  <summary>See More</summary>
  
  ### Schematic Block Diagram of Functionality
  ![Schematic Diagram S1-T12](https://github.com/user-attachments/assets/8bc26c6c-8e98-4281-911a-829015f4e7b9)

  ### Circuital Diagram
  ![Circuital Diagram S1-T12](https://github.com/user-attachments/assets/5bf039be-73b7-43d9-a54a-f85d61c3bbb6)
  
</details>


<!-- Third Section -->
## Working
<details>
  <summary>Detail Working</summary>

  
The Sewage Board & Water Management System efficiently regulates the supply of water based on demand while ensuring that reservoirs do not overflow. It compares the city’s water usage, checks demand rates, and manages reservoir levels accordingly. The system uses several conditions and logic gates to determine whether to continue supplying water or stop to avoid overflow.

### Inputs and Limits

- **city_prev_pulse_rate**: The previous water demand or usage rate from the city.
- **city_pulse_rate**: The current water usage rate or demand.
- **city_demand_pulse**: The new demand from the city.
- **water_reservoir**: The current water level in the reservoir.
- **MAX_RESERVOIR**: The maximum water level the reservoir can hold.

### Design & Working

1. **Start**:
   - The process initiates to monitor and compare the city’s water demand and reservoir levels.
  
2. **Reset Check**:
   - The system first checks if there is a reset condition in the operation.
   - If `reset = True`, it restarts the process; if `reset = False`, it continues monitoring.
  
3. **City Pulse Rate Check**:
   - Comparator compares the current city water demand (`city_pulse_rate`) with the value of 90.
   - If the current city demand is greater than 90, the process moves forward.
   - If the city pulse is less than or equal to 90, it moves to check other conditions.
  
4. **Previous and Current Pulse Rate Comparison**:
   - The system compares the `city_prev_pulse_rate` (previous demand) with the current `city_pulse_rate`.
   - If the previous pulse rate is less than the current pulse rate, the system continues.
   - If not, it checks further demand conditions.
  
5. **City Demand Comparison**:
   - The system checks if the `city_demand_pulse` is greater than or equal to 100.
   - If true, the process continues to manage water distribution.
   - If false, the process moves on without major action.
  
6. **Reservoir Level Check**:
   - The current water level in the reservoir is compared with `MAX_RESERVOIR`.
   - If the `water_reservoir` is less than the maximum reservoir capacity, the system continues.
   - If the reservoir is full, the system will avoid further filling to prevent overflow.
  
7. **Overflow Management**:
   - If the water reservoir level is greater than or equal to `MAX_RESERVOIR`, an overflow condition is triggered.
   - The system stops adding water or controls the flow to avoid spillage.
  
8. **Water Release Control**:
   - If demand is met and the reservoir has space, the water supply is managed and controlled based on the city’s demand.
   - `Water Reservoir < MAX_RESERVOIR`: This condition allows the system to supply water to match the demand.
  
9. **End**:
   - The process concludes either by supplying the required water, stopping overflow, or pausing due to normal conditions.

### System Functionality

- The system continuously monitors the water demand and reservoir levels.
- It ensures efficient water distribution by checking current demand and previous usage rates.
- Overflow protection mechanisms prevent reservoir overflows by halting water supply when the reservoir reaches its maximum capacity.
- It adapts to changes in water demand and ensures that the system reacts appropriately to changes in demand or reservoir levels.

This water management system efficiently regulates water supply, avoiding overflow and ensuring demand is met based on real-time usage data.

</details>

<!-- Fourth Section -->
## Logisim Circuit Diagram
<details>
  <summary>Click to View</summary>
    
   ![S1-T12_Logisim](https://github.com/user-attachments/assets/5247f974-7aef-4b91-9ec8-65789a99e9e6)
 
</details>

<!-- Fifth Section -->
## Verilog Code
<details>
  <summary>Click to View</summary>
  
 ### Main Code:
    
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


### Testbench File's Code:
        
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


</details>

## References
<details>
  <summary>For Furthur References</summary>
  
  > [International Water Management Institute - _Framework for Efficient Wastewater Treatment and Recycling Systems_](https://www.iwmi.cgiar.org/Publications/Working_Papers/working/WOR129.pdf) <br/>

  > “Water Resources Systems Planning and Management” by Loucks, Stedinger, and Haith. <br/>

  
</details>

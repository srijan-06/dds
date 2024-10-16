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

### Overview

In this water management system for the city and town, we are modeling the flow of water from a shared reservoir to two regions, while controlling the population, water intake, and sewage treatment. The process involves various components, control mechanisms, and logical steps for ensuring efficient water use and waste management.

### Key Components in the System

1. **Population Controls**:
   - Adjustments to the city and town population using the provided interface (Adders and Subtractors).
   - These controls allow for the modification of consumption rates and waste production.

2. **Water Reservoir**:
   - A central reservoir that stores water and supplies both the city and town.
   - Inputs include external sources such as rainwater, surface streams.
   - Outputs include water consumption by the city and town, which reduces the reservoir level.

3. **Sewage Collection and Treatment**:
   - Wastewater from both the city and town is treated. The process is only partially efficient, as some water is lost during treatment.
   - Treated water is returned to the reservoir.

4. **Control Buttons**:
   - Mechanisms for adding or subtracting water in the reservoir or altering population in the regions.

### Design and Flowchart Analysis

The project is broken down into the following steps:

1. **Start**:
   - The process initiates with predefined water levels in the reservoir and initial population in both the city and town.

2. **City Population Adjustment**:
   - A population adjustment function for the city is initiated using controls such as `city_pop_add` and `city_pop_sub`. Based on this, the city’s population is updated.

3. **Town Population Adjustment**:
   - Similarly, the town’s population can be increased or decreased with controls `town_pop_add` and `town_pop_sub`.

4. **Water Demand Calculation**:
   - The water demand for both the city and town is calculated. Each region’s demand is based on its population and consumption rate. The formula for demand is:

     ```
     Water_Demand = Population Size
     ```

   - City Demand: Derived using `city_demand = city_pop`
   - Town Demand: Derived using `town_demand = town_pop`.

5. **Sewage Flow**:
   - Sewage is produced based on the water intake (a percentage of water used becomes sewage). For the city, this is `city_sewage = 3/4 * city_demand`, and for the town, it is `town_sewage = 3/4 * town_demand`.

6. **Water Supply Check**:
   - A check is performed to determine if the total demand (`city_demand + town_demand`) is greater than the available water in the reservoir. If the demand exceeds the reservoir capacity, adjustments will be made.
   - If there is sufficient water in the reservoir, water is supplied to both regions.

7. **Reservoir Overflow Management**:
   - After supplying water, if the reservoir exceeds the maximum capacity (due to external inputs like rain), overflow is managed by releasing excess water to prevent flooding.

8. **Update Water Reservoir**:
   - The water levels in the reservoir are updated after accounting for consumption, sewage treatment, and water addition from external sources (like rainfall). The reservoir level is recalculated:

     ```
     New Water Level = Old Water Level - Total Demand + Returned Sewage + External Sources
     ```

9. **Sewage Treatment**:
   - Sewage produced is treated, and a portion (about three-quarters of the input) is returned to the reservoir, while the rest is lost.

10. **End**:
   - The process can be reset or adjusted based on changes in population or external inputs like rainfall.


### Summary of the Process

This water management system ensures efficient use of water resources by dynamically adjusting for population changes, consumption rates, and sewage recycling. It helps in preventing water shortages, managing waste, and ensuring a continuous supply for both the city and town.

This project can be implemented using a combination of logic gates, sensors, and controllers to manage water flow, population dynamics, and waste treatment. The diagram and flowchart guide decision-making processes for when to adjust water reserves or manage overflow.

### Real-time Adjustments

The controls allow real-time adjustments to:

- Population changes (Add/Subtract population).
- Water additions (simulate rainfall).
- Sewage management (treatment and return to the reservoir).

This model provides a systematic approach to balance water supply, demand, and treatment for a sustainable urban management system.


</details>

<!-- Fourth Section -->
## Logisim Circuit Diagram
<details>
  <summary>Click to View</summary>
  
  The [Logisim](https://github.com/cs131-231nitk/DDS_Project-S1-T12/tree/main/Logisim) folder consists the Logisim File of the DSWB: District Sewage and Water Board circuit.
  
    STEPS to use the .circ file (Overall Circuit):

    1. Firstly, Set the Population Rate for City & Down using the 4-bit & 3-bit input respectively.
    2. Toggle the Population Adder Switch to Increase the Given Rate of Population for a day (10-ticks).
    3. Set the "Water Collection Rate" using the 6-bit input, and use the "Pump Switch" to pump the input 
       water to the water reservoir every half-day (5-ticks)
    4. You will notice the water decrementing slowly with time due to consumption from the city & town and 
       about 9/16th of it being recycled
    5. Therefore, you'll have to accordingly adjust the "Water Collection Rate" for the selected population 
       of City & Town so that they don't run out of water.
    6. If there is Insufficient Water for the Town/City, the water supply for both will be halted so that 
       the Water Reservoir can Analyze the Supply and Adjust the "Water Collection Rate" to meet the District's 
       Need.
    7. This with enable to effectively understand the necessity of water for the District and Analyse the 
       consumption and avail the right input rates for the right population. 
    8. To Reset, Revert Every Binary Input to '0's and press the Reset Button to Reset the Circuit.


    Few Important NOTES:

    a. You can adjust the population by adding/subtracting using the "Population Rate" to choose the rate & the 
       right Switch to execute the process.
    b. You can also change the "Rate" of the Population Adder/Subtractor and the "Water Collection Rate" at any 
       point of time to match and analyze at different circumstances.
    c. [IMP] You can also start with FIlling the Water Reservoir First and then Add the Population.
  ### Main Circuit
   ![main](https://github.com/user-attachments/assets/30c8ba42-f7d7-4a4b-9137-bdd8a624d4a8)
  
  ### 
 
</details>

<!-- Fifth Section -->
## Verilog Code
<details>
<summary>View More</summary>
To use the Verilog files:-

Step-1:  
&nbsp;&nbsp;&nbsp;&nbsp;Open main Verilog code.

Step-2:  
&nbsp;&nbsp;&nbsp;&nbsp;Enter city Population & Town population.

Step-3:  
&nbsp;&nbsp;&nbsp;&nbsp;Open testbench verilog code and Enter water input rate.

  


 ### Main Code:
    //S1-T21:DDS Project
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
              city_pop <= 8'd50; //city_pop                       
          end else if (city_add_pop) begin
              city_pop <= city_pop + city_pop_rate;
          end else if (city_sub_pop && city_pop > 0) begin
              city_pop <= city_pop - city_pop_rate;
          end
      end
  
      always @(posedge clk or posedge reset) begin
          if (reset) begin
              town_pop <= 8'd30; //town_pop
          end else if (town_add_pop) begin
              town_pop <= town_pop + town_pop_rate;
          end else if (town_sub_pop && town_pop > 0) begin
              town_pop <= town_pop - town_pop_rate;
          end
      end
  
      assign city_demand = city_pop ;
      assign town_demand = town_pop ;
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
          water_collection_rate = 6'd20; //water_collection_rate
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
  
          #10 water_collection_rate = 6'd20;
          #10 rain_add = 1; #10 rain_add = 0; 
  
          
          
  
          
          #100 $finish;
      end
  
      initial begin
          $monitor("Time:%d, City Pop:%d, Town Pop:%d,Pump:%d ,Water Input:%d ,Reservoir:%d, Overflow:%b, Underflow:%b",
              $time, city_population, town_population,rain_add,water_collection_rate, reservoir_level, overflow, underflow);
      end
    endmodule
### OUTPUT:
![Screenshot 2024-10-17 010252](https://github.com/user-attachments/assets/d3e06139-5bd7-46c8-bfab-8cbf080e6045)


</details>

## References
<details>
  <summary>For Furthur References</summary>
  
  > [International Water Management Institute - _Framework for Efficient Wastewater Treatment and Recycling Systems_](https://www.iwmi.cgiar.org/Publications/Working_Papers/working/WOR129.pdf) <br/>

  > “Water Resources Systems Planning and Management” by Loucks, Stedinger, and Haith. <br/>

  
</details>

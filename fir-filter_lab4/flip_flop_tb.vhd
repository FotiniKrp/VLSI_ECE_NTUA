library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity d3_tb is
end d3_tb;

architecture sim of d3_tb is
    signal Clk, reset, D, Q: std_logic;
begin
    -- Instantiate the unit under test
    dut : entity work.d3
        port map (
            clk => clk,
            reset => reset,
            D => D,
            Q => Q
        );
   check: process
   begin
      reset <= '0'; clk <= '0';
      D <= '1';  wait for 10 ns;
      clk <= '1'; wait for 10 ns;
      
      clk <= '0'; D <= '1';  wait for 5 ns;
      reset <= '0'; wait for 2 ns;
      reset <= '0'; wait for 3 ns;
      clk <= '1'; wait for 10 ns;  
   
      clk <= '0';
      D <= '0';  wait for 10 ns;
      clk <= '1'; wait for 10 ns;
      
      clk <= '0'; D <= '1';  wait for 5 ns;
      reset <= '0'; wait for 2 ns;
      reset <= '0'; wait for 3 ns;
      clk <= '1'; wait for 10 ns; 
      
      clk <= '0'; wait for 10 ns;
      clk <= '1'; wait for 10 ns;    
   end process;     
end sim;
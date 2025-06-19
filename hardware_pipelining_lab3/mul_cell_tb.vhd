library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mul_cell_tb is
end mul_cell_tb;

architecture mul_cell_test of mul_cell_tb is
   component mul_cell is 
      Port (
            A1, A2, B, Cin, Clk: in std_logic;
            P, Cout: out std_logic
            );
   end component;
   signal A1_tb, A2_tb, B_tb, Cin_tb, P_tb, Cout_tb, Clk_tb: std_logic;
begin
   uut: mul_cell port map (A1 => A1_tb, A2 => A2_tb, B => B_tb, Cin => Cin_tb, 
                           P => P_tb, Cout => Cout_tb, Clk => Clk_tb);
   check: process
   begin
      Clk_tb <= '0'; A1_tb <= '0'; A2_tb <= '0'; B_tb <= '0'; Cin_tb <= '0'; wait for 10 ns; Clk_tb <= '1'; wait for 10 ns;
      Clk_tb <= '0'; A1_tb <= '0'; A2_tb <= '1'; B_tb <= '0'; Cin_tb <= '1'; wait for 10 ns; Clk_tb <= '1'; wait for 10 ns;
      Clk_tb <= '0'; A1_tb <= '0'; A2_tb <= '0'; B_tb <= '1'; Cin_tb <= '0'; wait for 10 ns; Clk_tb <= '1'; wait for 10 ns;
      Clk_tb <= '0'; A1_tb <= '0'; A2_tb <= '1'; B_tb <= '1'; Cin_tb <= '1'; wait for 10 ns; Clk_tb <= '1'; wait for 10 ns;
      Clk_tb <= '0'; A1_tb <= '1'; A2_tb <= '0'; B_tb <= '0'; Cin_tb <= '0'; wait for 10 ns; Clk_tb <= '1'; wait for 10 ns;
      Clk_tb <= '0'; A1_tb <= '1'; A2_tb <= '1'; B_tb <= '0'; Cin_tb <= '1'; wait for 10 ns; Clk_tb <= '1'; wait for 10 ns;
      Clk_tb <= '0'; A1_tb <= '1'; A2_tb <= '0'; B_tb <= '1'; Cin_tb <= '0'; wait for 10 ns; Clk_tb <= '1'; wait for 10 ns;
      Clk_tb <= '0'; A1_tb <= '1'; A2_tb <= '1'; B_tb <= '1'; Cin_tb <= '1'; wait for 10 ns; Clk_tb <= '1'; wait for 10 ns;
   end process check;
end mul_cell_test;
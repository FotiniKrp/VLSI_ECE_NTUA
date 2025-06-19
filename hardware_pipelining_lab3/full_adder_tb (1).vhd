library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture full_adder_test of full_adder_tb is
   component full_adder is 
      Port (
             A, B, Cin, Clk: in std_logic;
             Sum, Cout: out std_logic
            );
   end component;
   signal A_tb, B_tb, Cin_tb, S_tb, Cout_tb, Clk_tb: std_logic;
begin
   uut: full_adder port map (A => A_tb, B => B_tb, Cin => Cin_tb, Sum => S_tb, Cout => Cout_tb, Clk => Clk_tb);
   check: process
   begin
      Clk_tb <= '0'; A_tb <= '0'; B_tb <= '0'; Cin_tb <= '0'; wait for 5 ns; Clk_tb <= '1'; wait for 5 ns;
      Clk_tb <= '0'; A_tb <= '0'; B_tb <= '0'; Cin_tb <= '1'; wait for 5 ns; Clk_tb <= '1'; wait for 5 ns;
      Clk_tb <= '0'; A_tb <= '0'; B_tb <= '1'; Cin_tb <= '0'; wait for 5 ns; Clk_tb <= '1'; wait for 5 ns;
      Clk_tb <= '0'; A_tb <= '0'; B_tb <= '1'; Cin_tb <= '1'; wait for 5 ns; Clk_tb <= '1'; wait for 5 ns;
      Clk_tb <= '0'; A_tb <= '1'; B_tb <= '0'; Cin_tb <= '0'; wait for 5 ns; Clk_tb <= '1'; wait for 5 ns;
      Clk_tb <= '0'; A_tb <= '1'; B_tb <= '0'; Cin_tb <= '1'; wait for 5 ns; Clk_tb <= '1'; wait for 5 ns;
      Clk_tb <= '0'; A_tb <= '1'; B_tb <= '1'; Cin_tb <= '0'; wait for 5 ns; Clk_tb <= '1'; wait for 5 ns;
      Clk_tb <= '0'; A_tb <= '1'; B_tb <= '1'; Cin_tb <= '1'; wait for 5 ns; Clk_tb <= '1'; wait for 5 ns;
   end process check;
end full_adder_test;
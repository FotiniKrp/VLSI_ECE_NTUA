library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cell_tb is
end cell_tb;

architecture cell_test of cell_tb is
    component mul_cell is
        Port (
            A1, B1, P0, Cin, Clk: in std_logic;
            P, Cout: out std_logic
        );
    end component;
    
    signal A1_tb, B1_tb, P0_tb, Cin_tb, Clk_tb, P_tb, Cout_tb: std_logic;
begin
   uut: mul_cell port map (A1 => A1_tb, B1 => B1_tb, P0 => P0_tb,  Cin => Cin_tb, P => P_tb, Cout => Cout_tb, Clk => Clk_tb);
   check: process
   begin
   A1_tb <= '0'; B1_tb <= '0'; P0_tb <= '1'; Cin_tb <= '0';
      Clk_tb <= '0'; wait for 5 ns; Clk_tb <= '1'; wait for 5 ns;
      Clk_tb <= '0'; wait for 5 ns; A1_tb <= '0'; B1_tb <= '0'; P0_tb <= '1'; Cin_tb <= '1'; Clk_tb <= '1'; wait for 5 ns;
      Clk_tb <= '0'; wait for 5 ns; A1_tb <= '0'; B1_tb <= '1'; P0_tb <= '0'; Cin_tb <= '0'; Clk_tb <= '1'; wait for 5 ns;
      Clk_tb <= '0'; wait for 5 ns; A1_tb <= '0'; B1_tb <= '1'; P0_tb <= '1'; Cin_tb <= '1'; Clk_tb <= '1'; wait for 5 ns;
      Clk_tb <= '0'; wait for 5 ns; A1_tb <= '1'; B1_tb <= '0'; P0_tb <= '0'; Cin_tb <= '0'; Clk_tb <= '1'; wait for 5 ns;
      Clk_tb <= '0'; wait for 5 ns; A1_tb <= '1'; B1_tb <= '0'; P0_tb <= '1'; Cin_tb <= '1'; Clk_tb <= '1'; wait for 5 ns;
      Clk_tb <= '0'; wait for 5 ns; A1_tb <= '1'; B1_tb <= '1'; P0_tb <= '0'; Cin_tb <= '0'; Clk_tb <= '1'; wait for 5 ns;
      Clk_tb <= '0'; wait for 5 ns; A1_tb <= '1'; B1_tb <= '1'; P0_tb <= '1'; Cin_tb <= '1'; Clk_tb <= '1'; wait for 5 ns;
   end process check;
end cell_test;

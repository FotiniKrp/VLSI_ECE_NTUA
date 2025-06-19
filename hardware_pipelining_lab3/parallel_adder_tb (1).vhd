library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity parallel_adder_tb is
end parallel_adder_tb;

architecture parallel_adder_test of parallel_adder_tb is
   component parallel_adder
     Port (
        A, B: in std_logic_vector(3 downto 0);
        Clk, Cin: in std_logic;
        Sum: out std_logic_vector(3 downto 0);
        Cout: out std_logic
      );
   end component;
   signal A_tb, B_tb, Sum_tb: std_logic_vector(3 downto 0);
   signal Cin_tb, Cout_tb, Clk_tb: std_logic;
begin
  uut: parallel_adder port map (
    A => A_tb,
    B => B_tb,
    Sum => Sum_tb,
    Clk => Clk_tb,
    Cin => Cin_tb,
    Cout => Cout_tb
  );

  check: process
  begin 
    Cin_tb <= '0';
    
    Clk_tb <= '0'; A_tb <= "1000"; B_tb <= "0101"; wait for 10 ns;
    Clk_tb <= '1'; wait for 10ns;
    Clk_tb <= '0'; A_tb <= "0010"; B_tb <= "1101"; wait for 10 ns;
    Clk_tb <= '1'; wait for 10ns;
    Clk_tb <= '0'; A_tb <= "1110"; B_tb <= "1111"; wait for 10 ns;
    Clk_tb <= '1'; wait for 10ns;
    Clk_tb <= '0'; A_tb <= "1001"; B_tb <= "1001"; wait for 10 ns;
    Clk_tb <= '1'; wait for 10ns;
    Clk_tb <= '0'; Cin_tb <= '1'; A_tb <= "0110"; B_tb <= "0001"; wait for 10 ns;
    Clk_tb <= '1'; wait for 10ns; 
  end process check;
end parallel_adder_test;
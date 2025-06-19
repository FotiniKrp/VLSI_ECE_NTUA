library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity parallel_adder_t is
end parallel_adder_t;

architecture parallel_adder_tes of parallel_adder_t is
   component par_adder
     Port (
        A, B: in std_logic_vector(1 downto 0);
        Clk, Cin: in std_logic;
        Sum: out std_logic_vector(1 downto 0);
        Cout: out std_logic
      );
   end component;
   signal A_tb, B_tb, Sum_tb: std_logic_vector(1 downto 0);
   signal Cin_tb, Cout_tb, Clk_tb: std_logic;
begin
  uut: par_adder port map (
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
    Clk_tb <= '0'; wait for 10 ns;
    Clk_tb <= '1';
    A_tb <= "10"; B_tb <= "01"; wait for 10ns;
    Clk_tb <= '0'; wait for 10 ns;
    Clk_tb <= '1';
    A_tb <= "10"; B_tb <= "11"; wait for 10ns;
    Clk_tb <= '0'; wait for 10 ns;
    Clk_tb <= '1';
    A_tb <= "11"; B_tb <= "11"; wait for 10ns;
    Clk_tb <= '0'; wait for 10 ns;
    Clk_tb <= '1';
    A_tb <= "01"; B_tb <= "10"; wait for 10ns;
    Clk_tb <= '0'; wait for 10 ns;
    Clk_tb <= '1';
    A_tb <= "11"; B_tb <= "01"; wait for 10ns; 
  end process check;
end parallel_adder_tes;
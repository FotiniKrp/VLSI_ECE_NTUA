library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier_tb is
end multiplier_tb;

architecture multiplier_test of multiplier_tb is
   component multiplier
     Port (
        A, B: in STD_LOGIC_VECTOR(3 downto 0);
        Clk: in STD_LOGIC;
        Product : out STD_LOGIC_VECTOR(7 downto 0)
    );
   end component;
   signal A_tb, B_tb: std_logic_vector(3 downto 0);
   signal P_tb: std_logic_vector(7 downto 0);
   signal Clk_tb: std_logic;
begin
  uut: multiplier port map (
    A => A_tb,
    B => B_tb,
    Product => P_tb,
    Clk => Clk_tb
  );

  check: process
  begin 
    Clk_tb <= '0'; 
    A_tb <= "1000"; B_tb <= "0100"; wait for 10 ns;
    Clk_tb <= '1'; wait for 10 ns;

    Clk_tb <= '0'; 
    A_tb <= "0011"; B_tb <= "1011"; wait for 10 ns;
    Clk_tb <= '1'; wait for 10 ns;

    Clk_tb <= '0'; 
    A_tb <= "1100"; B_tb <= "1101"; wait for 10 ns;
    Clk_tb <= '1'; wait for 10ns;
    
    Clk_tb <= '0'; 
    A_tb <= "0000"; B_tb <= "0001"; wait for 10 ns;
    Clk_tb <= '1'; wait for 10ns;
    
    Clk_tb <= '0'; 
    A_tb <= "1111"; B_tb <= "1111"; wait for 10 ns;
    Clk_tb <= '1'; wait for 10ns;
    
    Clk_tb <= '0'; 
    A_tb <= "1001"; B_tb <= "1111"; wait for 10 ns;
    Clk_tb <= '1'; wait for 10ns;
  end process check;
end multiplier_test;
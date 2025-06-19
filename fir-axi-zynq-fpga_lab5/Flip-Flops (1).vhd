library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d1 is
    Port( 
          Clk, reset, D: in std_logic;
          Q: out std_logic
         );
end d1;

architecture Behavioral of d1 is
    signal rst: std_logic;
begin
    process(Clk, reset)
    begin
        if reset='1' then
            rst <= '1';
        elsif (Clk'event and Clk='1') then 
            if rst='1' then Q <= '0'; rst <= '0';
            else Q <= D;
            end if;
        end if;
    end process;
end Behavioral;

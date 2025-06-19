library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity valid_ff is
  Port (clk, reset, valid_in: in std_logic;
        valid_out: out std_logic 
        );
end valid_ff;

architecture Behavioral of valid_ff is
    component d4 is
    Port( 
          reset, Clk, D: in std_logic;
          Q: out std_logic
    );
    end component;

    signal valid_tmp: std_logic;
begin
    d1: d4 port map (clk => clk, d => valid_in, reset => reset, q => valid_tmp);
    d2: d4 port map (clk => clk, d => valid_tmp, reset => reset, q => valid_out);
end Behavioral;

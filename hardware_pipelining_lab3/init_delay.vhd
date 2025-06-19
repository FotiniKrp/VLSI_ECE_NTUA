library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity init_delay is
  Port (
        A: in std_logic_vector(3 downto 0);
        Clk: in std_logic;
        B: out std_logic_vector(3 downto 0)
  );
end init_delay;

architecture behavioral of init_delay is
    component d1 is 
        Port( 
              D, Clk: in std_logic;
              Q: out std_logic
            );
    end component;
    
    component d2 is 
        Port( 
              D, Clk: in std_logic;
              Q: out std_logic
            );
    end component;
    
    component d3 is 
        Port( 
              D, Clk: in std_logic;
              Q: out std_logic
            );
    end component;
    
    component d4 is 
        Port( 
              D, Clk: in std_logic;
              Q: out std_logic
            );
    end component;
begin
    f1: d1 port map (D => A(0), Q => B(0), Clk => Clk); 
    f2: d2 port map (D => A(1), Q => B(1), Clk => Clk); 
    f3: d3 port map (D => A(2), Q => B(2), Clk => Clk); 
    f4: d4 port map (D => A(3), Q => B(3), Clk => Clk);
end behavioral;

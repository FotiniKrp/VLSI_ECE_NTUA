library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d1 is
    Port( 
          D, Clk: in std_logic;
          Q: out std_logic
         );
end d1;

architecture behavioral of d1 is
begin
    process(Clk)
    begin
        if (Clk'event and Clk='1') then 
            Q <= D;
        end if;
    end process;
end behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d2 is
    Port( 
          D, Clk: in std_logic;
          Q: out std_logic
         );
end d2;

architecture behavioral of d2 is   
    component d1 is 
        Port( 
              D, Clk: in std_logic;
              Q: out std_logic
            );
    end component;
    signal tmp: std_logic;
begin
    l1: d1 port map (D => D, Q => tmp, Clk => Clk);
    l2: d1 port map (D => tmp, Q => Q, Clk => Clk);
end behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d3 is
    Port( 
          D, Clk: in std_logic;
          Q: out std_logic
         );
end d3;

architecture behavioral of d3 is   
    component d1 is 
        Port( 
              D, Clk: in std_logic;
              Q: out std_logic
            );
    end component;
    signal tmp1, tmp2: std_logic;
begin
    l1: d1 port map (D => D, Q => tmp1, Clk => Clk);
    l2: d1 port map (D => tmp1, Q => tmp2, Clk => Clk);
    l3: d1 port map (D => tmp2, Q => Q, Clk => Clk);
end behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d4 is
    Port( 
          D, Clk: in std_logic;
          Q: out std_logic
         );
end d4;

architecture behavioral of d4 is   
    component d2 is 
        Port( 
              D, Clk: in std_logic;
              Q: out std_logic
            );
    end component;
    signal tmp: std_logic;
begin
    l1: d2 port map (D => D, Q => tmp, Clk => Clk);
    l2: d2 port map (D => tmp, Q => Q, Clk => Clk);
end behavioral;
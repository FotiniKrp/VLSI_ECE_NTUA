library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mul_cell is
    Port (
        A1, A2, B, Cin, Clk: in std_logic;
        P, Cout, A_out, B_out: out std_logic
     );
end mul_cell;

architecture mul_cell_arch of mul_cell is
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
    
    component full_adder is
      Port (
           A, B, Cin, Clk: in std_logic;
           Sum, Cout: out std_logic
           );
    end component;
    signal and1: std_logic;
begin
    and1 <= A1 and A2;
    c1: full_adder port map (A => and1, B => B, Cin => Cin, Clk => Clk,
                             Sum => P, Cout => Cout);
    de1: d1 port map (D => A2, Q => B_out, Clk => Clk);
    de2: d2 port map (D => A1, Q => A_out, Clk => Clk);
end mul_cell_arch;
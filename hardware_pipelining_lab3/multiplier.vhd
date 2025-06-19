library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier is
    Port (
        A, B : in STD_LOGIC_VECTOR(3 downto 0);
        Clk: in STD_LOGIC;
        Product : out STD_LOGIC_VECTOR(7 downto 0)
    );
end multiplier;

architecture multiplier_arch of multiplier is
    component mul_cell is
        Port (
            A1, A2, B, Cin, Clk: in std_logic;
            P, Cout, A_out, B_out: out std_logic
             );
    end component;

    component init_delay is
        Port (
            A: in std_logic_vector(3 downto 0);
            Clk: in std_logic;
            B: out std_logic_vector(3 downto 0)
             );
    end component;

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

    signal A1, A2, A3, B1, B2, B3: std_logic_vector(3 downto 0);
    signal S1, S2, C1, C2, C3: std_logic_vector(3 downto 0);
    signal and1, S0: std_logic_vector(2 downto 0);
    signal P0, P0_d, P1, P1_d, P2, P2_d, P3, P4, P5: std_logic;
    signal B3_d: std_logic;
begin
    process(Clk)
    begin
        if (Clk'event and Clk='1') then
            and1 <= (A(3) and B(0))&(A(2) and B(0))&(A(1) and B(0));
            P0 <= A(0) and B(0); 
        end if;
    end process;
    --synch entity for 1st stage's inputs
    id: init_delay port map (A => A, B => A1, Clk => Clk);

    b11: d1 port map (D => B(1), Q => B1(0), Clk => Clk); 
    b21: d3 port map (D => B(2), Q => B2(0), Clk => Clk);
    b31: d4 port map (D => B(3), Q => B3_d, Clk => Clk); b32: d1 port map (D => B3_d, Q => B3(0), Clk => Clk);

    --final products' delay
    p01: d4 port map (D => P0, Q => P0_d, Clk => Clk); p02: d4 port map (D => P0_d, Q => Product(0), Clk => Clk); 
    p11: d3 port map (D => P1, Q => P1_d, Clk => Clk); p12: d4 port map (D => P1_d, Q => Product(1), Clk => Clk); 
    p21: d2 port map (D => P2, Q => P2_d, Clk => Clk); p22: d3 port map (D => P2_d, Q => Product(2), Clk => Clk);

    s01: d1 port map (D => and1(1), Q => S0(0), Clk => Clk); 
    s02: d2 port map (D => and1(2), Q => S0(1), Clk => Clk);
    s03: d4 port map (D => '0', Q => S0(2), Clk => Clk);

    --1st stage
    l1: mul_cell port map(A1 => A1(0), A2 => B1(0), B => and1(0), Cin => '0', Clk => Clk, P => P1, Cout => C1(0), B_out => B1(1), A_out => A2(0));
    l2: mul_cell port map(A1 => A1(1), A2 => B1(1), B => S0(0), Cin => C1(0), Clk => Clk, P => S1(0), Cout => C1(1), B_out => B1(2), A_out => A2(1));
    l3: mul_cell port map(A1 => A1(2), A2 => B1(2), B => S0(1), Cin => C1(1), Clk => Clk, P => S1(1), Cout => C1(2), B_out => B1(3), A_out => A2(2));
    l4: mul_cell port map(A1 => A1(3), A2 => B1(3), B => S0(2), Cin => C1(2), Clk => Clk, P => S1(2), Cout => C1(3), A_out => A2(3));
 
     --2nd stage
     c11: d1 port map (D => C1(3), Q => S1(3), Clk => Clk);
     m1: mul_cell port map(A1 => A2(0), A2 => B2(0), B => S1(0), Cin => '0', Clk => Clk, P => P2, Cout => C2(0), B_out => B2(1), A_out => A3(0));
     m2: mul_cell port map(A1 => A2(1), A2 => B2(1), B => S1(1), Cin => C2(0), Clk => Clk, P => S2(0), Cout => C2(1), B_out => B2(2), A_out => A3(1));
     m3: mul_cell port map(A1 => A2(2), A2 => B2(2), B => S1(2), Cin => C2(1), Clk => Clk, P => S2(1), Cout => C2(2), B_out => B2(3), A_out => A3(2));
     m4: mul_cell port map(A1 => A2(3), A2 => B2(3), B => S1(3), Cin => C2(2), Clk => Clk, P => S2(2), Cout => C2(3), A_out => A3(3));
   
     --3rd stage
     c21: d1 port map (D => C2(3), Q => S2(3), Clk => Clk);
     n1: mul_cell port map(A1 => A3(0), A2 => B3(0), B => S2(0), Cin => '0', Clk => Clk, P => P3, Cout => C3(0), B_out => B3(1));
     n2: mul_cell port map(A1 => A3(1), A2 => B3(1), B => S2(1), Cin => C3(0), Clk => Clk, P => P4, Cout => C3(1), B_out => B3(2));
     n3: mul_cell port map(A1 => A3(2), A2 => B3(2), B => S2(2), Cin => C3(1), Clk => Clk, P => P5, Cout => C3(2), B_out => B3(3));
     n4: mul_cell port map(A1 => A3(3), A2 => B3(3), B => S2(3), Cin => C3(2), Clk => Clk, P => Product(6), Cout => Product(7));
     
    --final products
    p31: d3 port map (D => P3, Q => Product(3), Clk => Clk);
    p41: d2 port map (D => P4, Q => Product(4), Clk => Clk);
    p51: d1 port map (D => P5, Q => Product(5), Clk => Clk);
    
     
end multiplier_arch;
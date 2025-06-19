library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fir_filter_tb is
end fir_filter_tb;

architecture tb_arch of fir_filter_tb is
    signal clk, reset, valid_in : std_logic;
    signal x : std_logic_vector(7 downto 0);
    signal valid_out : std_logic;
    signal y : std_logic_vector(18 downto 0);

    -- Component declaration for the DUT
    component fir_filter is
        port ( 
            clk, reset, valid_in: in std_logic;
            x: in std_logic_vector(7 downto 0);
            valid_out: out std_logic;
            y: inout std_logic_vector(18 downto 0)
        );
    end component;

    type input_array is array (0 to 19) of integer range 0 to 255;
    constant input_data : input_array := (1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
                                          1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
begin
    -- DUT instantiation
    DUT: fir_filter port map (
        clk => clk,
        reset => reset,
        valid_in => valid_in,
        x => x,
        valid_out => valid_out,
        y => y
    );
    check: process
    begin    
    
    reset <= '0';
    for i in 0 to 8 loop
        x <= std_logic_vector(to_unsigned(input_data(i), x'length));
        valid_in <= '1';
        clk <= '0';  wait for 5 ns; clk <= '1';  wait for 5 ns;
        valid_in <= '0';
        for i in 6 downto 0 loop
            clk <= '0';  wait for 5 ns;
            clk <= '1';  wait for 5 ns;
        end loop;
    end loop;
    
    clk <= '0'; reset <= '1'; wait for 2 ns; reset <= '0'; 
    x <= std_logic_vector(to_unsigned(input_data(9), x'length));
    valid_in <= '1';
    wait for 3 ns; clk <= '1';  wait for 5 ns;
    valid_in <= '0';
    for i in 6 downto 0 loop
        clk <= '0';  wait for 5 ns;
        clk <= '1';  wait for 5 ns;
    end loop;wait for 3 ns;
    
    for i in 10 to 11 loop
        x <= std_logic_vector(to_unsigned(input_data(i), x'length));
        valid_in <= '1';
        clk <= '0';  wait for 5 ns; clk <= '1';  wait for 5 ns;
        valid_in <= '0';
        for i in 6 downto 0 loop
            clk <= '0';  wait for 5 ns;
            clk <= '1';  wait for 5 ns;
        end loop;
    end loop; 
        
    end process;
end tb_arch;
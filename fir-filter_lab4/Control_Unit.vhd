library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity control_unit is
    port (
        clk : in std_logic;
        reset : in std_logic;
        valid_in: in std_logic;
        mac_init : out std_logic;
        valid_out_tmp: out std_logic := '0';
        we, en: out std_logic; 
        rom_address : out std_logic_vector(2 downto 0);
        ram_address : out std_logic_vector(2 downto 0)
    );
end entity control_unit;

architecture control_unit_arch of control_unit is
    signal counter : std_logic_vector(2 downto 0):="000";  -- Counter for ROM and RAM addressing
begin
    process (clk, reset)
    begin
        if reset = '1' then
            counter <= "000"; -- Reset counter
            valid_out_tmp <= '0';
        elsif rising_edge(clk) then
            if counter="000" then        
                valid_out_tmp <= '0';        
                if valid_in='1' then 
                    mac_init <= '1';
                    we <= '1'; en <= '1';
                    rom_address <= std_logic_vector(counter);
                    ram_address <= std_logic_vector(counter);
                    counter <= counter + 1;
                else
                    we <= '0'; en <= '0';
                    mac_init <= '1';
                end if;
             else
                we <= '0'; en <= '1';
                mac_init <= '0';
                rom_address <= std_logic_vector(counter);
                ram_address <= std_logic_vector(counter);
                if counter = "111" then valid_out_tmp <= '1'; else valid_out_tmp <= '0'; end if;
                counter <= counter + 1;
            end if;
        end if;
    end process;
end architecture control_unit_arch;
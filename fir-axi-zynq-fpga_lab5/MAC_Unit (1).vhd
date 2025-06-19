library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mac_unit is
    port (
        clk : in std_logic;
        rom_out : in std_logic_vector(7 downto 0); -- Coefficients from ROM
        ram_out : in std_logic_vector(7 downto 0); -- Input data from RAM
        mac_init : in std_logic;                   -- Initialization signal
        valid_out: out std_logic := '0';
        valid_out_tmp: in std_logic;
        y_out : out std_logic_vector(18 downto 0) -- Output data
    );
end entity mac_unit;

architecture mac_unit_arch of mac_unit is
 signal sum: std_logic_vector(18 downto 0);
 signal sig_valid: std_logic;
begin
    process (clk)
    begin
        if rising_edge(clk) then
            if mac_init = '1' then
                -- Reset accumulator
                sum <= "000" & rom_out*ram_out;
                valid_out <= '0';
            elsif mac_init = '0' then
                -- Perform MAC operation
                sum <= sum + ram_out*rom_out;
            end if;
           
            sig_valid <= valid_out_tmp;
            valid_out <= sig_valid;
            if sig_valid  ='1' then y_out <= sum; end if;
        end if;
    end process;
end mac_unit_arch;
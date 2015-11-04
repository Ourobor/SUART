library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift is

    port(   CLK         : in std_logic;
            SIN         : in std_logic;
            Y           : out std_logic_vector(7 downto 0));
end shift;

architecture OhBehave of shift is
begin
    process --behavioral section
    variable temp : std_logic_vector(7 downto 0);
    begin
        wait until rising_edge(CLK);
        for i in 0 to 6 loop
            temp(i) := temp(i+1);--shift all bits in temp to the left 1
        end loop;

        temp(7) := SIN; --Shift in the SIN value
        Y <= temp;
    end process;

end OhBehave;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--clock selector is just a fancy counter that counts to ten. But I am already buying one SIPO shift register and a MUX that has 4 ports,
--so lets do it this way, for fun

entity clockSelector is
    port(
        signal TGL, CLK : in std_logic;
        signal CLKOUT   : out std_logic
        );
end clockSelector

architecture Struct of clockSelector is
    
begin

end Struct;


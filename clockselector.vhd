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
    
component shift is
    
    port(   
    CLK         : in std_logic;
    SIN         : in std_logic;
    Y           : out std_logic_vector(7 downto 0));

end component;

component twotoonemux is

    port(
    signal X1, X2, S    : in Std_logic;
    signal Y            : out Std_logic);

end component;

begin

    
end Struct;


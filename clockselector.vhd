library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--clock selector is just a fancy counter that counts to ten. But I am already buying one SIPO shift register and a MUX that has 4 ports,
--so lets do it this way, for fun

entity clockSelector is
    port(
        signal TGL, CLK : in std_logic;
        signal CLKOUT   : out std_logic
        );
end clockSelector;

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

signal muxSelect, mux1out, CLK_Selected, CLK_Selected_Not : std_logic;
signal dummy : std_logic_vector(7 downto 1);

begin
    CLK_Selected_Not <= not CLK_Selected;
    CLKOUT <= CLK_Selected; -- hook up the output pin and we should be done!

    mux1 : twotoonemux
    port map(
        X1 => '1',
        X2 => '0',
        S => muxSelect,
        Y => mux1out);

    shift1 : shift
    port map(
        SIN => mux1out,
        CLK => CLK_Selected_Not, --this register is counting up for us every time we add a character, so we want it to finish when we release tgl, 
                            --not when we just added a bit to data
        Y(0) => muxSelect,
        Y(7 downto 1) => dummy); --modelsim whines if these aren't connected to at least something >.>


    mux2 : twotoonemux
    port map(
        X1 => TGL,
        X2 => CLK,
        S => muxSelect,
        Y => CLK_Selected);
		  
end Struct;


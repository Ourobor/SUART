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

signal muxSelect, mux1out, CLK_Selected, shift1out : std_logic;
signal dummy1 : std_logic_vector(7 downto 0);
signal dummy2 : std_logic_vector(7 downto 0);

begin
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
        CLK => CLK_Selected, --this register is counting up for us every time we add a character, so we want it to finish when we release tgl, 
                            --not when we just added a bit to data
--        Y(0) => shift1out,
        Y(7 downto 0) => dummy1); --modelsim whines if these aren't connected to at least something >.>

    shift2 : shift
    port map(
            SIN => dummy1(0),
            CLK => CLK_Selected,
            Y(7) => dummy2(7),
            Y(6) => dummy2(6),
            Y(5) => dummy2(5),
            Y(4) => muxSelect,
            Y(3) => dummy2(3),
            Y(2) => dummy2(2),
            Y(1) => dummy2(1),
            Y(0) => dummy2(0));

    mux2 : twotoonemux
    port map(
        X1 => TGL,
        X2 => CLK,
        S => muxSelect,
        Y => CLK_Selected);
		  
end Struct;


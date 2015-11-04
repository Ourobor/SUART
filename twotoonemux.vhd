library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity twotoonemux is
Port(
    signal X1, X2, S    : in Std_logic;
    signal Y            : out Std_logic);
end twotoonemux;

architecture OhBehave of twotoonemux is
begin
    Y <= X1 when (S = '0') else X2;
end OhBehave;

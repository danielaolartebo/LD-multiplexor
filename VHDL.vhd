library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity ent is
    port (
        a : in std_logic_vector (3 downto 0);
        b : in std_logic_vector (3 downto 0);
        mode : in std_logic_vector (2 downto 0);
        result : out std_logic_vector (3 downto 0)
    );
end entity ent;
architecture arch of ent is
begin   
    multiplexer : process (mode, a, b)
    begin
        if mode = "000" then
            result <= "0000";
        elsif mode = "001" then
            result <= "1111";
        elsif mode = "010" then
            result <= std_logic_vector(signed(a) - signed(b));
        elsif mode = "011" then
            result <= std_logic_vector(signed(a) + signed(b));
        elsif mode = "100" then
            result <= a and b;
        elsif mode = "101" then
            result <= not(a and b);
        elsif mode = "110" then
            result <= a or b;
        else    
            result <= not(a or b);
        end if;
    end process;
end architecture arch;

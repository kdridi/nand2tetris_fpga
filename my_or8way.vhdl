LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_or8way IS
    PORT (
        i : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        o : OUT STD_LOGIC
    );
END my_or8way;

ARCHITECTURE behavioral OF my_or8way IS
    COMPONENT my_or
        PORT (
            a, b : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;
    SIGNAL t : STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
    gate_00 : my_or PORT MAP (i(0), i(1), t(0));
    gate_01 : my_or PORT MAP (i(2), t(0), t(1));
    gate_02 : my_or PORT MAP (i(3), t(1), t(2));
    gate_03 : my_or PORT MAP (i(4), t(2), t(3));
    gate_04 : my_or PORT MAP (i(5), t(3), t(4));
    gate_05 : my_or PORT MAP (i(6), t(4), t(5));
    gate_06 : my_or PORT MAP (i(7), t(5), o);
END behavioral;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_half_adder IS
    PORT (
        a, b : IN STD_LOGIC;
        o, c : OUT STD_LOGIC
    );
END my_half_adder;

ARCHITECTURE behavioral OF my_half_adder IS
    COMPONENT my_and
        PORT (
            a, b : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT my_xor
        PORT (
            a, b : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;
    SIGNAL not_a, not_b, not_o : STD_LOGIC;
BEGIN
    xor_gate : my_xor PORT MAP (a, b, o);
    and_gate : my_and PORT MAP (a, b, c);
END behavioral;
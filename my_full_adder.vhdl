LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_full_adder IS
    PORT (
        a, b, ci : IN STD_LOGIC;
        o, co : OUT STD_LOGIC
    );
END my_full_adder;

ARCHITECTURE behavioral OF my_full_adder IS
    COMPONENT my_half_adder
        PORT (
            a, b : IN STD_LOGIC;
            o, c : OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT my_or
        PORT (
            a, b : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;
    SIGNAL o1, c1, c2 : STD_LOGIC;
BEGIN
    half_adder_1 : my_half_adder PORT MAP(a, b, o1, c1);
    half_adder_2 : my_half_adder PORT MAP(o1, ci, o, c2);
    or_gate : my_or PORT MAP(c1, c2, co);
END behavioral;
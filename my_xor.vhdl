LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_xor IS
    PORT (
        a, b : IN STD_LOGIC;
        o : OUT STD_LOGIC
    );
END my_xor;

ARCHITECTURE behavioral OF my_xor IS
    COMPONENT my_and
        PORT (
            a, b : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT my_or
        PORT (
            a, b : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT my_not
        PORT (
            i : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;
    SIGNAL not_a, not_b, not_a_and_b, a_and_not_b : STD_LOGIC;
BEGIN
    not_a_gate : my_not PORT MAP(a, not_a);
    not_b_gate : my_not PORT MAP(b, not_b);
    not_a_and_b_gate : my_and PORT MAP(not_a, b, not_a_and_b);
    a_and_not_b_gate : my_and PORT MAP(a, not_b, a_and_not_b);
    or_gate : my_or PORT MAP(not_a_and_b, a_and_not_b, o);
END behavioral;
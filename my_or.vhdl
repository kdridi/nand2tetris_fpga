LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_or IS
    PORT (
        a, b : IN STD_LOGIC;
        o : OUT STD_LOGIC
    );
END my_or;

ARCHITECTURE behavioral OF my_or IS
    COMPONENT my_and
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
    SIGNAL not_a, not_b, not_o : STD_LOGIC;
BEGIN
    not_a_gate : my_not PORT MAP(a, not_a);
    not_b_gate : my_not PORT MAP(b, not_b);
    and_gate : my_and PORT MAP(not_a, not_b, not_o);
    not_o_gate : my_not PORT MAP(not_o, o);
END behavioral;

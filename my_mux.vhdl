LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_mux IS
    PORT (
        a, b, sel : IN STD_LOGIC;
        o : OUT STD_LOGIC
    );
END my_mux;

ARCHITECTURE behavioral OF my_mux IS
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
    SIGNAL sel_a, sel_b, not_sel : STD_LOGIC;
BEGIN
    sel_not : my_not PORT MAP(sel, not_sel);
    a_and : my_and PORT MAP(a, not_sel, sel_a);
    b_and : my_and PORT MAP(b, sel, sel_b);
    o_or : my_or PORT MAP(sel_a, sel_b, o);
END behavioral;
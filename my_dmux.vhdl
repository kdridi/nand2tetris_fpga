LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_dmux IS
    PORT (
        i, sel : IN STD_LOGIC;
        a, b : OUT STD_LOGIC
    );
END my_dmux;

ARCHITECTURE behavioral OF my_dmux IS
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
    SIGNAL sel_a, sel_b, not_sel : STD_LOGIC;
BEGIN
    sel_not : my_not PORT MAP(sel, not_sel);
    a_and : my_and PORT MAP(i, not_sel, a);
    b_and : my_and PORT MAP(i, sel, b);
END behavioral;
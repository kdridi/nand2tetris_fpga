LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_and IS
    PORT (
        a, b : IN STD_LOGIC;
        o : OUT STD_LOGIC
    );
END my_and;

ARCHITECTURE behavioral OF my_and IS
    COMPONENT my_nand
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
    SIGNAL not_o : STD_LOGIC;
BEGIN
    nand_gate : my_nand PORT MAP(a, b, not_o);
    not_gate : my_not PORT MAP(not_o, o);
END behavioral;
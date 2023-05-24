LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_not IS
    PORT (
        i : IN STD_LOGIC;
        o : OUT STD_LOGIC
    );
END my_not;

ARCHITECTURE behavioral OF my_not IS
    COMPONENT my_nand
        PORT (
            a, b : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;
BEGIN
    structure : my_nand PORT MAP(i, i, o);
END behavioral;

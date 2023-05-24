LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_nand IS
    PORT (
        a, b : IN STD_LOGIC;
        o : OUT STD_LOGIC
    );
END my_nand;

ARCHITECTURE structural OF my_nand IS
    SIGNAL
    c : STD_LOGIC;
BEGIN
    c <= a AND b;
    o <= NOT c;
END structural;

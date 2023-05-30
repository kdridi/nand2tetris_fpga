LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_inc16 IS
    PORT (
        a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        c : OUT STD_LOGIC
    );
END my_inc16;

ARCHITECTURE behavioral OF my_inc16 IS
    COMPONENT my_add16
        PORT (
            a, b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            c : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL one : STD_LOGIC_VECTOR(15 DOWNTO 0) := "0000000000000001";
BEGIN
    inc : my_add16 PORT MAP (a, one, o, c);
END behavioral;
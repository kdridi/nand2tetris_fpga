LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_not_testbench IS
END my_not_testbench;

ARCHITECTURE behavioral OF my_not_testbench IS
    COMPONENT my_not
        PORT (
            i : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL i, o : STD_LOGIC;
BEGIN
    structure : my_not PORT MAP(i, o);

    PROCESS
    BEGIN

        i <= '0';
        WAIT FOR 10 ns;

        i <= '1';
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;
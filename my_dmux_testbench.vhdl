LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_dmux_testbench IS
END my_dmux_testbench;

ARCHITECTURE behavioral OF my_dmux_testbench IS
    COMPONENT my_dmux
        PORT (
            i : IN STD_LOGIC;
            sel : IN STD_LOGIC;
            a, b : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL i : STD_LOGIC;
    SIGNAL sel : STD_LOGIC;
    SIGNAL a_actual, b_actual : STD_LOGIC;
    SIGNAL a_expected, b_expected : STD_LOGIC;
BEGIN
    bench : my_dmux PORT MAP(i, sel, a_actual, b_actual);

    PROCESS
    BEGIN

        sel <= '0';
        i <= '0';
        a_expected <= '0';
        b_expected <= '0';
        WAIT FOR 10 ns;

        sel <= '0';
        i <= '1';
        a_expected <= '1';
        b_expected <= '0';
        WAIT FOR 10 ns;

        sel <= '1';
        i <= '0';
        a_expected <= '0';
        b_expected <= '0';
        WAIT FOR 10 ns;

        sel <= '1';
        i <= '1';
        a_expected <= '0';
        b_expected <= '1';
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;
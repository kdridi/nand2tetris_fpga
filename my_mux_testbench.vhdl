LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_mux_testbench IS
END my_mux_testbench;

ARCHITECTURE behavioral OF my_mux_testbench IS
    COMPONENT my_mux
        PORT (
            a, b : IN STD_LOGIC;
            sel : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL a, b : STD_LOGIC;
    SIGNAL sel : STD_LOGIC;
    SIGNAL o_actual : STD_LOGIC;
    SIGNAL o_expected : STD_LOGIC;
BEGIN
    bench : my_mux PORT MAP(a, b, sel, o_actual);

    PROCESS
    BEGIN

        a <= '0';
        b <= '0';
        sel <= '0';
        o_expected <= '0';
        WAIT FOR 10 ns;

        a <= '0';
        b <= '1';
        sel <= '0';
        o_expected <= '0';
        WAIT FOR 10 ns;

        a <= '1';
        b <= '0';
        sel <= '0';
        o_expected <= '1';
        WAIT FOR 10 ns;

        a <= '1';
        b <= '1';
        sel <= '0';
        o_expected <= '1';
        WAIT FOR 10 ns;

        a <= '0';
        b <= '0';
        sel <= '1';
        o_expected <= '0';
        WAIT FOR 10 ns;

        a <= '0';
        b <= '1';
        sel <= '1';
        o_expected <= '1';
        WAIT FOR 10 ns;

        a <= '1';
        b <= '0';
        sel <= '1';
        o_expected <= '0';
        WAIT FOR 10 ns;

        a <= '1';
        b <= '1';
        sel <= '1';
        o_expected <= '1';
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_half_adder_testbench IS
END my_half_adder_testbench;

ARCHITECTURE behavioral OF my_half_adder_testbench IS
    COMPONENT my_half_adder
        PORT (
            a, b : IN STD_LOGIC;
            o : OUT STD_LOGIC;
            c : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL a, b : STD_LOGIC;
    SIGNAL o_actual : STD_LOGIC;
    SIGNAL c_actual : STD_LOGIC;
    SIGNAL o_expected : STD_LOGIC;
    SIGNAL c_expected : STD_LOGIC;
BEGIN
    bench : my_half_adder PORT MAP(a, b, o_actual, c_actual);

    PROCESS
    BEGIN

        a <= '0';
        b <= '0';
        o_expected <= '0';
        c_expected <= '0';
        WAIT FOR 10 ns;

        a <= '0';
        b <= '1';
        o_expected <= '1';
        c_expected <= '0';
        WAIT FOR 10 ns;

        a <= '1';
        b <= '0';
        o_expected <= '1';
        c_expected <= '0';
        WAIT FOR 10 ns;

        a <= '1';
        b <= '1';
        o_expected <= '0';
        c_expected <= '1';
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;
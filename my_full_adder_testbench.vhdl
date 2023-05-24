LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_full_adder_testbench IS
END my_full_adder_testbench;

ARCHITECTURE behavioral OF my_full_adder_testbench IS
    COMPONENT my_full_adder
        PORT (
            a, b, ci : IN STD_LOGIC;
            o, co : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL a, b, ci, o, co : STD_LOGIC;
BEGIN
    bench : my_full_adder PORT MAP(a, b, ci, o, co);

    PROCESS
    BEGIN

        a <= '0';
        b <= '0';
        ci <= '0';
        WAIT FOR 10 ns;

        a <= '0';
        b <= '1';
        ci <= '0';
        WAIT FOR 10 ns;

        a <= '1';
        b <= '0';
        ci <= '0';
        WAIT FOR 10 ns;

        a <= '1';
        b <= '1';
        ci <= '0';
        WAIT FOR 10 ns;

        a <= '0';
        b <= '0';
        ci <= '1';
        WAIT FOR 10 ns;

        a <= '0';
        b <= '1';
        ci <= '1';
        WAIT FOR 10 ns;

        a <= '1';
        b <= '0';
        ci <= '1';
        WAIT FOR 10 ns;

        a <= '1';
        b <= '1';
        ci <= '1';
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;
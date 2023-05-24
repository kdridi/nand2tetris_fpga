LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_half_adder_testbench IS
END my_half_adder_testbench;

ARCHITECTURE behavioral OF my_half_adder_testbench IS
    COMPONENT my_half_adder
        PORT (
            a, b : IN STD_LOGIC;
            o, c : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL a, b, o, c : STD_LOGIC;
BEGIN
    bench : my_half_adder PORT MAP(a, b, o, c);

    PROCESS
    BEGIN

        a <= '0';
        b <= '0';
        WAIT FOR 10 ns;

        a <= '0';
        b <= '1';
        WAIT FOR 10 ns;

        a <= '1';
        b <= '0';
        WAIT FOR 10 ns;

        a <= '1';
        b <= '1';
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;
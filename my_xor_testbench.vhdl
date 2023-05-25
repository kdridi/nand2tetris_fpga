LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_xor_testbench IS
END my_xor_testbench;

ARCHITECTURE behavioral OF my_xor_testbench IS
    COMPONENT my_xor
        PORT (
            a, b : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL a, b, o : STD_LOGIC;
BEGIN
    bench : my_xor PORT MAP(a, b, o);

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
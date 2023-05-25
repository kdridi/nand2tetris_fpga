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

    SIGNAL i : STD_LOGIC;
    SIGNAL o_actual : STD_LOGIC;
    SIGNAL o_exptected : STD_LOGIC;
BEGIN
    bench : my_not PORT MAP(i, o_actual);

    PROCESS
    BEGIN

        i <= '0';
        o_exptected <= '1';
        WAIT FOR 10 ns;

        i <= '1';
        o_exptected <= '0';
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;
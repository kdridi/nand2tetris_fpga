LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_dff IS
    PORT (
        clk : IN STD_LOGIC;
        i : IN STD_LOGIC;
        o : OUT STD_LOGIC
    );
END my_dff;

ARCHITECTURE my_dff_architecture OF my_dff IS
    SIGNAL i_value : STD_LOGIC := 'U';
BEGIN
    o <= i_value;

    PROCESS (clk)
    BEGIN
        IF (rising_edge(clk)) THEN
            i_value <= i;
        END IF;
    END PROCESS;

END my_dff_architecture;
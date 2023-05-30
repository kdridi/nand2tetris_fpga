LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_bit IS
    PORT (
        clk : IN STD_LOGIC;
        i, load : IN STD_LOGIC;
        o : OUT STD_LOGIC
    );
END my_bit;

ARCHITECTURE my_bit_architecture OF my_bit IS
    COMPONENT my_dff IS
        PORT (
            clk : IN STD_LOGIC;
            i : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT my_mux IS
        PORT (
            a, b : IN STD_LOGIC;
            sel : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL mux_o, dff_o : STD_LOGIC;

BEGIN

    dff : my_dff PORT MAP (clk, mux_o, dff_o);
    mux : my_mux PORT MAP (dff_o, i, load, mux_o);
    o <= dff_o;

END my_bit_architecture;
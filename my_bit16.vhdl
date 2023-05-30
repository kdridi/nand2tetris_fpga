LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_bit16 IS
    PORT (
        clk : IN STD_LOGIC;
        load : IN STD_LOGIC;
        i : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        o : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
    );
END my_bit16;

ARCHITECTURE my_bit16_architecture OF my_bit16 IS
    COMPONENT my_bit IS
        PORT (
            clk : IN STD_LOGIC;
            load : IN STD_LOGIC;
            i : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;
BEGIN

    bit_00 : my_bit PORT MAP (clk, load, i(0), o(0));
    bit_01 : my_bit PORT MAP (clk, load, i(1), o(1));
    bit_02 : my_bit PORT MAP (clk, load, i(2), o(2));
    bit_03 : my_bit PORT MAP (clk, load, i(3), o(3));
    bit_04 : my_bit PORT MAP (clk, load, i(4), o(4));
    bit_05 : my_bit PORT MAP (clk, load, i(5), o(5));
    bit_06 : my_bit PORT MAP (clk, load, i(6), o(6));
    bit_07 : my_bit PORT MAP (clk, load, i(7), o(7));
    bit_08 : my_bit PORT MAP (clk, load, i(8), o(8));
    bit_09 : my_bit PORT MAP (clk, load, i(9), o(9));
    bit_10 : my_bit PORT MAP (clk, load, i(10), o(10));
    bit_11 : my_bit PORT MAP (clk, load, i(11), o(11));
    bit_12 : my_bit PORT MAP (clk, load, i(12), o(12));
    bit_13 : my_bit PORT MAP (clk, load, i(13), o(13));
    bit_14 : my_bit PORT MAP (clk, load, i(14), o(14));
    bit_15 : my_bit PORT MAP (clk, load, i(15), o(15));

END my_bit16_architecture;
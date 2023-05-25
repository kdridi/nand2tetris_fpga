LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_mux16_testbench IS
END my_mux16_testbench;

ARCHITECTURE behavioral OF my_mux16_testbench IS
    COMPONENT my_mux16
        PORT (
            a, b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC;
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL a, b : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sel : STD_LOGIC;
    SIGNAL o_actual : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL o_expected : STD_LOGIC_VECTOR(15 DOWNTO 0);

    TYPE test_case IS RECORD
        a, b : STD_LOGIC_VECTOR(15 DOWNTO 0);
        sel : STD_LOGIC;
        o : STD_LOGIC_VECTOR(15 DOWNTO 0);
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- a, b, sel, o
        (a => "1111111100011101", b => "0001001001010010", sel => '0', o => "1111111100011101"),
        (a => "0001111010011010", b => "1100110010010010", sel => '1', o => "1100110010010010"),
        (a => "1010010100001100", b => "0010101000010101", sel => '0', o => "1010010100001100"),
        (a => "1100011110110000", b => "1101101101011111", sel => '1', o => "1101101101011111"),
        (a => "0000000010100000", b => "0101001111011000", sel => '0', o => "0000000010100000"),
        (a => "0001100001010101", b => "0110010111110000", sel => '1', o => "0110010111110000"),
        (a => "1110100110000011", b => "0001111011001010", sel => '0', o => "1110100110000011"),
        (a => "0010010101000010", b => "1101000100001100", sel => '1', o => "1101000100001100"),
        (a => "0000011000000011", b => "0100111000100011", sel => '0', o => "0000011000000011"),
        (a => "0101101110110010", b => "0100110111010100", sel => '1', o => "0100110111010100"),
        (a => "1100010011110000", b => "0101010111111001", sel => '0', o => "1100010011110000"),
        (a => "1011101101101010", b => "0001010111011010", sel => '1', o => "0001010111011010"),
        (a => "0100001110001001", b => "1010010010110011", sel => '0', o => "0100001110001001"),
        (a => "1000110111110110", b => "1000000010001100", sel => '1', o => "1000000010001100"),
        (a => "0000000110010000", b => "1010111110101110", sel => '0', o => "0000000110010000"),
        (a => "1110110011010000", b => "0000000010101101", sel => '1', o => "0000000010101101")
    );

    FUNCTION slv_to_string (slv : STD_LOGIC_VECTOR) RETURN STRING IS
        VARIABLE str : STRING (slv'length - 1 DOWNTO 1) := (OTHERS => NUL);
    BEGIN
        FOR n IN slv'length - 1 DOWNTO 1 LOOP
            str(n) := STD_LOGIC'image(slv((n - 1)))(2);
        END LOOP;
        RETURN str;
    END FUNCTION;

BEGIN
    bench : my_mux16 PORT MAP(a, b, sel, o_actual);

    PROCESS
    BEGIN

        FOR n IN test_cases'RANGE LOOP
            a <= test_cases(n).a;
            b <= test_cases(n).b;
            sel <= test_cases(n).sel;
            o_expected <= test_cases(n).o;

            WAIT FOR 10 ns;

            ASSERT (o_actual = o_expected)
            REPORT "test failed for " &
                "a = " & slv_to_string(a) &
                ", b = " & slv_to_string(b) &
                ", sel = " & STD_LOGIC'image(sel) &
                ". expected o = " & slv_to_string(o_expected) &
                ", got " & slv_to_string(o_actual) SEVERITY error;
        END LOOP;
        WAIT;

    END PROCESS;

END behavioral;
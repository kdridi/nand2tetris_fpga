LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_add16_testbench IS
END my_add16_testbench;

ARCHITECTURE behavioral OF my_add16_testbench IS
    COMPONENT my_add16
        PORT (
            a, b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            c : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL a, b : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL o_actual : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL o_expected : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL c_actual : STD_LOGIC;
    SIGNAL c_expected : STD_LOGIC;

    TYPE test_case IS RECORD
        a, b : STD_LOGIC_VECTOR(15 DOWNTO 0);
        o : STD_LOGIC_VECTOR(15 DOWNTO 0);
        c : STD_LOGIC;
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- a, b, o, c
        (a => "1011010001110000", b => "0101000101000100", o => "0000010110110100", c => '1'),
        (a => "0000111100010111", b => "1111100011001011", o => "0000011111100010", c => '1'),
        (a => "0001101111011000", b => "0111110111011111", o => "1001100110110111", c => '0'),
        (a => "0111000001000100", b => "0111110100101011", o => "1110110101101111", c => '0'),
        (a => "0110010011011111", b => "1001011111110111", o => "1111110011010110", c => '0'),
        (a => "1101110011100011", b => "0001110011000000", o => "1111100110100011", c => '0'),
        (a => "1100011001100000", b => "0111011010111011", o => "0011110100011011", c => '1'),
        (a => "0000100001101111", b => "0010110010110011", o => "0011010100100010", c => '0'),
        (a => "1001100100100001", b => "1001010111101001", o => "0010111100001010", c => '1'),
        (a => "1111001111011110", b => "0101100000001000", o => "0100101111100110", c => '1'),
        (a => "1110011001110001", b => "1001010011010100", o => "0111101101000101", c => '1'),
        (a => "1111010100100001", b => "0101001111000001", o => "0100100011100010", c => '1'),
        (a => "1011100101000101", b => "0110110110000010", o => "0010011011000111", c => '1'),
        (a => "0111010101101010", b => "0111010000111100", o => "1110100110100110", c => '0'),
        (a => "0010111101001000", b => "1110001011101010", o => "0001001000110010", c => '1'),
        (a => "0110100001111010", b => "1110001110111001", o => "0100110000110011", c => '1')
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
    bench : my_add16 PORT MAP(a, b, o_actual, c_actual);

    PROCESS
    BEGIN

        FOR n IN test_cases'RANGE LOOP
            a <= test_cases(n).a;
            b <= test_cases(n).b;
            o_expected <= test_cases(n).o;
            c_expected <= test_cases(n).c;

            WAIT FOR 10 ns;

            ASSERT (o_actual = o_expected AND c_actual = c_expected)
            REPORT "test failed for " &
                "a = " & slv_to_string(a) &
                ", b = " & slv_to_string(b) &
                ". expected o = " & slv_to_string(o_expected) &
                ", got " & slv_to_string(o_actual) &
                ". expected c = " & STD_LOGIC'image(c_expected) &
                ", got " & STD_LOGIC'image(c_actual) SEVERITY error;
        END LOOP;
        WAIT;

    END PROCESS;

END behavioral;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_or16_testbench IS
END my_or16_testbench;

ARCHITECTURE behavioral OF my_or16_testbench IS
    COMPONENT my_or16
        PORT (
            a, b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL a, b : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL o_actual : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL o_expected : STD_LOGIC_VECTOR(15 DOWNTO 0);

    TYPE test_case IS RECORD
        a, b : STD_LOGIC_VECTOR(15 DOWNTO 0);
        o : STD_LOGIC_VECTOR(15 DOWNTO 0);
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- a, b, o
        (a => "0000000000000000", b => "0000000000000000", o => "0000000000000000"),
        (a => "0000000000000000", b => "1111111111111111", o => "1111111111111111"),
        (a => "1111111111111111", b => "0000000000000000", o => "1111111111111111"),
        (a => "1111111111111111", b => "1111111111111111", o => "1111111111111111"),
        -- generated test cases
        (a => "1011000100001111", b => "0100100000001010", o => "1111100100001111"),
        (a => "0011011101101101", b => "0111100110001010", o => "0111111111101111"),
        (a => "1010101101011100", b => "1111101000111110", o => "1111101101111110"),
        (a => "0011000101101011", b => "1001111111000001", o => "1011111111101011"),
        (a => "0010011001000110", b => "1111100000100101", o => "1111111001100111"),
        (a => "0011100101111111", b => "1100100111011100", o => "1111100111111111"),
        (a => "0010000101111111", b => "0001010100111101", o => "0011010101111111"),
        (a => "1001000100000100", b => "1101111010011100", o => "1101111110011100"),
        (a => "0111101000101000", b => "0001101100011110", o => "0111101100111110"),
        (a => "0011011011001101", b => "1111010101100110", o => "1111011111101111"),
        (a => "0111010001000110", b => "0001111001001010", o => "0111111001001110"),
        (a => "1010011001001111", b => "0111111010010101", o => "1111111011011111"),
        (a => "1011111111110000", b => "1100001110000011", o => "1111111111110011"),
        (a => "1000010100110100", b => "1110110110101000", o => "1110110110111100"),
        (a => "1011110010011111", b => "1111100001110000", o => "1111110011111111"),
        (a => "1110110100001101", b => "0110110110101110", o => "1110110110101111")
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
    bench : my_or16 PORT MAP(a, b, o_actual);

    PROCESS
    BEGIN

        FOR n IN test_cases'RANGE LOOP
            a <= test_cases(n).a;
            b <= test_cases(n).b;
            o_expected <= test_cases(n).o;

            WAIT FOR 10 ns;

            ASSERT (o_actual = o_expected)
            REPORT "test failed for " &
                "a = " & slv_to_string(a) &
                ", b = " & slv_to_string(b) &
                ". expected o = " & slv_to_string(o_expected) &
                ", got " & slv_to_string(o_actual) SEVERITY error;
        END LOOP;
        WAIT;

    END PROCESS;

END behavioral;
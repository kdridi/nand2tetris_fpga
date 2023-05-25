LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_mux4way16_testbench IS
END my_mux4way16_testbench;

ARCHITECTURE behavioral OF my_mux4way16_testbench IS
    COMPONENT my_mux4way16
        PORT (
            a, b, c, d : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL a, b, c, d : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sel : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL o_actual : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL o_expected : STD_LOGIC_VECTOR(15 DOWNTO 0);

    TYPE test_case IS RECORD
        a, b, c, d : STD_LOGIC_VECTOR(15 DOWNTO 0);
        sel : STD_LOGIC_VECTOR(1 DOWNTO 0);
        o : STD_LOGIC_VECTOR(15 DOWNTO 0);
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- a, b, c, d, sel, o
        (a => "1100100100000000", b => "0110100101110000", c => "0100011101000110", d => "0011111100100101", sel => "00", o => "1100100100000000"),
        (a => "1000000011100000", b => "0101111111110110", c => "0101101011010011", d => "1111011111000110", sel => "01", o => "0101111111110110"),
        (a => "1100101011001100", b => "1001101110111100", c => "0000101101100010", d => "1000010110110001", sel => "10", o => "0000101101100010"),
        (a => "0010110010010100", b => "1001101101111000", c => "0111111101110011", d => "0010111001110110", sel => "11", o => "0010111001110110"),
        (a => "0000100101101111", b => "0011000011111110", c => "1110000010000100", d => "1000001100111000", sel => "00", o => "0000100101101111"),
        (a => "1100000011000101", b => "1011000100010111", c => "1100110000011000", d => "1010011000000000", sel => "01", o => "1011000100010111"),
        (a => "1011001010110101", b => "1000010010001011", c => "0001110011110100", d => "1110110100010011", sel => "10", o => "0001110011110100"),
        (a => "0001110010000000", b => "1011000110110001", c => "0100000101010010", d => "1110010110000001", sel => "11", o => "1110010110000001"),
        (a => "0001101100100010", b => "1000100010011000", c => "0010010010100110", d => "1001110000000010", sel => "00", o => "0001101100100010"),
        (a => "1110100010001110", b => "0111111101111001", c => "1001001111001001", d => "1011001101011011", sel => "01", o => "0111111101111001"),
        (a => "0001101100110101", b => "1001111100101011", c => "0011100100001100", d => "0100011111001001", sel => "10", o => "0011100100001100"),
        (a => "0011101010100100", b => "1011100001111111", c => "0111011001000000", d => "0100010000010011", sel => "11", o => "0100010000010011"),
        (a => "1110100101111101", b => "0101011011000100", c => "1100011101001100", d => "1010101001000010", sel => "00", o => "1110100101111101"),
        (a => "0000011111011100", b => "1001001101100100", c => "0101000001000010", d => "1011101010010001", sel => "01", o => "1001001101100100"),
        (a => "0001011111110000", b => "0110110100110110", c => "1010011110100100", d => "0011010001110000", sel => "10", o => "1010011110100100"),
        (a => "0001111011100111", b => "1110100011110110", c => "0001100111110001", d => "0011101000001001", sel => "11", o => "0011101000001001")
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
    bench : my_mux4way16 PORT MAP(a, b, c, d, sel, o_actual);

    PROCESS
    BEGIN

        FOR n IN test_cases'RANGE LOOP
            a <= test_cases(n).a;
            b <= test_cases(n).b;
            c <= test_cases(n).c;
            d <= test_cases(n).d;
            sel <= test_cases(n).sel;
            o_expected <= test_cases(n).o;

            WAIT FOR 10 ns;

            ASSERT (o_actual = o_expected)
            REPORT "test failed for " &
                "a = " & slv_to_string(a) &
                ", b = " & slv_to_string(b) &
                ", c = " & slv_to_string(c) &
                ", d = " & slv_to_string(d) &
                ", sel = " & slv_to_string(sel) &
                ". expected o = " & slv_to_string(o_expected) &
                ", got " & slv_to_string(o_actual) SEVERITY error;
        END LOOP;
        WAIT;

    END PROCESS;

END behavioral;
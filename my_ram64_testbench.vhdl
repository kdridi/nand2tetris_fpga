LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_ram64_testbench IS
END my_ram64_testbench;

ARCHITECTURE behavioral OF my_ram64_testbench IS
    COMPONENT my_ram64
        PORT (
            clk : IN STD_LOGIC;
            load : IN STD_LOGIC;
            i : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
            sel : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL previous : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL clk : STD_LOGIC;
    SIGNAL load : STD_LOGIC;
    SIGNAL i : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL sel : STD_LOGIC_VECTOR (5 DOWNTO 0);
    SIGNAL o_actual : STD_LOGIC_VECTOR (15 DOWNTO 0);
    SIGNAL o_expected : STD_LOGIC_VECTOR (15 DOWNTO 0);

    CONSTANT clk_period : TIME := 10 ns;

    TYPE test_case IS RECORD
        previous : STD_LOGIC_VECTOR (15 DOWNTO 0);
        load : STD_LOGIC;
        i : STD_LOGIC_VECTOR (15 DOWNTO 0);
        sel : STD_LOGIC_VECTOR (5 DOWNTO 0);
        o : STD_LOGIC_VECTOR (15 DOWNTO 0);
    END RECORD;

    TYPE test_case_array IS ARRAY (NATURAL RANGE <>) OF test_case;
    CONSTANT test_cases : test_case_array := (
        -- previous, load, i, sel, o
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1110111001000000", sel => "001110", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1010101000110101", sel => "111110", o => "1010101000110101"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0110100101011010", sel => "001111", o => "0110100101011010"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0010100010000101", sel => "101111", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1100011011000101", sel => "110111", o => "1100011011000101"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0110101110000100", sel => "101111", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1100101110010100", sel => "111011", o => "1100101110010100"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1000100100001101", sel => "010001", o => "1000100100001101"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1110011100111001", sel => "110101", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1010101100000100", sel => "100100", o => "1010101100000100"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0001101101010010", sel => "111111", o => "UUUUUUUUUUUUUUUU"),
        (previous => "1100101110010100", load => '1', i => "1010111010010000", sel => "111011", o => "1010111010010000"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0110110100011111", sel => "101101", o => "0110110100011111"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0001100010001110", sel => "010010", o => "0001100010001110"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0001001010000101", sel => "101011", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1011101010110101", sel => "011010", o => "1011101010110101"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0100111110110000", sel => "000000", o => "0100111110110000"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1100010101000001", sel => "101010", o => "1100010101000001"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1000011111110110", sel => "000001", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0010010100011010", sel => "000010", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1100000101011010", sel => "100001", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0011000111010101", sel => "000001", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1011111010000010", sel => "010111", o => "1011111010000010"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1111011010010101", sel => "000110", o => "UUUUUUUUUUUUUUUU"),
        (previous => "1010111010010000", load => '1', i => "1000000100000000", sel => "111011", o => "1000000100000000"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1100011101011010", sel => "110110", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0100011100011011", sel => "110101", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0100100000000101", sel => "001000", o => "0100100000000101"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0100001101000110", sel => "101001", o => "0100001101000110"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0010101101001000", sel => "000100", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0101101001101010", sel => "100010", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1011111011101011", sel => "010011", o => "1011111011101011"),
        (previous => "1011111011101011", load => '0', i => "0000001100000010", sel => "010011", o => "1011111011101011"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1001000000001001", sel => "110011", o => "1001000000001001"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1000111010000100", sel => "100001", o => "1000111010000100"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1100010100111010", sel => "010100", o => "1100010100111010"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1001111110101111", sel => "111101", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1110100101111000", sel => "010101", o => "1110100101111000"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0010101110100001", sel => "101111", o => "UUUUUUUUUUUUUUUU"),
        (previous => "1010101000110101", load => '0', i => "0100110101100101", sel => "111110", o => "1010101000110101"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1111100111001000", sel => "101000", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0100110000011011", sel => "101100", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1111001011101110", sel => "000110", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0101101101100001", sel => "100010", o => "0101101101100001"),
        (previous => "1011111011101011", load => '0', i => "1001111000000010", sel => "010011", o => "1011111011101011"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1100110101010111", sel => "000100", o => "UUUUUUUUUUUUUUUU"),
        (previous => "0110100101011010", load => '0', i => "1010010000010100", sel => "001111", o => "0110100101011010"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0111000111101001", sel => "110110", o => "UUUUUUUUUUUUUUUU"),
        (previous => "1000111010000100", load => '1', i => "1111110000011000", sel => "100001", o => "1111110000011000"),
        (previous => "1011111011101011", load => '1', i => "1100101010010111", sel => "010011", o => "1100101010010111"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0000001001111111", sel => "001110", o => "0000001001111111"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0110010100101100", sel => "110010", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0010010001110010", sel => "000010", o => "UUUUUUUUUUUUUUUU"),
        (previous => "1110100101111000", load => '0', i => "1111111011010100", sel => "010101", o => "1110100101111000"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1110101011100111", sel => "110000", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0110100110101011", sel => "010000", o => "0110100110101011"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0100001001111010", sel => "101011", o => "0100001001111010"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1011110001110000", sel => "110101", o => "1011110001110000"),
        (previous => "1100011011000101", load => '1', i => "0001111110010010", sel => "110111", o => "0001111110010010"),
        (previous => "1011101010110101", load => '0', i => "1010111100100101", sel => "011010", o => "1011101010110101"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1001011001110011", sel => "100011", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0010111111100110", sel => "110100", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0011101001101000", sel => "100000", o => "UUUUUUUUUUUUUUUU"),
        (previous => "1000000100000000", load => '0', i => "1011100011111101", sel => "111011", o => "1000000100000000"),
        (previous => "0001111110010010", load => '1', i => "0011101110101110", sel => "110111", o => "0011101110101110"),
        (previous => "1011110001110000", load => '0', i => "0101000011111110", sel => "110101", o => "1011110001110000"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1011111000101001", sel => "001011", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0010001011011110", sel => "110100", o => "0010001011011110"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0110100010010101", sel => "000111", o => "0110100010010101"),
        (previous => "1001000000001001", load => '0', i => "1011101011110000", sel => "110011", o => "1001000000001001"),
        (previous => "1011110001110000", load => '0', i => "0110011101010011", sel => "110101", o => "1011110001110000"),
        (previous => "0011101110101110", load => '0', i => "0110011110001000", sel => "110111", o => "0011101110101110"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0000011110101000", sel => "100101", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0011101010100011", sel => "000101", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0101101111011010", sel => "111001", o => "UUUUUUUUUUUUUUUU"),
        (previous => "1100010100111010", load => '0', i => "0000100101010000", sel => "010100", o => "1100010100111010"),
        (previous => "1011101010110101", load => '0', i => "0001000001011011", sel => "011010", o => "1011101010110101"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0001010100001111", sel => "011011", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1000100101010111", sel => "001100", o => "UUUUUUUUUUUUUUUU"),
        (previous => "0110100101011010", load => '0', i => "0110100101001010", sel => "001111", o => "0110100101011010"),
        (previous => "0011101110101110", load => '1', i => "0111111101111111", sel => "110111", o => "0111111101111111"),
        (previous => "1100101010010111", load => '1', i => "1100111001110111", sel => "010011", o => "1100111001110111"),
        (previous => "1110100101111000", load => '0', i => "1011101101011100", sel => "010101", o => "1110100101111000"),
        (previous => "0100111110110000", load => '1', i => "0110101010100010", sel => "000000", o => "0110101010100010"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1101101100011011", sel => "101000", o => "UUUUUUUUUUUUUUUU"),
        (previous => "1010101000110101", load => '0', i => "1111011110110000", sel => "111110", o => "1010101000110101"),
        (previous => "0001100010001110", load => '1', i => "0010101000001010", sel => "010010", o => "0010101000001010"),
        (previous => "0110100110101011", load => '0', i => "1011010010100101", sel => "010000", o => "0110100110101011"),
        (previous => "0110110100011111", load => '1', i => "0101001111110001", sel => "101101", o => "0101001111110001"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0010011110000000", sel => "011111", o => "0010011110000000"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1101111001111000", sel => "000001", o => "1101111001111000"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0000111101001011", sel => "110110", o => "UUUUUUUUUUUUUUUU"),
        (previous => "0010001011011110", load => '0', i => "1110100111100001", sel => "110100", o => "0010001011011110"),
        (previous => "1011101010110101", load => '0', i => "1010100010100001", sel => "011010", o => "1011101010110101"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0000010010001001", sel => "100011", o => "UUUUUUUUUUUUUUUU"),
        (previous => "0110100010010101", load => '0', i => "0011100101000111", sel => "000111", o => "0110100010010101"),
        (previous => "1000000100000000", load => '0', i => "1001011111011001", sel => "111011", o => "1000000100000000"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1101111001101010", sel => "001010", o => "UUUUUUUUUUUUUUUU"),
        (previous => "0100001101000110", load => '1', i => "0010111111010111", sel => "101001", o => "0010111111010111"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1111010010110110", sel => "011110", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1110011111110111", sel => "011110", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0111000011101101", sel => "011101", o => "0111000011101101"),
        (previous => "1100111001110111", load => '0', i => "1111011100100001", sel => "010011", o => "1100111001110111"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1000001000111011", sel => "100101", o => "1000001000111011"),
        (previous => "1011101010110101", load => '0', i => "0100110011011111", sel => "011010", o => "1011101010110101"),
        (previous => "1100010101000001", load => '1', i => "1011001011100110", sel => "101010", o => "1011001011100110"),
        (previous => "1011001011100110", load => '1', i => "1011110110100010", sel => "101010", o => "1011110110100010"),
        (previous => "0010001011011110", load => '1', i => "0111110101101100", sel => "110100", o => "0111110101101100"),
        (previous => "1010101100000100", load => '0', i => "0000011101010101", sel => "100100", o => "1010101100000100"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1110010010110100", sel => "000110", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0111111011010010", sel => "101000", o => "0111111011010010"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0101010100101111", sel => "000010", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0011011001000010", sel => "100111", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1101110101100111", sel => "101110", o => "1101110101100111"),
        (previous => "1110100101111000", load => '0', i => "1011010101000001", sel => "010101", o => "1110100101111000"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1001100011101011", sel => "000110", o => "1001100011101011"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1000000000010101", sel => "111101", o => "1000000000010101"),
        (previous => "0000001001111111", load => '1', i => "1001010011001010", sel => "001110", o => "1001010011001010"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1000101110101110", sel => "001001", o => "1000101110101110"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1011100010110100", sel => "011011", o => "1011100010110100"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0100001101011100", sel => "100011", o => "0100001101011100"),
        (previous => "0101101101100001", load => '0', i => "0000101000011110", sel => "100010", o => "0101101101100001"),
        (previous => "0110100101011010", load => '0', i => "0001110001000110", sel => "001111", o => "0110100101011010"),
        (previous => "0111000011101101", load => '1', i => "0110001110110100", sel => "011101", o => "0110001110110100"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1000100100001001", sel => "100110", o => "1000100100001001"),
        (previous => "0110100101011010", load => '0', i => "1001000011001111", sel => "001111", o => "0110100101011010"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1011010001001101", sel => "011110", o => "UUUUUUUUUUUUUUUU"),
        (previous => "0110100101011010", load => '0', i => "1000101101011011", sel => "001111", o => "0110100101011010"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1111010001100101", sel => "101100", o => "UUUUUUUUUUUUUUUU"),
        (previous => "0010011110000000", load => '1', i => "0001111101000000", sel => "011111", o => "0001111101000000"),
        (previous => "1001100011101011", load => '1', i => "0000000010100100", sel => "000110", o => "0000000010100100"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1000000010000110", sel => "111111", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0000111111010101", sel => "100111", o => "UUUUUUUUUUUUUUUU"),
        (previous => "1000100100001101", load => '0', i => "1010010110110010", sel => "010001", o => "1000100100001101"),
        (previous => "0100001101011100", load => '1', i => "1100010001011001", sel => "100011", o => "1100010001011001"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1011100010101000", sel => "110110", o => "1011100010101000"),
        (previous => "0111110101101100", load => '0', i => "0011010110000110", sel => "110100", o => "0111110101101100"),
        (previous => "0100100000000101", load => '1', i => "1111100010010101", sel => "001000", o => "1111100010010101"),
        (previous => "1000100100001001", load => '0', i => "0111111101000001", sel => "100110", o => "1000100100001001"),
        (previous => "1001000000001001", load => '1', i => "1101000011100001", sel => "110011", o => "1101000011100001"),
        (previous => "0111110101101100", load => '1', i => "1101001000100111", sel => "110100", o => "1101001000100111"),
        (previous => "1000100100001101", load => '1', i => "0000000111100111", sel => "010001", o => "0000000111100111"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1011010101001110", sel => "001101", o => "1011010101001110"),
        (previous => "0110100101011010", load => '1', i => "0010001010100000", sel => "001111", o => "0010001010100000"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0010011101000011", sel => "000101", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0111100001111001", sel => "000101", o => "UUUUUUUUUUUUUUUU"),
        (previous => "1100010100111010", load => '0', i => "1010111100101101", sel => "010100", o => "1100010100111010"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0100101101110110", sel => "110000", o => "0100101101110110"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1110001000011100", sel => "100111", o => "1110001000011100"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1111111011001111", sel => "000100", o => "UUUUUUUUUUUUUUUU"),
        (previous => "1111110000011000", load => '1', i => "0101101001000011", sel => "100001", o => "0101101001000011"),
        (previous => "0101101101100001", load => '0', i => "0011011111010101", sel => "100010", o => "0101101101100001"),
        (previous => "0010111111010111", load => '1', i => "1010000110100010", sel => "101001", o => "1010000110100010"),
        (previous => "0000000010100100", load => '1', i => "1011001111110010", sel => "000110", o => "1011001111110010"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1101001001110111", sel => "010110", o => "UUUUUUUUUUUUUUUU"),
        (previous => "1010101000110101", load => '1', i => "1000011000111100", sel => "111110", o => "1000011000111100"),
        (previous => "0010001010100000", load => '0', i => "0110000000010000", sel => "001111", o => "0010001010100000"),
        (previous => "1000001000111011", load => '0', i => "0001010001000000", sel => "100101", o => "1000001000111011"),
        (previous => "0000000111100111", load => '1', i => "0010111000101000", sel => "010001", o => "0010111000101000"),
        (previous => "1000011000111100", load => '0', i => "1010001000101100", sel => "111110", o => "1000011000111100"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1000111110001101", sel => "001100", o => "UUUUUUUUUUUUUUUU"),
        (previous => "1101111001111000", load => '1', i => "1111011011101111", sel => "000001", o => "1111011011101111"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0101100011011000", sel => "011110", o => "0101100011011000"),
        (previous => "1000101110101110", load => '1', i => "1100010100011111", sel => "001001", o => "1100010100011111"),
        (previous => "1100010100111010", load => '1', i => "1110000101110101", sel => "010100", o => "1110000101110101"),
        (previous => "0101101101100001", load => '1', i => "0111001000110011", sel => "100010", o => "0111001000110011"),
        (previous => "1010000110100010", load => '0', i => "0011000000000010", sel => "101001", o => "1010000110100010"),
        (previous => "0110001110110100", load => '0', i => "0101000001101000", sel => "011101", o => "0110001110110100"),
        (previous => "1111100010010101", load => '0', i => "1100101111111001", sel => "001000", o => "1111100010010101"),
        (previous => "0010001010100000", load => '0', i => "0010000111110111", sel => "001111", o => "0010001010100000"),
        (previous => "1000001000111011", load => '1', i => "0010001101000011", sel => "100101", o => "0010001101000011"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1010001000000100", sel => "111111", o => "UUUUUUUUUUUUUUUU"),
        (previous => "1101110101100111", load => '1', i => "1010000000100010", sel => "101110", o => "1010000000100010"),
        (previous => "0110101010100010", load => '0', i => "1101001011101011", sel => "000000", o => "0110101010100010"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0101110011111111", sel => "000011", o => "0101110011111111"),
        (previous => "1000011000111100", load => '0', i => "0110010110100001", sel => "111110", o => "1000011000111100"),
        (previous => "1011100010101000", load => '1', i => "0110010101001010", sel => "110110", o => "0110010101001010"),
        (previous => "1000011000111100", load => '1', i => "0000101100101000", sel => "111110", o => "0000101100101000"),
        (previous => "1011001111110010", load => '0', i => "1010001010110000", sel => "000110", o => "1011001111110010"),
        (previous => "0111111101111111", load => '1', i => "0000110111111111", sel => "110111", o => "0000110111111111"),
        (previous => "1100111001110111", load => '0', i => "0100101111100100", sel => "010011", o => "1100111001110111"),
        (previous => "1000000000010101", load => '0', i => "1011011010100100", sel => "111101", o => "1000000000010101"),
        (previous => "1110100101111000", load => '1', i => "1000011000010010", sel => "010101", o => "1000011000010010"),
        (previous => "1011001111110010", load => '0', i => "0101101111010010", sel => "000110", o => "1011001111110010"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1110101111010110", sel => "010110", o => "UUUUUUUUUUUUUUUU"),
        (previous => "1011100010110100", load => '1', i => "0000100010010100", sel => "011011", o => "0000100010010100"),
        (previous => "1110000101110101", load => '0', i => "0011100001001010", sel => "010100", o => "1110000101110101"),
        (previous => "0010001010100000", load => '0', i => "1101101100001000", sel => "001111", o => "0010001010100000"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0000010100001111", sel => "110010", o => "UUUUUUUUUUUUUUUU"),
        (previous => "1001010011001010", load => '1', i => "1110010010000110", sel => "001110", o => "1110010010000110"),
        (previous => "0101101001000011", load => '1', i => "0001101110011001", sel => "100001", o => "0001101110011001"),
        (previous => "0000110111111111", load => '1', i => "0011100111010110", sel => "110111", o => "0011100111010110"),
        (previous => "0010111000101000", load => '0', i => "0011011000101100", sel => "010001", o => "0010111000101000"),
        (previous => "1110010010000110", load => '0', i => "0110100101110010", sel => "001110", o => "1110010010000110"),
        (previous => "0011100111010110", load => '0', i => "1001100011001001", sel => "110111", o => "0011100111010110"),
        (previous => "0001111101000000", load => '1', i => "1010010110100100", sel => "011111", o => "1010010110100100"),
        (previous => "0111111011010010", load => '1', i => "0000001000111000", sel => "101000", o => "0000001000111000"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1101111010000111", sel => "111100", o => "UUUUUUUUUUUUUUUU"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1000101011111001", sel => "111000", o => "1000101011111001"),
        (previous => "1010101100000100", load => '1', i => "1101001110000111", sel => "100100", o => "1101001110000111"),
        (previous => "0010001010100000", load => '0', i => "1101101000101000", sel => "001111", o => "0010001010100000"),
        (previous => "1010010110100100", load => '1', i => "1100001000011111", sel => "011111", o => "1100001000011111"),
        (previous => "0010101000001010", load => '1', i => "0010110101110001", sel => "010010", o => "0010110101110001"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1011110000111111", sel => "011000", o => "1011110000111111"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0100000101110110", sel => "110001", o => "UUUUUUUUUUUUUUUU"),
        (previous => "1100001000011111", load => '1', i => "0001101000010101", sel => "011111", o => "0001101000010101"),
        (previous => "0111001000110011", load => '1', i => "1010101110111110", sel => "100010", o => "1010101110111110"),
        (previous => "0100101101110110", load => '1', i => "0101101110111010", sel => "110000", o => "0101101110111010"),
        (previous => "1011001111110010", load => '0', i => "0011010100110011", sel => "000110", o => "1011001111110010"),
        (previous => "0100001001111010", load => '0', i => "1101101011010111", sel => "101011", o => "0100001001111010"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0101101010100111", sel => "010110", o => "UUUUUUUUUUUUUUUU"),
        (previous => "1011101010110101", load => '0', i => "0000000010000110", sel => "011010", o => "1011101010110101"),
        (previous => "1011110001110000", load => '1', i => "1000001100011000", sel => "110101", o => "1000001100011000"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0110100001110001", sel => "111100", o => "UUUUUUUUUUUUUUUU"),
        (previous => "0110010101001010", load => '1', i => "0000110001100010", sel => "110110", o => "0000110001100010"),
        (previous => "1000101011111001", load => '0', i => "0101101011000001", sel => "111000", o => "1000101011111001"),
        (previous => "0001101000010101", load => '0', i => "0101110000100100", sel => "011111", o => "0001101000010101"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "0100100011010100", sel => "111111", o => "0100100011010100"),
        (previous => "1000100100001001", load => '0', i => "1111101111011010", sel => "100110", o => "1000100100001001"),
        (previous => "1011001111110010", load => '1', i => "0111101001000101", sel => "000110", o => "0111101001000101"),
        (previous => "1010000000100010", load => '0', i => "1010100010011011", sel => "101110", o => "1010000000100010"),
        (previous => "0100100011010100", load => '0', i => "1010001001110101", sel => "111111", o => "0100100011010100"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1010000110101011", sel => "101111", o => "1010000110101011"),
        (previous => "0110100110101011", load => '0', i => "1101110001100111", sel => "010000", o => "0110100110101011"),
        (previous => "0101101110111010", load => '0', i => "1011110000011101", sel => "110000", o => "0101101110111010"),
        (previous => "0110100010010101", load => '1', i => "1101100110010110", sel => "000111", o => "1101100110010110"),
        (previous => "1101001000100111", load => '1', i => "1101101001110101", sel => "110100", o => "1101101001110101"),
        (previous => "0101100011011000", load => '1', i => "1100000011110100", sel => "011110", o => "1100000011110100"),
        (previous => "0101110011111111", load => '1', i => "0110101110011010", sel => "000011", o => "0110101110011010"),
        (previous => "0000100010010100", load => '0', i => "0110010101100001", sel => "011011", o => "0000100010010100"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1000000111001111", sel => "001011", o => "1000000111001111"),
        (previous => "0001101110011001", load => '1', i => "1001101100001110", sel => "100001", o => "1001101100001110"),
        (previous => "0000101100101000", load => '0', i => "0111001100111101", sel => "111110", o => "0000101100101000"),
        (previous => "1101000011100001", load => '1', i => "0011011111001101", sel => "110011", o => "0011011111001101"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1010010011111110", sel => "011001", o => "1010010011111110"),
        (previous => "1001101100001110", load => '1', i => "1111110001000101", sel => "100001", o => "1111110001000101"),
        (previous => "1011110110100010", load => '0', i => "0101011110111001", sel => "101010", o => "1011110110100010"),
        (previous => "1011110000111111", load => '1', i => "0110001100011000", sel => "011000", o => "0110001100011000"),
        (previous => "1010010011111110", load => '1', i => "0111101000011011", sel => "011001", o => "0111101000011011"),
        (previous => "1000001100011000", load => '0', i => "1101000111110111", sel => "110101", o => "1000001100011000"),
        (previous => "1000011000010010", load => '0', i => "0100010110000010", sel => "010101", o => "1000011000010010"),
        (previous => "0010111000101000", load => '0', i => "0010111101100011", sel => "010001", o => "0010111000101000"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1001000000100001", sel => "000010", o => "UUUUUUUUUUUUUUUU"),
        (previous => "1100000011110100", load => '1', i => "1110101011010100", sel => "011110", o => "1110101011010100"),
        (previous => "1111110001000101", load => '1', i => "1010011111101101", sel => "100001", o => "1010011111101101"),
        (previous => "UUUUUUUUUUUUUUUU", load => '1', i => "1101001111001110", sel => "000010", o => "1101001111001110"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "1100100100111001", sel => "111001", o => "UUUUUUUUUUUUUUUU"),
        (previous => "1000100100001001", load => '0', i => "1110010001010001", sel => "100110", o => "1000100100001001"),
        (previous => "1101100110010110", load => '0', i => "0110110111101010", sel => "000111", o => "1101100110010110"),
        (previous => "1101001111001110", load => '1', i => "0110000111011111", sel => "000010", o => "0110000111011111"),
        (previous => "0001101000010101", load => '1', i => "0011101001110101", sel => "011111", o => "0011101001110101"),
        (previous => "1000000111001111", load => '0', i => "1010000001000110", sel => "001011", o => "1000000111001111"),
        (previous => "UUUUUUUUUUUUUUUU", load => '0', i => "0011010111001000", sel => "000101", o => "UUUUUUUUUUUUUUUU"),
        (previous => "1000000000010101", load => '0', i => "1001110010100110", sel => "111101", o => "1000000000010101"),
        (previous => "0110101110011010", load => '0', i => "1011000101000111", sel => "000011", o => "0110101110011010"),
        (previous => "0111101001000101", load => '0', i => "0010111111001010", sel => "000110", o => "0111101001000101")
    );
    CONSTANT total_cycles : INTEGER := test_cases'LENGTH;
    FUNCTION slv_to_string (slv : STD_LOGIC_VECTOR) RETURN STRING IS
        VARIABLE str : STRING (slv'length DOWNTO 1) := (OTHERS => NUL);
    BEGIN
        FOR n IN slv'length DOWNTO 1 LOOP
            str(n) := STD_LOGIC'image(slv((n - 1)))(2);
        END LOOP;
        RETURN str;
    END FUNCTION;

BEGIN
    bench : my_ram64 PORT MAP(clk, load, i, sel, o_actual);

    PROCESS
    BEGIN
        FOR cycle IN 1 TO total_cycles LOOP
            clk <= '0';
            WAIT FOR clk_period / 2;

            clk <= '1';
            WAIT FOR clk_period / 2;
        END LOOP;
        WAIT;
    END PROCESS;

    PROCESS
    BEGIN
        FOR n IN test_cases'RANGE LOOP
            previous <= test_cases(n).previous;
            i <= test_cases(n).i;
            load <= test_cases(n).load;
            sel <= test_cases(n).sel;

            WAIT FOR clk_period / 2;
            o_expected <= test_cases(n).o;
            WAIT FOR clk_period / 4;

            ASSERT (o_actual = o_expected)
            REPORT "test failed for " &
                "previous = " & slv_to_string(previous) &
                ". load = " & STD_LOGIC'image(load) &
                ". i = " & slv_to_string(i) &
                ". sel = " & slv_to_string(sel) &
                ". expected o = " & slv_to_string(o_expected) &
                ", got " & slv_to_string(o_actual) SEVERITY error;
            WAIT FOR clk_period / 4;
        END LOOP;
        WAIT;

    END PROCESS;

END behavioral;
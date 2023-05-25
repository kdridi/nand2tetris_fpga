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
BEGIN
    bench : my_mux4way16 PORT MAP(a, b, c, d, sel, o_actual);

    PROCESS
    BEGIN
        -- test avec des motifs de bits plus complexes 01
        a <= "1110011000101111"; -- 0xE62F
        b <= "1010000000111000"; -- 0xA038
        c <= "0000101000101011"; -- 0x0A2B
        d <= "1011000001000011"; -- 0xB043
        sel <= "00";
        o_expected <= "1110011000101111"; -- 0xE62F
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 02
        a <= "1110010101100000"; -- 0xE560
        b <= "0100000001011110"; -- 0x405E
        c <= "0001000110101100"; -- 0x11AC
        d <= "0101111010000001"; -- 0x5E81
        sel <= "01";
        o_expected <= "0100000001011110"; -- 0x405E
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 03
        a <= "1001010000010001"; -- 0x9411
        b <= "0010011011001001"; -- 0x26C9
        c <= "0000110111111000"; -- 0x0DF8
        d <= "1110101001011101"; -- 0xEA5D
        sel <= "10";
        o_expected <= "0000110111111000"; -- 0x0DF8
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 04
        a <= "0100100011010101"; -- 0x48D5
        b <= "1000010111000010"; -- 0x85C2
        c <= "1101000000111000"; -- 0xD038
        d <= "0011100101000100"; -- 0x3944
        sel <= "11";
        o_expected <= "0011100101000100"; -- 0x3944
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 05
        a <= "1001000100111110"; -- 0x913E
        b <= "1110011111000011"; -- 0xE7C3
        c <= "0011100111011101"; -- 0x39DD
        d <= "0011101110111011"; -- 0x3BBB
        sel <= "00";
        o_expected <= "1001000100111110"; -- 0x913E
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 06
        a <= "1110111011010000"; -- 0xEED0
        b <= "1110110000111000"; -- 0xEC38
        c <= "1101001011011000"; -- 0xD2D8
        d <= "1100110000111100"; -- 0xCC3C
        sel <= "01";
        o_expected <= "1110110000111000"; -- 0xEC38
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 07
        a <= "0101100010001101"; -- 0x588D
        b <= "0100000101011110"; -- 0x415E
        c <= "0011001110010010"; -- 0x3392
        d <= "1000010000100101"; -- 0x8425
        sel <= "10";
        o_expected <= "0011001110010010"; -- 0x3392
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 08
        a <= "0000001110011000"; -- 0x0398
        b <= "1000001011100011"; -- 0x82E3
        c <= "1101011111100110"; -- 0xD7E6
        d <= "1110100111000111"; -- 0xE9C7
        sel <= "11";
        o_expected <= "1110100111000111"; -- 0xE9C7
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 09
        a <= "0010001100011011"; -- 0x231B
        b <= "1110001000010001"; -- 0xE211
        c <= "1001101000001011"; -- 0x9A0B
        d <= "0000100001111011"; -- 0x087B
        sel <= "00";
        o_expected <= "0010001100011011"; -- 0x231B
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 10
        a <= "0010001001101111"; -- 0x226F
        b <= "1010101110110111"; -- 0xABB7
        c <= "0110011011111101"; -- 0x66FD
        d <= "1011011010000000"; -- 0xB680
        sel <= "01";
        o_expected <= "1010101110110111"; -- 0xABB7
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 11
        a <= "1101001010000000"; -- 0xD280
        b <= "0111010011110101"; -- 0x74F5
        c <= "1010000011011110"; -- 0xA0DE
        d <= "0001101101010101"; -- 0x1B55
        sel <= "10";
        o_expected <= "1010000011011110"; -- 0xA0DE
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 12
        a <= "1111101010111000"; -- 0xFAB8
        b <= "0111000100010110"; -- 0x7116
        c <= "0101010010011001"; -- 0x5499
        d <= "1000101111110110"; -- 0x8BF6
        sel <= "11";
        o_expected <= "1000101111110110"; -- 0x8BF6
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 13
        a <= "0101100011011001"; -- 0x58D9
        b <= "1000111001110111"; -- 0x8E77
        c <= "1100011110110001"; -- 0xC7B1
        d <= "0100011110101010"; -- 0x47AA
        sel <= "00";
        o_expected <= "0101100011011001"; -- 0x58D9
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 14
        a <= "0111101010101111"; -- 0x7AAF
        b <= "1001101010001001"; -- 0x9A89
        c <= "0001001111100110"; -- 0x13E6
        d <= "1101001100111100"; -- 0xD33C
        sel <= "01";
        o_expected <= "1001101010001001"; -- 0x9A89
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 15
        a <= "1101101111101000"; -- 0xDBE8
        b <= "0100011101111000"; -- 0x4778
        c <= "0101011101100001"; -- 0x5761
        d <= "1101111110000000"; -- 0xDF80
        sel <= "10";
        o_expected <= "0101011101100001"; -- 0x5761
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 16
        a <= "1100101001011100"; -- 0xCA5C
        b <= "0010111101000111"; -- 0x2F47
        c <= "1100100101001000"; -- 0xC948
        d <= "1110110101110111"; -- 0xED77
        sel <= "11";
        o_expected <= "1110110101110111"; -- 0xED77
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;
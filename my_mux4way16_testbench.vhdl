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
    SIGNAL o : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL expected : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    bench : my_mux4way16 PORT MAP(a, b, c, d, sel, o);

    PROCESS
    BEGIN
        -- test avec des motifs de bits plus complexes 01
        a <= "1010010001011000"; -- 0xA458
        b <= "1100111110010110"; -- 0xCF96
        c <= "1011011011010010"; -- 0xB6D2
        d <= "1001000101100100"; -- 0x9164
        sel <= "00";
        expected <= "1010010001011000"; -- 0xA458
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 02
        a <= "1000010010111101"; -- 0x84BD
        b <= "1000011111000101"; -- 0x87C5
        c <= "0111010010000000"; -- 0x7480
        d <= "1110000010101111"; -- 0xE0AF
        sel <= "01";
        expected <= "1000011111000101"; -- 0x87C5
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 03
        a <= "1000100000111101"; -- 0x883D
        b <= "0000100000110001"; -- 0x0831
        c <= "0111100010111110"; -- 0x78BE
        d <= "0101011010110101"; -- 0x56B5
        sel <= "10";
        expected <= "0111100010111110"; -- 0x78BE
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 04
        a <= "0001111101010100"; -- 0x1F54
        b <= "0010100001110010"; -- 0x2872
        c <= "0101110111101011"; -- 0x5DEB
        d <= "0111101000110001"; -- 0x7A31
        sel <= "11";
        expected <= "0111101000110001"; -- 0x7A31
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 05
        a <= "1010100110101000"; -- 0xA9A8
        b <= "1011101111100101"; -- 0xBBE5
        c <= "0100101110010011"; -- 0x4B93
        d <= "0110101000100101"; -- 0x6A25
        sel <= "00";
        expected <= "1010100110101000"; -- 0xA9A8
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 06
        a <= "1110000110010001"; -- 0xE191
        b <= "1100011011011111"; -- 0xC6DF
        c <= "1011011100101111"; -- 0xB72F
        d <= "1101011100110011"; -- 0xD733
        sel <= "01";
        expected <= "1100011011011111"; -- 0xC6DF
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 07
        a <= "0011101001111101"; -- 0x3A7D
        b <= "1111010001111010"; -- 0xF47A
        c <= "1001010100000001"; -- 0x9501
        d <= "0101011010111111"; -- 0x56BF
        sel <= "10";
        expected <= "1001010100000001"; -- 0x9501
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 08
        a <= "0100111110111001"; -- 0x4FB9
        b <= "1010010000011001"; -- 0xA419
        c <= "0101010010110100"; -- 0x54B4
        d <= "1111010000010001"; -- 0xF411
        sel <= "11";
        expected <= "1111010000010001"; -- 0xF411
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 09
        a <= "0111001110101111"; -- 0x73AF
        b <= "0000101110000111"; -- 0x0B87
        c <= "1000010101110110"; -- 0x8576
        d <= "1111100001101101"; -- 0xF86D
        sel <= "00";
        expected <= "0111001110101111"; -- 0x73AF
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 10
        a <= "1001001101001100"; -- 0x934C
        b <= "1111100111110110"; -- 0xF9F6
        c <= "1101100100011100"; -- 0xD91C
        d <= "0001101110001001"; -- 0x1B89
        sel <= "01";
        expected <= "1111100111110110"; -- 0xF9F6
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 11
        a <= "0000001000100111"; -- 0x0227
        b <= "0101000111011010"; -- 0x51DA
        c <= "0111001000111111"; -- 0x723F
        d <= "0010000101111011"; -- 0x217B
        sel <= "10";
        expected <= "0111001000111111"; -- 0x723F
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 12
        a <= "0111101001001100"; -- 0x7A4C
        b <= "1101000000101010"; -- 0xD02A
        c <= "1001101110101100"; -- 0x9BAC
        d <= "0010001111110101"; -- 0x23F5
        sel <= "11";
        expected <= "0010001111110101"; -- 0x23F5
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 13
        a <= "1000110000001111"; -- 0x8C0F
        b <= "1110011100111111"; -- 0xE73F
        c <= "1000111000011010"; -- 0x8E1A
        d <= "0110110110100001"; -- 0x6DA1
        sel <= "00";
        expected <= "1000110000001111"; -- 0x8C0F
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 14
        a <= "1010111000011111"; -- 0xAE1F
        b <= "0100010101001010"; -- 0x454A
        c <= "0100010011010100"; -- 0x44D4
        d <= "1110100010011100"; -- 0xE89C
        sel <= "01";
        expected <= "0100010101001010"; -- 0x454A
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 15
        a <= "0011100111000100"; -- 0x39C4
        b <= "1101100111010101"; -- 0xD9D5
        c <= "0011111101011100"; -- 0x3F5C
        d <= "1000100101111101"; -- 0x897D
        sel <= "10";
        expected <= "0011111101011100"; -- 0x3F5C
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 16
        a <= "0111110111101110"; -- 0x7DEE
        b <= "1001010000010000"; -- 0x9410
        c <= "0111110110001111"; -- 0x7D8F
        d <= "1111000110011110"; -- 0xF19E
        sel <= "11";
        expected <= "1111000110011110"; -- 0xF19E
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;
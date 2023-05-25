LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_mux8way16_testbench IS
END my_mux8way16_testbench;

ARCHITECTURE behavioral OF my_mux8way16_testbench IS
    COMPONENT my_mux8way16
        PORT (
            a, b, c, d, e, f, g, h : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL a, b, c, d, e, f, g, h : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sel : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL o_actual : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL o_expected : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    bench : my_mux8way16 PORT MAP(a, b, c, d, e, f, g, h, sel, o_actual);

    PROCESS
    BEGIN

        -- test avec des motifs de bits plus complexes 01
        a <= "1000011001000111"; -- 0x8647
        b <= "1001011101111011"; -- 0x977B
        c <= "0000101000111000"; -- 0x0A38
        d <= "0010101100111101"; -- 0x2B3D
        e <= "0110000011100010"; -- 0x60E2
        f <= "1111000010110010"; -- 0xF0B2
        g <= "1001111011011010"; -- 0x9EDA
        h <= "1011101011001111"; -- 0xBACF
        sel <= "000";
        o_expected <= "1000011001000111"; -- 0x8647
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 02
        a <= "1110110010111011"; -- 0xECBB
        b <= "1001011010111110"; -- 0x96BE
        c <= "0111101001010110"; -- 0x7A56
        d <= "1010111010010010"; -- 0xAE92
        e <= "0100011100001110"; -- 0x470E
        f <= "0001000101001010"; -- 0x114A
        g <= "0101011011110110"; -- 0x56F6
        h <= "0001000101111101"; -- 0x117D
        sel <= "001";
        o_expected <= "1001011010111110"; -- 0x96BE
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 03
        a <= "1100110110010111"; -- 0xCD97
        b <= "0001010001111100"; -- 0x147C
        c <= "0111011011110000"; -- 0x76F0
        d <= "0001000101011110"; -- 0x115E
        e <= "1001101001101101"; -- 0x9A6D
        f <= "0111000011110101"; -- 0x70F5
        g <= "0111010101001011"; -- 0x754B
        h <= "1010000100011000"; -- 0xA118
        sel <= "010";
        o_expected <= "0111011011110000"; -- 0x76F0
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 04
        a <= "0001111111011000"; -- 0x1FD8
        b <= "1110100101000010"; -- 0xE942
        c <= "0101101111000001"; -- 0x5BC1
        d <= "0111010001010010"; -- 0x7452
        e <= "0111111001110100"; -- 0x7E74
        f <= "1011110111010010"; -- 0xBDD2
        g <= "1101010111000111"; -- 0xD5C7
        h <= "0000010010111100"; -- 0x04BC
        sel <= "011";
        o_expected <= "0111010001010010"; -- 0x7452
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 05
        a <= "0101010101001110"; -- 0x554E
        b <= "1101111111111111"; -- 0xDFFF
        c <= "0010111111111001"; -- 0x2FF9
        d <= "1011011000110000"; -- 0xB630
        e <= "1101000010110010"; -- 0xD0B2
        f <= "1100111011010100"; -- 0xCED4
        g <= "0111000100000000"; -- 0x7100
        h <= "1011110101101101"; -- 0xBD6D
        sel <= "100";
        o_expected <= "1101000010110010"; -- 0xD0B2
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 06
        a <= "0110010110010010"; -- 0x6592
        b <= "1110101101010110"; -- 0xEB56
        c <= "0110101111111111"; -- 0x6BFF
        d <= "1010110010100000"; -- 0xACA0
        e <= "1111110010100000"; -- 0xFCA0
        f <= "1100001011110101"; -- 0xC2F5
        g <= "1011111000011101"; -- 0xBE1D
        h <= "1100101000110111"; -- 0xCA37
        sel <= "101";
        o_expected <= "1100001011110101"; -- 0xC2F5
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 07
        a <= "1101011101110001"; -- 0xD771
        b <= "0011010100001101"; -- 0x350D
        c <= "1101101110010101"; -- 0xDB95
        d <= "0111000111011110"; -- 0x71DE
        e <= "1010011000000010"; -- 0xA602
        f <= "0101000011100000"; -- 0x50E0
        g <= "0001001011110111"; -- 0x12F7
        h <= "1100010111011010"; -- 0xC5DA
        sel <= "110";
        o_expected <= "0001001011110111"; -- 0x12F7
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 08
        a <= "0011101000100010"; -- 0x3A22
        b <= "0110111010111000"; -- 0x6EB8
        c <= "0011101000101101"; -- 0x3A2D
        d <= "1011100010010111"; -- 0xB897
        e <= "0010110010001010"; -- 0x2C8A
        f <= "0000111111110100"; -- 0x0FF4
        g <= "1011110101010011"; -- 0xBD53
        h <= "1000000111011000"; -- 0x81D8
        sel <= "111";
        o_expected <= "1000000111011000"; -- 0x81D8
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 09
        a <= "1110111111110100"; -- 0xEFF4
        b <= "1110110101001100"; -- 0xED4C
        c <= "0011100000001001"; -- 0x3809
        d <= "1100000010100110"; -- 0xC0A6
        e <= "1011110000100000"; -- 0xBC20
        f <= "1010100100001001"; -- 0xA909
        g <= "0111111000010011"; -- 0x7E13
        h <= "0010000110110010"; -- 0x21B2
        sel <= "000";
        o_expected <= "1110111111110100"; -- 0xEFF4
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 10
        a <= "1001010001011111"; -- 0x945F
        b <= "1110101000010010"; -- 0xEA12
        c <= "1100111001010010"; -- 0xCE52
        d <= "1001000011111111"; -- 0x90FF
        e <= "1010110100001000"; -- 0xAD08
        f <= "1000110001101111"; -- 0x8C6F
        g <= "0101101100110110"; -- 0x5B36
        h <= "1000010001111001"; -- 0x8479
        sel <= "001";
        o_expected <= "1110101000010010"; -- 0xEA12
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 11
        a <= "1100000101111101"; -- 0xC17D
        b <= "0011011011001100"; -- 0x36CC
        c <= "1111011001011000"; -- 0xF658
        d <= "0110011101111111"; -- 0x677F
        e <= "1000011110101100"; -- 0x87AC
        f <= "0000100101001111"; -- 0x094F
        g <= "0010110101011010"; -- 0x2D5A
        h <= "1100000111001111"; -- 0xC1CF
        sel <= "010";
        o_expected <= "1111011001011000"; -- 0xF658
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 12
        a <= "0111100000000111"; -- 0x7807
        b <= "0110011110000111"; -- 0x6787
        c <= "0111101001100110"; -- 0x7A66
        d <= "1010010010010001"; -- 0xA491
        e <= "0111011101111011"; -- 0x777B
        f <= "0011011110111001"; -- 0x37B9
        g <= "0010011001101010"; -- 0x266A
        h <= "0110011101101111"; -- 0x676F
        sel <= "011";
        o_expected <= "1010010010010001"; -- 0xA491
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 13
        a <= "0010010100000101"; -- 0x2505
        b <= "0101111001110011"; -- 0x5E73
        c <= "0010100000010101"; -- 0x2815
        d <= "1110000100100110"; -- 0xE126
        e <= "0000011101111100"; -- 0x077C
        f <= "1010011000101000"; -- 0xA628
        g <= "0000001011011000"; -- 0x02D8
        h <= "1001101111011011"; -- 0x9BDB
        sel <= "100";
        o_expected <= "0000011101111100"; -- 0x077C
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 14
        a <= "1001000000111011"; -- 0x903B
        b <= "1101000100101011"; -- 0xD12B
        c <= "0010110011011010"; -- 0x2CDA
        d <= "0011110101000011"; -- 0x3D43
        e <= "0101110110011010"; -- 0x5D9A
        f <= "1000100000010000"; -- 0x8810
        g <= "1100000110111100"; -- 0xC1BC
        h <= "0001111100010111"; -- 0x1F17
        sel <= "101";
        o_expected <= "1000100000010000"; -- 0x8810
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 15
        a <= "1011111011011100"; -- 0xBEDC
        b <= "1011100000010100"; -- 0xB814
        c <= "1000011010010111"; -- 0x8697
        d <= "0100011010001001"; -- 0x4689
        e <= "1100000101100011"; -- 0xC163
        f <= "1011001111110001"; -- 0xB3F1
        g <= "0000100001011000"; -- 0x0858
        h <= "0011100101101010"; -- 0x396A
        sel <= "110";
        o_expected <= "0000100001011000"; -- 0x0858
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 16
        a <= "0001101101111000"; -- 0x1B78
        b <= "1000001010111110"; -- 0x82BE
        c <= "1101110111111100"; -- 0xDDFC
        d <= "1001001011110011"; -- 0x92F3
        e <= "1011101001110111"; -- 0xBA77
        f <= "0000010001100110"; -- 0x0466
        g <= "1111101001100011"; -- 0xFA63
        h <= "1101111101111100"; -- 0xDF7C
        sel <= "111";
        o_expected <= "1101111101111100"; -- 0xDF7C
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;
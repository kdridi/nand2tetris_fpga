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
    SIGNAL o : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL expected : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    bench : my_mux8way16 PORT MAP(a, b, c, d, e, f, g, h, sel, o);

    PROCESS
    BEGIN

        -- test avec des motifs de bits plus complexes 01
        a <= "0111011011111101"; -- 0x76FD
        b <= "0110000110111011"; -- 0x61BB
        c <= "1111111001001111"; -- 0xFE4F
        d <= "0010000111101111"; -- 0x21EF
        e <= "0100101010011100"; -- 0x4A9C
        f <= "0111001000001011"; -- 0x720B
        g <= "1001111001010100"; -- 0x9E54
        h <= "0011000100110011"; -- 0x3133
        sel <= "000";
        expected <= "0111011011111101"; -- 0x76FD
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 02
        a <= "0010011110111000"; -- 0x27B8
        b <= "0110011101111101"; -- 0x677D
        c <= "0001001111011110"; -- 0x13DE
        d <= "1011001110100110"; -- 0xB3A6
        e <= "1010000110110010"; -- 0xA1B2
        f <= "1010011011010111"; -- 0xA6D7
        g <= "0000100010010100"; -- 0x0894
        h <= "0001000010000100"; -- 0x1084
        sel <= "001";
        expected <= "0110011101111101"; -- 0x677D
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 03
        a <= "1110101000111110"; -- 0xEA3E
        b <= "1011101011101000"; -- 0xBAE8
        c <= "0011011111111010"; -- 0x37FA
        d <= "0000101011111010"; -- 0x0AFA
        e <= "0100010000111011"; -- 0x443B
        f <= "1110100000110101"; -- 0xE835
        g <= "0001101010011101"; -- 0x1A9D
        h <= "0000101011100010"; -- 0x0AE2
        sel <= "010";
        expected <= "0011011111111010"; -- 0x37FA
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 04
        a <= "1010100001001100"; -- 0xA84C
        b <= "1101001101100001"; -- 0xD361
        c <= "1010101011010001"; -- 0xAAD1
        d <= "1100110001111111"; -- 0xCC7F
        e <= "1110000011101100"; -- 0xE0EC
        f <= "1011001111101101"; -- 0xB3ED
        g <= "1000010110111000"; -- 0x85B8
        h <= "0101011111101010"; -- 0x57EA
        sel <= "011";
        expected <= "1100110001111111"; -- 0xCC7F
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 05
        a <= "0001010110101000"; -- 0x15A8
        b <= "1000010000000111"; -- 0x8407
        c <= "0111100111011001"; -- 0x79D9
        d <= "0110000001000100"; -- 0x6044
        e <= "1111011000010010"; -- 0xF612
        f <= "0001100000101101"; -- 0x182D
        g <= "1001000101110111"; -- 0x9177
        h <= "0001110111001010"; -- 0x1DCA
        sel <= "100";
        expected <= "1111011000010010"; -- 0xF612
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 06
        a <= "0111111110101010"; -- 0x7FAA
        b <= "1010010101010101"; -- 0xA555
        c <= "1101000101110000"; -- 0xD170
        d <= "0010000101011100"; -- 0x215C
        e <= "0100110000101101"; -- 0x4C2D
        f <= "1101101000000101"; -- 0xDA05
        g <= "0011000111100000"; -- 0x31E0
        h <= "0011011001101011"; -- 0x366B
        sel <= "101";
        expected <= "1101101000000101"; -- 0xDA05
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 07
        a <= "1001010011101101"; -- 0x94ED
        b <= "0110100111011011"; -- 0x69DB
        c <= "0100000101100101"; -- 0x4165
        d <= "1101100100101001"; -- 0xD929
        e <= "0101001000010000"; -- 0x5210
        f <= "0101110000000011"; -- 0x5C03
        g <= "1110010000001011"; -- 0xE40B
        h <= "1111101001011101"; -- 0xFA5D
        sel <= "110";
        expected <= "1110010000001011"; -- 0xE40B
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 08
        a <= "0010111101100100"; -- 0x2F64
        b <= "1000111011011100"; -- 0x8EDC
        c <= "1100011011011100"; -- 0xC6DC
        d <= "0001000001010001"; -- 0x1051
        e <= "0100001011001001"; -- 0x42C9
        f <= "0100110010010100"; -- 0x4C94
        g <= "0110100000111011"; -- 0x683B
        h <= "0101100001110001"; -- 0x5871
        sel <= "111";
        expected <= "0101100001110001"; -- 0x5871
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 09
        a <= "1101000010011011"; -- 0xD09B
        b <= "1110001000010100"; -- 0xE214
        c <= "1011100010110101"; -- 0xB8B5
        d <= "1100011010101101"; -- 0xC6AD
        e <= "1111101001000001"; -- 0xFA41
        f <= "0100101000101100"; -- 0x4A2C
        g <= "1110010001111000"; -- 0xE478
        h <= "0111100111101100"; -- 0x79EC
        sel <= "000";
        expected <= "1101000010011011"; -- 0xD09B
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 10
        a <= "1110111110000001"; -- 0xEF81
        b <= "1011010111101000"; -- 0xB5E8
        c <= "1001101101001000"; -- 0x9B48
        d <= "0011101110101110"; -- 0x3BAE
        e <= "1000111111101101"; -- 0x8FED
        f <= "1100110100101001"; -- 0xCD29
        g <= "0111001000011010"; -- 0x721A
        h <= "0010010011011011"; -- 0x24DB
        sel <= "001";
        expected <= "1011010111101000"; -- 0xB5E8
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 11
        a <= "0011011100000100"; -- 0x3704
        b <= "1011001101111111"; -- 0xB37F
        c <= "1111111000000100"; -- 0xFE04
        d <= "1000100100010100"; -- 0x8914
        e <= "0000111110000010"; -- 0x0F82
        f <= "1110001000001111"; -- 0xE20F
        g <= "1000001101110001"; -- 0x8371
        h <= "0011111011100111"; -- 0x3EE7
        sel <= "010";
        expected <= "1111111000000100"; -- 0xFE04
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 12
        a <= "0111000011101011"; -- 0x70EB
        b <= "0100101001001110"; -- 0x4A4E
        c <= "0100111100111000"; -- 0x4F38
        d <= "1011001110110100"; -- 0xB3B4
        e <= "1001011011100010"; -- 0x96E2
        f <= "1011011101110011"; -- 0xB773
        g <= "0000110000100101"; -- 0x0C25
        h <= "0110011101111110"; -- 0x677E
        sel <= "011";
        expected <= "1011001110110100"; -- 0xB3B4
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 13
        a <= "1001100110000111"; -- 0x9987
        b <= "1100010011011010"; -- 0xC4DA
        c <= "0010111000101011"; -- 0x2E2B
        d <= "1001001111001000"; -- 0x93C8
        e <= "0000111100000110"; -- 0x0F06
        f <= "0001001010100011"; -- 0x12A3
        g <= "0000110110110100"; -- 0x0DB4
        h <= "1111111010000111"; -- 0xFE87
        sel <= "100";
        expected <= "0000111100000110"; -- 0x0F06
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 14
        a <= "1100100010001100"; -- 0xC88C
        b <= "1010100011111101"; -- 0xA8FD
        c <= "0011101000110110"; -- 0x3A36
        d <= "0101100001111001"; -- 0x5879
        e <= "0111011000100110"; -- 0x7626
        f <= "1010110001010000"; -- 0xAC50
        g <= "0111110101010100"; -- 0x7D54
        h <= "1010110100101010"; -- 0xAD2A
        sel <= "101";
        expected <= "1010110001010000"; -- 0xAC50
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 15
        a <= "0101111111001111"; -- 0x5FCF
        b <= "0111101101011000"; -- 0x7B58
        c <= "0011011000111110"; -- 0x363E
        d <= "0110111101010010"; -- 0x6F52
        e <= "0101110101100111"; -- 0x5D67
        f <= "1011100110110000"; -- 0xB9B0
        g <= "1010111000111001"; -- 0xAE39
        h <= "1100111001010010"; -- 0xCE52
        sel <= "110";
        expected <= "1010111000111001"; -- 0xAE39
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 16
        a <= "0000001111111110"; -- 0x03FE
        b <= "1111110101110001"; -- 0xFD71
        c <= "1000001000000110"; -- 0x8206
        d <= "1001101011100000"; -- 0x9AE0
        e <= "1011010011100100"; -- 0xB4E4
        f <= "1000111000101011"; -- 0x8E2B
        g <= "0000001001011110"; -- 0x025E
        h <= "0100111001101011"; -- 0x4E6B
        sel <= "111";
        expected <= "0100111001101011"; -- 0x4E6B
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;
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

BEGIN
    bench : my_or16 PORT MAP(a, b, o_actual);

    PROCESS
    BEGIN
        a <= (OTHERS => '0');
        b <= (OTHERS => '0');
        o_expected <= (OTHERS => '0');
        WAIT FOR 10 ns;

        a <= (OTHERS => '0');
        b <= (OTHERS => '1');
        o_expected <= (OTHERS => '1');
        WAIT FOR 10 ns;

        a <= (OTHERS => '1');
        b <= (OTHERS => '0');
        o_expected <= (OTHERS => '1');
        WAIT FOR 10 ns;

        a <= (OTHERS => '1');
        b <= (OTHERS => '1');
        o_expected <= (OTHERS => '1');
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 01
        a <= "1100011001101011"; -- 0xC66B
        b <= "0110110001101111"; -- 0x6C6F
        o_expected <= "1110111001101111"; -- 0xEE6F
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 02
        a <= "0011011011011010"; -- 0x36DA
        b <= "0111110100100000"; -- 0x7D20
        o_expected <= "0111111111111010"; -- 0x7FFA
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 03
        a <= "0101110111110001"; -- 0x5DF1
        b <= "0011011011110101"; -- 0x36F5
        o_expected <= "0111111111110101"; -- 0x7FF5
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 04
        a <= "1010100101100000"; -- 0xA960
        b <= "1011101101000000"; -- 0xBB40
        o_expected <= "1011101101100000"; -- 0xBB60
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 05
        a <= "1111010101010011"; -- 0xF553
        b <= "1001011000110110"; -- 0x9636
        o_expected <= "1111011101110111"; -- 0xF777
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 06
        a <= "1100001100000101"; -- 0xC305
        b <= "0011101000111000"; -- 0x3A38
        o_expected <= "1111101100111101"; -- 0xFB3D
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 07
        a <= "0000001010001011"; -- 0x028B
        b <= "0111110001110100"; -- 0x7C74
        o_expected <= "0111111011111111"; -- 0x7EFF
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 08
        a <= "1010010011110000"; -- 0xA4F0
        b <= "1000000011100100"; -- 0x80E4
        o_expected <= "1010010011110100"; -- 0xA4F4
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 09
        a <= "1101000011001010"; -- 0xD0CA
        b <= "1111011011111011"; -- 0xF6FB
        o_expected <= "1111011011111011"; -- 0xF6FB
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 10
        a <= "0100100010001000"; -- 0x4888
        b <= "1001000111010001"; -- 0x91D1
        o_expected <= "1101100111011001"; -- 0xD9D9
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_xor16_testbench IS
END my_xor16_testbench;

ARCHITECTURE behavioral OF my_xor16_testbench IS
    COMPONENT my_xor16
        PORT (
            a, b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL a, b, o : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    bench : my_xor16 PORT MAP(a, b, o);

    PROCESS
    BEGIN
        a <= (OTHERS => '0');
        b <= (OTHERS => '0');
        WAIT FOR 10 ns;

        a <= (OTHERS => '0');
        b <= (OTHERS => '1');
        WAIT FOR 10 ns;

        a <= (OTHERS => '1');
        b <= (OTHERS => '0');
        WAIT FOR 10 ns;

        a <= (OTHERS => '1');
        b <= (OTHERS => '1');
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 01
        a <= "1110010010000000"; -- 0xE480
        b <= "1010110111111111"; -- 0xADFF
        -- o = "0100100101111111" : 0x497F
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 02
        a <= "0110101110101000"; -- 0x6BA8
        b <= "0001000011010001"; -- 0x10D1
        -- o = "0111101101111001" : 0x7B79
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 03
        a <= "1000100100010000"; -- 0x8910
        b <= "0100000110101011"; -- 0x41AB
        -- o = "1100100010111011" : 0xC8BB
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 04
        a <= "1111111101100110"; -- 0xFF66
        b <= "0011110100101001"; -- 0x3D29
        -- o = "1100001001001111" : 0xC24F
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 05
        a <= "1011010011111111"; -- 0xB4FF
        b <= "1111001110101110"; -- 0xF3AE
        -- o = "0100011101010001" : 0x4751
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 06
        a <= "0001001100001111"; -- 0x130F
        b <= "1100001010100110"; -- 0xC2A6
        -- o = "1101000110101001" : 0xD1A9
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 07
        a <= "1111101110100100"; -- 0xFBA4
        b <= "1010011000011000"; -- 0xA618
        -- o = "0101110110111100" : 0x5DBC
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 08
        a <= "0101110101101011"; -- 0x5D6B
        b <= "0000100001011001"; -- 0x0859
        -- o = "0101010100110010" : 0x5532
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 09
        a <= "0000010000101111"; -- 0x042F
        b <= "1010011010000111"; -- 0xA687
        -- o = "1010001010101000" : 0xA2A8
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 10
        a <= "1100000111010110"; -- 0xC1D6
        b <= "1000000011000111"; -- 0x80C7
        -- o = "0100000100010001" : 0x4111
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;
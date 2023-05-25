LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_not16_testbench IS
END my_not16_testbench;

ARCHITECTURE behavioral OF my_not16_testbench IS
    COMPONENT my_not16
        PORT (
            i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL i, o : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    bench : my_not16 PORT MAP(i, o);

    PROCESS
    BEGIN
        i <= (OTHERS => '0');
        WAIT FOR 10 ns;

        i <= (OTHERS => '1');
        WAIT FOR 10 ns;
        -- test avec des motifs de bits plus complexes 01
        i <= "0101010001101011"; -- 0x546b
        -- o = "1010101110010100" : 0xab94
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 02
        i <= "0001100111110110"; -- 0x19f6
        -- o = "1110011000001001" : 0xe609
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 03
        i <= "0110010000100011"; -- 0x6423
        -- o = "1001101111011100" : 0x9bdc
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 04
        i <= "1111111110001101"; -- 0xff8d
        -- o = "0000000001110010" : 0x0072
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 05
        i <= "0111100000010010"; -- 0x7812
        -- o = "1000011111101101" : 0x87ed
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 06
        i <= "0101100100100100"; -- 0x5924
        -- o = "1010011011011011" : 0xa6db
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 07
        i <= "1100110000011000"; -- 0xcc18
        -- o = "0011001111100111" : 0x33e7
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 08
        i <= "1111111000110110"; -- 0xfe36
        -- o = "0000000111001001" : 0x01c9
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 09
        i <= "1111100100111001"; -- 0xf939
        -- o = "0000011011000110" : 0x06c6
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 10
        i <= "1111100011111111"; -- 0xf8ff
        -- o = "0000011100000000" : 0x0700
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;
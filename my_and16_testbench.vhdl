LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_and16_testbench IS
END my_and16_testbench;

ARCHITECTURE behavioral OF my_and16_testbench IS
    COMPONENT my_and16
        PORT (
            a, b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL a, b : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL o_actual : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL o_expected : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN
    bench : my_and16 PORT MAP(a, b, o_actual);

    PROCESS
    BEGIN
        a <= (OTHERS => '0');
        b <= (OTHERS => '0');
        o_expected <= (OTHERS => '0');
        WAIT FOR 10 ns;

        a <= (OTHERS => '0');
        b <= (OTHERS => '1');
        o_expected <= (OTHERS => '0');
        WAIT FOR 10 ns;

        a <= (OTHERS => '1');
        b <= (OTHERS => '0');
        o_expected <= (OTHERS => '0');
        WAIT FOR 10 ns;

        a <= (OTHERS => '1');
        b <= (OTHERS => '1');
        o_expected <= (OTHERS => '1');
        WAIT FOR 10 ns;
        -- test avec des motifs de bits plus complexes 01
        a <= "1011000010000101"; -- 0xb085
        b <= "0110001010110111"; -- 0x62b7
        o_expected <= "0010000010000101"; -- 0x2085
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 02
        a <= "1111000101111000"; -- 0xf178
        b <= "1101000111111101"; -- 0xd1fd
        o_expected <= "1101000101111000"; -- 0xd178
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 03
        a <= "0011100010000100"; -- 0x3884
        b <= "0111000001110101"; -- 0x7075
        o_expected <= "0011000000000100"; -- 0x3004
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 04
        a <= "0100111111011100"; -- 0x4fdc
        b <= "0010000011101000"; -- 0x20e8
        o_expected <= "0000000011001000"; -- 0x00c8
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 05
        a <= "0001000100100000"; -- 0x1120
        b <= "0010000101011011"; -- 0x215b
        o_expected <= "0000000100000000"; -- 0x0100
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 06
        a <= "0101001101000001"; -- 0x5341
        b <= "0100101101010111"; -- 0x4b57
        o_expected <= "0100001101000001"; -- 0x4341
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 07
        a <= "0001001101010000"; -- 0x1350
        b <= "0111100000100100"; -- 0x7824
        o_expected <= "0001000000000000"; -- 0x1000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 08
        a <= "0101010011011100"; -- 0x54dc
        b <= "0011001111001011"; -- 0x33cb
        o_expected <= "0001000011001000"; -- 0x10c8
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 09
        a <= "1000000011111010"; -- 0x80fa
        b <= "1101001111101011"; -- 0xd3eb
        o_expected <= "1000000011101010"; -- 0x80ea
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 10
        a <= "0101101101000001"; -- 0x5b41
        b <= "1000111011010100"; -- 0x8ed4
        o_expected <= "0000101001000000"; -- 0x0a40
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;
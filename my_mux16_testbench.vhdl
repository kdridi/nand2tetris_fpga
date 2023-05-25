LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_mux16_testbench IS
END my_mux16_testbench;

ARCHITECTURE behavioral OF my_mux16_testbench IS
    COMPONENT my_mux16
        PORT (
            a, b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC;
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL a, b : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sel : STD_LOGIC;
    SIGNAL o : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    bench : my_mux16 PORT MAP(a, b, sel, o);

    PROCESS
    BEGIN

        a <= (OTHERS => '0');
        b <= (OTHERS => '0');
        sel <= '0';
        WAIT FOR 10 ns;

        a <= (OTHERS => '0');
        b <= (OTHERS => '1');
        sel <= '0';
        WAIT FOR 10 ns;

        a <= (OTHERS => '1');
        b <= (OTHERS => '0');
        sel <= '0';
        WAIT FOR 10 ns;

        a <= (OTHERS => '1');
        b <= (OTHERS => '1');
        sel <= '0';
        WAIT FOR 10 ns;

        a <= (OTHERS => '0');
        b <= (OTHERS => '0');
        sel <= '1';
        WAIT FOR 10 ns;

        a <= (OTHERS => '0');
        b <= (OTHERS => '1');
        sel <= '1';
        WAIT FOR 10 ns;

        a <= (OTHERS => '1');
        b <= (OTHERS => '0');
        sel <= '1';
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 01
        a <= "0010001100000011"; -- 0x2303
        b <= "1010110110111100"; -- 0xADBC
        sel <= '0';
        -- o = "0010001100000011" : 0x2303
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 02
        a <= "0100010000000101"; -- 0x4405
        b <= "1100110011111010"; -- 0xCCFA
        sel <= '1';
        -- o = "1100110011111010" : 0xCCFA
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 03
        a <= "1101011000001100"; -- 0xD60C
        b <= "0000011111100001"; -- 0x07E1
        sel <= '0';
        -- o = "1101011000001100" : 0xD60C
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 04
        a <= "0100000110011010"; -- 0x419A
        b <= "1111111010001110"; -- 0xFE8E
        sel <= '1';
        -- o = "1111111010001110" : 0xFE8E
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 05
        a <= "0010011101100010"; -- 0x2762
        b <= "0101011001000100"; -- 0x5644
        sel <= '0';
        -- o = "0010011101100010" : 0x2762
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 06
        a <= "0100100100101100"; -- 0x492C
        b <= "1000110000101111"; -- 0x8C2F
        sel <= '1';
        -- o = "1000110000101111" : 0x8C2F
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 07
        a <= "0001111111011000"; -- 0x1FD8
        b <= "0000100110111000"; -- 0x09B8
        sel <= '0';
        -- o = "0001111111011000" : 0x1FD8
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 08
        a <= "0100111001011011"; -- 0x4E5B
        b <= "1001010011011011"; -- 0x94DB
        sel <= '1';
        -- o = "1001010011011011" : 0x94DB
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 09
        a <= "0111100101110100"; -- 0x7974
        b <= "0101101101110111"; -- 0x5B77
        sel <= '0';
        -- o = "0111100101110100" : 0x7974
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 10
        a <= "0000011011011100"; -- 0x06DC
        b <= "1001100000110000"; -- 0x9830
        sel <= '1';
        -- o = "1001100000110000" : 0x9830
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;
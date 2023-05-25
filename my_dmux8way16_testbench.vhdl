LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_dmux8way16_testbench IS
END my_dmux8way16_testbench;

ARCHITECTURE behavioral OF my_dmux8way16_testbench IS
    COMPONENT my_dmux8way16
        PORT (
            i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            a, b, c, d, e, f, g, h : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL i : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL sel : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL a_actual, b_actual, c_actual, d_actual, e_actual, f_actual, g_actual, h_actual : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL a_expected, b_expected, c_expected, d_expected, e_expected, f_expected, g_expected, h_expected : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    bench : my_dmux8way16 PORT MAP(i, sel, a_actual, b_actual, c_actual, d_actual, e_actual, f_actual, g_actual, h_actual);

    PROCESS
    BEGIN

        -- test avec des motifs de bits plus complexes 01
        i <= "0000100111100000"; -- 0x09E0
        sel <= "000";
        a_expected <= "0000100111100000"; -- 0x09E0
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0000000000000000"; -- 0x0000
        e_expected <= "0000000000000000"; -- 0x0000
        f_expected <= "0000000000000000"; -- 0x0000
        g_expected <= "0000000000000000"; -- 0x0000
        h_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 02
        i <= "0011110111111101"; -- 0x3DFD
        sel <= "001";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0011110111111101"; -- 0x3DFD
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0000000000000000"; -- 0x0000
        e_expected <= "0000000000000000"; -- 0x0000
        f_expected <= "0000000000000000"; -- 0x0000
        g_expected <= "0000000000000000"; -- 0x0000
        h_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 03
        i <= "1111000100011001"; -- 0xF119
        sel <= "010";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "1111000100011001"; -- 0xF119
        d_expected <= "0000000000000000"; -- 0x0000
        e_expected <= "0000000000000000"; -- 0x0000
        f_expected <= "0000000000000000"; -- 0x0000
        g_expected <= "0000000000000000"; -- 0x0000
        h_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 04
        i <= "1000001101010011"; -- 0x8353
        sel <= "011";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "1000001101010011"; -- 0x8353
        e_expected <= "0000000000000000"; -- 0x0000
        f_expected <= "0000000000000000"; -- 0x0000
        g_expected <= "0000000000000000"; -- 0x0000
        h_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 05
        i <= "1000100101010000"; -- 0x8950
        sel <= "100";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0000000000000000"; -- 0x0000
        e_expected <= "1000100101010000"; -- 0x8950
        f_expected <= "0000000000000000"; -- 0x0000
        g_expected <= "0000000000000000"; -- 0x0000
        h_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 06
        i <= "0000001000011111"; -- 0x021F
        sel <= "101";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0000000000000000"; -- 0x0000
        e_expected <= "0000000000000000"; -- 0x0000
        f_expected <= "0000001000011111"; -- 0x021F
        g_expected <= "0000000000000000"; -- 0x0000
        h_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 07
        i <= "0010001100011011"; -- 0x231B
        sel <= "110";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0000000000000000"; -- 0x0000
        e_expected <= "0000000000000000"; -- 0x0000
        f_expected <= "0000000000000000"; -- 0x0000
        g_expected <= "0010001100011011"; -- 0x231B
        h_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 08
        i <= "0001010011000000"; -- 0x14C0
        sel <= "111";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0000000000000000"; -- 0x0000
        e_expected <= "0000000000000000"; -- 0x0000
        f_expected <= "0000000000000000"; -- 0x0000
        g_expected <= "0000000000000000"; -- 0x0000
        h_expected <= "0001010011000000"; -- 0x14C0
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 09
        i <= "0000010100100100"; -- 0x0524
        sel <= "000";
        a_expected <= "0000010100100100"; -- 0x0524
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0000000000000000"; -- 0x0000
        e_expected <= "0000000000000000"; -- 0x0000
        f_expected <= "0000000000000000"; -- 0x0000
        g_expected <= "0000000000000000"; -- 0x0000
        h_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 10
        i <= "0001100000001110"; -- 0x180E
        sel <= "001";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0001100000001110"; -- 0x180E
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0000000000000000"; -- 0x0000
        e_expected <= "0000000000000000"; -- 0x0000
        f_expected <= "0000000000000000"; -- 0x0000
        g_expected <= "0000000000000000"; -- 0x0000
        h_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 11
        i <= "0110010001010010"; -- 0x6452
        sel <= "010";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "0110010001010010"; -- 0x6452
        d_expected <= "0000000000000000"; -- 0x0000
        e_expected <= "0000000000000000"; -- 0x0000
        f_expected <= "0000000000000000"; -- 0x0000
        g_expected <= "0000000000000000"; -- 0x0000
        h_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 12
        i <= "0010110011001011"; -- 0x2CCB
        sel <= "011";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0010110011001011"; -- 0x2CCB
        e_expected <= "0000000000000000"; -- 0x0000
        f_expected <= "0000000000000000"; -- 0x0000
        g_expected <= "0000000000000000"; -- 0x0000
        h_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 13
        i <= "0010001000010110"; -- 0x2216
        sel <= "100";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0000000000000000"; -- 0x0000
        e_expected <= "0010001000010110"; -- 0x2216
        f_expected <= "0000000000000000"; -- 0x0000
        g_expected <= "0000000000000000"; -- 0x0000
        h_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 14
        i <= "0000100001001100"; -- 0x084C
        sel <= "101";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0000000000000000"; -- 0x0000
        e_expected <= "0000000000000000"; -- 0x0000
        f_expected <= "0000100001001100"; -- 0x084C
        g_expected <= "0000000000000000"; -- 0x0000
        h_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 15
        i <= "0110011011110111"; -- 0x66F7
        sel <= "110";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0000000000000000"; -- 0x0000
        e_expected <= "0000000000000000"; -- 0x0000
        f_expected <= "0000000000000000"; -- 0x0000
        g_expected <= "0110011011110111"; -- 0x66F7
        h_expected <= "0000000000000000"; -- 0x0000
        WAIT FOR 10 ns;

        -- test avec des motifs de bits plus complexes 16
        i <= "0000101110111101"; -- 0x0BBD
        sel <= "111";
        a_expected <= "0000000000000000"; -- 0x0000
        b_expected <= "0000000000000000"; -- 0x0000
        c_expected <= "0000000000000000"; -- 0x0000
        d_expected <= "0000000000000000"; -- 0x0000
        e_expected <= "0000000000000000"; -- 0x0000
        f_expected <= "0000000000000000"; -- 0x0000
        g_expected <= "0000000000000000"; -- 0x0000
        h_expected <= "0000101110111101"; -- 0x0BBD
        WAIT FOR 10 ns;

        WAIT;

    END PROCESS;

END behavioral;
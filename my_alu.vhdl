LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY my_alu IS
    PORT (
        x, y : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        zx, nx, zy, ny, f, no : IN STD_LOGIC;
        o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        zr, ng : OUT STD_LOGIC
    );
END my_alu;

ARCHITECTURE behavioral OF my_alu IS
    COMPONENT my_mux16
        PORT (
            a, b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel : IN STD_LOGIC;
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT my_not16
        PORT (
            i : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT my_and16
        PORT (
            a, b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT my_add16
        PORT (
            a, b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            o : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            c : OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT my_or8way
        PORT (
            i : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            o : OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT my_or
        PORT (
            a, b : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT my_not
        PORT (
            i : IN STD_LOGIC;
            o : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL zero : STD_LOGIC_VECTOR(15 DOWNTO 0) := "0000000000000000";
    SIGNAL one : STD_LOGIC_VECTOR(15 DOWNTO 0) := "0000000000000001";

    SIGNAL x_zero : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL x_zero_not : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL x_value : STD_LOGIC_VECTOR(15 DOWNTO 0);

    SIGNAL y_zero : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL y_zero_not : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL y_value : STD_LOGIC_VECTOR(15 DOWNTO 0);

    SIGNAL x_and_y : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL x_add_y : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL carry : STD_LOGIC;

    SIGNAL o_value : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL o_value_not : STD_LOGIC_VECTOR(15 DOWNTO 0);

    SIGNAL o_high : STD_LOGIC;
    SIGNAL o_low : STD_LOGIC;
    SIGNAL not_zr : STD_LOGIC;

    SIGNAL o_signal : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL not_ng : STD_LOGIC;
BEGIN
    x_zero_choice : my_mux16 PORT MAP(x, zero, zx, x_zero);
    x_zero_not_gate : my_not16 PORT MAP(x_zero, x_zero_not);
    x_choice : my_mux16 PORT MAP(x_zero, x_zero_not, nx, x_value);

    y_zero_choice : my_mux16 PORT MAP(y, zero, zy, y_zero);
    y_zero_not_gate : my_not16 PORT MAP(y_zero, y_zero_not);
    y_choice : my_mux16 PORT MAP(y_zero, y_zero_not, ny, y_value);

    add_gate : my_add16 PORT MAP(x_value, y_value, x_add_y, carry);
    and_gate : my_and16 PORT MAP(x_value, y_value, x_and_y);

    f_choice : my_mux16 PORT MAP(x_and_y, x_add_y, f, o_value);
    o_not : my_not16 PORT MAP(o_value, o_value_not);
    o_choice : my_mux16 PORT MAP(o_value, o_value_not, no, o_signal);

    o_high_value : my_or8way PORT MAP(o_signal(15 DOWNTO 8), o_high);
    o_low_value : my_or8way PORT MAP(o_signal(7 DOWNTO 0), o_low);
    not_zr_value : my_or PORT MAP(o_high, o_low, not_zr);
    zr_value : my_not PORT MAP(not_zr, zr);

    not_ng_gate : my_not PORT MAP(o_signal(15), not_ng);
    ng_value : my_not PORT MAP(not_ng, ng);

    o <= o_signal;

END behavioral;
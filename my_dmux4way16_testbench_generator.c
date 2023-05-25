#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define TEST_SIZE 16

static const char *toBinary(uint16_t x);

int main(void)
{
    srand(time(NULL));
    for (uint16_t n = 0; n < TEST_SIZE; n++) {
        uint16_t i = rand() % 65536;
        uint16_t a_expected = n % 4 == 0 ? i : 0;
        uint16_t b_expected = n % 4 == 1 ? i : 0;
        uint16_t c_expected = n % 4 == 2 ? i : 0;
        uint16_t d_expected = n % 4 == 3 ? i : 0;
        printf("\n");
        printf("        -- test avec des motifs de bits plus complexes %02u\n", n + 1);
        printf("        i <= \"%s\"; -- 0x%04X\n", toBinary(i), i);
        printf("        sel <= \"%s\";\n", toBinary(n & 3) + 14);
        printf("        a_expected <= \"%s\"; -- 0x%04X\n", toBinary(a_expected), a_expected);
        printf("        b_expected <= \"%s\"; -- 0x%04X\n", toBinary(b_expected), b_expected);
        printf("        c_expected <= \"%s\"; -- 0x%04X\n", toBinary(c_expected), c_expected);
        printf("        d_expected <= \"%s\"; -- 0x%04X\n", toBinary(d_expected), d_expected);
        printf("        WAIT FOR 10 ns;\n");
    }

    return 0;
}

static const char *toBinary(uint16_t x)
{
    static char buffer[17];
    buffer[16] = '\0';
    for (int i = 15; i >= 0; i--) {
        buffer[i] = (x & 1) ? '1' : '0';
        x >>= 1;
    }
    return buffer;
}
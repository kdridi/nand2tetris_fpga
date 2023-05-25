#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define TEST_SIZE 10

static const char *toBinary(uint16_t x);

int main(void)
{
    srand(time(NULL));
    for (uint16_t n = 0; n < TEST_SIZE; n++) {
        uint16_t a = rand() % 65536;
        uint16_t b = rand() % 65536;
        uint16_t o = a | b;
        printf("\n");
        printf("        -- test avec des motifs de bits plus complexes %02u\n", n + 1);
        printf("        a <= \"%s\"; -- 0x%04X\n", toBinary(a), a);
        printf("        b <= \"%s\"; -- 0x%04X\n", toBinary(b), b);
        printf("        -- o = \"%s\" : 0x%04X\n", toBinary(o), o);
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

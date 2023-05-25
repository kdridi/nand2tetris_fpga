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
        printf("(i => \"%s\"", toBinary(i));
        printf(",sel => \"%s\"", toBinary(n & 3) + 14);
        printf(",a => \"%s\"", toBinary(a_expected));
        printf(",b => \"%s\"", toBinary(b_expected));
        printf(",c => \"%s\"", toBinary(c_expected));
        printf(",d => \"%s\"", toBinary(d_expected));
        printf(")%s\n", n == TEST_SIZE - 1 ? "" : ",");
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

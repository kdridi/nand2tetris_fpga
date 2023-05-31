#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define TEST_SIZE 8

static const char *toBinary(uint16_t x);

int main(void)
{
    srand(time(NULL));
    for (uint16_t n = 0; n < TEST_SIZE; n++) {
        uint16_t i = (n >> 2) & 1;
        uint16_t a = n % 4 == 0 ? i : 0;
        uint16_t b = n % 4 == 1 ? i : 0;
        uint16_t c = n % 4 == 2 ? i : 0;
        uint16_t d = n % 4 == 3 ? i : 0;
        printf("(i => '%s'", toBinary(i & 1) + 15);
        printf(",sel => \"%s\"", toBinary(n & 3) + 14);
        printf(",a => '%s'", toBinary(a & 1) + 15);
        printf(",b => '%s'", toBinary(b & 1) + 15);
        printf(",c => '%s'", toBinary(c & 1) + 15);
        printf(",d => '%s'", toBinary(d & 1) + 15);
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

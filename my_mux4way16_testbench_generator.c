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
        uint16_t a = rand() % 65536;
        uint16_t b = rand() % 65536;
        uint16_t c = rand() % 65536;
        uint16_t d = rand() % 65536;
        uint16_t values[] = {a, b, c, d};
        uint16_t o = values[n & 3];
        printf("(a => \"%s\"", toBinary(a));
        printf(",b => \"%s\"", toBinary(b));
        printf(",c => \"%s\"", toBinary(c));
        printf(",d => \"%s\"", toBinary(d));
        printf(",sel => \"%s\"", toBinary(n & 3) + 14);
        printf(",o => \"%s\"", toBinary(o));
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

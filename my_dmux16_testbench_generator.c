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
        uint16_t a = n % 2 == 0 ? i : 0;
        uint16_t b = n % 2 == 1 ? i : 0;
        printf("(i => \"%s\"", toBinary(i));
        printf(",sel => '%s'", toBinary(n & 1) + 15);
        printf(",a => \"%s\"", toBinary(a));
        printf(",b => \"%s\"", toBinary(b));
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

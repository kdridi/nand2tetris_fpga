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
        uint32_t a = rand() % 65536;
        uint32_t b = 1;
        uint16_t o = (a + b) & 0xffff;
        uint16_t c = (a + b) >> 16;
        printf("(a => \"%s\"", toBinary(a));
        printf(",o => \"%s\"", toBinary(o));
        printf(",c => '%s'", c ? "1" : "0");
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

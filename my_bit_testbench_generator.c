#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define TEST_SIZE 32

static const char *toBinary(uint16_t x);

int main(void)
{
    srand(time(NULL));
    char o = 'U';
    for (uint16_t n = 0; n < TEST_SIZE; n++) {
        char i = rand() % 2 ? '1' : '0';
        char load = rand() % 2 ? '1' : '0';
        o = load == '1' ? i : o;
        printf("(load => '%c'", load);
        printf(",i => '%c'", i);
        printf(",o => '%c'", o);
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

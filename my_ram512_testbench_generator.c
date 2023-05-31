#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define TEST_SIZE 1024

static const char *toBinary(uint16_t x);

int main(void)
{
    srand(time(NULL));

    bool initialized[0x100];
    uint16_t o[0x100];
    memset(initialized, 0, sizeof(initialized));
    memset(o, 0, sizeof(o));

    for (uint16_t n = 0; n < TEST_SIZE; n++) {
        uint16_t sel = rand() % 0x100;
        printf("(previous => \"%s\"", initialized[sel] ? toBinary(o[sel]) : "UUUUUUUUUUUUUUUU");

        uint16_t i = rand() % 0x10000;
        char load = rand() % 2 ? '1' : '0';
        if (load == '1') {
            o[sel] = i;
            initialized[sel] = true;
        }
        printf(",load => '%c'", load);
        printf(",i => \"%s\"", toBinary(i));
        printf(",sel => \"%s\"", toBinary(sel % 0x100) + 7);
        printf(",o => \"%s\"", initialized[sel] ? toBinary(o[sel]) : "UUUUUUUUUUUUUUUU");
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

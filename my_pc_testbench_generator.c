#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define TEST_SIZE 32

static const char *toBinary(uint16_t x);

int main(void)
{
    srand(time(NULL));

    bool initialized = false;
    uint16_t o = 0;
    for (uint16_t n = 0; n < TEST_SIZE; n++) {
        bool reset = (rand() >> 0) & 1;
        bool inc = (rand() >> 1) & 1;
        bool load = (rand() >> 2) & 1;

        if (n == 0 && (reset || !inc || load)) {
            n -= 1;
            continue;
        }

        printf("(previous => \"%s\"", initialized ? toBinary(o) : "UUUUUUUUUUUUUUUU");

        uint16_t i = rand() % 0x10000;

        if (reset) {
            o = 0;
            initialized = true;
        } else if (load) {
            o = i;
            initialized = true;
        } else if (inc && initialized) {
            o++;
        }

        printf(",load => '%c'", load ? '1' : '0');
        printf(",inc => '%c'", inc ? '1' : '0');
        printf(",reset => '%c'", reset ? '1' : '0');
        printf(",i => \"%s\"", toBinary(i));
        printf(",o => \"%s\"", initialized ? toBinary(o) : "UUUUUUUUUUUUUUUU");
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

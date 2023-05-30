#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define TEST_SIZE 256

static const char *toBinary(uint16_t x);

int main(void)
{
    srand(time(NULL));
    for (uint16_t n = 0; n < TEST_SIZE; n++) {
        bool no = (rand() >> 0) & 1;
        bool f = (rand() >> 1) & 1;
        bool ny = (rand() >> 2) & 1;
        bool zy = (rand() >> 3) & 1;
        bool nx = (rand() >> 4) & 1;
        bool zx = (rand() >> 5) & 1;

        uint16_t x = rand() % 0x10000;
        uint16_t y = rand() % 0x10000;

        printf("(x => \"%s\"", toBinary(x));
        printf(",y => \"%s\"", toBinary(y));
        printf(",zx => '%s'", zx ? "1" : "0");
        printf(",nx => '%s'", nx ? "1" : "0");
        printf(",zy => '%s'", zy ? "1" : "0");
        printf(",ny => '%s'", ny ? "1" : "0");
        printf(",f => '%s'", f ? "1" : "0");
        printf(",no => '%s'", no ? "1" : "0");

        x = zx == 1 ? 0 : x;
        x = nx == 1 ? ~x : x;
        y = zy == 1 ? 0 : y;
        y = ny == 1 ? ~y : y;

        uint16_t o = f == 1 ? x + y : x & y;
        o = no == 1 ? ~o : o;

        bool zr = o == 0;
        bool ng = (o >> 15) & 1;

        printf(",o => \"%s\"", toBinary(o));
        printf(",zr => '%s'", zr ? "1" : "0");
        printf(",ng => '%s'", ng ? "1" : "0");
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

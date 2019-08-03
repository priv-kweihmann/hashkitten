#include <sodium.h>
#include <stdio.h>
#include <string.h>

#ifndef YOUR_KEY
    #define YOUR_KEY "\x00\x01\x02\x03\0x04\0x05\0x06\0x07\0x08\0x09"
#endif
#ifndef MAX_LEN_CHUNK
    #define MAX_LEN_CHUNK 64
#endif
#ifndef MIN
    #define MIN(a,b) (a > b ? b : a)
#endif

int main(int argc, char *argv[]) {
    unsigned char out[crypto_generichash_BYTES_MAX] = {};
    unsigned char k[crypto_generichash_KEYBYTES_MAX] = YOUR_KEY;

    if (argc < 2) {
        printf("ERROR: you need to pass at least 1 argument\n");
        return -1;
    }
    int i;
    for (i = 1; i < argc; i++) {
        int j = 0;
        crypto_generichash_state state;

        crypto_generichash_init(&state, k, sizeof(k), sizeof(out));
        // Compute in chunks of 64 bytes
        while(j < strlen(argv[i])) {
            crypto_generichash_update(&state, (unsigned char *)&argv[i][j], MIN(strlen(argv[i]) - j, MAX_LEN_CHUNK));
            j += MAX_LEN_CHUNK;
        }

        crypto_generichash_final(&state, out, sizeof(out));

        // Dump result a hexbyte-string
        for (j = 0; j < sizeof(out); j++) {
            printf("%02x", (unsigned int) out[j]);
        }
        printf("\n");

        // Reset out buffer to ensure no leftovers on next loop
        memset(out, 0, sizeof(out));
    }
    return 0;
}
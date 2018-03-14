#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>

void mpi_safe_cond_assign(uint8_t *X, const uint8_t *Y, unsigned char assign) {
     size_t i = 0;
 
    /* make sure assign is 0 or 1 */
    assign = ( assign != 0 );

    X[i] = X[i] * ( 1 - assign ) + Y[i] * assign;
 }

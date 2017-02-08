
#include <stdio.h>
#include <stdint.h>
#include "dodgy.h"

int
main (void)
{
	test_safe_call () ;
	printf ("%ld\n", dodgy_addition (8, 5)) ;

	return 0 ;
}

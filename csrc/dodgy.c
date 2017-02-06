
#include <stdio.h>
#include <stdint.h>

#include <dodgy.h>



int64_t
dodgy_addition (int64_t a, int64_t b)
{	int64_t array [10] = { 0, };
	int64_t sum = a + b ;

	/* Deliberately bad code to see if we can call this from Haskell and
	 * pick up the problem using Address Sanitizer. */
	array [sum] = sum ;

	if (sum < 0 || sum > sizeof (array) / sizeof (array [0]))
	  puts ("That should have gone bang!") ;

	return sum ;
}


void
test_safe_call (void)
{
	puts (__func__) ;
}

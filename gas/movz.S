/*
# movz

# movs

    Intel `movzx` and `movsx`.

    Can add suffixes of form:

        bl
        bw
        wl

    to mean that it is from byte to long, or word to long.
*/

#include "lib/asm_io_s.h"

ENTRY
    mov $0x01234567, %eax
    mov $1, %bl
    movzbl %bl, %eax
    ASSERT_EQ($1)

    mov $0x01234567, %eax
    mov $-1, %bl
    movzbl %bl, %eax
    ASSERT_EQ($0xFF)

    /* Can omit the last character. */
    mov $0x01234567, %eax
    mov $-1, %bl
    movzb %bl, %eax
    ASSERT_EQ($0xFF)

    /* ERROR: Cannot omit the before last character. */
    /*movz %bl, %eax*/

    EXIT

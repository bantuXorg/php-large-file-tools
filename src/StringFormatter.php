<?php

/*
* (c) Andreas Fischer <af@bantuX.org>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/

namespace bantu\LargeFileTools;

class StringFormatter
{
    /**
    * Formats a signed integer or float as an unsigned integer base-10 string.
    * Passed strings will be checked for being base-10.
    *
    * @param int|float|string $number Number containing unsigned integer data
    *
    * @throws \UnexpectedValueException if $number is not a float, not an int
    *                                   and not a base-10 string.
    *
    * @return string Unsigned integer base-10 string
    */
    public function formatUnsignedInteger($number) {
        if (is_int($number)) {
            // Interpret signed integer as unsigned integer.
            return sprintf('%u', $number);
        } else if (is_float($number)) {
            // Undo the effect of the php.ini setting 'precision'.
            return number_format($number, 0, '', '');
        } else if (is_string($number) && ctype_digit($number)) {
            return $number;
        } else {
            throw new \UnexpectedValueException(
                'Expected int, float or base-10 string'
            );
        }
    }
}

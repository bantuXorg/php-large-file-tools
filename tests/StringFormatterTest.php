<?php

/*
* (c) Andreas Fischer <af@bantuX.org>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/

namespace bantu\LargeFileTools;

class StringFormatterTest extends TestCase
{
    protected $instance;

    public function setUp()
    {
        $this->instance = new StringFormatter;
    }

    public function testFormatUnsignedIntegerInt()
    {
        $this->assertSame(
            PHP_INT_SIZE === 4 ? '4294967295' : '18446744073709551615',
            $this->instance->formatUnsignedInteger(-1)
        );
    }

    public function testFormatUnsignedIntegerFloat()
    {
        $this->assertSame(
            '9007199254740992',
            $this->instance->formatUnsignedInteger((float) 9007199254740992)
        );
    }

    public function testFormatUnsignedIntegerString()
    {
        $this->assertSame(
            '9007199254740993',
            $this->instance->formatUnsignedInteger('9007199254740993')
        );
    }

    /**
    * @expectedException \UnexpectedValueException
    */
    public function testFormatUnsignedIntegerStringException()
    {
        $this->instance->formatUnsignedInteger('900ABCD254740993');
    }
}

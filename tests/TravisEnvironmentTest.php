<?php

/*
* (c) Andreas Fischer <af@bantuX.org>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/

namespace bantu\LargeFileTools;

class TravisEnvironmentTest extends \PHPUnit_Framework_TestCase
{
    public function testIntSize()
    {
        if (!getenv('phpint')) {
            $this->markTestSkipped('This test expects a phpint env variable.');
        }
        $this->assertSame(getenv('phpint') / 8, PHP_INT_SIZE);
    }
}

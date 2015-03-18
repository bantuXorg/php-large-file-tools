<?php

/*
* (c) Andreas Fischer <af@bantuX.org>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/

namespace bantu\LargeFileTools;

class TravisEnvironmentTest extends TestCase
{
    public function testIntSize()
    {
        $this->assertSame($this->getEnv('phpint') / 8, PHP_INT_SIZE);
    }
}

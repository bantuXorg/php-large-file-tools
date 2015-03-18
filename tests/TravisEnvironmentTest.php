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

    public function testLargeFileSupport()
    {
        if ($this->getEnv('phpint') == 64) {
            // 5G = 5 * 2^30 = 5368709120
            $expected = 5368709120;
        } else if ($this->getEnv('phplfs')) {
            // 5G = 1G = 2^30 = 1073741824 (mod 2^32)
            $expected = 1073741824;
        } else {
            $expected = false;
        }
        $filename = $this->createZeroFile('5G');
        $actual = filesize($filename);
        $this->assertSame($expected, $actual);
    }
}

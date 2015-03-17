<?php

/*
* (c) Andreas Fischer <af@bantuX.org>
*
* For the full copyright and license information, please view the LICENSE
* file that was distributed with this source code.
*/

namespace bantu\LargeFileTools;

abstract class TestCase extends \PHPUnit_Framework_TestCase
{
    public function getEnv($varname)
    {
        $result = getenv($varname);
        if (!$result) {
            $this->markTestSkipped("This test expects a $varname env variable.");
        }
        return $result;
    }
}

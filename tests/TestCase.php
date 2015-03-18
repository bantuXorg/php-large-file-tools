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
    protected $tempFilesToUnlinkOnTearDown = array();

    public function tearDown()
    {
        parent::tearDown();
        foreach ($this->tempFilesToUnlinkOnTearDown as $filename) {
            exec(sprintf(
                'rm -f %s',
                escapeshellarg($filename)
            ));
        }
    }

    /**
    * Creates a file containing all zero bytes and returns its path.
    *
    * @param string $sizeString
    *
    * @return string
    */
    protected function createZeroFile($sizeString)
    {
        $filename = tempnam(sys_get_temp_dir(), 'lft-test-');
        $this->assertTrue(file_exists($filename));
        exec(sprintf(
            'truncate --size %s %s',
            escapeshellarg($sizeString),
            escapeshellarg($filename)
        ));
        $this->tempFilesToUnlinkOnTearDown[] = $filename;
        return $filename;
    }

    public function getEnv($varname)
    {
        $result = getenv($varname);
        if (!$result) {
            $this->markTestSkipped("This test expects a $varname env variable.");
        }
        return $result;
    }
}

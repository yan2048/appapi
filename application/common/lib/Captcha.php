<?php 
namespace app\common\lib;

use think\captcha\Captcha;

class Captcha 
{
	public function verify()
    {
        $captcha = new Captcha();
        return $captcha->entry();    
    }
    
}

 ?>
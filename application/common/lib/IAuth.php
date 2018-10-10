<?php 
namespace app\common\lib;

/**
 * 关于用户类
 */
class IAuth 
{
	/**
	 * 生成密码
	 */
	public static function setPassword($password)
	{
		return md5($password.config('custom.auth_password_salt'));
	}
}


 ?>
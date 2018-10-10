<?php 
namespace app\admin\controller;

use think\Controller;

class Base extends Controller
{
	public function initialize()
	{
		$isLogin = $this->isLogin();
		if(!$isLogin){
			return $this->redirect('/admin/login');
		}
	}

	/**
	 * 判断用户是否登录
	 */
	public function isLogin()
	{
		$user = session(config('session.success_session'),'',config('session.session_scope'));
		if($user && $user['id']){
			return true;
		}else{
			return false;
		}
	}
}


 ?>
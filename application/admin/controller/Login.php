<?php
namespace app\admin\controller;

use think\Controller;
use think\captcha\Captcha;
use app\common\lib\IAuth;

class Login extends Base
{
    //空初始化函数，防止重定向多次
    public function initialize()
    {

    }

    public function index()
    {
        $isLogin = $this->isLogin();
        if($isLogin){
            //登录的情况下跳转到后台首页
            return $this->redirect('/admin/index');
        }else{
            //输出登录页
            return $this->fetch();
        }
    }

    /**
	* 验证用户名密码和验证码是否正确
    */
    public function check(){
    	if(request()->isPost()){
    		$data = input('post.');
    		if(!captcha_check($data['captcha'])){
				// 验证失败
				$this->error('验证码错误');
			}

            try {
                $user = model('AdminUser')->get(['username' => $data['account']]);
            } catch (\Exception $e) {
                $this->error($e->getMessage());                
            }

            //校验用户名
            if(!$user || ($user['status'] != config('code.success_status')) || ($user['delete_time'] > 0) ){
                $this->error('用户不存在');
            }

            //校验密码
            if( $user['password'] !== IAuth::setPassword($data['password']) ){
                $this->error('密码不正确');
            }

            //更新数据库中的登录时间和登录ip
            try {
                $udata = [
                    'last_login_time' => time(),
                    'last_login_ip' => request()->ip(),
                ];
                model('AdminUser')->save($udata,['id' => $user['id']]);
            } catch (Exception $e) {
                $this->error($e->getMessage());                
            }

            session(config('session.success_session'),$user,config('session.session_scope')); //存session

            $this->success('登录成功','/admin/index'); //登录成功
    	}
    }

    /**
     * 用户退出登录
     */
    public function logout()
    {
        session(null, config('session.session_scope'));
        $this->redirect('login/index');
    }

    /**
	* 生成验证码
    */
    public function verify()
    {
    	$config =    [
    		'imageH' => 50,
    		'imageW' => 200,
		    // 验证码字体大小
		    'fontSize'    =>    26,    
		    // 验证码位数
		    'length'      =>    4,   
		    // 关闭验证码杂点
		    'useNoise'    =>    true, 
		];
    	$captcha = new Captcha($config);
        return $captcha->entry();
    }

    public function welcome()
    {
    	return '欢迎';
    }
}

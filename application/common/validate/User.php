<?php 
namespace app\admin\validate;

use think\Validate;

class User extends Validate
{
	protected $rule =   [
        'username'  => 'require|max:25',
        'password'   => 'require|length:6,20',
    ];
    
    protected $message  =   [
        'username.require' => '名称必须',
        'username.max'     => '名称最多不能超过25个字符',
        'password.require'   => '密码必须填写',
        'password.length'  => '密码长度在6-20之间',  
    ];
}
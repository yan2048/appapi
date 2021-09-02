<?php
namespace app\admin\controller;

use think\Controller;

class Index extends Base
{
    public function index()
    {
        return $this->fetch();
    }

    public function userList()
    {
        echo '用户列表';
        return $this->fetch();
    }
}

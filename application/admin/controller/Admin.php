<?php 

namespace app\admin\controller;
use think\Controller;
use app\common\lib\IAuth;

class Admin extends Base
{
	/**
	 * 管理员列表
	 */
	public function index()
	{
		$data = model('AdminUser')->select_all();
		$select_count = model('AdminUser')->select_count();
		
		$this->assign('data',$data);
		$this->assign('select_count',$select_count);
		return $this->fetch();
	}

    /**
     * 添加管理员
     * @return mixed|void
     */
	public function add()
	{	
		$validate = validate('User');
		if(request()->isPost()){
			$data = input('post.');
			if(!$validate->check($data)){
				$this->error($validate->getError());
			}
			$data['password'] = IAuth::setPassword($data['password']);
			$data['status'] = 1;

			try{
				$id = model('AdminUser')->add($data);
			}catch (\Exception $e){
				$this->error($e->getMessage());
			}

			if(!$id){
				$this->error('添加失败');
			}else{
				$this->success('id='.$id.'的管理员添加成功');
			}
		}else{
			return $this->fetch();
		}
	}

    public function delList()
    {
        return '删除用户列表';
    }
}

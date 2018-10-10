<?php 
namespace app\admin\controller;

class News extends Base
{
	//新闻列表
	public function index()
	{
		return $this->fetch();
	}

	//添加新闻
	public function add()
	{
		return $this->fetch();
	}
}


 ?>
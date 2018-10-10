<?php 

namespace app\common\model;
use think\Model;

class AdminUser extends Model
{
	protected $autoWriteTimestamp = true;

	//添加管理员数据
	public function add($data)
	{
		if(!is_array($data)){
			exception('传递的数据不合法');
		}
		$this->allowField(true)->save($data);
		return $this->id;
	}

	//查询表中所有数据
	public function select_all()
	{
		return $this->where('delete_time',NULL)->all();
	}

	//查询表中有效数据的总条数
	public function select_count()
	{
		return $this->where('delete_time',NULL)->count();
	}
}

 ?>
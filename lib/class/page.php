<?php
class page extends v
{
	var $total;
	var $page;
	
	public function limit($page,$num)
	{
		if($page != '')
		{
			if($page == 0)
				$limit = "$page,$num";
			elseif($page > 0)
				$limit = ($page-1)*$num.",".$num;
		}
		else
		{
			$page = 1;
			$limit = "0,$num";
		}
		return $limit;
	}
	
	function listPage($page='1',$num,$total='',$showPageFigure='4')
	{
		global $_GET;
		//print_r($_GET);
		//echo $total;
		$v =  empty($_GET) || ( count($_GET) == 1 && isset($_GET['page']) )  ? '?' : '&'; 
		if($page == ''){ $page == 1; }
	
		if($total ==''){ $total = $_SESSION['total']; unset($_SESSION['total']); }
	
		if($total == 0){ return '';}
		$allPage = ceil( $total / $num );
		if($page > $allPage){ message('请选择正确的页码','javascript:history.go(-1)');exit();}
		//$showPageFigure = 4;
		$startPage = '1'; 
		$endPage = $allPage;
		if($allPage > $showPageFigure  && $page+$showPageFigure <= $allPage )
		{ 
			if($page == 0){ $startPage = 1; $endPage =  $page  + $showPageFigure; }
			else{ $startPage = $page; $endPage = $page - 1 + $showPageFigure;  }  
		}
		else
		{  
			if( $allPage - $showPageFigure < 0){$startPage = 1; $endPage = $allPage;     }
			else{ $startPage = $allPage - $showPageFigure + 1; $endPage = $allPage;  } 
		}
		$get = $_SERVER['QUERY_STRING'] == '' ? '' : '?'.$_SERVER['QUERY_STRING']; 
		$initialUrl = $_SERVER['PHP_SELF'].$get;
		$initialUrl = preg_replace('/\?page=[0-9]{1,5}/','',$initialUrl);
		$initialUrl = preg_replace('/&page=[0-9]{1,5}/','',$initialUrl);
		$initialUrl = preg_replace('/page=[0-9]{1,5}/','',$initialUrl);
		//echo $_SERVER['PHP_SELF'];
		$pagetop ="<a href='".$initialUrl."'>首页</a>";
		//下一页
		if($allPage > 1 && $page+1 <= $allPage )
		{
			$url = $initialUrl.$v."page=".($page+1);
			$pagetop .= "<a href='$url'>下一页</a>";	
		}
		//数字页
		for($i=$startPage;$i<=$endPage;$i++)
		{
			if($i == $page){ $url = 'javascript:video(0)'; }else{ $url = $initialUrl.$v."page=".$i; }
			$pagetop .= "<a href='$url'>$i</a>";	
		}
		//上一页
		if($page > 1 && $page <=  $allPage )
		{
			$url = $initialUrl.$v."page=".($page-1);
			$pagetop .= "<a href='$url'>上一页</a>";	
		}
		//尾页
		$pagetop .= "<a href='$initialUrl".$v."page=$allPage'>尾页</a>";
		$pagetop .= "<a href='javascript:video(0)'>共 $total 条</a>";
		return $pagetop;		
	}
}
?>
<?php
class page
{
    public $total;
    public $pageNo;
    public $pageSize;
    public $pageUrl;
    public $pageList;
    public $allPage;
    public $showPageFigure;

    public function pages($total = 0, $pageNo = '1', $pageSize = '20', $pageUrl = '', $showPageFigure = '4')
    {
        if ($total == 0) {
            return false;
        }
        $allPage = ceil($total / $pageSize);
        if ($pageNo > $allPage) {
            die(message('请选择正确的页码', 'javascript:history.go(-1)'));
        }

        $startPage = 1;
        $endPage   = $allPage;
        if ($allPage > $showPageFigure && $pageNo + $showPageFigure <= $allPage) {
            if ($pageNo == 0) {
                $startPage = 1;
                $endPage   = $pageNo + $showPageFigure;} else {
                $startPage = $pageNo;
                $endPage   = $pageNo - 1 + $showPageFigure;}
        } else {
            if ($allPage - $showPageFigure < 0) {
                $startPage = 1;
                $endPage   = $allPage;} else {
                $startPage = $allPage - $showPageFigure + 1;
                $endPage   = $allPage;}
        }

        for ($i = $startPage; $i <= $endPage; $i++) {
            $listTmp[] = $i;
        }

        $this->pageNo         = $pageNo;
        $this->pageSize       = $pageSize;
        $this->pageUrl        = $pageUrl;
        $this->total          = $total;
        $this->allPage        = $allPage;
        $this->showPageFigure = $showPageFigure;
        $this->pageList       = $listTmp;

        $data['pageNo']   = $pageNo;
        $data['pageSize'] = $pageSize;
        $data['allPage']  = $allPage;
        $data['pageList'] = $listTmp;
        $data['limit']    = ($pageNo - 1) * $pageSize;
        $data['pageUrl']  = $pageUrl;

        return $data;

    }

    public function loadConsole()
    {
        $this->pageUrl = $this->pageUrl . '&pageNo=';
        if (stripos($this->pageUrl, '?') === false) {
            $this->pageUrl = $this->pageUrl . '?pageNo=';
        }

        $pages = '<div class="pull-right page-box" pages-data="pages" param-data="param" page-function="getPageList()">' . "\r\n";
        $pages .= '<div class="pagination-info">当前' . $this->pageNo . ' - ' . ($this->pageNo * $this->pageSize) . '/' . ($this->allPage * $this->pageSize) . ' 条</div>' . "\r\n";
        $pages .= '<ul class="pagination" >' . "\r\n";
        if ($this->pageNo > $this->showPageFigure) {
            $pages .= '<li><a href="' . $this->pageUrl . '1">«</a></li>' . "\r\n";
        }

        if ($this->pageNo > 1) {
            $pages .= '<li><a href="' . $this->pageUrl . max(($this->pageNo - 1), 1) . '">‹</a></li>' . "\r\n";
        }

        if ($this->pageList) {
            foreach ($this->pageList as $key => $value) {
                $value == $this->pageNo ? $class = 'class="active"' : $class = '';
                $pages .= '<li ' . $class . '><a href="' . $this->pageUrl . $value . '">' . $value . '</a></li>' . "\r\n";
            }
        }
        $pages .= '<li><a href="' . $this->pageUrl . min(($this->pageNo + 1), $this->allPage) . '">›</a></li>' . "\r\n";
        $pages .= '<li><a href="' . $this->pageUrl . $this->allPage . '">»</a></li>' . "\r\n";
        $pages .= '</ul>' . "\r\n";
        $pages .= '<span class="pagination-goto">' . "\r\n";
        $pages .= '<input type="text" class="form-control w40">' . "\r\n";
        $pages .= '<button class="btn btn-default" type="button" >GO</button>' . "\r\n";
        $pages .= '</span>' . "\r\n";
        $pages .= '</div>' . "\r\n";
        $pages .= '</div>' . "\r\n";

        return $pages;
    }
}

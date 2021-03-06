<?php
/**
 * 文章相关信息
 */
namespace dao\base;

class Article
{

    private $dataTable;
    private $modelId;
    private $article;
    private $articleData;
    private $orderby;
    private $map   = [];
    private $field = '';

    public function __construct()
    {

    }

    /**
     * 获取单条文章记录
     * @date   2017-11-02T16:25:29+0800
     * @author ChenMingjiang
     * @param  [type]                   $nativeMap   [查询条件]
     * @param  [type]                   $nativeField [查询字段]
     * @param  [type]                   $modelId     [模型id]
     * @return [type]                                [description]
     */
    public function getRowContent($nativeMap, $nativeField, $modelId = 0)
    {

        if (!$modelId) {
            $modelId = table('Article')->where('id', $nativeMap['id'])->value('model_id');
        }

        $this->getMapField($nativeMap, $nativeField, '', $modelId);

        $rs = table('Article')->join($this->articleData)->where($this->map)->field($this->field)->find();

        return $rs;
    }

    /**
     * 获取列表
     * @date   2017-11-02T20:02:54+0800
     * @author ChenMingjiang
     * @param  [type]                   $nativeMap   [查询条件]
     * @param  [type]                   $nativeField [查询字段]
     * @param  [type]                   $modelId     [模型id]
     * @param  integer                  $pageSize    [分页数量]
     * @param  integer                  $pageNo      [分页数]
     * @return [type]                                [description]
     */
    public function getList($nativeMap = [], $nativeField = '', $modelId = 0, $pageSize = 99, $pageNo = 1, $orderby = '')
    {

        if (!$modelId) {
            $modelId = table('Article')->where('id', $nativeMap['id'])->value('model_id');
        }

        $offer = max(($pageNo - 1), 0) * $pageSize;
        $this->getMapField($nativeMap, $nativeField, $orderby, $modelId);

        $list          = table('Article')->join($this->articleData)->where($this->map)->field($this->field)->limit($offer, $pageSize)->order($this->orderby)->select();
        $total         = table('Article')->join($this->articleData)->where($this->map)->count();
        $data['total'] = $total;
        $data['list']  = $list;

        return $data;
    }

    /**
     * 根据模型id获取对于附属表 自动整合map field
     * @date   2017-11-02T20:03:55+0800
     * @author ChenMingjiang
     * @param  [type]                   $nativeMap   [description]
     * @param  [type]                   $nativeField [description]
     * @return [type]                                [description]
     */
    private function getMapField($nativeMap, $nativeField, $orderBy, $modelId)
    {

        $model           = getVar('admin.model.type');
        $this->dataTable = $model[$modelId]['db'];

        $this->article     = table('Article')->getTableName();
        $this->articleData = table('Article' . $this->dataTable)->getTableName();

        //主表字段
        $fieldArr  = table('Article')->getField();
        $bFieldArr = table('Article' . $this->dataTable)->getField();

        $this->map = [];
        if ($nativeMap) {
            foreach ($nativeMap as $key => $value) {
                if (in_array($key, $fieldArr)) {
                    $this->map[$this->article . '.' . $key] = $value;
                } elseif (in_array($key, $bFieldArr)) {
                    $this->map[$this->articleData . '.' . $key] = $value;
                }
            }
        }
        $this->map[$this->article . '.model_id'] = $modelId;

        $this->field = '';
        $nativeField = explode(',', $nativeField);
        $nativeField = array_filter($nativeField);
        if ($nativeField) {
            foreach ($nativeField as $value) {
                if (in_array($value, $fieldArr)) {
                    $this->field .= $this->article . '.' . $value . ',';
                } elseif (in_array($value, $bFieldArr)) {
                    $this->field .= $this->articleData . '.' . $value . ',';
                }
            }
        }
        !$this->field ?: $this->field = substr($this->field, 0, -1);

        $this->orderby = '';
        $orderBy       = explode(',', $orderBy);
        $orderBy       = array_filter($orderBy);
        if ($orderBy) {
            foreach ($orderBy as $value) {
                $key = explode(' ', trim($value));

                if (in_array($key[0], $fieldArr)) {
                    $this->orderby .= $this->article . '.' . trim($value) . ',';
                } elseif (in_array($key[0], $bFieldArr)) {
                    $this->orderby .= $this->articleData . '.' . $value . ',';
                }
            }
        }

        !$this->orderby ?: $this->orderby = substr($this->orderby, 0, -1);

    }

    /**
     * 增加流量记录
     * @date   2018-03-28T09:09:41+0800
     * @author ChenMingjiang
     * @param  [type]                   $id [description]
     */
    public function addHot($id, $click = 1)
    {
        $result = table('Article')->where('id', $id)->save('hot', 'add', $click);
        if ($result === false) {
            return false;
        }

        return true;
    }

    /**
     * 根据语言返回字段
     * @date   2018-01-29T12:13:44+0800
     * @author ChenMingjiang
     * @param  [type]                   $data [description]
     * @param  [type]                   $name [description]
     * @param  [type]                   $lg   [description]
     * @return [type]                         [description]
     */
    public function getLgValue($data, $name, $lg)
    {

        if (!$data || !$name) {
            return '';
        }

        $lg = $lg ? $lg : 'zh';
        if ($lg != 'zh') {
            $value = isset($data[$name . '_' . $lg]) ? $data[$name . '_' . $lg] : $data[$name];
        } else {
            $value = isset($data[$name]) ? $data[$name] : '';
        }

        return $value;

    }

    public function appContent($content, $fontSize = 0.8)
    {

        $content = str_replace(PHP_EOL, '', $content);
        $content = str_replace("\t", '', $content);
        $expP    = explode('</p>', $content);

        //var_dump($expP);die;

        $duanluo[] = [];
        foreach ($expP as $key => $value) {
            $value = trim($value);
            if ($value) {
                $f1 = strip_tags($value, '<img>,<iframe>');

                /*'<iframe height=\"498\" width=\"510\" src=\"http://player.youku.com/embed/XOTI1NDAzNjEy\" frameborder=\"0\"></iframe>'
                 */

                preg_match_all('/<iframe[^>]*?src=\"([^>]+?)\"[^>]*?>/i', $f1, $matchs);
                if ($matchs[0]) {
                    foreach ($matchs[0] as $k => $v) {
                        $duanluo[] = array(
                            'type'    => 2,
                            'content' => $matchs[1][$k],
                        );
                    }
                }

                //去图片
                preg_match_all('/<img[^>]*?src=\"([^>]+?)\"[^>]*?>/i', $f1, $imgArr);
                if ($imgArr[0]) {
                    foreach ($imgArr[0] as $k => $vimg) {
                        $duanluo[] = array(
                            'type'    => 1,
                            'content' => $imgArr[1][$k],
                        );
                    }
                }

                //取内容
                $content = strip_tags($value, '<br>');
                if ($content) {
                    $duanluo[] = array(
                        'type'    => 0,
                        'content' => $content,
                    );
                }
            }
        }

        //var_dump($duanluo);die;

        $content = '';
        foreach ($duanluo as $key => $value) {
            if (!empty($value['type'])) {
                if ($value['type'] == 1) {

                    $value['content'] = URL . $value['content'];
                    $content .= '<p><img src="' . $value['content'] . '" style="width:96%;margin-left:2%;display:block;" /></p>';
                } elseif ($value['type'] == 0) {
                    $content .= '<p style="font-size:' . $fontSize . 'rem;text-align:justify;line-height:2rem; padding-left:0.2rem">' . $value['content'] . '</p>';
                } elseif ($value['type'] == 2) {
                    $content .= '<iframe height="450" width="100%" src="' . $value['content'] . '" frameborder="0"></iframe>';
                }
            }

        }

        return $content;
    }

}

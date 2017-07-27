<?php
namespace denha;

class Exception extends \Exception
{

    public static $localCode = array(
                  E_COMPILE_ERROR     => 4001,
                  E_COMPILE_WARNING   => 4002,
                  E_CORE_ERROR        => 4003,
                  E_CORE_WARNING      => 4004,
                  E_DEPRECATED        => 4005,
                  E_ERROR             => 4006,
                  E_NOTICE            => 4007,
                  E_PARSE             => 4008,
                  E_RECOVERABLE_ERROR => 4009,
                  E_STRICT            => 4010,
                  E_USER_DEPRECATED   => 4011,
                  E_USER_ERROR        => 4012,
                  E_USER_NOTICE       => 4013,
                  E_USER_WARNING      => 4014,
                  E_WARNING           => 4015,
                 );

    public static $localName = array(
                  E_COMPILE_ERROR     => 'PHP Compile Error',
                  E_COMPILE_WARNING   => 'PHP Compile Warning',
                  E_CORE_ERROR        => 'PHP Core Error',
                  E_CORE_WARNING      => 'PHP Core Warning',
                  E_DEPRECATED        => 'PHP Deprecated Warning',
                  E_ERROR             => 'PHP Fatal Error',
                  E_NOTICE            => 'PHP Notice',
                  E_PARSE             => 'PHP Parse Error',
                  E_RECOVERABLE_ERROR => 'PHP Recoverable Error',
                  E_STRICT            => 'PHP Strict Warning',
                  E_USER_DEPRECATED   => 'PHP User Deprecated Warning',
                  E_USER_ERROR        => 'PHP User Error',
                  E_USER_NOTICE       => 'PHP User Notice',
                  E_USER_WARNING      => 'PHP User Warning',
                  E_WARNING           => 'PHP Warning',
                  4016                => 'Customer`s Error',
                 );

    /**
     * 保存异常页面显示的额外Debug数据
     * @var array
     */
    protected $data = [];

    /**
     * 设置异常额外的Debug数据
     * 数据将会显示为下面的格式
     *
     * Exception Data
     * --------------------------------------------------
     * Label 1
     *   key1      value1
     *   key2      value2
     * Label 2
     *   key1      value1
     *   key2      value2
     *
     * @param string $label 数据分类，用于异常页面显示
     * @param array  $data  需要显示的数据，必须为关联数组
     */
    final protected function setData($label, array $data)
    {
        $this->data[$label] = $data;
    }

    /**
     * 获取异常额外Debug数据
     * 主要用于输出到异常页面便于调试
     * @return array 由setData设置的Debug数据
     */
    final public function getData()
    {
        return $this->data;
    }

}

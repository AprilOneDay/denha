<?php
return array(
    /* 数据库信息 */
    'db_type'          => 'mysqli', // 数据库类型
    'db_host'          => '127.0.0.1', // 服务器地址
    'db_name'          => 'koudaiche', // 数据库名
    'db_user'          => 'root', // 用户名
    'db_pwd'           => 'root', // 密
    'db_prefix'        => 'dh_', // 数据库表前缀
    'db_port'          => '3306', // 端口
    'db_dsn'           => '',
    'db_params'        => '',

    'db_fieldsCache'   => false, // 启用字段缓存
    'db_charset'       => 'utf8', // 数据库编码默认采用utf8
    'db_deployType'    => 0, // 数据库部署方式:0 集中式(单一服务器),1 分布式(主从服务器)
    'db_rwSeparate'    => false, // 数据库读写是否分离 主从式有效
    'db_masterNum'     => 1, // 读写分离后 主服务器数量
    'db_slaveNo'       => '', // 指定从服务器序号

    /** sql记录配置 */
    'db_save_log'      => true, //是否开启sql日志保存
    'db_slow_save_log' => true, //是否开启慢sql日志记录
    'db_slow_time'     => 5, //查询时间超过多少秒记录日志
);

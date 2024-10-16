<?php
return [
    'defaultRoute' => '/site/login',
    'timeZone' => 'Asia/Tashkent',
    'on beforeRequest' => function ($event) {
        Yii::$app->language = Yii::$app->session->get('language', 'kz-KZ');
    },

    'aliases' => [
        '@bower' => '@vendor/bower-asset',
        '@npm'   => '@vendor/npm-asset',
    ],
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'components' => [
        'cache' => [
            'class' => \yii\caching\FileCache::class,
        ],

        'formatter' => [
            'datetimeFormat' => 'php: d-m-Y, H:i:s',
            'locale' => 'ru'
        ],
    ],
];

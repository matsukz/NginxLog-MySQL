# NginxのログをMySQLに登録するやーつ
GrafanaでNginxのアクセスログを集計するときに使います。

レポジトリに載せれる箇所だけです。

載せれない部分は空値 or 空ファイルにしてます。

自分用のメモです。

> [!NOTE]
> Webサーバーではありません。
> 
> stream moduleを用いて国フィルターとして利用しているNginxのアクセスログを集計しています。
> 
> 流用可能でしょうが私は知りません。

## fluentd
`fluent/fluentd:v1.16-1`を利用しています。

ログを観測してDBに登録してくれるそうです。

### 必要なファイルのマウント
* fluentd.conf -> /fluentd/etc/fluent.conf
* ltsv形式のログ -> /var/log/nginx/access.log
  * configで設定した場所です

## MySQL
* 普通のMySQLです
  * なんでMySQLかというと`phpmyadmin`が使えるからです

### 必要なファイルとマウント
* テーブル作成スクリプト -> /docker-entrypoint-initdb.d
  * コンテナ作成と同時にテーブルを作らないとエラーになるらしいです
* ./mysql/data -> /var/lib/mysql
  * データの永続化

## phpmyadmin
* MySQL初心者ですすいません生きててごめんなさい

## Nginxのログフォーマット
4点を記録しています
* 時間
* 接続元IP
* 国コード
* 動作
```conf
log_format ltsv "log_time:$time_iso8601\t"
                "remote_addr:$remote_addr\t"
                "country:$geoip2_data_country_code\t"
                "status:$status";
```

# 参考
[Nginxのアクセスログをfluentd経由でMySQLに保存する](https://itoka.hatenadiary.com/entry/2022/03/17/000944)

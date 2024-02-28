# README
勤怠管理アプリケーションです。


## 使い方

このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。
その後、次のコマンドで必要になる RubyGems をインストールします。

```
$ gem install bundler -v 2.4.19
$ bundle install
```

その後、データベースへのマイグレーションを実行します。

```
$ rails db:migrate
```

Railsサーバーを立ち上げることができます。

```
$ rails server
```


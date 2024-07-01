# README
企業の採用時の課題として作成した勤怠管理アプリケーションです。

## 課題概要
勤怠管理アプリケーションを作成しなさい。用途や機能などは自由とします。

## 独自設定課題
アルバイト契約者が、様々な勤務地に村座する系列店で出勤できるアプリケーションを開発する

## 要求・要件
### 要求主体
- アルバイトスタッフ
- シフト管理者
### 要求
- アルバイトスタッフが、出勤する際に勤務地を一緒に登録することができる
- シフト管理者が、勤務地別に勤怠一覧を確認することができる
- 新たな勤務地、及びユーザー情報の登録は、シフト管理者のみが行うことができる

### 要件
- 勤務地情報を勤務時間をレコードに併せて保存する
- 勤務地ごとで、勤怠履歴一覧を表示する

### 設計
- 勤怠登録画面
- <img width="592" alt="image" src="https://github.com/MasatoIkeda05/timesheet_app/assets/142978007/861445ba-1f45-4ed2-8947-c61846212359">
  - プルダウン形式で、勤務地を選択することができる
  - <img width="725" alt="image" src="https://github.com/MasatoIkeda05/timesheet_app/assets/142978007/62f11bf6-7a6f-48a0-b262-17cb24e63649">

- 勤怠一覧画面
- <img width="811" alt="image" src="https://github.com/MasatoIkeda05/timesheet_app/assets/142978007/71f41d4d-9e41-4ec7-94da-8deaad548076">
  - 勤務地を選択することで表示する勤務地を絞り込むことができる 
  [![Image from Gyazo](https://i.gyazo.com/e573d118229a76a83410fa8009959c63.gif)](https://gyazo.com/e573d118229a76a83410fa8009959c63)

- 管理者機能
  - 画面
    - 管理者アカウントでログイン時
    - <img width="727" alt="image" src="https://github.com/MasatoIkeda05/timesheet_app/assets/142978007/6b2831b9-e004-4453-90d2-c73741316cf2">
    - 一般アカウントでログイン時
    - <img width="569" alt="image" src="https://github.com/MasatoIkeda05/timesheet_app/assets/142978007/e36c6ca5-4b9a-4194-b957-ece8f6cb982d">
  - ユーザー登録
  - <img width="881" alt="image" src="https://github.com/MasatoIkeda05/timesheet_app/assets/142978007/8f89ce25-dbc1-44ff-9a52-c7e2166ad5ea">
 
  - 勤務地登録
  - <img width="671" alt="image" src="https://github.com/MasatoIkeda05/timesheet_app/assets/142978007/b5f5585d-36f0-48af-87ed-b2619ffe8de7">


## アプリケーション情報
### URL
https://timesheet-app-1.onrender.com

### 登録ユーザー
- adminユーザー
  メールアドレス：example@kintai.org,　パスワード：foobar
- 一般ユーザー
  メールアドレス：masato@kintai.org,　パスワード：foobaz


## 編集方法

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


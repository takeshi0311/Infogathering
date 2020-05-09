# README

# Name（takeshi0311/Infogathering）
下記の3つのエンジニアサイトから定期的にスクレイピングを実行し、<br>
まとめた「エンジニア向けのまとめサイト」となっております。

・はてなブック<br>
https://b.hatena.ne.jp/hotentry/it

・Developers.IO<br>
https://dev.classmethod.jp/

・サイボウズ式<br>
https://cybozushiki.cybozu.co.jp/recent_8.html

ぜひ下記リンクから一度みてください。<br>
http://www.infogathering.info/

ユーザー名：62-night<br>
pass：2020

ユーザーログインは以下のテストユーザーをお使いください。<br>
テストユーザー<br>
メールアドレス：test1234@test.com<br>
pass:test1234<br>
 
# DEMO
 ・新規登録<br>
 https://gyazo.com/83cedba4a2ad9ca6baba7399bd553e17<br>
 ・ログイン<br>
 https://gyazo.com/cdc8c94b4addd07fe36466028864747d<br>
 ・スクレイピング情報<br>
 https://gyazo.com/bfc7611f54052f7a3ffc1d49c4973464<br>
 ・お気に入り機能<br>
 https://gyazo.com/c860ee1e158f5a1f743429edbbe42a6d<br>
 ・ランキング機能<br>
 https://gyazo.com/84855812116f4f70b18a3d249fa7f1be<br>
 
# Features
 このアプリはエンジニアとして働いていく上で欠かせない情報を配信しているサイトを選定し、まとめているのが特徴になります。
 
 以下になぜ以下の３つのサイトを選定し、まとめたかを記載します。<br>
 ①はてなブック（https://b.hatena.ne.jp/hotentry/it）<br>
 IT業界では、次々と生まれる業界のトレンドをチェックする必要があり、それらを効率よく情報収集できるはてなブックマークはエンジニアとして働いていく上で絶対にチェックし、インプットする必要があると考えたため選定しております。
 
 ②Developers.IO（https://dev.classmethod.jp/）<br>
 Developers.IOは、はてなブックマークと比べてインフラ関係の情報が充実しています。自分たちのサービスを上手く運用するために、およびインフラ構築によりスムーズな開発環境の構築など開発効率にも欠かせないインフラの知識はエンジニアとして働いていく上で必要であると考えたため選定しております。
 
 ③サイボウズ式（https://cybozushiki.cybozu.co.jp/recent_8.html）<br>
 サイボウズ式では、上記2つのサイトと比べて技術よりも組織やマインドセットを主に配信しているサイトとなっています。エンジニアに限らず、仕事をする際にチームを作ってプロジェクトを進めると思います。エンジニアは技術は必要ですが、それ以上にチームと一丸となって問題解決するかが重要だと考えています。チームを上手く機能させ、より良いサービスを作るヒントが得られるのではないかと考え、選定しました。
 
 
# Installation
 下記URLに入って頂き、passを入力してください。<br>
 http://www.infogathering.info/<br>
 
ユーザー名：62-night<br>
pass：2020<br>

ユーザーログインは以下のテストユーザーをお使いください。<br>
テストユーザー<br>
メールアドレス：test1234@test.com<br>
pass:test1234<br>
 
# Usage
基本的な使い方<br>
上記のサイトに入ると、各サイトからその日スクレイピングした情報を閲覧することができます。<br>
見たい情報がある場合、タイトルを押すことでサイトに飛ぶことができます。<br>
また新規登録をすることで、あとで読みたい記事がある場合は「あとで読む」ボタンを押すことでストックすることができます。<br><br>
<img border="0" src="https://github.com/takeshi0311/Infogathering/blob/master/images/Infogathering1.png" width="900" height="500" alt="天気メッセージ一覧">

新規登録すると、「あとで読む」ボタンをクリックすることができ、<br>
ストックボタンを押すことで「あとで読む」をクリックした記事が一覧で確認することできます。<br>
またランキング機能もあり、全ユーザーが一番閲覧・関心のある記事を確認できるようになっています。<br><br>
<img border="0" src="https://github.com/takeshi0311/Infogathering/blob/master/images/Infogathering2.png" width="1000" height="500" alt="天気メッセージ一覧">

 
 
# Note
アプリに入るにはpassが必要です。<br>
以下のpassを入力してください。<br>
ユーザー名：62-night<br>
pass：2020<br>
 
# Author
 
作成情報を列挙する
 
* 作成者：スズキタケシ
* E-mail：takeshi.c.suzuki@gmail.com


* ...
# Infogathering DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false|
|username|string|null: false, unique: true|
### Association
- has_many :infos,  through:  :user_infos
- has_many :user_infos

## infosテーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false, unique: true|
|text|text|null: false, unique: true|
|url|text|null: false, unique: true|
<!-- |detail|text|null: false| -->
### Association
- has_many :users,  through:  :user_infos  
- has_many :user_infos

## user_infosテーブル
|Column|Type|Options|
|------|----|-------|
|info_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :info

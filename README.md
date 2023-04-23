# ながのCAKE

長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト<br>
元々近隣住民たちが顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るようになった。<br>
InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い至った。


## 通販について

・通販では注文に応じて製作する受注生産型としている。<br>
・現在通販での注文量は十分に対応可能な量の為、1日の受注量に制限は設けない。<br>
・送料は1配送につき全国一律800円。<br>
・友人や家族へのプレゼントなど、注文者の住所以外にも商品を発送できる。<br>
・支払方法はクレジットカード、銀行振込から選択できる。<br>

## 主な実装機能
【会員側機能】<br>
・新規会員登録、ログイン/ログアウト、退会機能<br>
・商品の注文機能<br>
・注文履歴の管理機能<br>
・配送先の管理機能<br>

【管理者側機能】<br>
・管理者ログイン/ログアウト機能<br>
・商品の新規追加、編集、閲覧機能<br>
・商品ジャンルの新規追加、編集機能<br>
・会員情報の管理機能(情報閲覧、編集、退会処理)<br>
・販売ステータスの選択、注文ステータスの更新、製作ステータスの更新機能<br>

## 使用方法<br>
$ git clone git@github.com:DMMWEBCAMPjoker/nagano_cake.git<br>
$ bucdle:install<br>
$ rails db:migrate<br>
$ rails db:seed<br>
$ rails s<br>

**管理者ログイン**<br>
メールアドレス：admin@admin<br>
パスワード：testtest<br>



## 開発環境<br>
Cloud9<br>

**バックエンド**<br>
・Ruby 3.1.2<br>
・Ruby on Rails 6.1.7<br>
・SQLite3<br>

**フロントエンド**<br>
・HTML<br>
・SCSS<br>

**その他**<br>
・devise<br>
・Bootstrap<br>
・Font Awesome<br>
・kaminari<br>
・enum_help<br>
・ActiveStorage<br>


**ER図**<br>




## 作成者<br>

チーム　Joker <br>
・こば<br>
・かわかみ<br>
・こまつ<br>

# これはなに？

Lotus を使った、1ファイルアプリケーションのサンプルです。

Webブラウザで以下のURLにアクセスするこで、コンテンツが表示されます。

* http://localhost:2300/

# 動作環境

## OS

Linux での動作を想定しています。以下で動作確認済みです。

* OS X 10.10 + Homebrew 0.9.5
* Ubuntu 15.04

## ruby

Ruby と Bundler が必要です。以下で動作確認済みです。

* Ruby ver2.2.2
* Bundler ver1.9.9

# インストール方法

シェルで以下を実行してください。

    $ git clone https://github.com/taturou/lotus_sample_onefile.git
    $ cd lotus_sample_onefile
    $ bundle install

# 実行方法

シェルで以下を実行してください。

    $ bundle exec lotus server

# 動作確認方法

lotus server を実行後、Webブラウザから `http://localhost:2300` にアクセスしてください。

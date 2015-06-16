# coding: utf-8
require 'lotus'

# モジュール名は OnFile ではなく ::OneFile とする。
# Shotgun ライブラリがネームスペースをラッパしてしまうため。
module ::OneFile
  class Application < Lotus::Application
    configure do
      routes do
        get '/', to: 'home#index'
        get '/hello', to: 'home#hello', as: :hello  # このルーティング情報に :hello という名前をつける
      end
    end
    load!
  end

  module Controllers
    module Home
      include OneFile::Controller

      class Index
        include OneFile::Action

        # Viewで扱いたいデータは expose する必要がある
        expose :time

        def call(params)
          # Viewで扱いたいデータはインスタンス変数とする
          @time = Time.now
        end
      end

      class Hello
        include OneFile::Action

        # ルーティング情報をViewでも扱えるようにする
        # これは Applicationクラス内から渡されてきたもの
        expose :routes

        def call(params)
        end
      end
    end
  end

  module Views
    module Home
      class Index
        include OneFile::View

        def render
          # expose した名前でアクセスする
          "Now: #{time}"
        end
      end

      class Hello
        include OneFile::View

        def render
          # ローティング情報 :hello のパスを表示する
          html  = "<p>Here path is #{routes.path(:hello)}<p>"
          # ローティング情報 :hello のURLを表示する
          html += "<p>Here url is #{routes.url(:hello)}</p>"
          # そのままだと "<p>" が "&lt;p&gt;" となるので生のHTMLであることを伝える
          _raw html
        end
      end
    end
  end
end

run ::OneFile::Application.new

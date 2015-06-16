# coding: utf-8
require 'lotus'

# モジュール名は OnFile ではなく ::OneFile とする。
# Shotgun ライブラリがネームスペースをラッパしてしまうため。
module ::OneFile
  class Application < Lotus::Application
    configure do
      routes do
        get '/', to: 'home#index'
      end
    end
    load!
  end

  module Controllers
    module Home
      include OneFile::Controller

      class Index
        include OneFile::Action

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
          'Hello World!'
        end
      end
    end
  end
end

run ::OneFile::Application.new

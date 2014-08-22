module Lotus
  module Routing
    class Builder
      def initialize(options = {}, &blk)
        @router = Lotus::Routing::HttpRouter.new(options)
        instance_eval &blk
      end

      def mount(app)
        @app = app.new
        @router.mount @app, at: "/"
      end

      def call(env)
        @router.call(env)
      end
    end
  end
end

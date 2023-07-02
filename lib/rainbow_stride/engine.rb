module RainbowStride
  class Engine < ::Rails::Engine
    isolate_namespace RainbowStride

    initializer "rainbow_stride.assets.precompile" do |app|
      app.config.assets.paths << root.join('vendor', 'assets', 'javascripts').to_s
    end
  end
end

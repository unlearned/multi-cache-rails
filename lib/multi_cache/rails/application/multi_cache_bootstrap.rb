module Rails
  class Application
    module Bootstrap
      initializer :initialize_multi_cache, after: :initialize_cache, group: :all do
        config.cache_store_names.each do |name|
          next if name == :default
          Rails.cache = {
            name: name,
            cache: ActiveSupport::Cache.lookup_store(config.cache_store(name))
          }

          if Rails.cache(name).respond_to?(:middleware)
            config.middleware.insert_before("Rack::Runtime", Rails.cache(name).middleware)
          end
        end
      end
    end
  end
end

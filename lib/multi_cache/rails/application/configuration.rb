module Rails
  class Application
    class Configuration

      def cache_store=(cache_setting)
        init_cache_store

        case cache_setting
        when Hash
          key = cache_setting[:name]
          @cache_store[key] = cache_setting[:setting]
        else
          @cache_store[:default] = cache_setting
        end
        @cache_store
      end

      def cache_store(cache_name = :default)
        init_cache_store
        @cache_store[cache_name] || @cache_store[:default]
      end

      def cache_store_names
        return [] if @cache_store.blank?
        @cache_store.keys
      end

      private

      def init_cache_store
        @cache_store = { default: @cache_store } if @cache_store.instance_of? Array
      end
    end
  end
end

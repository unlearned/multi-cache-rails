# frozen_string_literal: true
module Rails
  class << self
    def cache=(cache_obj)
      @cache = {} unless defined? @cache
      case cache_obj
      when Hash
        key = cache_obj[:name]
        @cache[key] = cache_obj[:cache]
      else
        @cache[:default] = cache_obj
      end
      nil
    end

    def cache(name = :default)
      return nil unless defined? @cache
      @cache[name] || @cache[:default]
    end
  end
end

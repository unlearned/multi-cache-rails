require 'spec_helper'
describe Rails::Application::Bootstrap do
  describe 'initializer propery run' do
    before do
      class TestMultiCache < Rails::Application
        config.cache_store = {
          name: :secondary,
          setting: :memory_store
        }
      end
      TestMultiCache.initialize!
    end
    it 'returns cache objects with key' do
      expect(Rails.cache.class).to eq ActiveSupport::Cache::FileStore
      expect(Rails.cache(:default).class).to eq ActiveSupport::Cache::FileStore
      expect(Rails.cache(:secondary).class).to eq ActiveSupport::Cache::MemoryStore
    end
  end
end

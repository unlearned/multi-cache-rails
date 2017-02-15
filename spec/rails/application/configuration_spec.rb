require 'spec_helper'
describe Rails::Application::Configuration do
  describe '#cache_store' do
    let(:configuration) { Rails::Application::Configuration.new }

    context 'default' do
      subject { configuration.cache_store }
      it { should eq [:file_store, '/tmp/cache/'] }
    end

    context 'set the prymary' do
      let(:cache_setting) { [:file_store, '/tmp/cache/test'] }
      subject do
        configuration.cache_store = cache_setting
        configuration.cache_store
      end
      it { should eq cache_setting }
    end

    context 'set the prymary' do
      let(:cache_setting_secondary) { [:file_store, '/tmp/cache/secondary'] }
      let!(:set) do
        configuration.cache_store = {
          name: :secondary,
          setting: cache_setting_secondary
        }
      end

      it 'returns caches' do
        expect(configuration.cache_store).to eq [:file_store, '/tmp/cache/']
        expect(configuration.cache_store(:secondary)).to eq cache_setting_secondary
      end
    end
  end
end

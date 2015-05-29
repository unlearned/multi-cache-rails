require 'spec_helper'
module Rails
  describe '.cache' do
    let!(:set1) { Rails.cache = 'cache_object1' }
    let!(:set2) { Rails.cache = { name: :secondary, cache: 'cache_object2' } }
    let!(:set3) { Rails.cache = { name: :tertiary, cache: 'cache_object3' } }

    it 'retyrns cache object' do
      expect(Rails.cache).to eq 'cache_object1'
      expect(Rails.cache(:default)).to eq 'cache_object1'
      expect(Rails.cache(:secondary)).to eq 'cache_object2'
      expect(Rails.cache(:tertiary)).to eq 'cache_object3'
    end
  end
end

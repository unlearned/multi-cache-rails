# MultiCache::Rails

Multiple cache configuration for Ruby On Rails.


## Installation

Add this line to your application's Gemfile:

    gem 'multi_cache-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install multi_cache-rails

## Usage

On `Application.configure` , it's like `project_root/config/emvironments/production.rb`

```
YourProject::Application.configure do

config.cache_store =  :dalli_store, 'localhost', { :namespace => 'Fril', :compress => true }
config.cache_store = {
  name: :secondary,
  setting: :memory_store
}
end
```

Then, In your project, you can use the caches like below,
```
Rails.cache.read("something") # fetch cached object from :dalli_store
Rails.cache(:secondary).read("something") # fetch cached object from :memory_store
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/multicache-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

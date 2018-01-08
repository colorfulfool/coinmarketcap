require 'test_helper'

VCR.configure do |config|
  config.cassette_library_dir = Rails.root.join("test", "requests")
  config.hook_into :webmock
end

class CoinTest < ActiveSupport::TestCase
  test "fetch_all" do
    assert_difference "Coin.count", +200 do
      VCR.use_cassette("coinmarketcap", record: :new_episodes) do
        Coin.fetch_all(max_pages: 2)
      end
    end
    
    assert_equal Coin.first.name, "Bitcoin"
  end
end

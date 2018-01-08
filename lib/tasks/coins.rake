namespace :coins do
  task fetch: :environment do
    Coin.delete_all
    Coin.fetch_all
  end
end

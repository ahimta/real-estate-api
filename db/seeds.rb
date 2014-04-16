#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Trade.destroy_all

QUANTITY = 5

QUANTITY.times do |i|
  trade = Trade.create! name: "Trade#{i}"

  QUANTITY.times do |j|
    Idea.create body: "Idea#{j}", trade_id: trade.id
  end

  QUANTITY.times do |j|
    shop = Shop.create! name: "Shop#{j}", phone:"Shop#{j} phone", lower_price: j,
      higher_price: (j+50), rating:(j%6), notes:"Shop#{j} notes", trade_id: trade.id

    QUANTITY.times do |k|
      Material.create! name: "Material#{k}", lower_price: k, higher_price: (k+100), rating: (k%6),
        notes: "Material#{k} notes", shop_id: shop.id, trade_id: trade.id

      Worker.create! name: "Worker#{k}", phone: "Worker#{k} phone", lower_price: k,
        higher_price: (k+100), rating: (k%6), notes: "Worker#{k} notes", shop_id: shop.id,
        trade_id: trade.id
    end
  end
end

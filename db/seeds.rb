#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
trade0 = Trade.create! name: 'كهرباء'
trade1 = Trade.create! name: 'لياسة'
trade2 = Trade.create! name: 'بوية'

shop0 = Shop.create! name: 'أنوار الشعيب', phone: '0501024323', rating: 5, lower_price: 5,
  higher_price: 300, trade_id: trade0.id
shop1 = Shop.create! name: 'راشد', phone: '0502401323', rating: 4, lower_price: 30,
  higher_price: 500, trade_id: trade1.id

worker0 = Worker.create! name: 'أحمد', phone: '0555234321', rating: 3, lower_price: 50,
  higher_price: 90, shop_id: shop0.id, trade_id: trade0.id
worker1 = Worker.create! name: 'أحمد', phone: '0555267621', rating: 5, lower_price: 50,
  higher_price: 130, shop_id: shop0.id, trade_id: trade1.id

material0 = Material.create! name: 'اسمنت المدينة', material_type: 'اسمنت', rating: 4,
  lower_price: 15, higher_price: 20, shop_id: shop0.id, trade_id: trade1.id
material1 = Material.create! name: 'دهانات الجزيرة', material_type: 'بوية بدون لمعة', rating: 3,
  lower_price: 15, higher_price: 20, shop_id: shop0.id, trade_id: trade2.id

trade0.ideas.create! [{body: 'تجريح الأسلاك'}, {body: 'عداد أصلي'}]
trade1.ideas.create! [{body: 'شراء الأبواب جاهزة'}, {body: 'عدم استخدام دهانات تجارية'}]

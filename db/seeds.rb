#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
trades = Trade.create! [{name: 'كهرباء'}, {name: 'لياسة'}, {name: 'بوية'}]
trades.first.ideas.create! [{body: 'تجريح الأسلاك'}, {body: 'عداد أصلي'}]
trades.last.ideas.create! [{body: 'شراء الأبواب جاهزة'}, {body: 'عدم استخدام دهانات تجارية'}]

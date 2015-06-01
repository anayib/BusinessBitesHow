# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{
		email: 'sezama08@gmail.com',
		name: 'Sebastian Zapata',
		role: "admin",
		password: 'holamama'
	},
	{
		email: 'nayib.abdala@gmail.com',
		name: 'Nayib Abdala',
		role: "admin",
		password: 'holamama'
		}])

plan = Plan.create(stripe_id: 'vip', name: 'VIP Plan', amount: 500, interval:'month', description: 'VIP Plan', published: true)
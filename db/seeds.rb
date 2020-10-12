# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Deleting existing seeds in database'

Buyer.delete_all
Seller.delete_all
Business.delete_all
Bid.delete_all

puts 'Seeding database with new seeds'

buyer1 = Buyer.create(email_address: 'amit@buyer.com', password: 'hello', first_name: 'Amit', last_name: 'Deshpande', company_name: 'FIS', aum: 1_000_000, prof_pic: 'https://hips.hearstapps.com/wdy.h-cdn.co/assets/17/39/1506709524-cola-0247.jpg?crop=1.00xw:0.750xh;0,0.226xh&resize=480:*', industry: 'TMT')
buyer2 = Buyer.create(email_address: 'amit@buyer2.com', password: 'hello', first_name: 'Amit2', last_name: 'Deshpande2', company_name: 'FIS2', aum: 1_000_000, prof_pic: 'https://hips.hearstapps.com/wdy.h-cdn.co/assets/17/39/1506709524-cola-0247.jpg?crop=1.00xw:0.750xh;0,0.226xh&resize=480:*', industry: 'CRG')
seller1 = Seller.create(email_address: 'amit@seller.com', password: 'hello', first_name: 'Amit', last_name: 'Deshpande', prof_pic: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/lifestyle-bestdogbreeds-1577128927.png?crop=0.502xw:1.00xh;0.263xw,0&resize=640:*')
business1 = Business.create(name: 'Testing', location: 'Testing', founder_name: 'Tom Son', industry: 'TMT', biz_type: 'Institutional', employees: 100, revenue: 30_000, description: 'Works with Tech', seller_id: seller1.id)
business2 = Business.create(name: 'Testing2', location: 'Testing2', founder_name: 'Tom Son2', industry: 'TMT', biz_type: 'Institutional', employees: 100, revenue: 30_000, description: 'Works with Tech', seller_id: seller1.id)
bid1 = Bid.create(buyer_id: buyer1.id, business_id: business1.id, bid_price: 1_000_000, closing_timeline: 30, cash_consid: 0.8, eq_consid: 0.2, winning_bid: false)
bid2 = Bid.create(buyer_id: buyer2.id, business_id: business1.id, bid_price: 5_000_000, closing_timeline: 30, cash_consid: 0.8, eq_consid: 0.2, winning_bid: false)

puts 'Done seeding database with test seeds'

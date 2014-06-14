# admin = User.new(
#   email: 'admin@example.com',
#   roles: ['admin'],
#   password: 'administrator',
#   password_confirmation: 'administrator'
# )
# admin.skip_confirmation!
# admin.save!

Campaign.delete_all
User.delete_all

def time_rand from = Time.now, to = Time.now + 2.months
  Time.at(from + rand * (to.to_f - from.to_f))
end

big_company = Company.create({
	name:'My Big Company', 
	ordinary_shares: 200
	# founders: [User.create({email:'john@doe.tld'})] 
})

(1..10).to_a.each do |i|
	start_date = time_rand()
	c = Campaign.new({
		name: Faker::Company.name,
		description: Faker::Lorem.paragraph,
		start_date: start_date,
		end_date: start_date + 3.months
	})
	c.create_transaction 100, 1000
	c.save
	# big_company.campaigns = [] unless big_company.campaigns
	# big_company.campaigns << c
end
# big_company.save
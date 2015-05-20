require 'faker'
 
  # Create Emily (customer user)
   emily = User.new(
     name:     "Emily Customer",
     email:    "emily@example.com",
     password: "helloworld",
     role: "Customer",
   )
   emily.skip_confirmation!
   emily.save!

  # Create Admin user
    admin = User.new(
     name:     "Admin",
     email:    "admin@example.com",
     password: "helloworld",
     role: "Customer",
   )
   admin.skip_confirmation!
   admin.save!

  #create 10 different cleaners

  10.times do 
    cleaner=User.new(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Lorem.characters(10),
      role: "Vendor",
      base_rate: 20 + rand(15),
      bedroom_rate: 5 + rand(10),
      bathroom_rate: 10 + rand(5),
      )
    cleaner.skip_confirmation!
    cleaner.save!
  end

  puts "Seed finished"
  puts "Emily and Admin user created"
  puts "#{Vendor.count} vendors created"

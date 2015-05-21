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

   #Create an Illinois property for Emily
   property=emily.properties.new(
    name: "Emily's Illinois House",
    street_address: "250 Lehigh Lane",
    city: "Bloomingdale",
    state: "IL",
    zipcode: "60108",
    bathrooms: 3,
    bedrooms: 3,
    )
   property.save!

   #Create a Wisconsin property for Emily
   wisconsin=emily.properties.new(
    name: "Emily's Wisconsin House",
    street_address: "123 Campus Drive",
    city: "Madison",
    state: "WI",
    zipcode: "53703",
    bathrooms: 2,
    bedrooms: 2,
    )
   wisconsin.save!

  # Create Admin user
    admin = User.new(
     name:     "Admin",
     email:    "admin@example.com",
     password: "helloworld",
     role: "Customer",
   )
   admin.skip_confirmation!
   admin.save!

   # Create Cleaner (vendor user)
   cleaner = User.new(
     name:     "Klean Cleaner",
     email:    "cleaner@example.com",
     password: "helloworld",
     role: "Vendor",
     base_rate: 20 + rand(15),
     bedroom_rate: 5 + rand(10),
     bathroom_rate: 10 + rand(5),
     zipcode: 60108,

   )
   cleaner.skip_confirmation!
   cleaner.save!

  #create 10 different vendors in 60108

  10.times do 
    vendor=User.new(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Lorem.characters(10),
      role: "Vendor",
      base_rate: 20 + rand(15),
      bedroom_rate: 5 + rand(10),
      bathroom_rate: 10 + rand(5),
      zipcode: 60108,
      )
    vendor.email="#{vendor.name.split(' ').join}@illinoiscleaner.com"
    vendor.skip_confirmation!
    vendor.save!
  end

  #create 10 different vendors in 53703

  10.times do 
    vendor=User.new(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Lorem.characters(10),
      role: "Vendor",
      base_rate: 20 + rand(15),
      bedroom_rate: 5 + rand(10),
      bathroom_rate: 10 + rand(5),
      zipcode: 53703,
      )
    vendor.email="#{vendor.name.split(' ').join}@wisconsincleaner.com"
    vendor.skip_confirmation!
    vendor.save!
  end

  vendors=Vendor.all

  #Set schedules for the cleaners
  vendors.each do |x|
    x.schedule.monday_start=Time.new(2000,1,1,(5+rand(4)),0,0)
    x.schedule.monday_end=Time.new(2000,1,1,(15+rand(6)),0,0)
    x.schedule.tuesday_start=Time.new(2000,1,1,(5+rand(4)),0,0)
    x.schedule.tuesday_end=Time.new(2000,1,1,(15+rand(6)),0,0)
    x.schedule.wednesday_start=Time.new(2000,1,1,(5+rand(4)),0,0)
    x.schedule.wednesday_end=Time.new(2000,1,1,(15+rand(6)),0,0)
    x.schedule.thursday_start=Time.new(2000,1,1,(5+rand(4)),0,0)
    x.schedule.thursday_end=Time.new(2000,1,1,(15+rand(6)),0,0)
    x.schedule.friday_start=Time.new(2000,1,1,(5+rand(4)),0,0)
    x.schedule.friday_end=Time.new(2000,1,1,(15+rand(6)),0,0)
    x.schedule.saturday_start=Time.new(2000,1,1,(5+rand(4)),0,0)
    x.schedule.saturday_end=Time.new(2000,1,1,(15+rand(6)),0,0)
    x.schedule.sunday_start=Time.new(2000,1,1,(5+rand(4)),0,0)
    x.schedule.sunday_end=Time.new(2000,1,1,(15+rand(6)),0,0)
    x.schedule.save
  end

  puts "Seed finished"
  puts "Emily and Admin user created"
  puts "#{Vendor.count} vendors created"

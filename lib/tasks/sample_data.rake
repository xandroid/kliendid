namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Mihkel Püümann",
                 email: "mpyymann@gmail.com",
				 aadress: "Graniidi 24, Tallinn",
                 password: "foobar",
                 password_confirmation: "foobar",
				 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      aadress  = "Lehe 26-#{n+1}, Tallinn"
	  password  = "password"
      User.create!(name: name,
                   email: email,
				   aadress: aadress,
                   password: password,
                   password_confirmation: password)
    end
  end
end
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
      email = "karu-#{n+1}@metsalised.ee"
      aadress  = "Lehe 26-#{n+1}, Tallinn"
	  password  = "password"
      User.create!(name: name,
                   email: email,
				   aadress: aadress,
                   password: password,
                   password_confirmation: password)
	end
	users = User.all()
    3.times do |n|
      maja = "Lehe 26-#{n+1}"
	  linn = "Metsaküla"
      users.each { |user| user.aadresses.create!(maja: maja, linn: linn) }
    end
  end
end
namespace :db do
  desc "Fill database with admin details"
  task populate: :environment do
    admin = Admin.create!(email: "ukirde.priyanka@weboniselab.com",
                           password: "123456789",
                           password_confirmation: "123456789")

  end
end
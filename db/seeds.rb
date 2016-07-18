# user= User.create(email: "robert@robert.com", password: "12345678", password_confirmation: "12345678")
#
# treasuremap = user.treasuremaps.create(name: "Houston, TX 77063")
#
# photo_1 = treasuremap.photos.new location: "7705 Westheimer Road, Houston, TX 77063", description: "Uberrito Burrito Bowl!",
# File.open("#{Rails.root}/app/assets/images/uberrito_bowl.jpg", "rb") do |file|
#   photo_1.photo = file
# end
# photo_1.save!

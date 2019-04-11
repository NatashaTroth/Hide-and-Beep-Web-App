# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])




Hunt.create(:name => "My First Hunt", :start_date => "09.04.2019", :expiry_date => "12.04.2019", :no_time_limit => true, :winning_code => "youWon234")
Hunt.create(:name => "My Second Hunt", :start_date => "09.04.2019", :expiry_date => "25.04.2019", :no_time_limit => true, :winning_code => "youWonAgain")
Hunt.create(:name => "My Third Hunt", :start_date => "19.06.2020", :expiry_date => "01.04.2021", :no_time_limit => true, :winning_code => "youJustKeepWinning")


FactoryBot.define do
  factory :piece do
    type {"King"}

  end
  
  factory :king do
    
  end
  factory :queen do
    
  end
  factory :rook do
    
  end

  factory :bishop do
    
  end

  factory :knight do
    
  end
  factory :pawn do
    position_x 1
    position_y 1
    game
  end

  factory :player do
    sequence :email do |n|
      "dummi#{n}Email#{n}@gmail.com"
    end

    password {"secretPassword"}
    name {"test"}
    sequence :id do |i|
      "#{i}#{i}"
    end

  end

  
  factory :game do
    name {"test"}
    white_player_id {1}
    black_player_id {1}
    sequence :id do |i|
      "#{i}#{i}"
    end
  end


  


end
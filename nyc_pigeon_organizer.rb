def nyc_pigeon_organizer(data)
  new_hash = {}
  
  male_pigeons_arr = data[:gender][:male]
  female_pigeons_arr = data[:gender][:female]
  keys = male_pigeons_arr + female_pigeons_arr
  #p keys
  
  keys.each do |bird_name|
    bird_colors = []
    data[:color].each do |color, name_array|
      if name_array.include?(bird_name)
        bird_colors << color.to_s
      end
    end
    
    bird_gender = []
    data[:gender].each do |gender, name_array|
      if name_array.include?(bird_name)
        bird_gender << gender.to_s
      end
    end
  
    
    bird_home = []
    data[:lives].each do |home, name_array|
      if name_array.include?(bird_name)
        bird_home << home.to_s
      end
    end
    
    if !new_hash[bird_name]
      new_hash[bird_name] = {
        :color => bird_colors,
        :gender => bird_gender,
        :lives => bird_home
      }
    end
   end
   
  new_hash
  #p new_hash["Ms. K"][:gender]
end

=begin
pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

nyc_pigeon_organizer(pigeon_data)

=begin
        :color => ["an array of colors that have the name of the key present in individual color array in the data set"],
        :gender => ["an array that contains the gender in the original data set that has the key in its value array"],
        :lives => ["an array of any keys from the original data set that contain this key name in its value array"]
        
=end 
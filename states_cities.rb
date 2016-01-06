require "pry"
#options[:font_size]
$states = {
  OR: ['Oregon', ['washington', 'colorado', 'rocky mountains']],
  FL: ['Florida', ['miami', 'orlando', 'tampa']],
  CA: ['California', ['LA', 'San Diego', 'San Jose']],
  NY: ['New York', ['new york city', 'rochester', 'albany']],
  MI: ['Michigan', ['new york city', 'rochester', 'albany']],
  BC: ['British Columbia', ['vancouver', 'victoria', 'nelson']],
  AB: ['Alberta', ['calgary', 'shittown', 'edmonton']]
}
#tax hash
$taxes = {
  OR: 7.5,
  FL: 7.5,
  CA: 7.566,
  NY: 7.5,
  MI: 7.5,
  BC: 7.5,
  AB: 7.5
}

def describe_state(state)
  $states[state.to_sym].last.join(' ,')
end


def calculate_tax(state, amount)
  $taxes[state.to_sym] * amount / 100
end


def find_state_for_city(cities_code)
  exists = false
  $states.each do |statekey, statevalue|
    if statevalue[1].map{|x| x.downcase}.include?(cities_code.downcase)
      exists = statekey
    end
  end
  if exists
    puts "#{cities_code} is in #{exists}"
  else
    puts "couldn't find this city... try again"
  end
end
puts "what state do you want to learn about?"
state = gets.chomp.upcase
  puts "#{state} is for #{$states[state.to_sym].first} and it's cities are #{describe_state(state)}."
  puts "How much would you like to spend?"
  amount = gets.chomp.to_i
  puts "If you spend $#{amount} you will pay $#{calculate_tax(state, amount)} in taxes = ($#{amount+ calculate_tax(state, amount).round(2)}) " 
  puts "name a city:"
  cities_code = gets.chomp.capitalize
  find_state_for_city(cities_code)




##########OLD CODE/NOTES##########
  #def find_city_for_state
    # puts @cities[state_code.to_sym]
    # puts "the cities #{@cities[cities_code.to_sym]} belong to the state of #{@states[state_code.to_sym]} ."
  #end

  #def calculate_taxes(state, amount)
  #returns the tax percent of the state and the state name
  #{((@taxes[state_code.to_sym]/100 + 1) * amount).round(2)}"
  # puts "the tax percent in #{@states[state_code.to_sym]} is #{@taxes[state_code.to_sym]}"
  #calculates the total amount owed based on percentage algorith * amount then used .round(2) to round it 2 number places.
  # puts "the total amount owed is: #{((@taxes[state_code.to_sym]/100 + 1) * amount).round(2)}"
#end
#find the #describes the state and shows what it's cities are using interpolation and to_sym to show the matching numbers from the hash above
# def describe_state(state_code)
#   puts "#{state_code.to_sym} is for #{@states[state_code.to_sym]} and it's cities are #{@cities[state_code.to_sym].join(', ')}.
#   the taxes are #{@taxes[state_code.to_sym]} percent."
# end 
        #key     #value         #index
# @states[:BC] = 'British Columbia'[5]
# @states[:AB] = 'Alberta'[6]
#injects values into states hash

#call upon the cities hash and use the cities code value to symbol to relay the proper cities
# def describe_cities(cities_code)
#   puts @cities[cities_code.to_sym]
# end
#call upon @taxes hash and use the taxes code value to symbol to relay the proper tax attatched to the city
# def describe_taxes(taxes_code)
#   puts @taxes[taxes_code.to_sym]
# end

#creates cities for the states
# @cities = {
#   OR: ['washington', 'colorado', 'rocky mountains'],
#   FL: ['miami', 'orlando', 'tampa'],
#   CA: ['LA', 'San Diego', 'San Jose'],
#   NY: ['new york city', 'rochester', 'albany'],
#   MI: ['detroit', 'grand rapids', 'ann arbor'],
#   BC: ['vancouver', 'victoria', 'nelson'],
#   AB: ['calgary', 'shittown', 'edmonton']
# }

# puts describe_state('CA')
# puts calculate_taxes('CA', 20)
# puts find_state_for_city('CA', 'CA')
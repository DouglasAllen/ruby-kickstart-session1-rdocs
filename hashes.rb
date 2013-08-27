class HashesRubyDoc
=begin rdoc
===
  # ===================================================================>
  
      # Note: You may just copy these into irb or pry.
      # Be careful though, putting too much in at
      # once can hang IRB. I would say the limit is
      # a page full.

      # Watch out for tabs too if you have tab
      # completion set.

      # Just in case, use cntl c if IRB hangs.
      # And if it realy hangs, well then there is always
      # closing IRB or pry and starting up again.

      # This is just my experience.

      # The lines that are single quoted help you copy more.
      # Which do you like better, the green or the white?
      # Oh! You got red? Go fix your style sheet in rdoc templates.
      # It's the ruby comments one.

      # Not to worry, it is evaluated as a string would.
      # But that is just irb not rdoc.

      # Also the methods at the bottom of this are just dummys
      # for the rdoc generator to link this information.

  # ===================================================================>

      # Hash class and instance methods

      # http://ruby-doc.org/core/classes/Hash.html

      # =====  Initializing  =====

      # populated;'

      { 1 => 'one' , 2 => 'two' } 
      '=> {1=>"one", 2=>"two"}'

      Hash[ 1,'one' , 2,'two' ]   
      '=> {1=>"one", 2=>"two"}'

      'empty;'
      
      {}                          
      '=> {}'
      
      Hash.new                    
      '=> {}'

  # ===================================================================>

      # =====  Nonexistent Keys  =====

      # By default, nonexistent keys return nil.'

      hash = Hash.new   
      '=> {}'

      hash[:josh]       
      '=> nil'

      # To change this behaviour,
      # you can pass new a block that receives the hash and 
      # the nonexistent key and then adds it to the hash 
      # in the way that you would like.'

      aliases = Hash.new { |this_hash, key|
                            this_hash[key] = Array.new }
      aliases         
      '=> {}'

      aliases[:josh]  
      '=> []'

      aliases         
      '=> {:josh=>[]}'

      aliases[:jeff] << 
          'the dude' << 
      'his dudeness' << 
             'duder' << 
       'el duderino'
       
      aliases         
      '=> {:josh=>[],
           :jeff=>["the dude",
                   "his dudeness",
                   "duder",
                   "el duderino"]}'

  # ===================================================================>

      '=====  Access and Assign  =====

      Generally access and assign like ths:'

      hash = Hash.new
      hash                          
      '=> {}'

      hash["my key"] = "my value"
      hash                          
      '=> {"my key"=>"my value"}'

      hash["my key"]                
      '=> "my value"'

      'Access multiple values at once:

      just populating;'

      hash = Hash[ *[ Array('a'..'j'),
                      Array(1..10) ].transpose.flatten
                 ] 

      hash                                  
      '=> {"a"=>1, "b"=>2, "c"=>3, "d"=>4,
           "e"=>5, "f"=>6, "g"=>7, "h"=>8,
           "i"=>9, "j"=>10}'

      hash.values_at 'j' , 'e' , 'i' , :x   
      '=> [10, 5, 9, nil]'

  # ===================================================================>
      'More interesting options with fetch 
      (think how this might be helpful in param default values).'

      hash = { "a" => 100, "b" => 200 }
      hash.fetch "a"                              
      '=> 100'

      hash.fetch "z" , "go fish"                  
      '=> "go fish"'

      hash.fetch("z") { |el| "go fish, #{el}"}    
      '=> "go fish, z"'

  # ===================================================================>

      'Sometimes you might use has_key to check for a key,
      for example, if you\'re using an init block.'

      hash = Hash.new { true }
      hash[:a] = :b
      hash[1000]                                  
      '=> true'

      hash.has_key? 1000                          
      '=> false'

      hash = { 12 => nil }
      hash[12]                                    
      '=> nil'

      hash[13]
      '=> nil'

      hash.has_key? 12                            
      '=> true'

      hash.has_key? 13                            
      '=> false'

      'and the converse;'

      hash = { "a" => 100, "b" => 200 }
      hash.has_value?(100)                        
      '=> true'

      hash.has_value?(999)                        
      '=> false'

  # ===================================================================>

      '=====  Removal  =====

      Delete accepts a key and returns its value.
      You can give a block that will be invoked and returned
      in the event that the key to delete was not seen.'

      hash = Hash[*Array(1..10)]                  
      '=> {1=>2, 3=>4, 5=>6, 7=>8, 9=>10}'

      hash.delete 1                               
      '=> 2'

      hash.delete 100                             
      '=> nil'

      hash                                        
      '=> {3=>4, 5=>6, 7=>8, 9=>10}'

      hash.delete(3)   { |n| "#{n} not found" }   
      '=> 4'

      hash.delete(100) { |n| "#{n} not found" }  
      '=> "100 not found"'

      'delete_if to remove all pairs from a hash 
      that cause the block to evaluate to true'

      hash = Hash[*Array(1..10)]                  
      '=> {1=>2, 3=>4, 5=>6, 7=>8, 9=>10}'

      hash.delete_if do |key,value|
        key % 5 == 0 || value % 5 == 0
      end
      hash                                        
      '=> {1=>2, 3=>4, 7=>8}'

  # ===================================================================>

      '=====  Iterating  =====

      pass a block that receives the key and the value'

      cities = { :Chicago => :USA ,
                 :Paris => :France ,
                 :Ramstein => :Germany }
                 
      results = Array.new
      cities.each do |city,country|
        results << "#{city} is in #{country}"
      end
      results 
      '=> ["Chicago is in USA",
           "Paris is in France",
           "Ramstein is in Germany"]'

  # ===================================================================>

      '=====  Other Useful Methods  =====

      there is also a self mutator version: merge!'

      defaults = { :color => :red , :city => 'Wichita' }
      custom   = { :city => 'Boston' }
      merged   = defaults.merge custom

      defaults                      
      '=> {:color=>:red, :city=>"Wichita"}'

      custom                        
      '=> {:city=>"Boston"}'

      merged                        
      '=> {:color=>:red, :city=>"Boston"}'

      cities = { :Chicago => :USA ,
                 :Paris => :France ,
                 :Ramstein => :Germany }
                 
      cities.keys                   
      '=> [:Chicago, :Paris, :Ramstein]'

      cities.values                 
      '=> [:USA, :France, :Germany]'

      cities.length                 
      '=> 3'

      cities.size                   
      '=> 3'

      cities.empty?                 
      '=> false'

      Hash.new.empty?               
      '=> true'

  # ===================================================================>

      hash = Hash[*Array(1..10)]
      hash                          
      '=> {1=>2, 3=>4, 5=>6, 7=>8, 9=>10}'

      hash.clear
      hash                          
      '=> {}'

      'get a key for a given value (remember,
      there could be more than one key with the same value)'

      hash = { "a" => 100, "b" => 200 }
      hash.index(200)               
      '=> "b" # !> Hash#index is deprecated; use Hash#key'

      hash.index(999)               
      '=> nil # !> Hash#index is deprecated; use Hash#key'

      'swap keys with values'

      hash = { :n => 1, :m => 1, :o => 2 }

      'n and m have the same value, n ends up getting squashed'
      
      hash.invert                   
      '=> {1=>:m, 2=>:o}'

      'convert to an array;'

      { :Chicago => :USA,
        :Paris => :France,
        :Ramstein => :Germany }.to_a

      '=> [[:Chicago, :USA],
           [:Paris, :France],
           [:Ramstein, :Germany]]'

  # ===================================================================>

=end
def hashes?( Everything is an Object except Basic Object maybe? );end
end

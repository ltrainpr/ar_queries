require_relative '../../db/config'
require_relative '../main'

class Legislator < ActiveRecord::Base
  #extend Shiznitt

  def initialize
      
  end

  def self.by_state(state)
    # Given any state, first print out the senators 
    # for that state (sorted by last name), then print
    # out the representatives (also sorted by last name). 
    # Include the party affiliation next to the name. 
    # The output might look something like this:
    #self.where(firstname: )

  end



end



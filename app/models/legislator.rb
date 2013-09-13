require_relative '../../db/config'
require_relative '../main'

class Legislator < ActiveRecord::Base
  extend Shiznitt


  def self.by_state(state)
    senators_array = []
    rep_array = []
    searched_state = self.where('state = ?', state.upcase ).order('lastname')
    puts "Senators:"
    searched_state.map do |x|
      if x.title == 'Sen'
        senators_array << [x.firstname, x.middlename, x.lastname, x.party] 
      else
        rep_array << [x.firstname, x.middlename, x.lastname, x.party]
      end
    end

    senators_array.each {|x| puts "#{x[0]} #{x[1]} #{x[2]} (#{x[3]})"}
    puts
    puts "Representatives:"
    rep_array.each {|x| puts "#{x[0]} #{x[1]} #{x[2]} (#{x[3]})"}
  end

  def self.politicians_per_state
    # Print out the list of states along with how many active senators 
    # and representatives are in each, in descending order (i.e., print out 
    #   states with the most congresspeople first).
    # CA: 2 Senators, 53 Representative(s)
    # TX: 2 Senators, 32 Representative(s)
    # NY: 2 Senators, 29 Representative(s)
    # (... etc., etc., ...)
    # WY: 2 Senators, 1 Representative(s)
    #self.all.map do |x|

    
  end
end

Legislator.by_state('ma')


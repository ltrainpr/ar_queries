require_relative '../../db/config'
require_relative '../main'

class Legislator < ActiveRecord::Base
  extend Shiznitt


  def self.by_state(state)
    senators_array = []
    rep_array = []
    searched_state = self.where('state = ?', state.upcase )
    puts "Senators:"
    searched_state.map do |x|
      if x.title == 'Sen'
        senators_array << [x.firstname, x.middlename, x.lastname, x.party] 
      else
        rep_array << [x.firstname, x.middlename, x.lastname, x.party]
      end
    end

    sorted_senators = senators_array.sort {|a, b| a[2] <=> b[2]}.uniq 
    sorted_senators.each {|x| puts "#{x[0]} #{x[1]} #{x[2]} (#{x[3]})"}
    puts
    puts "Representatives:"
    sorted_rep = rep_array.sort {|a, b| a[2] <=> b[2]}.uniq 
    sorted_rep.each {|x| puts "#{x[0]} #{x[1]} #{x[2]} (#{x[3]})"}
  end

  def politician_count_per_state(state)
    # Print out the list of states along with how many active senators 
    # and representatives are in each, in descending order (i.e., print out 
    #   states with the most congresspeople first).
    # CA: 2 Senators, 53 Representative(s)
    # TX: 2 Senators, 32 Representative(s)
    # NY: 2 Senators, 29 Representative(s)
    # (... etc., etc., ...)
    # WY: 2 Senators, 1 Representative(s)
  end
end

Legislator.by_state('ma')


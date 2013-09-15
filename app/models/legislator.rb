require_relative '../../db/config'
require_relative '../main'

class Legislator < ActiveRecord::Base
  extend Shiznitt


  def self.by_state(state)
    senators_searched_state = self.where('state = ? AND title = ?', state.upcase, title = 'Sen' ).order('lastname')

    puts "Senators:"
    senators_searched_state.map {|x| puts "#{x.firstname}, #{x.middlename}, #{x.lastname}, #{x.party}"}
    puts 
    puts "Representatives:"
    rep_searched_state = self.where('state = ? AND title = ?', state.upcase, title = 'Rep' ).order('lastname')
    rep_searched_state.map {|x| puts "#{x.firstname}, #{x.middlename}, #{x.lastname}, #{x.party}"}
  end

scope :legislator_objects, -> {select(:state).distinct.group("")}



  def self.politicians_per_state
    p legislator_objects
    # Print out the list of states along with how many active senators 
    # and representatives are in each, in descending order (i.e., print out 
    #   states with the most congresspeople first).
    # CA: 2 Senators, 53 Representative(s)
    # TX: 2 Senators, 32 Representative(s)
    # NY: 2 Senators, 29 Representative(s)
    # (... etc., etc., ...)
    # WY: 2 Senators, 1 Representative(s)
    #self.all.map do |x|
    # states = []
    # legislator_objects.each do |x|
    #   states << x.state
    # end

    # states = states.compact
    # states.each do |x|
    #   puts "#{x}: #{Legislator.where('state = ? AND title = ?', x.upcase, title = 'Sen').count} Senators, #{Legislator.where('state = ? AND title = ?', x.upcase, title = 'Rep').count} Representative(s)"
    # end
    # p senator_count
    # p rep_count
  end
end


#Legislator.by_state('ma')
Legislator.politicians_per_state


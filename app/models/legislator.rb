require_relative '../../db/config'
require_relative '../main'

class Legislator < ActiveRecord::Base

  scope :active_legislators, -> {where('in_office = ?', '1')}
  scope :active_representatives, -> {active_legislators.where('title = ?', 'Rep')}
  scope :active_senators, -> {active_legislators.where('title = ?', 'Sen')}
  scope :senator_count, -> {where('title = ?', 'Sen').count} 
  scope :male_senator_count, -> {active_senators.where('gender = ?', 'M').count} 
  scope :representative_count, -> {where('title = ?', 'Rep').count}
  scope :male_representative_count, -> {active_representatives.where('gender = ?', 'M').count} 
  scope :inactive_legislators, -> {where('in_office = ?', '0')}
  scope :delete_inactive_legislators, -> {inactive_legislators.destroy_all}

  def self.by_state(state)
    senators_searched_state = self.where('state = ? AND title = ?', state.upcase, title = 'Sen' ).order('lastname')

    puts "Senators:"
    senators_searched_state.map {|x| puts "#{x.firstname}, #{x.middlename}, #{x.lastname}, #{x.party}"}
    puts 
    puts "Representatives:"
    rep_searched_state = self.where('state = ? AND title = ?', state.upcase, title = 'Rep' ).order('lastname')
    rep_searched_state.map {|x| puts "#{x.firstname}, #{x.middlename}, #{x.lastname}, #{x.party}"}
  end

  def self.male_politicians
    puts "Male Senators: #{male_senator_count} (#{((male_senator_count.to_f/senator_count)*100).round}%)"
    puts "Male Representatives: #{male_representative_count} (#{((male_representative_count.to_f/representative_count)*100).round}%)"
  end  

  def self.politicians_per_state
    active_rep = active_representatives.group('state').order("count(*) DESC").count
    # active_sen = active_senators.group('state').order("count(*) DESC").count
    active_rep.each do |key, value|
        puts "#{key}: 2 Senators, #{value} Representative(s)"
    end
  end

  def self.total_number_each
    puts "Senators: #{senator_count}"
    puts "Representatives: #{representative_count}" 
  end

end


# Legislator.by_state('ma')
# Legislator.male_politicians
# Legislator.politicians_per_state
# Legislator.total_number_each
# Legislator.delete_inactive_legislators
# Legislator.total_number_each



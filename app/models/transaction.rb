class Transaction < ActiveRecord::Base
  attr_reader :total

  def self.total
    self.all.reduce(0){|sum, t| sum + t.amount}
  end

end

class Transaction < ActiveRecord::Base

  def self.total
    self.all.reduce(0) do |sum, t|
      if t.transaction_type == "Deposit"
        sum + t.amount
      else
        sum - t.amount
      end
    end
  end

  def self.count
    self.all.count
  end

end

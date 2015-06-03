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

  def self.this_months_expenses
    expenses = 0
    self.all.each do |t|
      if t.created_at.month == Time.now.month
        expenses += t.amount
      else
        expenses = expenses
      end
    end
    expenses
  end



end

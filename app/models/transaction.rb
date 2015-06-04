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

  def self.withdrawals
    self.all.select {|t| t.transaction_type == "Withdrawal"}
  end

  def self.deposits
    self.all.select {|t| t.transaction_type == "Deposit"}
  end

  def self.this_months_expenses
    expenses = withdrawals.select {|t| t.created_at.month == DateTime.now.month}
    expenses.reduce(0) {|sum, t| sum + t.amount}
  end

  def self.last_months_expenses
    expenses = withdrawals.select {|t| t.created_at.month == (DateTime.now.month - 1)}
    expenses.reduce(0) {|sum, t| sum + t.amount}
  end

end

class Transaction < ActiveRecord::Base

  def self.total
    expenses = withdrawals.reduce(0) {|sum, t| sum + t.amount}
    income = deposits.reduce(0) {|sum, t| sum + t.amount}
    income - expenses
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

  def self.count_this_month
    self.all.select {|t| t.created_at.month == DateTime.now.month}.count
  end

  def self.count_last_month
    self.all.select {|t| t.created_at.month == (DateTime.now.month - 1)}.count
  end

  def self.biggest_expense_this_month
    expenses = withdrawals.select {|t| t.created_at.month == DateTime.now.month}
    expenses.map{|t| t.amount}.sort.last
  end

  def self.biggest_expense_ever
    withdrawals.map{|t| t.amount}.sort.last
  end

  def self.money_pit
    groups = self.where(transaction_type: "Withdrawal")
        .group(:recipient)
        .order("sum(amount)")
    groups.last.recipient
  end

end

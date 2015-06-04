require 'test_helper'

class TransactionTest < ActiveSupport::TestCase

  test "get total" do
    assert_equal 600, Transaction.total
  end

  test "transaction count" do
    assert_equal 5, Transaction.count
  end

  test "this months expenses" do
    assert_equal 200, Transaction.this_months_expenses
  end

  test "last months expenses" do
    assert_equal 200, Transaction.last_months_expenses
  end

  test "total transactions this month" do
    assert_equal 4, Transaction.count_this_month
  end

  test "total transactions last month" do
    assert_equal 1, Transaction.count_last_month
  end

  test "biggest_expense_this_month" do
    assert_equal 150, Transaction.biggest_expense_this_month
  end

  test "biggest_expense_ever" do
    assert_equal 200, Transaction.biggest_expense_ever
  end

end

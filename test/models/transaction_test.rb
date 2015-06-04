require 'test_helper'

class TransactionTest < ActiveSupport::TestCase

  test "get total" do
    assert_equal 300, Transaction.total
  end

  test "transaction count" do
    assert_equal 5, Transaction.count
  end

  test "this months expenses" do
    assert_equal 300, Transaction.this_months_expenses
  end

  test "last months expenses" do
    last_month = transactions(:last_month)
    last_month.update(created_at: last_month.created_at - 1.month)
    assert_equal 100, Transaction.last_months_expenses
  end

  test "total transactions this month" do
    assert_equal 5, Transaction.count_this_month
  end

  test "total transactions last month" do
    last_month = transactions(:last_month)
    last_month.update(created_at: last_month.created_at - 1.month)
    assert_equal 1, Transaction.count_last_month
  end

end

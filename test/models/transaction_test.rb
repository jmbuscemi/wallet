require 'test_helper'

class TransactionTest < ActiveSupport::TestCase

  test "get total" do
    assert_equal 150, Transaction.total
  end

  test "transaction count" do
    assert_equal 2, Transaction.count
  end

  test "this months expenses" do
    assert_equal 150, Transaction.this_months_expenses
  end



end

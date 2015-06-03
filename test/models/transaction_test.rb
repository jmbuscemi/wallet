require 'test_helper'

class TransactionTest < ActiveSupport::TestCase

  test "get total" do
    assert_equal 150, Transaction.total
  end



end

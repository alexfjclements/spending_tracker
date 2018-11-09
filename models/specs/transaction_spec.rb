require('minitest/autorun')
require('minitest/rg')
require_relative('../transaction')


class TransactionTest < MiniTest::Test

  def setup()
    options = {
      'id' => 1,
      'user_id' => 1,
      'merchant_id' => 1,
      'label_id' => 1,
      'amount' => 30,
      'time_stamp' => '12/08/18'
    }
    @transaction1 = Transaction.new(options)
  end

  def test_readers
    expected = 1
    actual = @transaction1.id
    assert_equal(expected, actual)

    expected = 1
    actual = @transaction1.user_id
    assert_equal(expected, actual)

    expected = 1
    actual = @transaction1.merchant_id
    assert_equal(expected, actual)

    expected = 1
    actual = @transaction1.label_id
    assert_equal(expected, actual)

    expected = 30
    actual = @transaction1.amount
    assert_equal(expected, actual)

    expected = '12/08/18'
    actual = @transaction1.time_stamp
    assert_equal(expected, actual)
  end

  def test_writers
    expected = 50
    @transaction1.amount = 50
    actual = @transaction1.amount
    assert_equal(expected, actual)
  end

end

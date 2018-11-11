require('minitest/autorun')
require('minitest/rg')
require('pp')
require_relative('../merchant')


class MerchantTest < MiniTest::Test

  def setup()
    options = {
      'id' => 1,
      'name' => 'Amazon',
      'user_id' => 1
    }
    @merchant1 = Merchant.new(options)
  end

  def test_readers
    expected = 1
    actual = @merchant1.id
    assert_equal(expected, actual)

    expected = 'Amazon'
    actual = @merchant1.name
    assert_equal(expected, actual)

    expected = 1
    actual = @merchant1.user_id
    assert_equal(expected, actual)
  end

  def test_writers
    expected = 'Cookson Gold'
    @merchant1.name = 'Cookson Gold'
    actual = @merchant1.name
    assert_equal(expected, actual)
  end

end

pp Merchant.all

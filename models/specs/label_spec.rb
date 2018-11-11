require('minitest/autorun')
require('minitest/rg')
require('pp')
require_relative('../label')


class LabelTest < MiniTest::Test

  def setup()
    options = {
      'id' => 1,
      'user_id' => 1,
      'label' => 'groceries'
    }
    @label1 = Label.new(options)
  end

  def test_readers
    expected = 1
    actual = @label1.id
    assert_equal(expected, actual)

    expected = 1
    actual = @label1.user_id
    assert_equal(expected, actual)

    expected = 'groceries'
    actual = @label1.label
    assert_equal(expected, actual)
  end

  def test_writer
    expected = 'cds'
    @label1.label = 'cds'
    actual = @label1.label
    assert_equal(expected, actual)
  end

end

# Print all test
# pp Label.all

label1 = Label.all.last
pp label1

label1.delete
# merchant1 = Merchant.all.first
# pp merchant1
#
# user1 = User.all.first
# pp user1
#
# transaction1 = Transaction.all.first
# pp transaction1

require('minitest/autorun')
require('minitest/rg')
require_relative('../user')


class UserTest < MiniTest::Test

  def setup()
    options = {
      'username' => 'Bob',
      'name' => 'Robert',
      'monthly_budget' => 200,
      'transactions_to_disp' => 20
    }
    @user1 = User.new(options)
  end

  def test_readers
    expected = 'Bob'
    actual = @user1.username
    assert_equal(expected, actual)

    expected = 'Robert'
    actual = @user1.name
    assert_equal(expected, actual)

    expected = 200
    actual = @user1.monthly_budget
    assert_equal(expected, actual)

    expected = 20
    actual = @user1.transactions_to_disp
    assert_equal(expected, actual)
  end

end

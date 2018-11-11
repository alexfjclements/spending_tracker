require('minitest/autorun')
require('minitest/rg')
require('pp')
require_relative('../user')


class UserTest < MiniTest::Test

  def setup()
    options = {
      'id' => 1,
      'username' => 'Bob',
      'name' => 'Robert',
      'monthly_budget' => 200,
      'transactions_to_disp' => 20
    }
    @user1 = User.new(options)
  end

  def test_readers
    expected = 1
    actual = @user1.id
    assert_equal(expected, actual)

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

  def test_writers
    expected = 'Jim'
    @user1.username = 'Jim'
    actual = @user1.username
    assert_equal(expected, actual)

    expected = 'James'
    @user1.name = 'James'
    actual = @user1.name
    assert_equal(expected, actual)

    expected = 150
    @user1.monthly_budget = 150
    actual = @user1.monthly_budget
    assert_equal(expected, actual)

    expected = 50
    @user1.transactions_to_disp = 50
    actual = @user1.transactions_to_disp
    assert_equal(expected, actual)
  end

end

# Print all test
# pp User.all

user1 = User.all.last
pp user1

# User update method test
# user1.username = "Spongebob"
# user1.update

# User delete transations test
user1.delete_transactions

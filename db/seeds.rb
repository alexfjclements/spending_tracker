require_relative('../models/label')
require_relative('../models/merchant')
require_relative('../models/transaction')
require_relative('../models/user')


# **********************************************
# Users
# **********************************************

user1 = User.new({
  'username' => 'Bob',
  'name' => 'Robert',
  'monthly_budget' => 450,
  'transactions_to_disp' => 50
  })
user2 = User.new({
  'username' => 'RandomUsernameGeneratorFail',
  'name' => 'James',
  'monthly_budget' => 400,
  'transactions_to_disp' => 30
  })

  user1.save
  user2.save

  # *****************************************
  # Labels
  # *****************************************

  label1 = Label.new({
    'user_id' => user1.id,
    'label' => 'electronics'
    })
  label2 = Label.new({
    'user_id' => user1.id,
     'label' => 'groceries'
     })

  label1.save
  label2.save

# ******************************************
# Merchants
# ******************************************

  merchant1 = Merchant.new({
    'user_id' => user1.id,
    'name' => 'Amazon'
    })

  merchant2 = Merchant.new({
    'user_id' => user1.id,
    'name' => 'Cookson Gold'
    })

merchant1.save
merchant2.save

# ****************************************
# Transactions
# ****************************************

transaction1 = Transaction.new({
  'user_id' => user1.id,
  'merchant_id' => 1,
  'label_id' => 1,
  'amount' => 30,
  'time_stamp' => '12/08/18'
  })

transaction2 = Transaction.new({
  'user_id' => user1.id,
  'merchant_id' => 1,
  'label_id' => 1,
  'amount' => 30,
  'time_stamp' => '12/08/18'
  })

transaction3 = Transaction.new({
  'user_id' => user2.id,
  'merchant_id' => 1,
  'label_id' => 1,
  'amount' => 30,
  'time_stamp' => '12/08/18'
  })

transaction4 = Transaction.new({
  'user_id' => user2.id,
  'merchant_id' => 1,
  'label_id' => 1,
  'amount' => 30,
  'time_stamp' => '12/08/18'
  })

transaction1.save
transaction2.save
transaction3.save
transaction4.save

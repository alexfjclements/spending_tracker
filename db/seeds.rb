require_relative('../models/label')
require_relative('../models/merchant')
require_relative('../models/transaction')
require_relative('../models/user')

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

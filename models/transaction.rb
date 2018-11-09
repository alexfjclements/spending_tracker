require_relative('../db/sql_runner')

class Transaction

  attr_reader :id, :user_id, :merchant_id, :label_id, :time_stamp
  attr_accessor :amount

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @user_id = options['user_id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @label_id = options['label_id'].to_i
    @amount = options['amount'].to_f
    @time_stamp = options['time_stamp']
  end

end

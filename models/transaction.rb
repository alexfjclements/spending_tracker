class Transaction

  attr_reader :id, :user_id, :merchant_id, :label_id, :time_stamp
  attr_accessor :amount

  def initialize(options)
    @id = options['id'] if options['id']
    @user_id = options['user_id']
    @merchant_id = options['merchant_id']
    @label_id = options['label_id']
    @amount = options['amount']
    @time_stamp = options['time_stamp']
  end

end

class Merchant

  attr_reader :id, :user_id
  attr_accessor :merchant_name

  def initialize(options)
    @id = options['id'] if options['id']
    @user_id = options['user_id']
    @merchant_name = options['merchant_name']
  end

end

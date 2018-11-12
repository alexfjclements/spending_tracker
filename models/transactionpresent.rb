class TransactionPresent

  attr_reader :id, :name, :amount, :label, :time_stamp

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @amount = '£' + options['amount']
    @label = options['label']
    @time_stamp = options['time_stamp']
  end

end

class User

  attr_reader :id
  attr_accessor :username, :name, :monthly_budget, :transactions_to_disp

  def initialize(options)
    @id = options['id'] if options['id']
    @username = options['username']
    @name = options['name']
    @monthly_budget = options['monthly_budget']
    @transactions_to_disp = options['transactions_to_disp']
  end

end

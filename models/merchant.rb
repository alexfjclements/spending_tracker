require_relative('../db/sql_runner')

class Merchant

  attr_reader :id, :user_id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @user_id = options['user_id'].to_i
    @name = options['name']
  end

end

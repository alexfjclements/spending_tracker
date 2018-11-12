require_relative('../db/sql_runner')

class Merchant

  attr_reader :id, :user_id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @user_id = options['user_id'].to_i
    @name = options['name']
  end

  # **************************************************
  # SQL Functions
  # **************************************************

  def self.all()
    sql = "SELECT merchants.* FROM merchants"
    merchants = SqlRunner.run(sql)
    return merchants.map { |merchant| Merchant.new(merchant) }
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [id]
    merchants = SqlRunner.run(sql, values)
    return merchants.map { |merchant| Merchant.new(merchant) }.first
  end

  def save()
    sql = "INSERT INTO merchants
    (
      user_id,
      name
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@user_id, @name]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def delete()
    sql = "DELETE FROM merchants
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end

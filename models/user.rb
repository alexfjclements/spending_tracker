require_relative('../db/sql_runner')

class User

  attr_reader :id
  attr_accessor :username, :name, :monthly_budget, :transactions_to_disp

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @username = options['username']
    @name = options['name']
    @monthly_budget = options['monthly_budget'].to_f
    @transactions_to_disp = options['transactions_to_disp'].to_i
  end

  # **************************************************
  # SQL Functions
  # **************************************************

  def self.all()
    sql = "SELECT users.* FROM users"
    users = SqlRunner.run(sql)
    return users.map { |user| User.new(user) }
  end

  def save()
    sql = "INSERT INTO users
    (
      username,
      name,
      monthly_budget,
      transactions_to_disp
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@username, @name, @monthly_budget, @transactions_to_disp]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def update()
    sql = "UPDATE users
    SET (
      username,
      name,
      monthly_budget,
      transactions_to_disp
      ) = (
        $1, $2, $3, $4
        ) WHERE id = $5"
    values = [@username, @name, @monthly_budget, @transactions_to_disp, @id]
    SqlRunner.run(sql, values)
  end

end

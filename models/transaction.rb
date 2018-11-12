require_relative('../db/sql_runner')
require_relative('transactionpresent')

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

  # **************************************************
  # SQL Functions
  # **************************************************

  def self.all()
    sql = "SELECT transactions.* FROM transactions"
    transactions = SqlRunner.run(sql)
    return transactions.map { |transaction| Transaction.new(transaction) }
  end

  def self.delete_user_transac(id)
    sql = "DELETE FROM transactions
    WHERE user_id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    values = [id]
    transactions = SqlRunner.run(sql, values)
    return transactions.map { |transaction| Transaction.new(transaction) }.first
  end

  def self.present()
    # Hard coded user1
    sql = "SELECT
      transactions.id,
      merchants.name,
      transactions.amount,
      labels.label,
      transactions.time_stamp
      FROM
      transactions
      INNER JOIN merchants
      ON transactions.merchant_id = merchants.id
      INNER JOIN labels
      ON transactions.label_id = labels.id
      WHERE transactions.user_id = 1;"
    results = SqlRunner.run(sql)
    return results.map { |result| TransactionPresent.new(result) }
  end

  def save()
    sql = "INSERT INTO transactions
    (
      user_id,
      merchant_id,
      label_id,
      amount,
      time_stamp
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@user_id, @merchant_id, @label_id, @amount, @time_stamp]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def delete()
    sql = "DELETE FROM transactions
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end

require_relative('../db/sql_runner')

class Label

  attr_reader :id, :user_id
  attr_accessor :label

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @user_id = options['user_id'].to_i
    @label = options['label']
  end

  # **************************************************
  # SQL Functions
  # **************************************************

  def self.all()
    sql = "SELECT labels.* FROM labels"
    labels = SqlRunner.run(sql)
    return labels.map { |label| Label.new(label) }
  end

  def save()
    sql = "INSERT INTO labels
    (
      user_id,
      label
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@user_id, @label]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def delete()
    sql = "DELETE FROM labels
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end

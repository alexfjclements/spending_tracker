class Label

  attr_reader :id, :user_id
  attr_accessor :label

  def initialize(options)
    @id = options['id'] if options['id']
    @user_id = options['user_id']
    @label = options['label']
  end

end

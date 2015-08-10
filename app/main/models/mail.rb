class Mail < Volt::Model
  belongs_to :tenant

  before_save :add_timestamp

  def add_timestamp
    self._createdAt = Time.now
  end
end
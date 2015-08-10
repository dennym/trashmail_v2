class Mail < Volt::Model
  belongs_to :tenant

  before_save :add_create_time

  def add_create_time
    self._createdAt = Time.now
  end
end
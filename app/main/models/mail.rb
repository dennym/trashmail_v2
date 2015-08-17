class Mail < Volt::Model
  belongs_to :tenant

  before_save :add_timestamp

  def add_timestamp
    # only add time stamp on new created mails
    self._createdAt = Time.now if self._createdAt.nil?
  end
end

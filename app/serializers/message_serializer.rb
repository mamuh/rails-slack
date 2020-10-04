class MessageSerializer < ActiveModel::Serializer
  attributes :id, :author, :content, :created_at
  # attribute :preferred, key: :is_preferred

  def author
    object.user.email
    # self.object.user.email
  end
end

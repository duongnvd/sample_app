class Micropost < ApplicationRecord
  belongs_to :user

  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validates :content, presence: true,
                      length: {maximum: Settings.microposts.content_max_length}
  validate :picture_size

  scope :recent_posts, ->{order created_at: :desc}

  scope :news_feed, (lambda do |id|
    where(user_id: Relationship.following_ids(id))
    .or(Micropost.where(user_id: id))
  end)

  private

  def picture_size
    return unless picture.size > Settings.microposts.picture_capacity.megabytes

    errors.add :picture, I18n.t("error_picture",
      size: Settings.microposts.picture_capacity)
  end
end

class Pic < ApplicationRecord
  validates_presence_of :title, :description

  belongs_to :user

  # 了解這幾行用意
  has_attached_file :image
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_file_name :image, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
end

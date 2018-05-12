class Pic < ApplicationRecord
  acts_as_votable
  validates_presence_of :title, :description

  belongs_to :user

  # 了解這幾行用意
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end

class Product < ActiveRecord::Base

  default_scope { order title:'asc' }
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, uniqueness: true
  validates :title, length: { minimum: 10 }
  validates :title, :image_url, :description, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image'
  }

  def ensure_not_referenced_by_any_line_item

    return true if line_items.count.zero?

    errors[:base] << "Line Items present"
    return false

  end

end

class Portfolio < ApplicationRecord
  include Placeholder
  after_initialize :set_defaults
  validates_presence_of :title, :main_image, :thumb_image
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                reject_if: lambda { |attributes| attributes['name'].blank? }
  private

  def set_defaults
    self.main_image  ||= Placeholder.generate_image width: 600, height: 300
    self.thumb_image ||= Placeholder.generate_image width: 200, height: 100
  end
end

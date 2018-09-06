class Portfolio < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :main_image, :thumb_image
  has_many :technologies

  def self.angular
    where(subtitle: "Angular")
  end

  def self.ruby_on_rails
    where(subtitle: "Ruby on Rails")
  end

  after_initialize :set_defaults

  private

  def set_defaults
    self.main_image ||= Placeholder.generate_image width: 600, height: 300
    self.thumb_image ||= Placeholder.generate_image width: 200, height: 100
  end
end

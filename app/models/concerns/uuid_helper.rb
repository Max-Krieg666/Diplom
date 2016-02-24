module UuidHelper
  extend ActiveSupport::Concern

  def self.included(base)
    base.primary_key = 'id'
    base.before_create :assign_id
  end

  private
  def assign_id
    self.id = UUIDTools::UUID.timestamp_create().to_s if id.blank?
  end
end
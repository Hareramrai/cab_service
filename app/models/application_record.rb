class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  scope :undeleted, -> { where(marked_as_deleted: false) }
  before_save :unmark_deleted

  def delete!
    update_columns(marked_as_deleted: true)
  end

  def unmark_deleted
    self.marked_as_deleted = false if self.respond_to? :marked_as_deleted
  end
end

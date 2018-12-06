class AddAttachmentAvatarToMods < ActiveRecord::Migration[5.2]
  def self.up
    change_table :mods do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :mods, :document
  end
end

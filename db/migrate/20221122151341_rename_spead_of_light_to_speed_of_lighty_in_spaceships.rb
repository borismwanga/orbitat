class RenameSpeadOfLightToSpeedOfLightyInSpaceships < ActiveRecord::Migration[7.0]
  def change
    rename_column :spaceships, :spead_of_light, :speed_of_light
  end
end

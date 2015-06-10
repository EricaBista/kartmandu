class AddAudioJackToItem < ActiveRecord::Migration
  def change
    add_column :items, :audio_jack, :string
  end
end

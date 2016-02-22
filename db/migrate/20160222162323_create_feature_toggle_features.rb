class CreateFeatureToggleFeatures < ActiveRecord::Migration
  def change
    create_table :feature_toggle_features do |t|
      t.string :feature
      t.string :state
      t.boolean :enable, default: false

      t.timestamps null: false
    end

    add_index :feature_toggle_features, :feature
  end
end

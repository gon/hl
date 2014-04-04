class AddSourceIdNameSlugDescriptionExternalUrlStateStartTimeEndTimeLogoStudentsOnlyHackersCountHacksCountCityStateCountrySourceUrlToEvent < ActiveRecord::Migration
  def change
    add_column :events, :source_id, :string
    add_column :events, :name, :string
    add_column :events, :slug, :string
    add_column :events, :description, :string
    add_column :events, :external_url, :string
    add_column :events, :status, :string
    add_column :events, :start_time, :datetime
    add_column :events, :end_time, :datetime
    add_column :events, :logo, :string
    add_column :events, :students_only, :boolean
    add_column :events, :hackers_count, :integer
    add_column :events, :hacks_count, :integer
    add_column :events, :city, :string
    add_column :events, :state, :string
    add_column :events, :country, :string
    add_column :events, :url, :string
  end
end

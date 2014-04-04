class Event < ActiveRecord::Base
  self.per_page = 5

  def self.build_with_hackerleague(attrs)
    Event.new(
      source_id: attrs.source_id,
      name: attrs.name,
      slug: attrs.slug,
      description: attrs.description,
      external_url: attrs.external_url,
      status: attrs.state,
      start_time: Time.parse(attrs.start_time),
      end_time: Time.parse(attrs.end_time),
      logo: attrs.logo,
      students_only: attrs.students_only,
      hackers_count: attrs.total_hackers,
      hacks_count: attrs.total_hacks,
      city: attrs.location.city,
      state: attrs.location.state,
      country: attrs.location.country,
      url: attrs.url
    )
  end
end

class Lesson < ApplicationRecord
  belongs_to :profile
  has_and_belongs_to_many :users
  has_many :reviews
  has_one_attached :image

  def lesson_duration
    starting_time = Time.parse(start_time)
    ending_time = Time.parse(end_time)
    (ending_time - starting_time) / 60
  end

  def as_json(options={})
    {
      id:                id,
      name:         self.description,
      startTime:  Date.parse(self.start_time)&.strftime('%m/%/d/%y %H:%M %P'),
      endTime:    Date.parse(self.end_time)&.strftime('%m/%d/%y %H:%M %P' ),
      location:     self.location
    }
  end

end

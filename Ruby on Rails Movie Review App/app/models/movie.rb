 class Movie < ApplicationRecord
	searchkick
	belongs_to :user
	has_many :reviews

	has_attached_file :image, styles: { medium: "300x500>" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	has_attached_file :video, styles: { medium: { geometry: "640x480", format: 'mp4'},
		thumb: { geometry: "100x50", format: 'jpg', time: 10}
	}, processor: [:transcoder]
	validates_attachment_content_type :video, content_type: /\Avideo\/.*\z/
end

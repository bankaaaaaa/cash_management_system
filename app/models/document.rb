class Document < ApplicationRecord
	has_attached_file :doc, styles: { medium: "300x300>", thumb: "100x100>" }
	validates_attachment :doc, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf)}
end

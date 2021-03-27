class StreamingService < ApplicationRecord
  SUPPORTED_SERVICES = ["Netflix", "Amazon Video"].freeze

  validates(:title, presence: true, inclusion: SUPPORTED_SERVICES)
end

# frozen_string_literal: true

module ActiveSupport
  module IncludeTimeWithZone #:nodoc:
    # Extends the default Range#include? to support ActiveSupport::TimeWithZone.
    #
    #   (1.hour.ago..1.hour.from_now).include?(Time.current) # => true
    #
    def include?(value)
      if first.is_a?(::Time)
        cover?(value)
      elsif last.is_a?(::Time)
        cover?(value)
      else
        super
      end
    end
  end
end

Range.prepend(ActiveSupport::IncludeTimeWithZone)

# frozen_string_literal: true
module Cucumber
  module Formatter

    class DurationExtractor
      attr_reader :result_duration
      def initialize(result)
        @result_duration = 0
        result.describe_to(self)
      end

      def passed(*) end

      def failed(*) end

      def undefined(*) end

      def skipped(*) end

      def pending(*) end

      def exception(*) end

      def duration(duration, *)
        duration.tap { |d| @result_duration = d.nanoseconds / 10**9.0 }
      end
    end
  end
end

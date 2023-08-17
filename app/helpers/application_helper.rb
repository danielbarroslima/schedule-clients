# frozen_string_literal: true

# ApplicationHelper
module ApplicationHelper
  def self.format_result(records)
    {
      records: records,
      meta: {
        prev: records.prev_page,
        page: records.current_page,
        next: records.next_page,
        total: records.total_count
      }
    }
  end
end

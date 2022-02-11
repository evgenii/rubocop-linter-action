# frozen_string_literal: true

module Helpers
  def event
    {'repository': {
      'owner': {
        'login': "event_login"
      },
      'name': "event_name"
    }}
  end

  def pull_request_event
    event.merge(
      'pull_request' => {
        'head' => {
          'sha' => 'head_sha'
        },
        'base' => {
          'sha' => 'base_sha'
        }
      }
    )
  end
end

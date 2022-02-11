# frozen_string_literal: true

module Github
  class Data
    attr_reader :event

    def initialize(event)
      @event = event
    end

    def pull_request?
      !event.dig("pull_request").nil?
    end

    def sha
      return event.dig("pull_request", "head", "sha") if pull_request?

      ENV['GITHUB_SHA']
    end

    def base_sha
      return event.dig("pull_request", "base", "sha") if pull_request?

      event.dig("before") || ENV['GITHUB_BASE_SHA']
    end

    def token
      ENV["GITHUB_TOKEN"]
    end

    def owner
      ENV["GITHUB_REPOSITORY_OWNER"] || event.dig("repository", "owner", "login")
    end

    def repo
      ENV["GITHUB_REPOSITORY_NAME"] || event.dig("repository", "name")
    end

    def workspace
      ENV["GITHUB_WORKSPACE"]
    end
  end
end

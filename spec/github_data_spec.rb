# frozen_string_literal: true

require "./spec/spec_helper"

describe Github::Data do
  subject { Github::Data.new(event) }

  context 'when push event' do
    it "#sha" do
      expect(subject.sha).to eq("sha")
    end

    it "#pull_request?" do
      expect(subject.pull_request?).to be_falsey
    end

    it "#base_sha" do
      expect(subject.base_sha).to be_nil
    end
  end

  context 'when pull_request event' do
    subject { Github::Data.new(pull_request_event) }

    it "#pull_request?" do
      expect(subject.pull_request?).to be_truthy
    end

    it "#sha" do
      expect(subject.sha).to eq("head_sha")
    end

    it "#base_sha" do
      expect(subject.base_sha).to eq('base_sha')
    end
  end

  it "#token" do
    expect(subject.token).to eq("token")
  end

  context "environment variables exist" do
    it "#owner" do
      expect(subject.owner).to eq("owner")
    end

    it "#repo" do
      expect(subject.repo).to eq("repository_name")
    end
  end

  it "#workspace" do
    expect(subject.workspace).to eq("workspace")
  end
end

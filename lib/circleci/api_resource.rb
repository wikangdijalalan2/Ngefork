# frozen_string_literal: true

module CircleCi
  ##
  #
  # ApiResource is a parent class for rest resources for the
  # CircleCI API. It allows for request conifugration to be
  # set per request if needed, otherwise the default global
  # CircleCi.config is used
  class ApiResource
    attr_reader :conf, :project, :username

    def initialize(username = nil, project = nil, conf = nil)
      @username = username
      @project = project
      @conf = conf || default_config
    end

    def self.default_config
      CircleCi.config
    end

    def default_config
      self.class.default_config
    end
  end
end

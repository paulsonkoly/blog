# frozen_string_literal: true

require 'active_support/concern'

module ViewSpecHelpers
  extend ActiveSupport::Concern

  included do
    before do
      controller.singleton_class.include(SessionsHelper)
    end
  end
end

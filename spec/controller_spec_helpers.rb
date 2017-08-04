module ControllerSpecHelpers
  RSpec::Matchers::define :deny_access do
    match do |actual|
      actual.call
      assert_redirected_to(controller.root_url)
    end

    supports_block_expectations
  end
end

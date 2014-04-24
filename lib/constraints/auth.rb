module Constraints
  class Auth
    def matches?(request)
      request.env['warden'].user.present?
    end
  end
end

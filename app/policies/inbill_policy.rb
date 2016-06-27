class InbillPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
end

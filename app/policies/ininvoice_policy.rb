class IninvoicePolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.where(user, Ininvoice)
    end
  end

  def show?    
    true
  end

  def create?
    true
  end
  
  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end  
end
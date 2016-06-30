class UserPolicy < ApplicationPolicy

  # Inherited from ApplicationPolicy:
  # def initialize(user, resource)
      # @user = user
      # @resource = resource
  # end

  def update?
      user == record
  end
end
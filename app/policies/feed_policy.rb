class FeedPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def create?
    user.present? && user == record.user
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def update?
    user.present? && user == record.user
  end

  def destroy?
    user.present? && user == record.user
  end
end
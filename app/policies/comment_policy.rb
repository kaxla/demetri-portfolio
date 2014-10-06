class CommentPolicy < ApplicationPolicy
  # class Scope
  #   attr_reader :user, :scope

  #   def initialize(user, scope)
  #     @user = user
  #     @scope = scope
  #   end

  #   def resolve
  #     if @user.present?
  #       scope.all
  #     # elsif @user.author?
  #     #   scope.where(article.author => @user)
  #     else
  #       scope.where(:published => true)
  #     end
  #   end
  # end

  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    user.present?
  end

  # def create?
  #   user.editor? || user.author?
  # end

  # def destroy?
  #   user.editor?
  # end

  # def update?
  #   user.author? || user.editor?
  # end
end

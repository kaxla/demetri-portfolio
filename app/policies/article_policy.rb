class ArticlePolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if @user.editor?
        scope.all
      # elsif @user.author?
      #   scope.where(article.author => @user)
      else
        scope.where(:published => true)
      end
    end
  end

  def publish?
    user.editor?
  end

  def create?
    user.editor? || user.author?
  end

  def destroy?
    user.editor?
  end

  def update?
    user.author? || user.editor?
  end
end

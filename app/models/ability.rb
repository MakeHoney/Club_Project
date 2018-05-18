class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new # guest user (not logged in)
       
      if user.has_role? :admin
        can :manage, :all
         
      else
        can [:index, :show, :edit, :update], Club
        can [:destory], Club, user_id: user.id
      end
  end
end

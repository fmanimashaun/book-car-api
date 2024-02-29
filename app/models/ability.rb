class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else

      # Non-admin users can only manage their own resources
      can :manage, :all
      cannot :manage, [Car, City]
      can %i[show], [Car]

      # Users can only update their own profile
      can :update, User, id: user.id

      # Prevent non-admin users from updating their role
      cannot :update, User, role: 'admin'

      # Allow all users to create reservations
      can :create, Reservation

      # Allow users to manage their own reservations
      can :manage, Reservation, user_id: user.id
    end
  end
end

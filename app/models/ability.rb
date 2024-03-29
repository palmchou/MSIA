class Ability
  include CanCan::Ability

  def initialize(user)

    can :read, :all                   # allow everyone to read everything
    can :access, :ckeditor   # needed to access Ckeditor filebrowser

    if user && user.admin?
      can :access, :rails_admin
      can :dashboard
      can :manage, :all
      can [:read, :create, :destroy], Ckeditor::Picture
      can [:read, :create, :destroy], Ckeditor::AttachmentFile
    end

    # if user && user.admin?
    #   can :access, :rails_admin       # only allow admin users to access Rails Admin
    #   can :dashboard                  # allow access to dashboard
    #   if user.role? :superadmin
    #     can :manage, :all             # allow superadmins to do anything
    #   elsif user.role? :manager
    #     can :manage, [User, Product]  # allow managers to do anything to products and users
    #   elsif user.role? :sales
    #     can :update, Product, :hidden => false  # allow sales to only update visible products
    #   end
    # end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end

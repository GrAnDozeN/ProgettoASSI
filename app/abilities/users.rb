Canard::Abilities.for(:User) do
  can [:create, :read, :update], Movie
  cannot [:destroy], Movie
  can [:create, :read, :update], Review
  
end

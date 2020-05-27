Canard::Abilities.for(:User) do
  can [:create, :read, :update], Music
  cannot [:destroy], Music
  can [:create, :read, :update], Review
  
end

Canard::Abilities.for(:admin) do
  can [:destroy], Music
  can [:destroy], Review
end

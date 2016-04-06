import SkillDashboard from "./SkillDashboard";
import NewRegistration from "./NewRegistration";

Paloma.controller('Skills', {
  show: () => new SkillDashboard()
});

Paloma.controller('Devise/Registrations', {
  new: () => new NewRegistration()
});

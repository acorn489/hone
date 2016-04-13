import SkillDashboard from "./SkillDashboard";
import NewRegistration from "./NewRegistration";
import Skill from "./Skill";

Paloma.controller('Skills', {
  show: () => new SkillDashboard()
});

Paloma.controller('Devise/Registrations', {
  new: () => new NewRegistration()
});

Paloma.controller('Skill', {
  show: () => new Skill()
});

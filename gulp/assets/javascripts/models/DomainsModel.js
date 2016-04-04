/*globals Backbone:false*/
import SkillCollection from "./SkillCollection";
import _ from "lodash";

let DomainsModel = Backbone.Model.extend({
  initialize: function(options) {
    this.url = "/api/v1/skills?course_id=" + options.courseId
  },
  parse: function(data) {
    return {domains: createDomains(this, data)};
  }
});

function createDomains(model, data) {
  return _(data)
    .groupBy("domain_id")
    .map(domain => {
      let skills = new SkillCollection(domain);
      skills.on("change", () => model.trigger("change"));
      return {domainName: domain[0].domain, skills};
    })
    .value();
}

export default DomainsModel;

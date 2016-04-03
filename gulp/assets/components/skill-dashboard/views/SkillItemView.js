/*globals Backbone:false, $:false*/

import skillTemplate from "../templates/skillTemplate.handlebars";
import unwrapView from "./unwrapView";
let gradesVent = Backbone.Wreqr.radio.channel("grades").vent;

let SkillItemView = Backbone.Marionette.ItemView.extend({
  template: skillTemplate,
  onRender: function() {
    unwrapView.call(this);
    this.wiggle();
  },
  events: {click: "updateModel"},
  modelEvents: {
    "change:collected": "animateSkillCollection",
    "change:completed": "render"
  },
  animateSkillCollection,
  wiggle: () => setTimeout(() => $(".completed img").ClassyWiggle(), 0),
  updateModel: function() {
    if (!this.model.get("completed")) {
      this.model.set("completed", true);
    } else {
      this.model.set("collected", true);
    }
  }
});

function animateSkillCollection() {
  let self = this;
  var image = this.$el.children("img");
  this.$el.slideUp(() => self.render());
  if (image && image.position()) {
    gradesVent.trigger("collectionAnimationStart");
    image.css({position: "absolute", top: image.position().top, left: image.position().left});
    image.animate({
      top: $(getGradeId(self.model)).position().top,
      left: $(getGradeId(self.model)).position().left
    }, function() {
      gradesVent.trigger("collectionAnimationEnd");
      $(getGradeId(self.model)).ClassyWiggle("start", {limit: 2});
    });
  }
}

function getGradeId(model) {
  return "#grade-" + model.get("grade");
}

export default SkillItemView;

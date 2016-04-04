/*globals Backbone:false*/

import gradeTemplate from "../../templates/gradeTemplate.handlebars";
import unwrapView from "./unwrapView";

let GradeItemView = Backbone.Marionette.ItemView.extend({
  template: gradeTemplate,
  onRender: unwrapView
});

export default GradeItemView;

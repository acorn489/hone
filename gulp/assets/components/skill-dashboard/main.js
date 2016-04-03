/*globals $:false*/
let handlebars = require("handlebars/runtime").default;
handlebars.registerHelper("inc", value => parseInt(value) + 1);
handlebars.registerHelper("toUpperCase", value => value.toUpperCase());
import DomainsCollectionView from "./views/DomainsCollectionView";
import GradesCollectionView from "./views/GradesCollectionView";
import GradeCollection from "./models/GradeCollection";
import DomainsModel from "./models/DomainsModel";

Paloma.controller('Skills', {
  show: () => {
    let domainsModel = new DomainsModel({courseId: window.app.courseId});
    domainsModel.fetch();
    new DomainsCollectionView({model: domainsModel});
    new GradesCollectionView({collection: new GradeCollection({domainsModel})});
  }
});

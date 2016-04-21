/*globals Backbone:true*/

let SkillModel = Backbone.Model.extend({
    initialize: function() {
        this.on('change:collected', () => $.post("/api/v1/collect_skill", {id: this.get("id")}))
    },
    defaults: {collected: false}
});
export default SkillModel;

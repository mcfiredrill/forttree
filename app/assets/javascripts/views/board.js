Forttree.Views.BoardView = Backbone.View.extend({
  tagName: "a",
  render: function() {
    this.$el.html(JST['boards/board']({ model: this.model }));
    return this;
  }
});

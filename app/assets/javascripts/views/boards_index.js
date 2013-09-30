Forttree.Views.BoardsIndex = Backbone.View.extend({
  render: function() {
    var self = this;
    this.$el.html(JST['boards/index']());

    this.collection.each(function(board) {
      var boardView = new Forttree.Views.BoardView({ model: board });
      self.$('#boards').append(boardView.render().el);
    });
    return this;
  }
});

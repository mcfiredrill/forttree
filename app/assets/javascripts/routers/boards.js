Forttree.Routers.Boards = Backbone.Router.extend({
  routes: {
    "": "index"
  },
  index: function() {
    var view = new Forttree.Views.BoardsIndex({ collection: Forttree.boards });
    $('body').html(view.render().$el);
  }
});

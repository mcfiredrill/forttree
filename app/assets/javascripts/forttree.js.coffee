window.Forttree =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: (data) -> 
    this.boards = new Forttree.Collections.Boards(data.boards)
    new Forttree.Routers.Boards()
    Backbone.history.start()

BenchPrep.Views.Quotes ||= {}

class BenchPrep.Views.Quotes.IndexView extends Backbone.View
  template: JST["backbone/templates/quotes/index"]

  initialize: () ->
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (quote) =>
    view = new BenchPrep.Views.Quotes.QuoteView({model : quote})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(quotes: @collection.toJSON() ))
    @addAll()

    return this

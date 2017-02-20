BenchPrep.Views.Quotes ||= {}

class BenchPrep.Views.Quotes.QuoteView extends Backbone.View
  template: JST["backbone/templates/quotes/quote"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this

BenchPrep.Views.Quotes ||= {}

class BenchPrep.Views.Quotes.ShowView extends Backbone.View
  template: JST["backbone/templates/quotes/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this

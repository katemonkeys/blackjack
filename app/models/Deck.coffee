class window.Deck extends Backbone.Collection

  model: Card

  initialize: ->
    @add _(_.range(1, 53)).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)
        imgSource: 'styles/classic-cards/' + card + 't.png'

  dealPlayer: -> hand = new Hand [ @pop(), @pop() ], @

  dealDealer: -> new Hand [ @pop().flip(), @pop() ], @, true

#
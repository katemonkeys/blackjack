#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'endTurn', @newTurn, @
    #@get('playerHand').on 'change', @newTurn, @
    undefined

  newTurn: ->
    console.log 'starting newTurn'
    dh = @get('dealerHand')
    ph = @get('playerHand')
    dh.models[0].set('revealed', true)
    console.log "player has " + ph.checkScores()
    if ph.checkScores() > 21 then alert 'you lose'
    else
      while dh.checkScores() < 17
        dh.hit()
        console.log "dealer has " + dh.checkScores()
      console.log "dealer has " + dh.checkScores()
      if dh.checkScores() > 21 then alert 'dealer busts (you win)'
      else if dh.checkScores() > ph.checkScores() then alert 'dealer wins'
      else if dh.checkScores() == ph.checkScores() then alert 'push'
      else alert 'you win!'
    undefined
# array!!!!
    # alert 'Dealer wins; you bust'
# TODO   alert 'Dealer wins with #{points}; you bust with #{somestuff}'


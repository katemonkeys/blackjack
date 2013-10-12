class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: -> @add(@deck.pop()).last()

  stand: -> @trigger('endTurn')

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then answers = [score, score + 10] else answers = [score]
    if answers[0] == 21 || answers[1] == 21
      @trigger('endTurn')
      answers = [21]
    else if answers[0] > 21
      @trigger('endTurn')
      answers = answers.splice(0,1)
    else if answers[1] > 21
      answers = answers.splice(0,1)
    else answers

    # if arguments[0] @$('.score')
    # if @collection.scores().length > 1 && @collection.scores()[1] <= 21
    #   @$('.score').text @collection.scores()[0] + " or " + @collection.scores()[1]
    # else @$('.score').text @collection.scores()[0]

  checkScores: ->
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then answers = [score, score + 10] else answers = [score]
    if answers[0] == 21 || answers[1] == 21
      answers = 21
    # else if answers[0] > 21
      # answers = answers.splice(0,1)
    else if answers[1] > 21
      answers = answers[0]
    else answers[answers.length-1]

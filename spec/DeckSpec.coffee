describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it "should give the last card from the deck", ->
      expect(deck.length).toBe 50
      expect(deck.last()).toEqual hand.hit()
      expect(deck.length).toBe 49
      expect(deck.last()).toEqual hand.hit()
      expect(deck.length).toBe 48

  describe 'stand', ->
    it "should allow hit until stand", ->
      hand.hit()
      expect(deck.length).toBe 49
    it "should not allow hit after stand", ->
      hand.stand()
      hand.hit()
      expect(deck.length).toBe 50

  describe 'deal', ->
    it "should deal one dealer card face down", ->
      dealerHand = deck.dealDealer()
      expect(dealerHand.at(0).get('revealed')).toBe false
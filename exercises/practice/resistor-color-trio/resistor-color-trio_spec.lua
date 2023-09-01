local rct = require 'resistor-color-trio'

describe('resistor-color-trio', function()
  it('orange and orange and black', function()
    local value, unit = rct.decode({'orange', 'orange', 'black'})
    assert.are.equal(33, value)
    assert.are.equal('ohms', unit)
  end)

  it('blue and grey and brown', function()
    local value, unit = rct.decode({'blue', 'grey', 'brown'})
    assert.are.equal(680, value)
    assert.are.equal('ohms', unit)
  end)

  it('red and black and red', function()
    local value, unit = rct.decode({'red', 'black', 'red'})
    assert.are.equal(2, value)
    assert.are.equal('kiloohms', unit)
  end)

  it('green and brown and orange', function()
    local value, unit = rct.decode({'green', 'brown', 'orange'})
    assert.are.equal(51, value)
    assert.are.equal('kiloohms', unit)
  end)

  it('yellow and violet and yellow', function()
    local value, unit = rct.decode({'yellow', 'violet', 'yellow'})
    assert.are.equal(470, value)
    assert.are.equal('kiloohms', unit)
  end)

  it('blue and violet and blue', function()
    local value, unit = rct.decode({'blue', 'violet', 'blue'})
    assert.are.equal(67, value)
    assert.are.equal('megaohms', unit)
  end)

  it('minimum possible value', function()
    local value, unit = rct.decode({'black', 'black', 'black'})
    assert.are.equal(0, value)
    assert.are.equal('ohms', unit)
  end)

  it('maximum possible value', function()
    local value, unit = rct.decode({'white', 'white', 'white'})
    assert.are.equal(99, value)
    assert.are.equal('gigaohms', unit)
  end)

  it('first two colors make an invalid octal number', function()
    local value, unit = rct.decode({'black', 'grey', 'black'})
    assert.are.equal(8, value)
    assert.are.equal('ohms', unit)
  end)

  it('ignore extra colors', function()
    local value, unit = rct.decode({'blue', 'green', 'yellow', 'orange'})
    assert.are.equal(650, value)
    assert.are.equal('kiloohms', unit)
  end)

end)

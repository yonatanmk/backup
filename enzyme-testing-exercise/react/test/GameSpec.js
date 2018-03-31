import Game from '../src/Game.js';

describe('Game', () => {
  let wrapper;
  // write non shallow (mount) tests here to test the Game Component with the
  // full DOM and don't forget to remove pending()
  beforeEach(() => {
    jasmineEnzyme();
    spyOn(Game.prototype, 'selectCell').and.callThrough();
    wrapper = mount(<Game />);
    // add set up data as needed here
    // create a variable assigned to your full DOM rendered component
  });

  it('should have the specified inital state', () => {
    expect(wrapper.state()).toEqual({
      table: {
        row1: { cell1: '', cell2: '', cell3: '' },
        row2: { cell1: '', cell2: '', cell3: '' },
        row3: { cell1: '', cell2: '', cell3: '' }
      },
      turn: 'X'
    });
  });

  it('should render an h3 (<h3>) with the title of the page', () => {
    expect(wrapper.find('h3').text()).toBe("Tic Tac Toe");
  });

  it('should render the GameTable', () => {
    expect(wrapper.find('GameTable')).toBePresent();
  });

  it('should render an X when a cell is clicked during X\'s turn', () => {
      wrapper.find({'data-row': 'row1', 'data-cell': 'cell1'}).simulate('click', {target: {dataset: {row: "row1", cell: "cell1"}}});
      expect(wrapper.state()).toEqual({
        table: {
          row1: { cell1: 'X', cell2: '', cell3: '' },
          row2: { cell1: '', cell2: '', cell3: '' },
          row3: { cell1: '', cell2: '', cell3: '' }
        },
        turn: 'O'
      });
    });

  it("should update who's turn it is when a cell is clicked during X\'s turn", () => {
    wrapper.find({'data-row': 'row1', 'data-cell': 'cell1'}).simulate('click', {target: {dataset: {row: "row1", cell: "cell1"}}});
    expect(wrapper.find('p').text()).toBe("O's turn to go!");
  });
});

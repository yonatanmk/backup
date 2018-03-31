describe('Square', () =>  {
  describe('new Square()', () =>  {
    it('takes argument for a length of a side', () =>  {
      let square = new Square(12);

      expect(square).toBeDefined();
      expect(square.side).toBe(12);
    });

    it('takes optional argument for the center point', () =>  {
      let square = new Square(12, 1, 2);

      expect(square).toBeDefined();
      expect(square.x).toBe(1);
      expect(square.y).toBe(2);
    });

    it('defaults (x,y) to (0,0) if not provided', () =>  {
      let square = new Square(1);

      expect(square).toBeDefined();
      expect(square.x).toBe(0);
      expect(square.y).toBe(0);
    });
  });

  describe('area()', () =>  {
    it('returns the area of the circle', () =>  {
      let square = new Square(12);

      expect(square.area()).toBe(144);
    });
  });

  describe('perimeter()', () =>  {
    it('returns the perimeter of the circle', () =>  {
      let square = new Square(12);

      expect(square.perimeter()).toBe(48);
    });
  });

  describe('contains_point?(x,y)', () =>  {
    it('returns true for a point given inside of the square\'s perimeter', () => {
      let square = new Square(12);

      expect(square.contains_point(1,4)).toBe(true);
    });

    it('returns false for a point given outside of the square\'s perimeter', () => {
      let square = new Square(12);

      expect(square.contains_point(1,7)).toBe(true);
    });
  });
});

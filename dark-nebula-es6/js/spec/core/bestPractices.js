describe('best practices', () => {
  it('you should avoid global variables', () => {
    globals();
    expect(window.myObject).toBe(undefined);
  });

  it('you should use parseInt correctly', () => {
    expect(parseInt2('12')).toEqual(12);
    expect(parseInt2('12px')).toEqual(12);
    expect(parseInt2('0x12')).toEqual(0);
  });

  it('you should understand strict comparison', () => {
    expect(identity(1, '1')).toEqual(false);
    expect(identity(1, 1)).toEqual(true);
    expect(identity(0, false)).toEqual(false);
  });
});

import App from '../src/components/App';
import data from '../src/constants/data';

describe('Question Index', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(
      <App data={data} />
    );
    wrapper.setState({question:data.question, answers:data.answers})
  });

  afterEach(() => {
    wrapper.unmount();
  });

  describe('visiting the quiz page', () => {
    it('has the question body and answer choices', () => {
      let pageText = wrapper.text();
      console.log(wrapper.debug())

      expect(pageText).toMatch('What is the best JavaScript Framework?');
      expect(pageText).toMatch('React');
      expect(pageText).toMatch('Ember');
      expect(pageText).toMatch('Angular 2');
      expect(pageText).toMatch('Rails');
      expect(pageText).not.toMatch('Incorrect');
      expect(pageText).not.toMatch('Correct!');
    });
  });

  describe('select an incorrect response', () => {
    it('shows a response of Incorrect for selecting rails', done => {
      setTimeout(() => {
        let wrongAnswer = wrapper.findWhere(n => {
          return n.type() === 'li' && n.text() === 'Rails';
        });
        simulateIfPresent(wrongAnswer, 'click');
      }, 0);
      setTimeout(() => {
        let pageText = wrapper.text();
        expect(pageText).toMatch("Incorrect");
        done();
      }, 0);
    });

    it('shows a response of Incorrect for selecting Ember', done => {
      setTimeout(() => {
        let wrongAnswer = wrapper.findWhere(n => {
          return n.type() === 'li' && n.text() === 'Ember';
        });
        simulateIfPresent(wrongAnswer, 'click');
      }, 0);
      setTimeout(() => {
        let pageText = wrapper.text();
        expect(pageText).toMatch("Incorrect");
        done();
      }, 0);
    });

    it('shows a response of Incorrect', done => {
      setTimeout(() => {
        let wrongAnswer = wrapper.findWhere(n => {
          return n.type() === 'li' && n.text() === 'Angular 2';
        });
        simulateIfPresent(wrongAnswer, 'click');
      }, 0);
      setTimeout(() => {
        let pageText = wrapper.text();
        expect(pageText).toMatch("Incorrect");
        done();
      }, 0);
    });

  });

  describe('toggle between wrong and right answers', () => {
    it('shows a response of Incorrect for selecting rails', done => {
      setTimeout(() => {
        let wrongAnswer = wrapper.findWhere(n => {
          return n.type() === 'li' && n.text() === 'Rails';
        });
        simulateIfPresent(wrongAnswer, 'click');
      }, 0);
      setTimeout(() => {
        let pageText = wrapper.text();
        expect(pageText).toMatch("Incorrect");
        done();
      }, 0);
      setTimeout(() => {
        let wrongAnswer = wrapper.findWhere(n => {
          return n.type() === 'li' && n.text() === 'React';
        });
        simulateIfPresent(wrongAnswer, 'click');
      }, 0);
      setTimeout(() => {
        let pageText = wrapper.text();
        expect(pageText).toMatch("Correct!");
        done();
      }, 0);
      setTimeout(() => {
        let wrongAnswer = wrapper.findWhere(n => {
          return n.type() === 'li' && n.text() === 'Rails';
        });
        simulateIfPresent(wrongAnswer, 'click');
      }, 0);
      setTimeout(() => {
        let pageText = wrapper.text();
        expect(pageText).toMatch("Incorrect");
        done();
      }, 0);
    });

  });


  describe('select a correct response of React', () => {
    it('shows a response of Correct!', done => {
      setTimeout(() => {
        let wrongAnswer = wrapper.findWhere(n => {
          return n.type() === 'li' && n.text() === 'React';
        });
        simulateIfPresent(wrongAnswer, 'click');
      }, 0);
      setTimeout(() => {
        let pageText = wrapper.text();
        expect(pageText).toMatch("Correct!");
        done();
      }, 0);
    });
  });
});

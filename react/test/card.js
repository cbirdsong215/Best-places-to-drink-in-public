// test/components/Card.js
import Card from '../src/components/Card';
import { mount } from 'enzyme';
import React from 'react';

describe('Component: Card', () => {
  let wrapper;

  beforeEach(() => {
    jasmineEnzyme();
    wrapper = mount(
      <Card/>
    );
  });

  it('should render a p tag', () => {
   expect(wrapper.find('p').length).toEqual(1);
  });


});

// test/components/Card.js
import Card from '../src/components/Card';
import { mount } from 'enzyme';
import React from 'react';

describe('Component: Card', () => {
  let wrapper,
    foodId,
    photo,
    name,
    description;

  beforeEach(() => {
    jasmineEnzyme();
    wrapper = mount(
      <Card
        foodId="1"
        photo="sample.jpg"
        name="Awesome Taco"
        description="This is one awesome taco"
      />
    );
  });

  it('img tag should be present', () => {
   expect(wrapper.find('img').toBePresent();
  });

  it('should render an img tag with the specific prop', () => {
    expect(wrapper.find('img').props()).toEqual({
      src: 'https://foodie-review.s3.amazonaws.com/uploads/food/photo/1/sample.jpg'
    });
  });
});

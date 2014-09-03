Obi
===

Obi is a simple object constructor that allows you to compose objects together with immutability.


# API
You use Obi by requiring the obi module
```
var obi = require('obi');
```

### obi
either give obi an object to wrap or just invoke obi. obi will use an empty object by default.
The cool part here is that obi will return an method to keep extending the object.  
```obi()``` or ```obi({foo: 'foo'})``` will return the ```extend``` and ```done``` methods for the object state.


### extend
if you want to keep building on top of that object, use extend to immutably extend the object.
The cool part is obi will recursively return new obi objects while cloning the object you pass in.
```
obj = obi()
obj.extend({foo: 'foo'}) # => obi({foo: 'foo'})
```


### done
once you're done extending the object you created with obi, use ```done``` to return the final object
```
obj = obi()
obj.extend({foo: 'foo'}).extend({bar: 'bar'}).done() # => {foo: 'foo', bar: 'bar'}

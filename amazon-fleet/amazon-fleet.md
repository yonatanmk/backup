## Instructions

In this lesson, you will create a Ruby Class to manage Amazon's new fleet of
cargo trucks.

### Getting Set Up

```
$ et get amazon-fleet
$ cd amazon-fleet
```

Add code to the `cargo_truck.rb` file to satisfy the following conditions.

## Meeting Expectations Requirements

* Create a `CargoTruck` class.
* The `initialize` method should require us to specify the `plate_number` and
  `branding` when calling the `new` method. There should be readers for both
  of these variables.
* When creating a new cargo truck, the `odometer` should be zero. Create a reader
  for `odometer`.
* Create a reader and writer for `driver`.
* Write a summary method, that prints out a summary of the cargo truck.

Here is an example of interacting with the `CargoTruck` class:

```
truck = CargoTruck.new('AMZ001', "Amazon")
truck.odometer  # returns 0
truck.driver  # returns nil
truck.driver = "Larry"
truck.summary  # returns "Amazon truck with plate #AMZ001 is driven by Larry."
```

#include <iostream>
#include <string>
#include <functional>
class Animal
{
public:
    int name = 0;
    void sleep(){}
};

class Dog : public Animal
{
public:
    int name = 3;
    // change this to virtual
    void sleep(){}
    void bark(){}
};

Animal animal_clone()
{
}

Dog dog_clone()
{
}

// Q: dog_clone ? animal_clone
// why?

void animal_sub_dog(std::function<Dog()> func)
{
    // maybe I'll call bark here
    // dog = func();  dog.bark();
    std::cout << "animal_clone is a subtype of dog_clone" << '\n';
}

void dog_sub_animal(std::function<Animal()> func)
{
    // animal = func(); animal.dosomething
    // all functions for animals work for dog
    std::cout << "dog_clone is a subtype of animal_clone" << '\n';
}
int main()
{
    // Clone:  animal_clone <: dog_clone?
    // what dog_clone can do, animal_clone can do
    // think of a function that takes dog_clone as input, but animal_clone cannot work
    animal_sub_dog(animal_clone);
    // Clone:  dog_clone <: animal_clone?
    // what animal_clone can do, dog_clone can do
    dog_sub_animal(dog_clone);
    // pointer follows covariance
    // Dog <: Animal
    // Animal* dog_to_animal = new Dog();
    // Dog* animal_to_dog = new Animal();
}

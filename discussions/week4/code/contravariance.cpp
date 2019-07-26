#include <iostream>
#include <string>
#include <functional>
class Animal
{
public:
    int name = 0;
    void sleep(){}
    virtual void f(Animal a) {}
};

class Dog : public Animal
{
public:
    int dog_name = 1;
    // change this to virtual
    void sleep(){}
    void bark(){}
    virtual void f(Dog d) {}
};

void animal_f(Animal a) {}

void dog_f(Dog d) {}

void animal_sub_dog(std::function<void(Dog)> func)
{
    //Dog dog;
    //func(dog)  (dog -> animal can work)
    // the only application that is the difference will be the argument
    std::cout << "animal_f is a subtype of dog_f" << '\n';
}

void dog_sub_animal(std::function<void(Animal)> func)
{
    // Animal animal;
    // func(animal);
    // all functions for animals work for dog
    std::cout << "dog_f is a subtype of animal_f" << '\n';
}
int main()
{
    // animal_f <: dog_f?
    animal_sub_dog(animal_f);
    // dog_f <: animal_f?
    dog_sub_animal(dog_f);
    // another way:
    // animal_f(animal) works, dog_f(animal) doesn't work
    // animal_f(dog) works, dog_f(dog) works
    // ===> dog_f x<: animal_f

    // dog_f(animal) dosen't work
    // dog_f(dog) works, animal_f(dog) works
    // ===> animal_f <: dog_f
}

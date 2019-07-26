#include <iostream>
#include <string>
#include <functional>
class Animal
{
public:
    int name = 0;
    void sleep(){}
    //virtual Animal* clone(Animal* a) {}
};

class Dog : public Animal
{
public:
    int dog_name = 1;
    // change this to virtual
    void sleep(){}
    void bark(){}
    //Dog* clone(Dog* a) override {}
};
Dog dog_to_dog(Dog a){}
Animal animal_to_animal(Animal b){}
void one_sub_two(std::function<Animal(Animal)> func)
{
    // maybe I'll call bark here
    // dog = func();  dog.bark();
    std::cout << "dog_to_dog is a subtype of animal_to_animal" << '\n';
}

void two_sub_one(std::function<Dog(Dog)> func)
{
    // all functions for animals work for dog
    std::cout << "animal_to_animal is a subtype of dog_to_dog" << '\n';
}
int main()
{
    one_sub_two(dog_to_dog);
    two_sub_one(animal_to_animal);
    // animal->dog <: animal->animal <: dog->animal
    // dog->dog ? animal->animal
}

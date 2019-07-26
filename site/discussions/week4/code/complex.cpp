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
Animal dog_to_animal(Dog a){}
Dog animal_to_dog(Animal b){}
void one_sub_two(std::function<Dog(Animal)> func)
{
    // maybe I'll call bark here
    // dog = func();  dog.bark();
    std::cout << "dog_to_animal is a subtype of animal_to_dog" << '\n';
}

void two_sub_one(std::function<Animal(Dog)> func)
{
    // all functions for animals work for dog
    std::cout << "animal_to_dog is a subtype of dog_to_animal" << '\n';
}
int main()
{
    one_sub_two(dog_to_animal);
    two_sub_one(animal_to_dog);
    // animal->dog <: animal->animal <: dog->animal
    // dog->dog ? animal->animal
}

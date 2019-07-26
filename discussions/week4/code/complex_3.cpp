#include <iostream>
#include <string>
#include <functional>
class Food
{
public:
    void eaten(){}
};
class DogFood : public Food
{
public:
    void eaten(){}
};

class Animal
{
public:
    int name = 0;
    void sleep(){}
};

class Dog : public Animal
{
public:
    int dog_name = 1;
    void sleep(){}
    void bark(){}
};
DogFood animal_dogfood(Animal a){}
Food dog_food(Dog b){}
void one_sub_two(std::function<Food(Dog)> func)
{
    // maybe I'll call bark here
    // dog = func();  dog.bark();
    std::cout << "animal_dogfood is a subtype of dog_food" << '\n';
}

void two_sub_one(std::function<DogFood(Animal)> func)
{
    // all functions for animals work for dog
    std::cout << "dog_food is a subtype of animal_dogfood" << '\n';
}
int main()
{
    one_sub_two(animal_dogfood);
    two_sub_one(dog_food);
    // animal->dog <: animal->animal <: dog->animal
    // dog->dog ? animal->animal
}

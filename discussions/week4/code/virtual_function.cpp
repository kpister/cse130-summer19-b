#include <iostream>
#include <string>
class Animal
{
public:
    int name = 0;
    virtual void sleep()
    {
        std::cout << "sleeping...zzz" << '\n';
    }
};

class Dog : public Animal
{
public:
    // change this to virtual
    int dogname = -1;
    virtual void sleep()
    {
        std::cout << "a dog is sleeping...zzz" << '\n';
    }
    void bark()
    {
        std::cout << "bark bark" << '\n';
    }
};

int main()
{
    // will this work?
    dog_to_animal->bark();
    //__Animal_bark()

    // non-virtual sleep
    dog_to_animal->sleep();
    // __Animal_sleep()


    //Animal* dog_to_animal = new Dog();
    //std::cout << dog_to_animal->dogname << '\n';

    // will this work? --subtyping
    Dog* animal_to_dog = new Animal();

}

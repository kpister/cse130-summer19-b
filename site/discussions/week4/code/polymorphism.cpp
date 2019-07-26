#include <iostream>
#include <string>
class Shape
{
public:
    virtual double area(){return -1;}
};

class Circle : public Shape
{
    double r;
public:
    Circle (double radius) {r = radius;}
    // change this to virtual
    double area()
    {
        return r*r*3.14159265;
    }
};

class Rectangle : public Shape
{
    double a, b;
public:
    Rectangle (double _a, double _b) {a = _a; b = _b;}
    // change this to virtual
    double area()
    {
        return a*b;
    }
};

void calculate_area_1(Shape* s)
{
    std :: cout << s->area() << '\n';
}

// pass by reference
void calculate_area_2(Shape& s)
{
    std :: cout << s.area() << '\n';
}

// pass by value: create a new instance
void calculate_area_3(Shape s)
{
    std :: cout << s.area() << '\n';
}

int main()
{
    Circle c = Circle(1.0);
    Rectangle r = Rectangle(1.0, 1.0);
    // pass by pointer
    calculate_area_1(&c);
    calculate_area_1(&r);

    // pass by reference
    //calculate_area_2(c);
    //calculate_area_2(r);

    // pass by value: create a new instance
    //calculate_area_3(c);
    //calculate_area_3(r);
}

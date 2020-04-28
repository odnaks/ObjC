#import <Foundation/Foundation.h>
#import "Wheel.h"
#import "Engine.h"
#import "Car.h"

int main(int argc, const char * argv[]) {
    
    Car *car = [[Car alloc] init];
   
    // Создание первого колеса
    Wheel *wheel1 = [[Wheel alloc] initWithNumber:@1];
    // Создание второго колеса 
    Wheel *wheel2 = [[Wheel alloc] initWithNumber:@2];
    // Создание третьего колеса 
    Wheel *wheel3 = [[Wheel alloc] initWithNumber:@3]; 
   // Создание четвертого колеса
    Wheel *wheel4 = [[Wheel alloc] initWithNumber:@4]; 
    
    // Создание массива колес
    NSArray *wheels = [[NSArray alloc] initWithObjects:wheel1, wheel2, wheel3, wheel4, nil];                                         
    // Создание двигателя
    Engine *engine = [[Engine alloc] initWithModel:@"Engine 1x"];
    
    // Конфигурация автомобиля с созданными компонентами
    [car configWithEngine:engine andWheels:wheels];               
    
    // Освобождение автомобиля и удаление компонентов
    [car release];                                                                             
    
    return 0;
}

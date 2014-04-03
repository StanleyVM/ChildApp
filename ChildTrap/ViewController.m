//
//  ViewController.m
//  ChildTrap
//
//  Created by Aditya Narayan on 1/10/14.
//  Copyright (c) 2014 TB's APP House. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self startLocationManager];
    
}

- (IBAction)getLocation:(UIButton *)sender {
    if ([CLLocationManager locationServicesEnabled])
    {
        CLLocationManager *locationManager = [[CLLocationManager alloc] init];
        [locationManager startUpdatingLocation];
        
        CLLocationCoordinate2D currentLocation = [locationManager.location coordinate];
        double dblLatitude = currentLocation.latitude;
        double dblLongitude = currentLocation.longitude;
        NSLog(@"The latititude is %f and the longitude is %f", dblLatitude, dblLongitude);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)startLocationManager
{
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate=self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    //[self locationManager:locationManager didUpdateLocations:[[NSArray alloc] initWithObjects:<#(id), ...#>, nil]
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocationCoordinate2D coordinate = [newLocation coordinate];
    double dblLatitude = coordinate.latitude;
    double dblLongitude = coordinate.longitude;
    NSLog(@"The latititude is %f and the longitude is %f", dblLatitude, dblLongitude);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocationCoordinate2D coordinate = [[locations lastObject] coordinate];
    double dblLatitude = coordinate.latitude;
    double dblLongitude = coordinate.longitude;
    NSLog(@"The latititude is %f and the longitude is %f", dblLatitude, dblLongitude);
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
	NSLog(@"Error: %@", [error description]);
}

@end


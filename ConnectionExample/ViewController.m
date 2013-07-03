//
//  ViewController.m
//  ConnectionExample
//
//  Created by Daniela Velasquez on 03/07/13.
//  Copyright (c) 2013 Daniela Velasquez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)makeRequest:(id)sender {
    
    NSString *urlString = @"http://synergy-gb.com/descargas/curso_iOS/pruebaConexion.txt";
    NSTimeInterval timeInterval = 10.0;
    
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:timeInterval];
    
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    
    
    if(!connection)
        NSLog(@"Fallo");
}


- (IBAction)makeSynchronousRequest:(id)sender {
    
    
    NSString *urlString = @"http://synergy-gb.com/descargas/curso_iOS/pruebaConexionSincrona.txt";
    
    NSTimeInterval timeInterval = 10.0;
    
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:timeInterval];
    
    NSError        *error = nil;
    NSURLResponse  *response = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest: request returningResponse: &response error: &error];
    NSString *result = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    
    self.textAreaResponse.text = result;
    
}



- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    NSLog(@"***** Se recibio la data  *********\n");
    NSString *result = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    
    self.textAreaResponse.text = result;
    
    NSLog(@"************\n");
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    NSLog(@"***** La petición dio error *******\n");
    NSLog(@"Code error %d", error.code);
    NSLog(@"Domain error %@", error.domain);
    
    for (NSString *value in [error.userInfo allValues]) {
        NSLog(@"Value %@\n", error.domain);
    }
    
    NSLog(@"************\n");
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"***** La petición se realizó con exito *******\n");
    
    NSLog(@"Code error %@", [response URL]);
    NSLog(@"Domain error %@", [response MIMEType]);
    
    NSLog(@"************\n");
    
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"***** Finalizo de conexión *******\n");
}


@end

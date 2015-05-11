//
//  ViewController.m
//  test_faye_static
//
//  Created by Resident evil on 2/17/15.
//  Copyright (c) 2015 Resident evil. All rights reserved.
//

#import "ViewController.h"
#include "fayecpp.h"

#define OBJC_CLIENT 1

class FayeDelegate;

#if defined(OBJC_CLIENT)
#import "FayeCppClient.h"
#else
FayeCpp::Client * _client = NULL;
FayeDelegate * _delegate = NULL;

class FayeDelegate : public FayeCpp::Delegate
{
public:
	virtual void onFayeTransportConnected(FayeCpp::Client * client)
	{
		FayeCpp::RELog::log("DELEGATE onFayeTransportConnected");
	}

	virtual void onFayeTransportDisconnected(FayeCpp::Client * client)
	{
		FayeCpp::RELog::log("DELEGATE onFayeTransportDisconnected");

		FayeCpp::RELog::log("Try reconnect.");
		client->connect();
		client->subscribeToChannel("/messages");
		FayeCpp::RELog::log("Done reconnect.");
	}

	virtual void onFayeClientConnected(FayeCpp::Client * client)
	{
		FayeCpp::RELog::log("DELEGATE onFayeClientConnected");
	}

	virtual void onFayeClientDisconnected(FayeCpp::Client * client)
	{
		FayeCpp::RELog::log("DELEGATE onFayeClientDisconnected");
	}

	virtual void onFayeClientSubscribedToChannel(FayeCpp::Client * client,
												 const FayeCpp::REString & channel)
	{
		FayeCpp::RELog::log("DELEGATE onFayeClientSubscribedToChannel");
	}

	virtual void onFayeClientUnsubscribedFromChannel(FayeCpp::Client * client,
													 const FayeCpp::REString & channel)
	{
		FayeCpp::RELog::log("DELEGATE onFayeClientUnsubscribedFromChannel");
	}

	virtual void onFayeClientReceivedMessageFromChannel(FayeCpp::Client * client,
														const FayeCpp::REVariantMap & message,
														const FayeCpp::REString & channel)
	{
		FayeCpp::RELog::log("DELEGATE onFayeClientReceivedMessageFromChannel");
	}

	virtual void onFayeClientWillSendMessage(FayeCpp::Client * client,
											 FayeCpp::REVariantMap & message)
	{
		FayeCpp::RELog::log("DELEGATE onFayeClientWillSendMessage");
	}

	virtual void onFayeClientWillReceiveMessage(FayeCpp::Client * client,
												FayeCpp::REVariantMap & message)
	{
		FayeCpp::RELog::log("DELEGATE onFayeClientWillReceiveMessage");
	}

	virtual void onFayeErrorString(FayeCpp::Client * client,
								   const FayeCpp::REString & errorString)
	{
		FayeCpp::RELog::log("DELEGATE ERROR: %s", errorString.UTF8String());
	}

	FayeDelegate() { }
	virtual ~FayeDelegate() { }
};

class FayeSSLDataSource : public FayeCpp::SSLDataSource
{
public:
	virtual FayeCpp::REString clientLocalCertificateFilePath() const
	{
		return FayeCpp::REString("/Volumes/Data/faye_server/node/client1.crt");
	}

	virtual FayeCpp::REString clientPrivateKeyFilePath() const
	{
		return FayeCpp::REString("/Volumes/Data/faye_server/node/client1.key");
	}

	virtual FayeCpp::REString clientPrivateKeyPassPhrase() const
	{
		return FayeCpp::REString("Q1w2E3");
	}

	virtual FayeCpp::REString clientCACertificateFilePath() const
	{
		return FayeCpp::REString("/Volumes/Data/faye_server/node/ca.crt");
	}

	virtual ~FayeSSLDataSource() { }
};
#endif

using namespace FayeCpp;

@interface ViewController ()
#if defined(OBJC_CLIENT)
<FayeCppClientDelegate, FayeCppClientSSLDataSource>

@property (nonatomic, strong) FayeCppClient * client;
#endif

@end

@implementation ViewController

- (IBAction) onSendText:(id)sender
{
#if defined(OBJC_CLIENT)
	if (_client)
	{
		NSMutableDictionary * dict = [NSMutableDictionary dictionary];
		dict[@"text"] = [_textField text];
		dict[@"YES"] = @YES;
		dict[@"NO"] = @NO;
		dict[@"int1"] = @123;
		dict[@"float1"] = @3.14;

		[_client sendMessage:dict toChannel:@"/messages"];
	}
#else
	if (_client)
	{
		REVariantMap message;

		RELog::log("Try send text: %s", [[_textField text] UTF8String]);

		message["text"] = [[_textField text] UTF8String];

		_client->sendMessageToChannel(message, "/messages");
	}
#endif
	NSLog(@"Done");
}

- (IBAction) onCreate:(id)sender
{
	NSLog(@"SSL: %@", FayeCpp::Client::isSupportsSSLConnection() ? @"YES" : @"NO");

#if defined(OBJC_CLIENT)
	FayeCppClient * client = self.client;
	self.client = nil;
	if (client)
	{
		[client setDelegate:nil];
		[client setSSLDataSource:nil];
	}

	client = [[FayeCppClient alloc] init];
	[client setDelegate:self];
	[client setSSLDataSource:self];
	[client setUrlString:@"http://localhost:8000/faye"];
	self.client = client;

	NSMutableDictionary * ext = [NSMutableDictionary dictionary];
	NSMutableArray * arr = [NSMutableArray array];
	[arr addObject:@"Hello"];
	[arr addObject:@"World"];
	[arr addObject:[NSNull null]];
	[arr addObject:@231231233234324];
	[arr addObject:@3.142352532111];
	[arr addObject:@YES];
	[arr addObject:@NO];
	ext[@"arr"] = arr;
	ext[@"asd"] = @"asd";
	ext[@"YES"] = @YES;
	ext[@"NULL"] = [NSNull null];
	ext[@"int"] = @-324432603623523111;

	[_client setExtValue:ext];

	NSDictionary * ext1 = [_client extValue];
	if (![ext isEqualToDictionary:ext1])
	{
		assert(0);
	}
#else
	if (_client)
	{
		delete _client;
		_client = NULL;
	}

	if (_delegate)
	{
		delete _delegate;
		_delegate = NULL;
	}

	_delegate = new FayeDelegate();

	_client = new FayeCpp::Client();

	_client->setExtValue(22222);
	REVariant v = _client->extValue();

	_client->setExtValue(REVariant());
	v = _client->extValue();

	_client->setUsingIPV6(false);
	_client->setUrl("http://localhost:8000/faye");
	_client->setDelegate(_delegate);
	//	_client->setSSLDataSource(new FayeSSLDataSource());
#endif
	NSLog(@"Done");
}

- (IBAction) onConnect:(id)sender
{
#if defined(OBJC_CLIENT)
	[_client connect];
	[_client subscribeToChannel:@"/messages"];
#else
	_client->connect();
	_client->subscribeToChannel("/messages");
#endif
	NSLog(@"Done");
}

#if defined(OBJC_CLIENT)
#pragma mark - FayeCppClientDelegate & FayeCppClientSSLDataSource
- (void) onFayeTransportConnected:(FayeCppClient *) client
{
	NSLog(@"onFayeTransportConnected");
}

- (void) onFayeTransportDisconnected:(FayeCppClient *) client
{
	NSLog(@"onFayeTransportDisconnected");
}

- (void) onFayeClientConnected:(FayeCppClient *) client
{
	NSLog(@"onFayeClientConnected");
}

- (void) onFayeClientDisconnected:(FayeCppClient *) client
{
	NSLog(@"onFayeClientDisconnected");
}

- (void) onFayeClient:(FayeCppClient *) client
  subscribedToChannel:(NSString *) channel
{
	NSLog(@"onFayeClient subscribedToChannel: %@", channel);
}

- (void) onFayeClient:(FayeCppClient *) client
unsubscribedFromChannel:(NSString *) channel
{
	NSLog(@"onFayeClient unsubscribedFromChannel: %@", channel);
}

- (void) onFayeClient:(FayeCppClient *) client
	  receivedMessage:(NSDictionary *) message
		  fromChannel:(NSString *) channel
{
	NSLog(@"onFayeClient receivedMessage fromChannel: %@ \n%@", channel, message);
}

- (void) onFayeClient:(FayeCppClient *) client
				error:(NSError *) error
{
	NSLog(@"onFayeClient error: %@", error);
}
#endif


- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	NSLog(@"Client info: %s", FayeCpp::Client::info());
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
